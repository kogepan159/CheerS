import 'dart:io';

import 'package:cheers_app/data_models/chat.dart';
import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/offer.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/models/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:intl/intl.dart";

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

  Future<void> insertPostParty(HostParty hostParty,) async {
    await _db
        .collection("hostParties")
        .doc(hostParty.hostPartyId)
        .set(hostParty.toMap());

  }

  //HostPartyデータに、サブコレクション（members）を追加
  Future<void> insertMemberInParty(
      HostParty hostParty,
      String uId,
      String member2Id,
      String member3Id,
      String member4Id,
      String member5Id,
      String member6Id,
      String member7Id,
      String member8Id,
      String member9Id,
      String member10Id,
      List<User> selectedFriends
      ) async{

    //hostPartyのサブコレクション[members]に参加メンバーのIDを登録)

    //""""""""""招待メンバーが１名の場合"""""""""""""""
   if (selectedFriends.length == 1 ){
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(uId).set({"uId" : uId});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member2Id).set({"uId" : member2Id});
     return;
   }

   //""""""""""招待メンバーが２名の場合"""""""""""""""
   if (selectedFriends.length == 2 ){
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(uId).set({"uId" : uId});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member2Id).set({"uId" : member2Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member3Id).set({"uId" : member3Id});
     return;
   }

   //""""""""""招待メンバーが3名の場合"""""""""""""""
   if (selectedFriends.length == 3 ){
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(uId).set({"uId" : uId});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member2Id).set({"uId" : member2Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member3Id).set({"uId" : member3Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member4Id).set({"uId" : member4Id});
     return;
   }

   //""""""""""招待メンバーが4名の場合"""""""""""""""
   if (selectedFriends.length == 4 ){
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(uId).set({"uId" : uId});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member2Id).set({"uId" : member2Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member3Id).set({"uId" : member3Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member4Id).set({"uId" : member4Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member5Id).set({"uId" : member5Id});
     return;
   }

   //""""""""""招待メンバーが5名の場合"""""""""""""""
   if (selectedFriends.length == 5 ){
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(uId).set({"uId" : uId});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member2Id).set({"uId" : member2Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member3Id).set({"uId" : member3Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member4Id).set({"uId" : member4Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member5Id).set({"uId" : member5Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member6Id).set({"uId" : member6Id});
     return;
   }

   //""""""""""招待メンバーが6名の場合"""""""""""""""
   if (selectedFriends.length == 6 ){
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(uId).set({"uId" : uId});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member2Id).set({"uId" : member2Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member3Id).set({"uId" : member3Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member4Id).set({"uId" : member4Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member5Id).set({"uId" : member5Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member6Id).set({"uId" : member6Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member7Id).set({"uId" : member7Id});
     return;
   }

   //""""""""""招待メンバーが7名の場合"""""""""""""""
   if (selectedFriends.length == 7 ){
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(uId).set({"uId" : uId});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member2Id).set({"uId" : member2Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member3Id).set({"uId" : member3Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member4Id).set({"uId" : member4Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member5Id).set({"uId" : member5Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member6Id).set({"uId" : member6Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member7Id).set({"uId" : member7Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member8Id).set({"uId" : member8Id});
     return;
   }

   //""""""""""招待メンバーが8名の場合"""""""""""""""
   if (selectedFriends.length == 8 ){
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(uId).set({"uId" : uId});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member2Id).set({"uId" : member2Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member3Id).set({"uId" : member3Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member4Id).set({"uId" : member4Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member5Id).set({"uId" : member5Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member6Id).set({"uId" : member6Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member7Id).set({"uId" : member7Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member8Id).set({"uId" : member8Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member9Id).set({"uId" : member9Id});
     return;
   }

   //""""""""""招待メンバーが9名の場合"""""""""""""""
   if (selectedFriends.length == 9 ){
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(uId).set({"uId" : uId});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member2Id).set({"uId" : member2Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member3Id).set({"uId" : member3Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member4Id).set({"uId" : member4Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member5Id).set({"uId" : member5Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member6Id).set({"uId" : member6Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member7Id).set({"uId" : member7Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member8Id).set({"uId" : member8Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member9Id).set({"uId" : member9Id});
     await _db.collection("hostParties").doc(hostParty.hostPartyId).collection("members").doc(member10Id).set({"uId" : member10Id});
     return;
   }

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

//合コンを申し込みをキャンセル
  Future<void> cancelOfferParty(HostParty hostParty, User currentUser) async{

    //offerIdをキーにしてドキュメントを指定する事ができない。
    // なので、hostPartyIdと、offerUserId=currentUser。この２つの条件を指定。
  final offerRef = await _db.collection("offers").where("hostPartyId", isEqualTo: hostParty.hostPartyId).where("offerUserId",isEqualTo: currentUser.uId).get();

  //forEachを使い、コレクション「offers」に上記条件のドキュメントがないか検索
  offerRef.docs.forEach((element)async {
    final ref = _db.collection("offers").doc(element.id);
    await ref.delete();
  });

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

  Future<void>   unBlock(User profileUser, User currentUser) async{
//(currentUserがprofileUserのブロック辞める。currentUserのサブコレクション[blockUsers]からprofileUserのIDを削除)
    await _db.collection("users").doc(currentUser.uId).collection("blockUsersByMe").doc(profileUser.uId).delete();


  }

  //友達申請しているかどうかを確認
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

  //友達申請されてるかどうかを確認
  Future<bool> checkIsFollowed(User profileUser, User currentUser) async{
    //followersにデータが入っているのかどうかを確認
    final query = await _db.collection("users").doc(currentUser.uId).collection("followers").get();
    if (query.docs.length == 0) return false;
    //currentUserがprofileUserにフォローされているのかどうかを確認。currentUserのドキュメントを読み込み
    final checkQuery = await _db.collection("users").doc(currentUser.uId).collection("followers").where("uId", isEqualTo: profileUser.uId).get();
    if (checkQuery.docs.length > 0) {
      return true;
    }else{
      return false;
    }


  }

 //友達かどうかを確認
  Future<bool> checkIsFriends(User profileUser, User currentUser) async{
    //friendsにデータが入っているのかどうかを確認
    final query = await _db.collection("users").doc(currentUser.uId).collection("friends").get();
    if (query.docs.length == 0) return false;
    //profileUserとcurrentUserが友達になっているのかどうかを確認。currentUserのドキュメントを読み込み
    final checkQuery = await _db.collection("users").doc(currentUser.uId).collection("friends").where("uId", isEqualTo: profileUser.uId).get();
    if (checkQuery.docs.length > 0) {
      return true;
    }else{
      return false;
    }
  }

  //自分がブロックしているかどうかを確認
  Future<bool> checkIsBlocked(User profileUser, User currentUser) async{
    //blockUsersByMeにデータが入っているのかどうかを確認
    final query = await _db.collection("users").doc(currentUser.uId).collection("blockUsersByMe").get();
    if (query.docs.length == 0) return false;
    //profileUserをcurrentUserがブロックしているかどうかを確認。currentUserのドキュメントを読み込み
    final checkQuery = await _db.collection("users").doc(currentUser.uId).collection("blockUsersByMe").where("uId", isEqualTo: profileUser.uId).get();
    if (checkQuery.docs.length > 0) {
      return true;
    }else{
      return false;
    }
  }


  //誰から友達申請されているのか確認
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

  //自分が誰に友達申請しているのか確認
  Future<List<String>> getFollowingUserIds(String uId) async{
    //cloudfirestoreに入っている自分がフォローしている人のユーザーIDを読み込み
    final query = await _db.collection("users").doc(uId).collection("followings").get();

    //データベースにデータがなかった場合、空のLISTを返す
    if(query.docs.length == 0)
      return List();

    //自分がフォローしている人のユーザーIDを取得してくる（プログラムの詳細は分からん）
    var userIds = List<String>();
    query.docs.forEach((id) {
      userIds.add(id.data()["uId"]);
    });
    return userIds;
  }


  //誰と友達になっているのか確認
  Future<List<String>> getFriendUserIds(String uId) async{
    //cloudfirestoreに入っている自分がフォローしている人のユーザーIDを読み込み
    final query = await _db.collection("users").doc(uId).collection("friends").get();

    //データベースにデータがなかった場合、空のLISTを返す
    if(query.docs.length == 0)
      return List();

    //友達のユーザーIDを取得してくる（プログラムの詳細は分からん）
    var userIds = List<String>();
    query.docs.forEach((id) {
      userIds.add(id.data()["uId"]);
    });

    print("userIds: $userIds");

    return userIds;
  }

  //ブロックユーザー人数を確認
  Future<List<String>> getNumberOfBlockUsersByMe(String uId)async {

    //cloudfirestoreに入っている自分がブロックしている人のユーザーIDを読み込み
    final query = await _db.collection("users").doc(uId).collection("blockUsersByMe").get();

    //データベースにデータがなかった場合、空のLISTを返す
    if(query.docs.length == 0)
      return List();

    //ブロックユーザーIDを取得してくる
    var userIds = List<String>();
    query.docs.forEach((id) {
      userIds.add(id.data()["uId"]);
    });

    print("userIds: $userIds");

    return userIds;

  }




  //誰から友達申請をされているのか表示用（getFollowerUserIdsメソッドから、友達申請してきた人のIDを取得し、そのIDを元にユーザーデータ全体を取得する）
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

  //自分が友達申請をしている人のリストを取ってくる（getFollowingUserIdsメソッドから、自分が申請している人のIDを取得し、そのIDを元にユーザーデータ全体を取得する）
  Future<List<User>> getFriendRequestByMe(String uId) async{
    final followingUserIds = await getFollowingUserIds(uId);
    print({"followingUserIds: $followingUserIds"});
    var followingUsers = List<User>();
    await Future.forEach(followingUserIds, (followingUserId)async {
      final user = await getUserInfoFromDbById(followingUserId);
      followingUsers.add(user);

    });
    return followingUsers;


  }

  //友達リストを取ってくる（getFollowingUserIdsメソッドから、自分が申請している人のIDを取得し、そのIDを元にユーザーデータ全体を取得する）
  Future<List<User>> getFriends(String uId) async{
    final friendUserIds = await getFriendUserIds(uId);
    print({"friendUserIds: $friendUserIds"});
    var friends = List<User>();
    await Future.forEach(friendUserIds, (friendUserId)async {
      final user = await getUserInfoFromDbById(friendUserId);
      friends.add(user);

    });
    return friends;


  }

  //ブロックユーザーリストを取ってくる（getFollowingUserIdsメソッドから、自分が申請している人のIDを取得し、そのIDを元にユーザーデータ全体を取得する）
  Future<List<User>> getBlockUsersList(String uId) async{
    final blockUserIds = await getNumberOfBlockUsersByMe(uId);
    print({"friendUserIds: $blockUserIds"});
    var blockUsers = List<User>();
    await Future.forEach(blockUserIds, (blockUserId)async {
      final user = await getUserInfoFromDbById(blockUserId);
      blockUsers.add(user);

    });
    return blockUsers;


  }



  Future<void>   quitFriends(User profileUser, User currentUser) async{
//(currentUserがprofileUserと絶交する。currentUserのサブコレクション[friends]からprofileUserのIDを削除)
    await _db.collection("users").doc(currentUser.uId).collection("friends").doc(profileUser.uId).delete();

    //(currentUserがprofileUserと絶交する。profileUserのサブコレクション[friends]からcurrentUserのIDを削除)
    await _db.collection("users").doc(profileUser.uId).collection("friends").doc(currentUser.uId).delete();

  }

  //誰が合コンに参加しているのか確認
  Future<List<String>> getMemberUserIds(String hostPartyId) async{

    final query = await _db.collection("hostParties").doc(hostPartyId).collection("members").get();

    //データがあるか判定。ない場合には空リストを返す
    if(query.docs.length == 0)
      return List();

    var memberIds = List<String>();
    query.docs.forEach((id) {
      memberIds.add(id.data()["uId"]);
    });
    return memberIds;

  }

  //getMemberUserIdsメソッドから、合コン参加者のIDを取得し、そのIDを元にユーザーデータ全体を取得する）
  Future<List<User>> getPartyMemberInfo(String hostPartyId) async{
    final memberUserIds = await getMemberUserIds(hostPartyId);
    print({"memberUserIds: $memberUserIds"});
    var members = List<User>();
    await Future.forEach(memberUserIds, (memberUserId)async {
      final user = await getUserInfoFromDbById(memberUserId);
      members.add(user);

    });
    return members;


  }

//合コンに招待された人数を取得
  Future<List<String>> getNumberOfInvitedMembers(String hostPartyId) async{
    //cloudfirestoreに入っているmemberのユーザーIDを読み込み
    final query = await _db.collection("hostParties").doc(hostPartyId).collection("members").get();

    //データベースにデータがなかった場合、空のLISTを返す
    if(query.docs.length == 0)
      return List();

    //友達のユーザーIDを取得してくる（プログラムの詳細は分からん）
    var memberIds = List<String>();
    query.docs.forEach((id) {
      memberIds.add(id.data()["uId"]);
    });

    print("memberIds: $memberIds");

    return memberIds;
  }

  //合コン申込したか確認
 Future <bool> checkIsOffer(String hostPartyId, String uId)async {
   //offerIdをキーにしてドキュメントを指定する事ができない。
   // なので、hostPartyIdと、offerUserId=currentUser。この２つの条件を指定。
   final offerRef = await _db.collection("offers").where("hostPartyId", isEqualTo: hostPartyId).where("offerUserId",isEqualTo: uId).get();

   if(offerRef.docs.length == 0) {
     return false;
   }else{
     return true;
   }


 }

 //トークルームを作成
 Future<void> insertChat(Chat chat) async{

   print("db  insertChat");
    //トークルームを作成
   await _db
       .collection("chats")
       .doc(chat.chatRoomId)
       .set(chat.toMap());

 }

 //自分が関与しているチャット情報を取得してくる
  Future<List<Chat>> getChats(String uId)async {

    //データの有無を判定（これをしないとアプリ落ちる）
    final query = await _db.collection("chats").get();
    if (query.docs.length == 0) return List();

    var results = List<Chat>();

    print("getChats db");


    // //offerUserIdが自分のチャット取得（他人の合コンにいいねした場合）
    await _db
        .collection("chats")
        .where("offerUserId", isEqualTo: uId)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(Chat.fromMap(element.data()));
      });
    });

    print("getChats db2");

    //offeredUserIdが自分のチャット取得（自分の合コンにいいねされた場合）
    await _db
        .collection("chats")
        .where("offeredUserId", isEqualTo: uId)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        results.add(Chat.fromMap(element.data()));
      });
    });

    results.sort((a,b) => b.sendDateTime.compareTo(a.sendDateTime));

    print("results $results");
    return results;

  }

 Future <void> sendMessage(String message, String chatRoomId, String uId, Chat updateChat)async {


   await _db.collection("chats").doc(chatRoomId).collection("messages").doc().set({"uId" : uId, "message": message, "sendDateTime": DateTime.now().toString()});

   final document =  _db.collection("chats").doc(chatRoomId);
   await document.update(updateChat.toMap());


 }

  Stream<QuerySnapshot>  getChat(Chat chat) {

    print("getChat db");
    return _db.collection("chats")
        .doc(chat.chatRoomId)
        .collection("messages")
        .orderBy("sendDateTime", descending: true)
        .snapshots();
  }

 Future<void> block(User profileUser, User currentUser) async{
   //(currentUserがprofileUserをブロックする。currentUserのサブコレクション[blockUsersByMe]にprofileUserのIDを登録)
   await _db.collection("users").doc(currentUser.uId).collection("blockUsersByMe").doc(profileUser.uId).set({"uId" : profileUser.uId});

   //(currentUserがprofileUserをブロックする。profileUserのサブコレクション[blockUsersByOther]にcurrentUserのIDを登録)
   await _db.collection("users").doc(profileUser.uId).collection("blockUsersByOther").doc(currentUser.uId).set({"uId" : currentUser.uId});



 }






  }


