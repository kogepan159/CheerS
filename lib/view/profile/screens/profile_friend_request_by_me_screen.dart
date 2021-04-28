import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/profile/components/sub/user_card_for_applied_and_applying_user_and_friends.dart';
import 'package:cheers_app/view/profile/pages/profile_page.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../style.dart';

class ProfileFriendRequestByMeScreen extends StatefulWidget {
  @override
  _ProfileFriendRequestByMeScreenState createState() =>
      _ProfileFriendRequestByMeScreenState();
}

class _ProfileFriendRequestByMeScreenState
    extends State<ProfileFriendRequestByMeScreen> {
  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    //自分が友達申請をしている人のリストを取ってくる
    // Future(() => profileViewModel.getFriendRequestByMe());

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).friendRequestFromYou),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage(profileMode: ProfileMode.MYSELF))),
        ),
      ),
      body: FutureBuilder(
        future: profileViewModel.getFriendRequestByMe(),
        builder: (context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData &&
              snapshot.data.length > 0 &&
              snapshot.data != null) {
            final proposedUser = snapshot.data;
            print("proposedUser: $proposedUser");
            return ListView.builder(
                itemCount: proposedUser.length,
                itemBuilder: (context, int index) {
                  final user = proposedUser[index];
                  return UserCardForAppliedAndApplyingUserAndFriends(
                    photoUrl: user.photoUrl_1,
                    title: user.inAppUserName,
                    onTap: () => _openProfileScreen(context, user),
                    subTitle: user.residence,
                    //フォローしている場合は、取り消しボタン。
                    trailing: profileViewModel.isFollowingProfileUser
                        ? OutlineButton(
                            color: Colors.deepOrange,
                            onPressed: () {
                              setState(() {
                                _unFollow(context, user);
                              });
                            },
                            child: Text(
                              S.of(context).cancelFriendRequest,
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          )
                        : FlatButton(
                            color: Colors.white,
                            onPressed: null,
                          ),
                  );
                });
          } else {
            return Center(
              child: Text(
                S.of(context).noUserYouAreApplyingForAFriend,
                style: profileApplicationOfFriendsTextStyle,
              ),
            );
          }
        },
      ),
    );
  }

  _openProfileScreen(BuildContext context, User user) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(
          profileMode: user.uId == profileViewModel.currentUser.uId
              ? ProfileMode.MYSELF
              : ProfileMode.OTHER,
          selectedUser: user,
        ),
      ),
    );
  }

  _unFollow(BuildContext context, User user) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    profileViewModel.unFollow(user);
  }
}
