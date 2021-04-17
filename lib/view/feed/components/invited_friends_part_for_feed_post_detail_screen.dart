import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view/host_party/components/user_card_for_inveted_friends_part.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view_models/feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../style.dart';

class InvitedFriendsPartForFeedPostDetailScreen extends StatelessWidget {
  final List<User> selectedFriends;
  final VoidCallback onTap;

  InvitedFriendsPartForFeedPostDetailScreen({@required this.selectedFriends, @required this.onTap});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Column(
      children: [
        Text(S
            .of(context)
            .member,
          style: userCardTitleLeftTextStyle,),
        Container(
          height: 150,
          child:
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              shrinkWrap: true,
              controller: ScrollController(keepScrollOffset: false),
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: selectedFriends.length,
              itemBuilder: (context, int index) {
                final selectedFriend = selectedFriends[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: ()=> _openProfileScreen(context, selectedFriend),
                    child: UserCardForInvitedFriendsPart(
                      friendName: selectedFriend.inAppUserName,
                      photoUrl: selectedFriend.photoUrl_1,
                      radius: 25,
                      isImageFromFile: false,
                      selectedFriend: selectedFriend,
                    ),
                  ),
                );
              }),


        ),
      ],
    );
  }

  _openProfileScreen(BuildContext context,
      User selectedFriend,) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProfileScreen(
              profileMode: feedViewModel.currentUser.uId == selectedFriend.uId
                  ? ProfileMode.MYSELF
                  : ProfileMode.OTHER,
              selectedUser: selectedFriend,
            ),
      ),
    );
  }


}
