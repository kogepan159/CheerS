
import 'package:cheers_app/data_models/chat.dart';
import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/models/db/database_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ChatRepository {
  final DatabaseManager dbManager;

  ChatRepository({this.dbManager});

  User hostPartyUser ;
  User selectedUser ;
  User chatUser ;
  HostParty hostParty;





 Future<void> insertChat(HostParty hostParty, User currentUser)async {

   print("repo  insertChat");
   hostPartyUser =  await dbManager.getUserInfoFromDbById(hostParty.uId);

   final chat = Chat(
     chatRoomId: Uuid().v1(),
     sendDateTime: DateTime.now(),
     lastSendDateTime: DateTime.now(),
     offerUserId: currentUser.uId ,
     offerUserInAppUserName:  currentUser.inAppUserName,
     offerUserPhotoUrl: currentUser.photoUrl_1,
     offeredUserId: hostPartyUser.uId,
     offeredUserInAppUserName: hostPartyUser.inAppUserName,
     offeredUserPhotoUrl: hostPartyUser.photoUrl_1,
   );

   await dbManager.insertChat(chat);



 }

  Future<List<Chat>> getChats(User currentUser) {
   return dbManager.getChats(currentUser.uId);

  }

  Future<User> getChatUserInfo(String chatUserId) async{
  return await dbManager.getUserInfoFromDbById(chatUserId);

  }

  Future<void>  sendMessage(String message, String chatRoomId, String uId, Chat chat)async {

   dbManager.sendMessage(message, chatRoomId, uId,chat.copyWith(lastSendDateTime: DateTime.now(),messageSenderId: uId));

  }

  Stream<QuerySnapshot>  getChat(Chat chat) {
    print("getChat repository");
   return  dbManager.getChat(chat);
  }





}