import 'package:cheers_app/data_models/chat.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view_models/chat_view_model.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              if (snapshot.hasData &&
                  snapshot.data.length > 0 &&
                  snapshot.data != null) {
                final chats = snapshot.data;
                print("chats $chats");

                return ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, int index) {
                      final chat = chats[index];
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

                            ///メッセージ画面へ（コンポーネンツ）
                            child: ListTile(
                              leading: CirclePhoto(
                                photoUrl: chat.chatUserPhotoUrl,
                                radius: 30.0,
                                isImageFromFile: false,
                                onTap: () => _openProfileScreen(
                                    context, chat.chatUserId),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(chat.chatUserInAppUserName),
                                  Text(chat.chatUserPrefecture),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  _openProfileScreen(BuildContext context, String chatUserId) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    final chatViewModel = Provider.of<ChatViewModel>(context, listen: false);

    //チャット相手のデータを取ってくる
    Future(() => chatViewModel.getChatUserInfo(chatUserId));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(
          profileMode: chatUserId == profileViewModel.currentUser.uId
              ? ProfileMode.MYSELF
              : ProfileMode.OTHER,
          selectedUser: chatViewModel.chatUser,
        ),
      ),
    );
  }
}
