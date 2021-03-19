import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/models/repositories/party_repository.dart';
import 'package:cheers_app/models/repositories/user_repository.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:flutter/material.dart';

class HostPartyViewModel extends ChangeNotifier {
  final PartyRepository partyRepository;
  final UserRepository userRepository;

  HostPartyViewModel({this.partyRepository, this.userRepository});

  bool isProcessing = false;
  bool isImagePicked = false;

  bool isFriendsInvited = false;

  //hostPartyCaptionPartのTextFieldとつなげる（_onCaptionUpdatedメソッド内）
  String caption = "";

  //host_Partyデータクラスのインスタンス
  String selectedPrefecture;

  List<HostParty> parties = List();

  HostParty party = HostParty();
  User feedUser;
  HostParty hostParty;
  List<User> selectedFriends = List();

  //合コン企画を投稿
  Future<void> postParty() async {
    isProcessing = true;
    notifyListeners();
    print("HostPartyConfirmationScreen# partyRepository.hostParty invoked");
    await partyRepository.postParty(
      UserRepository.currentUser,
      selectedPrefecture,
      caption,
    );
    isProcessing = false;
    notifyListeners();
  }

  //プロフィール画面から来た場合に、編集用に既にデータベースにある合コンデータをとってくる
  Future<HostParty> getPartyForEdit(String hostPartyId) async {
    return await partyRepository.getPartyForEdit(hostPartyId);
  }

  //投稿内容を更新
  Future<void> updateHostParty(HostParty hostParty, FeedMode feedMode) async {
    isProcessing = true;
    notifyListeners();

    await partyRepository.updateHostParty(hostParty.copyWith(
      selectedPrefecture: selectedPrefecture,
      caption: caption,
    ));
    print("hostPartyViewModel# partyRepository.updateHostParty invoked");

    isProcessing = false;
    notifyListeners();
  }

  Future<List<User>> getFriends(String uId) async {
    return await userRepository.getFriends(uId);
  }



}
