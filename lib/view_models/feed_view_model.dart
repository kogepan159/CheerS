import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/offer.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/models/repositories/party_repository.dart';
import 'package:cheers_app/models/repositories/user_repository.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:flutter/material.dart';

class FeedViewModel extends ChangeNotifier{


  final PartyRepository partyRepository;
  final UserRepository userRepository;
  FeedViewModel({this.partyRepository, this.userRepository});

  int numberOfInvitedMembers;
  bool isProcessing = false ;
  bool isOffered = false ;

  List<HostParty> parties = List();
  List<User> partyMembers = List();
  OfferResult  offerResult;

  User feedUser;
  //UserRepository.currentUserの値をcurrentUserに入れる
  User get currentUser => UserRepository.currentUser;

  //FeedMode.FROM_FEEDの場合とそうでない場合での条件整理
  void setFeedUser(FeedMode feedMode , User user){
    if(feedMode == FeedMode.FROM_FEED){
      //feedUserは自分
      feedUser = currentUser;
    }else{
      //feedUserはuser
      feedUser = user;

    }


  }


 Future<void> getParty(FeedMode feedMode)async {
   isProcessing = true;
   notifyListeners();

   parties = await partyRepository.getParty(feedMode,feedUser);

   isProcessing = false;
   notifyListeners();


 }

  Future<List<User>> getPartyMemberInfo(String hostPartyId)async {

    isProcessing = true;

   return  await partyRepository.getPartyMemberInfo(hostPartyId);

  }



 //フィード画面に表示するユーザー情報を取得
 Future<User> getPartyUserInfo(String uId) async{


   return await userRepository.getUserById(uId);
 }

 Future<void> offerParty(HostParty hostParty) async{
    await partyRepository.offerParty(hostParty, currentUser);
 }

  Future<void> cancelOfferParty(HostParty hostParty)async {
    await partyRepository.cancelOfferParty(hostParty, currentUser);
  }

 // Future<void> getOfferResult(String hostPartyId) async{
 //   offerResult =  await partyRepository.getOfferResult(hostPartyId, currentUser);
 // }

  // 合コンに招待されたメンバーの人数を取得
  Future<void> getNumberOfInvitedMembers(String hostPartyId) async{

    isProcessing = true;
    numberOfInvitedMembers = await partyRepository.getNumberOfInvitedMembers(hostPartyId);
    print("feedViewModel numberOfInvitedMembers: $partyMembers");
    isProcessing = false;

  }

  // 合コンに申し込み済みかどうか確認
  Future<void>  checkIsOffer(String hostPartyId)async {
    isOffered = await partyRepository.checkIsOffer(hostPartyId,currentUser.uId);
    notifyListeners();

  }



}