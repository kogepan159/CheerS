import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/style.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view/host_party/pages/sub/invited_friends_part.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view_models/feed_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'invited_friends_part_for_feed_post_detail_screen.dart';

class FeedPostDetailPart extends StatelessWidget {
  final String photoUrl;
  final String titleLeft;
  final String titleRight;
  final String subTitleLeft;
  final String subTitleRight;
  final Widget trailing;
  final VoidCallback onTap;
  final User currentUser;
  final User hostPartyUser;
  final String caption;
  final HostParty hostParty;
  final List<User> partyMembers;

  FeedPostDetailPart({
    @required this.photoUrl,
    @required this.titleLeft,
    @required this.titleRight,
    @required this.subTitleLeft,
    @required this.subTitleRight,
    @required this.trailing,
    @required this.onTap,
    @required this.currentUser,
    @required this.hostPartyUser,
    @required this.caption,
    @required this.hostParty,
    @required this.partyMembers
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  titleLeft.toString(),
                  style: userCardTitleLeftTextStyle,
                ),
                SizedBox(
                  width: 60.0,
                ),
                Text(
                  titleRight.toString(),
                  style: userCardTitleRightTextStyle,
                ),
              ],
            ),

            Divider(
              thickness: 1.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  subTitleLeft,
                  style: userCardSubTitleLeftTextStyle,
                ),
                SizedBox(
                  width: 60.0,
                ),
                Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _openProfile(context, hostPartyUser),
                        child: CirclePhoto(
                          photoUrl: photoUrl,
                          radius: 50.0,
                          isImageFromFile: false,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _openProfile(context, hostPartyUser),
                        child: Text(
                          subTitleRight,
                          style: userCardSubTitleRightTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


          SizedBox(
            height: 5.0,
          ),
          Divider(
            thickness: 1.0,
          ),
          Container(
            width: double.infinity,
            child: Text(
              S.of(context).hostComment,
              style: userCardSubTitleLeftTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            width: double.infinity,
            child: Text(
              caption,
              style: userCardCaptionTextStyle,
              textAlign: TextAlign.left,
            ),
          ),


          Divider(
            thickness: 1.0,
          ),

          Center(child: InvitedFriendsPartForFeedPostDetailScreen(selectedFriends: partyMembers,))

        ],
      ),
    );
  }

  _openProfile(BuildContext context, User hostPartyUser) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
            profileMode: hostPartyUser.uId == feedViewModel.currentUser.uId
                ? ProfileMode.MYSELF
                : ProfileMode.OTHER,
            selectedUser: hostPartyUser,
          ),
        ));
  }

  }



