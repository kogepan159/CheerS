import 'dart:async';

import 'package:bubble/bubble.dart';
import 'package:cheers_app/data_models/chat.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view_models/chat_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../style.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;

  ChatScreen({this.chat});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final chatViewModel = Provider.of<ChatViewModel>(context, listen: false);

    int index;
    //各端末の幅
    final double deviceWidth = MediaQuery.of(context).size.width;
    //各端末の高さ
    final double deviceHeight = MediaQuery.of(context).size.height;
    //キーボードの高さ
    final double bottomSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_checkName(context, widget.chat)),
      ),
      body: StreamBuilder(
        stream: chatViewModel.getChat(widget.chat),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final chatDatas = snapshot.data.docs;

            print("chatDatas $chatDatas");

            return ListView.builder(
                reverse: true,
                itemCount: chatDatas.length,
                itemBuilder: (context, int index) {
                  final chatData = chatDatas[index];
                  return

                    SingleChildScrollView(
                    reverse: true,
                    child:
                        //自分の場合は、右よせ。他人の場合は、左寄せ
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                                chatData["uId"] == chatViewModel.currentUser.uId
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                            children: [
                          ListTile(
                            leading: chatData["uId"] ==
                                    chatViewModel.currentUser.uId
                                ? null
                                : CirclePhoto(
                                    photoUrl:
                                        _checkPhotoUrl(widget.chat, chatData),
                                    radius: 20.0,
                                    isImageFromFile: false,
                                    onTap: null,
                                  ),
                            title: Column(
                              crossAxisAlignment: chatData["uId"] ==
                                      chatViewModel.currentUser.uId
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Bubble(
                                    nip: chatData["uId"] ==
                                            chatViewModel.currentUser.uId
                                        ? BubbleNip.rightTop
                                        : BubbleNip.leftTop,
                                    child: Text(chatData["message"])),
                                Align(
                                  alignment: chatData["uId"] ==
                                          chatViewModel.currentUser.uId
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Text(
                                    _getDate(chatData),
                                    style: chatTimeTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                  );

                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomSpace),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: deviceWidth,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.multiline,
                      onSubmitted: _handleSubmit,
                      minLines: 1,
                      maxLines: 4,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration.collapsed(
                        hintText: S.of(context).sendMessage,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _handleSubmit(_controller.text);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleSubmit(String message) {
    var message = _controller.text;
    _sendMessage(message);
    _controller.text = "";

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String message) async {
    final chatViewModel = Provider.of<ChatViewModel>(context, listen: false);

    final chatRoomId = widget.chat.chatRoomId;

    chatViewModel.sendMessage(message, chatRoomId, widget.chat);
  }

  // チャット相手の写真を特定する
  _checkPhotoUrl(Chat chat, QueryDocumentSnapshot document) {
    if (document["uId"] == chat.offerUserId) {
      return chat.offerUserPhotoUrl;
    } else if (document["uId"] == chat.offeredUserId) {
      return chat.offeredUserPhotoUrl;
    }
  }

  String _getDate(QueryDocumentSnapshot document) {
    initializeDateFormatting('ja', null);

    DateTime datetime = DateTime.parse(document["sendDateTime"]);

    var result = DateFormat.yMd('ja').add_jm().format(datetime);
    return result;
  }

  //チャット相手の名前を特定する
  _checkName(BuildContext context, Chat chat) {

    final chatViewModel = Provider.of<ChatViewModel>(context, listen: false);

    if(chat.offerUserInAppUserName == chatViewModel.currentUser.inAppUserName){
      return chat.offeredUserInAppUserName;
    }else if (chat.offeredUserInAppUserName == chatViewModel.currentUser.inAppUserName){
      return chat.offerUserInAppUserName;
    }
  }


}
