import 'dart:io';

import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/models/repositories/party_repository.dart';
import 'package:cheers_app/models/repositories/user_repository.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  final PartyRepository partyRepository;
  final UserRepository userRepository;

  ProfileViewModel({this.partyRepository, this.userRepository});

  User profileUser;

  User get currentUser => UserRepository.currentUser;

  bool isProcessing = false;
  bool isImagePicked = false;

  File imageFile;

  List<HostParty> parties = List();

  String caption = "";
  String selectedPrefecture = "";
  String updateBio = "";
  String updateInAppUserName = "";
  String selectedGender = "";
  int selectedAge = 0;
  String selectedResidence = "";
  String selectedBirthPlace = "";
  String selectedBloodType = "";
  String selectedLivingStatus = "";
  int _selectedHeight = 0;

  //"""""""外のクラスから、selectedHeightでアクセス。getterを使うことで、_selectedHeightにアクセスできる"""""""""""""""""""""""""""""""
  int get selectedHeight => _selectedHeight;
  //"""""""setterとnotifyListenersを使い、値の変更をウィジェットに通知できる"""""""""""""""""""""""""""""""
  set selectedHeight(int value) {
    _selectedHeight = value;
    notifyListeners();
  }

  String _selectedBodyShape = "";

  String get selectedBodyShape => _selectedBodyShape;
  set selectedBodyShape(String value) {
    _selectedBodyShape = value;
    notifyListeners();
  }

  String selectedEducationalBackground = "";
  String selectedOccupation = "";
  String selectedHoliday = "";
  String selectedAlcohol = "";
  String selectedTobacco = "";
  String selectedSociability = "";
  String selectedIdealNumberOfParty = "";
  String selectedIdealPartyAtmosphere = "";
  String selectedKaraoke = "";
  String selectedPartyFee = "";

  void getProfileUser(ProfileMode profileMode, User selectedUser) {
    if (profileMode == ProfileMode.MYSELF) {
      profileUser = currentUser;
    } else {
      profileUser = selectedUser;
    }
  }

  //プロフィール画面に表示する合コンデータをとってくる
  Future<void> getParties(ProfileMode profileMode) async {
    isProcessing = true;
    notifyListeners();

    parties = await partyRepository.getParties(profileMode, profileUser);

    isProcessing = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    await userRepository.signOut();
    notifyListeners();
  }

  Future<int> getNumberOfOffer() async {
    return await partyRepository.getNumberOfOffer(profileUser);
  }

  void updateProfile() async {
    isProcessing = true;
    notifyListeners();

    await userRepository.updateProfile(
      profileUser,
      updateBio,
      updateInAppUserName,
      // selectedGender,
      // selectedAge,
      selectedResidence,
      selectedBirthPlace,
      selectedBloodType,
      selectedLivingStatus,
      _selectedHeight,
      _selectedBodyShape,
      selectedEducationalBackground,
      selectedOccupation,
      selectedHoliday,
      selectedAlcohol,
      selectedTobacco,
      selectedSociability,
      selectedIdealNumberOfParty,
      selectedIdealPartyAtmosphere,
      selectedKaraoke,
      selectedPartyFee,
    );
    // プロフィール更新後にユーザーデータを再取得。staticに保存
    await userRepository.getCurrentUserById(profileUser.uId);
    profileUser = currentUser;

    isProcessing = false;
    notifyListeners();
  }

  //プロフィール画面を開いた時に、既設定の情報が表示されるように
  Future<User> getProfile() async {
    isImagePicked = false;
    isProcessing = true;
    // notifyListeners();

    final User user = await userRepository.getProfile(profileUser);

    profileUser = user;
    updateBio = user.bio;
    updateInAppUserName = user.name;
    selectedGender = user.gender;
    selectedAge = user.age;
    selectedResidence = user.residence;
    selectedBirthPlace = user.birthPlace;
    selectedBloodType = user.bloodType;
    selectedLivingStatus = user.livingStatus;
    _selectedHeight = user.height;
    _selectedBodyShape = user.bodyShape;
    selectedEducationalBackground = user.educationalBackground;
    selectedOccupation = user.occupation;
    selectedHoliday = user.holiday;
    selectedAlcohol = user.alcohol;
    selectedTobacco = user.tobacco;
    selectedSociability = user.sociability;
    selectedIdealNumberOfParty = user.idealNumberOfParty;
    selectedIdealPartyAtmosphere = user.idealPartyAtmosphere;
    selectedKaraoke = user.karaoke;
    selectedPartyFee = user.partyFee;

    isProcessing = false;
    return user;
  }

  //プロフィール画面に表示する合コン開催ユーザー情報を取得
  Future<User> getPartyUserInfo(String uId) async {
    return await userRepository.getUserById(uId);
  }

  //"""""""""""""""""""""""""""""""""""""""""""""""""""""端末のギャラリーアプリから画像取得"""""""""ここから""""""""""""""""""""""""""""""""""""""""""""""""""""
  Future<void> pickProfileImage_1() async {
    isImagePicked = false;
    isProcessing = true;
    notifyListeners();

    imageFile = await userRepository.pickProfileImage_1();
    print("pickProfileImage: ${imageFile.path}");

    if (imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();
  }

  //端末のギャラリーアプリから画像取得
  Future<void> pickProfileImage_2() async {
    isImagePicked = false;
    isProcessing = true;
    notifyListeners();

    imageFile = await userRepository.pickProfileImage_2();
    print("pickProfileImage: ${imageFile.path}");

    if (imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();
  }

  //端末のギャラリーアプリから画像取得
  Future<void> pickProfileImage_3() async {
    isImagePicked = false;
    isProcessing = true;
    notifyListeners();

    imageFile = await userRepository.pickProfileImage_3();
    print("pickProfileImage: ${imageFile.path}");

    if (imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();
  }

  //端末のギャラリーアプリから画像取得
  Future<void> pickProfileImage_4() async {
    isImagePicked = false;
    isProcessing = true;
    notifyListeners();

    imageFile = await userRepository.pickProfileImage_4();
    print("pickProfileImage: ${imageFile.path}");

    if (imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();
  }

  //端末のギャラリーアプリから画像取得
  Future<void> pickProfileImage_5() async {
    isImagePicked = false;
    isProcessing = true;
    notifyListeners();

    imageFile = await userRepository.pickProfileImage_5();
    print("pickProfileImage: ${imageFile.path}");

    if (imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();
  }

  //"""""""""""""""""""""""""""""""""""""""""""""""""""""端末のギャラリーアプリから画像取得"""""""""ここまで""""""""""""""""""""""""""""""""""""""""""""""""""""

  Future<void> updateProfilePhoto_1(String photoUrl_1, bool isImageFromFile_1) async {
    isProcessing = true;
    notifyListeners();

    await userRepository.updateProfilePhoto_1(profileUser, photoUrl_1, isImageFromFile_1);

    // プロフィール写真更新後にユーザーデータを再取得。staticに保存
    await userRepository.getCurrentUserById(profileUser.uId);
    profileUser = currentUser;

    isProcessing = false;
    notifyListeners();
  }

  Future<void> updateProfilePhoto_2(String photoUrl_2, bool isImageFromFile_2) async {
    isProcessing = true;
    notifyListeners();

    await userRepository.updateProfilePhoto_2(profileUser, photoUrl_2, isImageFromFile_2);

    // プロフィール写真更新後にユーザーデータを再取得。staticに保存
    await userRepository.getCurrentUserById(profileUser.uId);
    profileUser = currentUser;

    isProcessing = false;
    notifyListeners();
  }

  Future<void> updateProfilePhoto_3(String photoUrl_3, bool isImageFromFile_3) async {
    isProcessing = true;
    notifyListeners();

    await userRepository.updateProfilePhoto_3(profileUser, photoUrl_3, isImageFromFile_3);

    // プロフィール写真更新後にユーザーデータを再取得。staticに保存
    await userRepository.getCurrentUserById(profileUser.uId);
    profileUser = currentUser;

    isProcessing = false;
    notifyListeners();
  }

  Future<void> updateProfilePhoto_4(String photoUrl_4, bool isImageFromFile_4) async {
    isProcessing = true;
    notifyListeners();

    await userRepository.updateProfilePhoto_4(profileUser, photoUrl_4, isImageFromFile_4);

    // プロフィール写真更新後にユーザーデータを再取得。staticに保存
    await userRepository.getCurrentUserById(profileUser.uId);
    profileUser = currentUser;

    isProcessing = false;
    notifyListeners();
  }

  Future<void> updateProfilePhoto_5(String photoUrl_5, bool isImageFromFile_5) async {
    isProcessing = true;
    notifyListeners();

    await userRepository.updateProfilePhoto_5(profileUser, photoUrl_5, isImageFromFile_5);

    // プロフィール写真更新後にユーザーデータを再取得。staticに保存
    await userRepository.getCurrentUserById(profileUser.uId);
    profileUser = currentUser;

    isProcessing = false;
    notifyListeners();
  }

  Future<void> addProfilePhoto_2(String photoUrl_2, bool isImageFromFile) async {
    isProcessing = true;
    notifyListeners();

    await userRepository.addProfilePhoto_2(profileUser, photoUrl_2, isImageFromFile);

    // プロフィール写真更新後にユーザーデータを再取得。staticに保存
    await userRepository.getCurrentUserById(profileUser.uId);
    profileUser = currentUser;

    isProcessing = false;
    notifyListeners();
  }

  Future<void> deleteHostParty(String hostPartyId, ProfileMode profileMode) async {
    isProcessing = true;
    notifyListeners();

    await partyRepository.deleteHostParty(hostPartyId);

    await getParties(ProfileMode.MYSELF);

    isProcessing = false;
    notifyListeners();
  }
}
