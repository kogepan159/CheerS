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

class ProfileBlockUsersScreen extends StatefulWidget {
  @override
  _ProfileBlockUsersScreenState createState() =>
      _ProfileBlockUsersScreenState();
}

class _ProfileBlockUsersScreenState
    extends State<ProfileBlockUsersScreen> {
  @override
  Widget build(BuildContext context) {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);


    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).onBlock),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage(profileMode: ProfileMode.MYSELF))),
        ),
      ),
      body: FutureBuilder(
        future: profileViewModel.getBlockUsersList(),
        builder: (context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData &&
              snapshot.data.length > 0 &&
              snapshot.data != null) {
            final blockUsers = snapshot.data;
            print("proposedUser: $blockUsers");
            return ListView.builder(
                itemCount: blockUsers.length,
                itemBuilder: (context, int index) {
                  final user = blockUsers[index];
                  return UserCardForAppliedAndApplyingUserAndFriends(
                    photoUrl: user.photoUrl_1,
                    title: user.inAppUserName,
                    onTap: () => _openProfileScreen(context, user),
                    subTitle: user.residence,
                    //ブロックしている場合は、取り消しボタン。取り消しボタン押したら、ボタンを消す
                    trailing: _checkIsBlock(context,user),
                  );
                });
          } else {
            return Center(
              child: Text(
                S.of(context).noUserYouAreBlocking,
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

  _unBlock(BuildContext context, User user) {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);

    profileViewModel.unBlock(user);
  }

   _checkIsBlock(BuildContext context, User user) {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);
    var isBlocked = false;

    Future(() async{
      isBlocked =  await profileViewModel.checkIsBlockedFromList(user);

    });


      if(isBlocked == true){
        return OutlineButton(
          color: Colors.deepOrange,
          onPressed: () {
            setState(() {
              _unBlock(context, user);
            });
          },
          child: Text(
            S.of(context).cancelFriendRequest,
            style: TextStyle(color: Colors.deepOrange),
          ),
        );
      }else{
        return FlatButton(
          color: Colors.white,
          onPressed: null,
        );
      }





  }
}
