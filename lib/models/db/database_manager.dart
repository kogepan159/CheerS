import 'dart:io';

import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/offer.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/models/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //新規ユーザー登録のためまずは、dbにすでに登録済みが否かを真偽判定
  Future<bool> searchUserInDb(auth.User firebaseUser) async {
    final query = await _db
        .collection("users")
        .where("uId", isEqualTo: firebaseUser.uid)
        .get();

    if (query.docs.length > 0) {
      return true;
    }
    return false;
  }




  //新規会員情報をdbに登録
  Future<void> insertUser(User user) async {
    await _db.collection("users").doc(user.uId).set(user.toMap());
  }

  //会員情報をuserIdから取得。firebaseのmapデータをdartのデータクラスに変換。
  Future<User> getUserInfoFromDbById(String uId) async {
    final query =
        await _db.collection("users").where("uId", isEqualTo: uId).get();
    return User.fromMap(query.docs[0].data());
  }

  Future<void> insertPostParty(HostParty hostParty) async {
    await _db
        .collection("hostParties")
        .doc(hostParty.hostPartyId)
        .set(hostParty.toMap());
  }

  //フィード画面にフィードを表示させるために投稿データを読み込み
  Future<List<HostParty>> getAllParty(String uId) async {
    //データの有無を判定（これをしないとアプリ落ちる）
    final query = await _db.collection("hostParties").get();
    if (query.docs.length == 0) return List();

    var uIds = await getAllUserIds(uId);

    uIds.add(uId);

    var results = List<HostParty>();

    await _db
        .collection("hostParties")
        .where("uId", whereIn: uIds)
        .orderBy("postDateTime", descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(HostParty.fromMap(element.data()));
      });
    });

    print("posts: $results");

    return results;
  }

  Future<List<HostParty>> getPartiesByUser(String uId) async {
    //データの有無を判定（これをしないとアプリ落ちる）
    final query = await _db.collection("hostParties").get();
    if (query.docs.length == 0) return List();

    var results = List<HostParty>();

    await _db
        .collection("hostParties")
        .where("uId", isEqualTo: uId)
        .orderBy("postDateTime", descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(HostParty.fromMap(element.data()));
      });
    });

    print("posts: $results");

    return results;
  }

// 全ての人のIDをとってくる
  Future<List<String>> getAllUserIds(String uId) async {
    //データの有無を判定（これをしないとアプリ落ちる）
    final query = await _db.collection("users").get();
    //データの有無を判定（これをしないとアプリ落ちる）
    if (query.docs.length == 0) return List();

    var uIds = List<String>();
    query.docs.forEach((id) {
      uIds.add(id.data()["uId"]);
    });
    return uIds;
  }

  //フィード投稿から合コンを申し込む
  Future<void> offerParty(Offer offer) async {
    await _db.collection("offers").doc(offer.offerId).set(offer.toMap());
  }

  //合コンのオファー（いいね）数を取得（feedViewModel経由、合コン申し込みボタン消す用）
  Future<List<Offer>> getOffers(String hostPartyId) async {
    //いいねデータがあるか判定
    final query = await _db.collection("offers").get();
    if (query.docs.length == 0) return List();

    var results = List<Offer>();
    await _db
        .collection("offers")
        .where("hostPartyId", isEqualTo: hostPartyId)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(Offer.fromMap(element.data()));
      });
    });
    return results;
  }

  //合コンのオファー（いいね）数を取得（profileViewModel経由、プロフィール画面のいいね数表示用）
  Future<List<String>> getNumberOfOffer(String uId) async {
    final query = await _db.collection("offers").get();
    if (query.docs.length == 0) return List();

    var results = List<String>();
    await _db
        .collection("offers")
        .where("hostPartyUserId", isEqualTo: uId)
        .get()
        .then((value) {
      value.docs.forEach((id) {
        results.add(id.data()["hostPartyUserId"]);
      });
    });
    return results;
  }

  Future<void> updateProfile(User updateUser) async {
    final reference = _db.collection("users").doc(updateUser.uId);
    await reference.update(updateUser.toMap());
  }

  //自分の合コンデータを取得（プロフィール画面用）
  Future<List<HostParty>> getMyParties(String uId) async {
    final query = await _db.collection("hostParties").get();
    if (query.docs.length == 0) return List();

    var results = List<HostParty>();

    await _db
        .collection("hostParties")
        .where("uId", isEqualTo: uId)
        .orderBy("postDateTime", descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(HostParty.fromMap(element.data()));
      });
    });

    print("posts: $results");

    return results;
  }

  //プロフィール画面から来た場合に、編集用に既にデータベースにある合コンデータをとってくる
  Future<HostParty> getMyParty(String hostPartyId) async {
    final query = await _db
        .collection("hostParties")
        .where("hostPartyId", isEqualTo: hostPartyId)
        .get();
    return HostParty.fromMap(query.docs[0].data());
  }

  //投稿画像をFirebaseにアップロードするため、ファイルの保存場所の情報を取得
  Future<String> uploadImageToStorage(
      File imageFile, String storageId
  ) {
    final storageRef = FirebaseStorage.instance.ref().child(storageId);

    //取得したファイル保管場所に、ファイルをアップロード
    final uploadTask = storageRef.putFile(imageFile);

    //アップロード処理が完了したら、ファイルのダウンロードURLを取得
    return uploadTask
        .then((TaskSnapshot snapshot) => snapshot.ref.getDownloadURL());
  }

  Future<void> updateProfilePhoto_1(User updatedProfilePhoto) async {
    final reference = _db.collection("users").doc(updatedProfilePhoto.uId);
    await reference.update(updatedProfilePhoto.toMap());
  }

  Future<void> updateProfilePhoto_2(User updatedProfilePhoto) async {
    final reference = _db.collection("users").doc(updatedProfilePhoto.uId);
    await reference.update(updatedProfilePhoto.toMap());
  }

  Future<void> updateProfilePhoto_3(User updatedProfilePhoto) async {
    final reference = _db.collection("users").doc(updatedProfilePhoto.uId);
    await reference.update(updatedProfilePhoto.toMap());
  }

  Future<void> updateProfilePhoto_4(User updatedProfilePhoto) async {
    final reference = _db.collection("users").doc(updatedProfilePhoto.uId);
    await reference.update(updatedProfilePhoto.toMap());
  }

  Future<void> updateProfilePhoto_5(User updatedProfilePhoto) async {
    final reference = _db.collection("users").doc(updatedProfilePhoto.uId);
    await reference.update(updatedProfilePhoto.toMap());
  }

  //firebaseへプロフィール画像を追加
  // Future<void> addProfilePhoto_2(User addedPhotoUrl_2) async{
  //   await _db.collection("users").doc(addedPhotoUrl_2.uId).set(addedPhotoUrl_2.toMap());
  // }

  //合コン企画を削除
 Future<void> deleteHostParty(String hostPartyId) async{

    final hostPartyRef = _db.collection("hostParties").doc(hostPartyId);
    await hostPartyRef.delete();

 }

  //投稿内容を更新
  Future<void> updateHostParty(HostParty updateHostParty)async {

    final reference = _db.collection("hostParties").doc(updateHostParty.hostPartyId);
    await reference.update(updateHostParty.toMap());

    print(" dbManager.updateHostParty invoked");

  }

  Future<List<User>> searchUsers(String queryString) async{
    final query = await _db.collection("users").orderBy("inAppUserName")
    .startAt([queryString])
    .endAt([queryString + "\uf8ff"])
    .get();

    if (query.docs.length == 0) return List();

    var soughtUsers = List<User>();
    query.docs.forEach((element) {
      final selectedUser = User.fromMap(element.data());
      if(selectedUser.uId != UserRepository.currentUser.uId){
        soughtUsers.add(selectedUser);
      }
    });
    return soughtUsers;

  }

 Future<void> follow(User profileUser, User currentUser) async{
    //(currentUserがprofileUserをフォローする。currentUserのサブコレクション[followings]にprofileUserのIDを登録)
   await _db.collection("users").doc(currentUser.uId).collection("followings").doc(profileUser.uId).set({"uId" : profileUser.uId});

   //(currentUserがprofileUserをフォローする。profileUserのサブコレクション[followers]にcurrentUserのIDを登録)
   await _db.collection("users").doc(profileUser.uId).collection("followers").doc(currentUser.uId).set({"uId" : currentUser.uId});

 }


  Future<void>   unFollow(User profileUser, User currentUser) async{
//(currentUserがprofileUserのフォロー辞める。currentUserのサブコレクション[followings]からprofileUserのIDを削除)
  await _db.collection("users").doc(currentUser.uId).collection("followings").doc(profileUser.uId).delete();

    //(currentUserがprofileUserのフォロー辞める。profileUserのサブコレクション[followers]からcurrentUserのIDを削除)
  await _db.collection("users").doc(profileUser.uId).collection("followers").doc(currentUser.uId).delete();

  }

 Future<bool> checkIsFollowing(User profileUser, User currentUser) async{
    //followingsにデータが入っているのかどうかを確認
    final query = await _db.collection("users").doc(currentUser.uId).collection("followings").get();
    if (query.docs.length == 0) return false;
    //profileUserをcurrentUserがフォローしているのかどうかを確認。currentUserのドキュメントを読み込み
    final checkQuery = await _db.collection("users").doc(currentUser.uId).collection("followings").where("uId", isEqualTo: profileUser.uId).get();
    if (checkQuery.docs.length > 0) {
      return true;
    }else{
      return false;
    }


 }

  //誰に友達申請されているのか確認
  Future<List<String>> getFollowerUserIds(String uId) async{

    final query = await _db.collection("users").doc(uId).collection("followers").get();

    //フォロワーデータがあるか判定。ない場合には空リストを返す
    if(query.docs.length == 0)
      return List();

    var uIds = List<String>();
    query.docs.forEach((id) {
      uIds.add(id.data()["uId"]);
    });
    return uIds;

  }

  //誰に友達申請をされているのか表示用（getFollowerUserIdsメソッドから、友達申請してきた人のIDを取得し、そのIDを元にユーザーデータ全体を取得する）
 Future<List<User>> getApplicationOfFriends(String uId) async{
    final followerUserIds = await getFollowerUserIds(uId);
    print({"followerUserIds: $followerUserIds"});
        var followerUsers = List<User>();
    await Future.forEach(followerUserIds, (followerUserId)async {
      final user = await getUserInfoFromDbById(followerUserId);
      followerUsers.add(user);

    });
    return followerUsers;


 }

 Future<void> becomeFriends(User appliedUser, User currentUser)async {
  //#######友達コレクションにID追加########
   //(currentUserがappliedUserの友達申請を承認する。currentUserのサブコレクション[friends]にappliedUserのIDを登録)
   await _db.collection("users").doc(currentUser.uId).collection("friends").doc(appliedUser.uId).set({"uId" : appliedUser.uId});

   //(currentUserがappliedUserの友達申請を承認する。appliedUserのサブコレクション[friends]にcurrentUserのIDを登録)
   await _db.collection("users").doc(appliedUser.uId).collection("friends").doc(currentUser.uId).set({"uId" : currentUser.uId});

   //##########友達申請を受け入れたら、お互いのfollowings,followersコレクションからIDを削除する。それにより、申請待ち画面からユーザーが消える############

   //currentUserのサブコレクション[followers]からappliedUserのIDを削除)
   await _db.collection("users").doc(currentUser.uId).collection("followers").doc(appliedUser.uId).delete();

   //appliedUserのサブコレクション[followings]からcurrentUserのIDを削除)
   await _db.collection("users").doc(appliedUser.uId).collection("followings").doc(currentUser.uId).delete();


 }




}
