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

  bool isProcessing = false ;
  List<HostParty> parties = List();

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

 //フィード画面に表示するユーザー情報を取得
 Future<User> getPartyUserInfo(String uId) async{
   return await userRepository.getUserById(uId);
 }

 Future<void> offerParty(HostParty hostParty) async{
    await partyRepository.offerParty(hostParty, currentUser);
    notifyListeners();
 }

 Future<OfferResult> getOfferResult(String hostPartyId) async{
    return await partyRepository.getOfferResult(hostPartyId, currentUser);
 }



}