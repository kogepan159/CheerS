import 'package:cheers_app/data_models/chat.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/chat/screens/chat_screen.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view/common/dialog/confirm_dialog.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view_models/chat_view_model.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../style.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatViewModel = Provider.of<ChatViewModel>(context, listen: false);

    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Center(child: Text(S.of(context).message)),
        ),
        body: FutureBuilder(
            future: chatViewModel.getChats(),
            builder: (context, AsyncSnapshot<List<Chat>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final chats = snapshot.data;
                print("chats $chats");

                return ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, int index) {
                      final chat = chats[index];

                      final offerUserId = chat.offerUserId;
                      final offerUserInAppUserName =
                          chat.offerUserInAppUserName;
                      final offerUserPhotoUrl = chat.offerUserPhotoUrl;

                      final offeredUserId = chat.offeredUserId;
                      final offeredUserInAppUserName =
                          chat.offeredUserInAppUserName;
                      final offeredUserPhotoUrl = chat.offeredUserPhotoUrl;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: InkWell(
                            splashColor: Colors.blueAccent,
                            onTap: null,

                            //メッセージ画面へ（コンポーネンツ）
                            child: GestureDetector(
                              onTap: () => _openChatScreen(context, chat),
                              child: ListTile(
                                leading: CirclePhoto(
                                  photoUrl: _checkPhotoUrl(context,
                                      offerUserPhotoUrl, offeredUserPhotoUrl),
                                  radius: 30.0,
                                  isImageFromFile: false,
                                ),
                                title: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_checkName(
                                        context,
                                        offerUserInAppUserName,
                                        offeredUserInAppUserName)),
                                    Text(
                                      _getDate(chat),
                                      style: chatTimeTextStyle,
                                    )
                                  ],
                                ),
                                trailing: PopupMenuButton(
                                    icon: Icon(Icons.more_vert),
                                    onSelected: (value) => _onPopUpMenuSelected(
                                        context, value, chat),
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          value: ChatMenu.DELETE,
                                          child: Text(S.of(context).delete),
                                        ),
                                      ];
                                    }),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else if (chatViewModel.isProcessing) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(child: Text(S.of(context).noMessage));
              }
            }));
  }

  //チャット相手の写真を特定する
  _checkPhotoUrl(BuildContext context, String offerUserPhotoUrl,
      String offeredUserPhotoUrl) {
    final chatViewModel = Provider.of<ChatViewModel>(context, listen: false);

    if (offerUserPhotoUrl == chatViewModel.currentUser.photoUrl_1) {
      return offeredUserPhotoUrl;
    } else if (offeredUserPhotoUrl == chatViewModel.currentUser.photoUrl_1) {
      return offerUserPhotoUrl;
    }
  }

  //チャット相手の名前を特定する
  _checkName(BuildContext context, String offerUserInAppUserName,
      String offeredUserInAppUserName) {
    final chatViewModel = Provider.of<ChatViewModel>(context, listen: false);

    if (offerUserInAppUserName == chatViewModel.currentUser.inAppUserName) {
      return offeredUserInAppUserName;
    } else if (offeredUserInAppUserName ==
        chatViewModel.currentUser.inAppUserName) {
      return offerUserInAppUserName;
    }
  }

  _openChatScreen(BuildContext context, Chat chat) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          chat: chat,
        ),
      ),
    );
  }

  String _getDate(Chat chat) {
    initializeDateFormatting('ja', null);

    DateTime datetime = DateTime.parse(chat.lastSendDateTime.toString());

    var result = DateFormat.yMd('ja').add_jm().format(datetime);
    return result;
  }

  _onPopUpMenuSelected(BuildContext context, ChatMenu selectedMenu, Chat chat) {
    switch (selectedMenu) {
      case ChatMenu.DELETE:
        showConfirmDialog(
            context: context,
            title: S.of(context).deletePost,
            content: S.of(context).deletePostConfirm,
            onConfirmed: (isConfirmed) {
              if (isConfirmed) _deleteChat(context, chat);
            });
    }
  }

  void _deleteChat(BuildContext context, Chat chat) {}//TODO


}
