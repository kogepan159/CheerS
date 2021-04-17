import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/profile/components/sub/user_card_for_applied_and_applying_user_and_friends.dart';
import 'package:cheers_app/view/profile/pages/profile_page.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view/search_user/pages/components/user_card_for_search_user.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../style.dart';

class ProfileApplicationOfFriendsScreen extends StatefulWidget {
  @override
  _ProfileApplicationOfFriendsScreenState createState() =>
      _ProfileApplicationOfFriendsScreenState();
}

class _ProfileApplicationOfFriendsScreenState
    extends State<ProfileApplicationOfFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    //自分に友達申請をしている人のリストを取ってくる
    Future(() => profileViewModel.getApplicationOfFriends());

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).friendRequestToYou),
      ),
      body: FutureBuilder(
        future: profileViewModel.getApplicationOfFriends(),
        builder: (context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData &&
              snapshot.data.length > 0 &&
              snapshot.data != null) {
            final appliedUser = snapshot.data;
            return ListView.builder(
                itemCount: appliedUser.length,
                itemBuilder: (context, int index) {
                  final user = appliedUser[index];
                  return UserCardForAppliedAndApplyingUserAndFriends(
                    photoUrl: user.photoUrl_1,
                    title: user.inAppUserName,
                    onTap: () => _openProfileScreen(context, user),
                    subTitle: user.residence,
                    trailing: profileViewModel.isFriends
                        ? OutlineButton(
                            color: Colors.deepOrange,
                            onPressed: null,
                            child: Text(
                              S.of(context).approved,
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : OutlineButton(
                            color: Colors.deepOrange,
                            onPressed: () {
                              setState(() {
                                _becomeFriends(context, user);
                                profileViewModel.isFriends = true;
                              });
                            },
                            child: Text(
                              S.of(context).approval,
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ),
                  );
                });
          } else {
            return Center(
              child: Text(
                S.of(context).noOneSentTheFriendRequest,
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

  _becomeFriends(BuildContext context, User user) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    //友達申請を受け入れる
    profileViewModel.becomeFriends(user);
  }
}
