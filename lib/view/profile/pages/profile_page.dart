import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/style.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/button_with_icon.dart';
import 'package:cheers_app/view/profile/components/profile_photo_part.dart';
import 'package:cheers_app/view/profile/components/profile_post_tile.dart';
import 'package:cheers_app/view/profile/components/profile_setting_part.dart';
import 'package:cheers_app/view/profile/screens/profile_application_of_friends_screen.dart';
import 'package:cheers_app/view/profile/components/sub/profile_detail_part.dart';
import 'package:cheers_app/view/profile/components/sub/profile_likes_part.dart';
import 'package:cheers_app/view/profile/screens/change_photo_screen.dart';
import 'package:cheers_app/view/profile/screens/profile_edit_screen.dart';
import 'package:cheers_app/view/profile/screens/profile_friend_request_by_me_screen.dart';
import 'package:cheers_app/view/profile/screens/profile_number_of_friends_screen.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final ProfileMode profileMode;
  final User selectedUser;
  final HostParty hostParty;
  final bool isImageFromFile;
  final int index;

  ProfilePage(
      {@required this.profileMode,
      this.selectedUser,
      this.hostParty,
      this.isImageFromFile,
      this.index});

  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    //プロフィール画面がどこから開かれたかを判別
    profileViewModel.setProfileUser(profileMode, selectedUser);

    Future(() => profileViewModel.getParties(profileMode));

    return Consumer<ProfileViewModel>(builder: (context, model, child) {
      final profileUser = model.profileUser;
      final profileImageFromFile = model.imageFile;
      final isFollowing = profileViewModel.isFollowingProfileUser;
      final isFriends = profileViewModel.isFriends;
      return Scaffold(
        appBar: AppBar(
          title: Text(profileUser.inAppUserName),
          actions: [
            ProfileSettingPart(
              mode: profileMode,
            ),
          ],
        ),
        body: model.isProcessing
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //""""""""""""プロフィール画像パート"""""""""""""""""""""""""""
                    profileViewModel.isProcessing
                        ? CircularProgressIndicator()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 400,
                              child: InkWell(
                                // onTap: () => _openProfilePhotoExpandedScreen(context,index),
                                child: ProfilePhotoPart(
                                  profileImageFromFile: profileImageFromFile,
                                  mode: profileMode,
                                  isImageFromFile: false,
                                ),
                              ),
                            ),
                          ),

                    //""""""""""""いいね表示パート"""""""""""""""""""""""""""
                    Row(
                      children: [
                        Expanded(
                          child: ProfileLikesPart(
                            hostParty: hostParty,
                          ),
                        ),

                        ///""""""""""""友達人数表示パート"""""""""""""""""""""""""""
                        Expanded(
                          child: GestureDetector(
                            onTap: () =>
                                _openProfileNumberOfFriendsPart(context),
                            child: Text("友達"),
                          ),
                        ),

                        ///""""""""""""友達申請中パート"""""""""""""""""""""""""""
                        profileMode == ProfileMode.MYSELF
                            ? Expanded(
                                child: GestureDetector(
                                    onTap: () =>
                                        _openProfileFriendRequestScreen(
                                            context),
                                    child: Text("友達申請中")),
                              )
                            : Container(),

                        ///""""""""""""友達承認待ちパート"""""""""""""""""""""""""""
                        profileMode == ProfileMode.MYSELF
                            ? Expanded(
                                child: GestureDetector(
                                    onTap: () =>
                                        _openProfileApplicationOfFriendsScreen(
                                            context),
                                    child: Text("友達承認待ち")),
                              )
                            : Container(),
                      ],
                    ),

                    //""""""""""""自分の場合は、アイコンボタン（画像変更）。他人の場合は、友達になるボタン"""""""""""""""""""""""""""
                    profileMode == ProfileMode.MYSELF
                        ? ButtonWithIcon(
                            onPressed: () => _openChangePhotoScreen(context),
                            label: S.of(context).changePhoto,
                            iconData: FontAwesomeIcons.portrait,
                          )
                        : profileViewModel.isFriends
                    //既に友達だったら、友達を辞めるボタン。友達じゃなかったら、友達申請
                            ? ButtonWithIcon(
                                onPressed: () => _quitFriends(context),
                                label: S.of(context).quitBeingFriends,
                                iconData: FontAwesomeIcons.heartBroken,
                              )
                            : ButtonWithIcon(
                                onPressed: () => _follow(context),
                                label: S.of(context).becomeFriend,
                                iconData: FontAwesomeIcons.handshake,
                              ),

                    // ButtonWithIcon(
                    //         onPressed: () {
                    //          if(isFollowing == true && isFriends == false){
                    //            //友達申請を取り消す（A）
                    //            _unFollow(context);
                    //          } else if(isFriends == true && isFollowing == true){
                    //            ///友達を辞める（B）
                    //          }else if(isFriends == false && isFollowing == false) {
                    //            ///友達を辞める（C）
                    //            _follow(context);
                    //          }
                    //         },
                    //         label:
                    //         iconData: FontAwesomeIcons.handshake,
                    //       ),

                    //""""""""""""アイコンボタン（プロフィール変更）"""""""""""""""""""""""""""
                    profileMode == ProfileMode.MYSELF
                        ? ButtonWithIcon(
                            onPressed: () => _openProfileEditScreen(context),
                            label: S.of(context).editProfile,
                            iconData: FontAwesomeIcons.edit,
                          )
                        : Container(),

                    //""""""""""""（プロフィール詳細）"""""""""""""""""""""""""""

                    ProfileDetailPart(),
                    profileMode == ProfileMode.MYSELF
                        ? Column(
                            children: [
                              SizedBox(
                                height: 5.0,
                              ),
                              Center(
                                  child: Text(
                                S.of(context).partyInSession,
                                style: profileEditTitleTextStyle,
                              )),
                              SizedBox(
                                height: 10.0,
                              ),

                              //""""""""""""開催中合コンリスト"""""""""""""""""""""""""""

                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: model.parties.length,
                                  itemBuilder: (context, index) {
                                    return ProfilePostTile(
                                      profileMode: profileMode,
                                      hostParty: model.parties[index],
                                    );
                                  }),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
      );
    });
  }

  _openProfileEditScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileEditScreen(),
        ));
  }

  _openChangePhotoScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangePhotoScreen(),
      ),
    );
  }

  //TODO
  // _unFollow(BuildContext context) {
  //   final profileViewModel =
  //       Provider.of<ProfileViewModel>(context, listen: false);
  //
  //   profileViewModel.unFollow();
  // }

  //友達申請をする
  _follow(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    profileViewModel.follow();
  }

  //自分に友達申請をしているユーザーリスト
  _openProfileApplicationOfFriendsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileApplicationOfFriendsScreen(),
      ),
    );
  }

  //友達リストスクリーン
  _openProfileNumberOfFriendsPart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileNumberOfFriendsPart(),
      ),
    );
  }

  //自分が友達申請中のユーザーリスト
  _openProfileFriendRequestScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileFriendRequestByMeScreen(),
      ),
    );
  }

  //友達を辞める
  _quitFriends(BuildContext context) {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);

    profileViewModel.quitFriends();
  }
}
