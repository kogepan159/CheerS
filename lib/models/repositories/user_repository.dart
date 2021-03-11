import 'dart:io';

import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/models/db/database_manager.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  final DatabaseManager dbManager;

  UserRepository({this.dbManager});

  //dbに登録したユーザーデータを取得してアプリ全体で使えるようにしておく為に、currentUserプロパティ宣言
  static User currentUser;

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final FacebookLogin facebookLogin = FacebookLogin();

//アプリ立ち上げ時に会員か否かを判定する
  Future<bool> isSignIn() async {
    //boolの真偽設定
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      //firebaseの不具合防止のため。詳細は、レクチャー49
      currentUser = await dbManager.getUserInfoFromDbById(firebaseUser.uid);

      return true;
    }
    return false;
  }

  //サインインメソッド
  Future<bool> signIn() async {
    // Facebookの認証画面が開く
    final FacebookLoginResult result = await facebookLogin
        .logIn(['email', 'user_gender', 'user_friends', 'user_birthday']);

    //facebookログインの複数情報取得対応
    final FacebookAccessToken accessToken = result.accessToken;
    final String token = accessToken.token;
    print('accessToken: $token');
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=id,name,birthday,gender,friends&access_token=$token');
    final profile = json.decode(graphResponse.body);
    print('profile: $profile');

    print("switch");

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print("FacebookLoginStatus.loggedIn");
        //firebase認証に必要な認証情報／信用状を取得
        final auth.FacebookAuthCredential facebookCredential =
            auth.FacebookAuthProvider.credential(token);

        print("token");

        //firebaseで取得した信用状をもとにfirebase認証を実行
        final firebaseUser =
            (await _auth.signInWithCredential(facebookCredential)).user;
        print(firebaseUser.uid);

        if (firebaseUser == null) {
          return false;
        }

        //DBにユーザー登録のためまずは、dbに登録済みが否かを判定。真偽判定は、dbのsearchUserInDb内にて
        final isUserExistedInDb = await dbManager.searchUserInDb(firebaseUser);
        //dbにユーザー登録されてなかったら、登録するメソッドに流す

        if (isUserExistedInDb == false) {
          await dbManager.insertUser(_convertToUser(firebaseUser, profile));
        }

        //dbに登録したユーザーデータをアプリ全体で使えるようにしておく為に、currentUserプロパティ作成
        currentUser = await dbManager.getUserInfoFromDbById(firebaseUser.uid);

        // すでにユーザー登録している場合はtrueを返す
        return true;

        break;
      case FacebookLoginStatus.cancelledByUser:
        print("FacebookLoginStatus.cancelledByUser");
        break;
      case FacebookLoginStatus.error:
        print("FacebookLoginStatus.error");
        break;
    }
    return false;
  }

  // firebaseのユーザー情報をアプリで使うデータクラスに変換
  _convertToUser(auth.User firebaseUser, profile) {
    //"""""""""""""年齢の計算"""ここから""""""""""""""""""""""""""""""""""""""
    final birthday = profile["birthday"].toString();
    final splitBirthday = birthday.split("/").map(int.parse).toList();
    final birthdayYear = splitBirthday[2];
    final birthdayMonth = splitBirthday[0];
    final birthdayDay = splitBirthday[1];

    final thisYear = DateTime.now().year;
    final thisMonth = DateTime.now().month;
    final thisDay = DateTime.now().day;

    final roughAge =
        (((thisYear * 1000) + (thisMonth * 100) + (thisDay)) / 1000) -
            (((birthdayYear * 1000) + (birthdayMonth * 100) + (birthdayDay)) /
                1000);

    print("roughAge $roughAge");

    final age = roughAge.floor();

    print("age $age");

    //"""""""""""""年齢の計算"""""ここまで""""""""""""""""""""""""""""""""""""

    return User(
      uId: firebaseUser.uid,
      email: firebaseUser.email,
      name: firebaseUser.displayName,
      inAppUserName: firebaseUser.displayName,
      photoUrl_1: firebaseUser.photoURL,
      photoUrl_2: "",
      photoUrl_3: "",
      photoUrl_4: "",
      photoUrl_5: "",
      imageStoragePath_1: "",
      imageStoragePath_2: "",
      imageStoragePath_3: "",
      imageStoragePath_4: "",
      imageStoragePath_5: "",
      birthday: profile["birthday"],
      friends: profile["friends"]["summary"]["total_count"],
      bio: "",
      gender: profile["gender"],
      age: age,
      residence: "",
      birthPlace: "",
      bloodType: "",
      livingStatus: "",
      height: 0,
      bodyShape: "",
      educationalBackground: "",
      occupation: "",
      holiday: "",
      alcohol: "",
      tobacco: "",
      sociability: "",
      idealNumberOfParty: "",
      idealPartyAtmosphere: "",
      karaoke: "",
      partyFee: "",
    );
  }

  //フィード画面に表示するユーザー情報を取得
  Future<User> getUserById(String uId) async {
    return await dbManager.getUserInfoFromDbById(uId);
  }

  Future<void> signOut() async {
    await facebookLogin.logOut();
    await _auth.signOut();
    currentUser = null;
  }

  updateProfile(
    User profileUser,
    String updateBio,
    String updateInAppUserName,
    // String selectedGender,
    // int selectedAge,
    String selectedResidence,
    String selectedBirthPlace,
    String selectedBloodType,
    String selectedLivingStatus,
    int selectedHeight,
    String selectedBodyShape,
    String selectedEducationalBackground,
    String selectedOccupation,
    String selectedHoliday,
    String selectedAlcohol,
    String selectedTobacco,
    String selectedSociability,
    String selectedIdealNumberOfParty,
    String selectedIdealPartyAtmosphere,
    String selectedKaraoke,
    String selectedPartyFee,
  ) async {
    final userBeforeUpdate =
        await dbManager.getUserInfoFromDbById(profileUser.uId);

    final updateUser = userBeforeUpdate.copyWith(
      bio: updateBio,
      inAppUserName: updateInAppUserName,
      // gender: selectedGender,
      // age: selectedAge,
      residence: selectedResidence,
      birthPlace: selectedBirthPlace,
      bloodType: selectedBloodType,
      livingStatus: selectedLivingStatus,
      height: selectedHeight,
      bodyShape: selectedBodyShape,
      educationalBackground: selectedEducationalBackground,
      occupation: selectedOccupation,
      holiday: selectedHoliday,
      alcohol: selectedAlcohol,
      tobacco: selectedTobacco,
      sociability: selectedSociability,
      idealNumberOfParty: selectedIdealNumberOfParty,
      idealPartyAtmosphere: selectedIdealPartyAtmosphere,
      karaoke: selectedKaraoke,
      partyFee: selectedPartyFee,
    );

    await dbManager.updateProfile(updateUser);
  }

  // プロフィール更新後にユーザーデータを再取得。staticに保存
  Future<void> getCurrentUserById(String uId) async {
    currentUser = await dbManager.getUserInfoFromDbById(uId);
  }

  //プロフィール画面を開いた時に、既設定の情報が表示されるように
  Future<User> getProfile(User profileUser) async {
    return await dbManager.getUserInfoFromDbById(profileUser.uId);
  }

  //###################################################端末のギャラリーから画像を取得#####ここから########################################################
  Future<File> pickProfileImage_1() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    return File(pickedImage.path);
  }

  Future<File> pickProfileImage_2() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    return File(pickedImage.path);
  }

  Future<File> pickProfileImage_3() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    return File(pickedImage.path);
  }

  Future<File> pickProfileImage_4() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    return File(pickedImage.path);
  }

  Future<File> pickProfileImage_5() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    return File(pickedImage.path);
  }

  //###################################################端末のギャラリーから画像を取得#####ここまで########################################################

  Future<void> updateProfilePhoto_1(
    User profileUser,
    String photoUrl_1,
    bool isImageFromFile_1,
  ) async {
    var updatePhotoUrl;

    if (isImageFromFile_1) {
      final updatePhotoFile = File(photoUrl_1);

      final storagePath = Uuid().v1();

      updatePhotoUrl = await dbManager.uploadImageToStorage(
        updatePhotoFile,
        storagePath,
      );

      final userBeforeUpdate =
          await dbManager.getUserInfoFromDbById(profileUser.uId);

      final updatedProfilePhoto = userBeforeUpdate.copyWith(
        photoUrl_1:
            isImageFromFile_1 ? updatePhotoUrl : userBeforeUpdate.photoUrl_1,
      );

      await dbManager.updateProfilePhoto_1(updatedProfilePhoto);
    }
  }

  Future<void> updateProfilePhoto_2(
    User profileUser,
    String photoUrl_2,
    bool isImageFromFile_2,
  ) async {
    var updatePhotoUrl;

    if (photoUrl_2.length > 0) {
      //""""""""""""写真更新処理"""""""""""""""""
      if (isImageFromFile_2) {
        final updatePhotoFile = File(photoUrl_2);

        final storagePath = Uuid().v1();

        updatePhotoUrl = await dbManager.uploadImageToStorage(
          updatePhotoFile,
          storagePath,
        );

        final userBeforeUpdate =
            await dbManager.getUserInfoFromDbById(profileUser.uId);

        final updatedProfilePhoto = userBeforeUpdate.copyWith(
          photoUrl_2:
              isImageFromFile_2 ? updatePhotoUrl : userBeforeUpdate.photoUrl_2,
        );

        await dbManager.updateProfilePhoto_2(updatedProfilePhoto);
      }
    } else {
      //""""""""""""写真削除処理"""""""""""""""""

      final userBeforeUpdate =
          await dbManager.getUserInfoFromDbById(profileUser.uId);

      final updatedProfilePhoto =
          userBeforeUpdate.copyWith(photoUrl_2: photoUrl_2);

      await dbManager.updateProfilePhoto_2(updatedProfilePhoto);
    }

    // if (isImageFromFile_2) {
    //
    //   final updatePhotoFile = File(photoUrl_2);
    //
    //   final storagePath = Uuid().v1();
    //
    //   updatePhotoUrl = await dbManager.uploadImageToStorage(
    //     updatePhotoFile,
    //     storagePath,
    //   );
    //
    //   final userBeforeUpdate =
    //   await dbManager.getUserInfoFromDbById(profileUser.uId);
    //
    //
    //   final updatedProfilePhoto = userBeforeUpdate.copyWith(
    //     photoUrl_2: isImageFromFile_2 ? updatePhotoUrl : userBeforeUpdate.photoUrl_2,
    //   );
    //
    //   await dbManager.updateProfilePhoto_2(updatedProfilePhoto);
    // }
  }

  Future<void> updateProfilePhoto_3(
    User profileUser,
    String photoUrl_3,
    bool isImageFromFile_3,
  ) async {
    var updatePhotoUrl;

    if (photoUrl_3.length > 0) {
      //""""""""""""写真更新処理"""""""""""""""""
      if (isImageFromFile_3) {
        final updatePhotoFile = File(photoUrl_3);

        final storagePath = Uuid().v1();

        updatePhotoUrl = await dbManager.uploadImageToStorage(
          updatePhotoFile,
          storagePath,
        );

        final userBeforeUpdate =
            await dbManager.getUserInfoFromDbById(profileUser.uId);

        final updatedProfilePhoto = userBeforeUpdate.copyWith(
          photoUrl_3:
              isImageFromFile_3 ? updatePhotoUrl : userBeforeUpdate.photoUrl_3,
        );

        await dbManager.updateProfilePhoto_3(updatedProfilePhoto);
      }
    } else {
      //""""""""""""写真削除処理"""""""""""""""""
      final userBeforeUpdate =
          await dbManager.getUserInfoFromDbById(profileUser.uId);

      final updatedProfilePhoto =
          userBeforeUpdate.copyWith(photoUrl_3: photoUrl_3);

      await dbManager.updateProfilePhoto_3(updatedProfilePhoto);
    }
  }

  Future<void> updateProfilePhoto_4(
    User profileUser,
    String photoUrl_4,
    bool isImageFromFile_4,
  ) async {
    var updatePhotoUrl;

    if (photoUrl_4.length > 0) {
      //""""""""""""写真更新処理"""""""""""""""""

      if (isImageFromFile_4) {
        final updatePhotoFile = File(photoUrl_4);

        final storagePath = Uuid().v1();

        updatePhotoUrl = await dbManager.uploadImageToStorage(
          updatePhotoFile,
          storagePath,
        );

        final userBeforeUpdate =
            await dbManager.getUserInfoFromDbById(profileUser.uId);

        final updatedProfilePhoto = userBeforeUpdate.copyWith(
          photoUrl_4:
              isImageFromFile_4 ? updatePhotoUrl : userBeforeUpdate.photoUrl_4,
        );

        await dbManager.updateProfilePhoto_4(updatedProfilePhoto);
      }
    } else {
      //""""""""""""写真削除処理"""""""""""""""""
      final userBeforeUpdate =
          await dbManager.getUserInfoFromDbById(profileUser.uId);

      final updatedProfilePhoto =
          userBeforeUpdate.copyWith(photoUrl_4: photoUrl_4);

      await dbManager.updateProfilePhoto_3(updatedProfilePhoto);
    }
  }

  Future<void> updateProfilePhoto_5(
    User profileUser,
    String photoUrl_5,
    bool isImageFromFile_5,
  ) async {
    var updatePhotoUrl;

    if (photoUrl_5.length > 0) {
      //""""""""""""写真更新処理"""""""""""""""""

      if (isImageFromFile_5) {
        final updatePhotoFile = File(photoUrl_5);

        final storagePath = Uuid().v1();

        updatePhotoUrl = await dbManager.uploadImageToStorage(
          updatePhotoFile,
          storagePath,
        );

        final userBeforeUpdate =
            await dbManager.getUserInfoFromDbById(profileUser.uId);

        final updatedProfilePhoto = userBeforeUpdate.copyWith(
          photoUrl_5:
              isImageFromFile_5 ? updatePhotoUrl : userBeforeUpdate.photoUrl_5,
        );

        await dbManager.updateProfilePhoto_5(updatedProfilePhoto);
      }
    } else {
      //""""""""""""写真削除処理"""""""""""""""""
      final userBeforeUpdate =
          await dbManager.getUserInfoFromDbById(profileUser.uId);

      final updatedProfilePhoto =
          userBeforeUpdate.copyWith(photoUrl_5: photoUrl_5);

      await dbManager.updateProfilePhoto_3(updatedProfilePhoto);
    }
  }

  // Future<void> addProfilePhoto_2(
  //   User profileUser,
  //   String photoUrl_2,
  //   bool isImageFromFile,
  // ) async {
  //   var updatePhotoUrl;
  //
  //   if (isImageFromFile) {
  //     final updatePhotoFile = File(photoUrl_2);
  //
  //     final storagePath = Uuid().v1();
  //
  //     updatePhotoUrl = await dbManager.uploadImageToStorage(
  //       updatePhotoFile,
  //       storagePath,
  //     );
  //
  //     // final userBeforeUpdate =
  //     // await dbManager.getUserInfoFromDbById(profileUser.uId);
  //
  //     final addedPhotoUrl_2 = User(
  //       uId: currentUser.uId,
  //       photoUrl_2: photoUrl_2,
  //       imageStoragePath_2: storagePath,
  //     );
  //
  //     await dbManager.addProfilePhoto_2(addedPhotoUrl_2);
  //   }
  // }

 Future<List<User>> searchUsers(String query)async {
    return dbManager.searchUsers(query);

 }


}
