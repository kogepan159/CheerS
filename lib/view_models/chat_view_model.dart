import 'dart:async';

import 'package:cheers_app/data_models/chat.dart';
import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/models/repositories/chat_repository.dart';
import 'package:cheers_app/models/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatRepository chatRepository;

  ChatViewModel({this.chatRepository});

  //UserRepository.currentUserの値をcurrentUserに入れる
  User get currentUser => UserRepository.currentUser;
  User chatUser;
  bool isProcessing = false;
  Chat chatData ;




  Future<void> insertChat(HostParty hostParty)async {
    print("viewmodel  insertChat");
    await chatRepository.insertChat(hostParty,currentUser);

  }

 Future<List<Chat>> getChats() {
    return  chatRepository.getChats(currentUser);
 }

 Future<void> getChatUserInfo(String chatUserId)async {

   chatUser =  await chatRepository.getChatUserInfo(chatUserId);

 }

 Future<void> sendMessage(String message, String chatRoomId, Chat chat) async{

    await chatRepository.sendMessage(message, chatRoomId, currentUser.uId,chat);

 }

  Stream<QuerySnapshot> getChat(Chat chat) {
    print("getChat  viewModel");
    return chatRepository.getChat(chat);

  }




  }

