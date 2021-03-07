import 'package:bubble/bubble.dart';
import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/offer.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/style.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/button_with_icon.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view_models/feed_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserCardForFeedPostDetailScreen extends StatelessWidget {
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

  UserCardForFeedPostDetailScreen({
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
  });

  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text(
                titleLeft.toString(),
                style: userCardTitleLeftTextStyle,
              ),
              SizedBox(
                width: 30.0,
              ),
              Text(
                titleRight.toString(),
                style: userCardTitleRightTextStyle,
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Text(
                subTitleLeft,
                style: userCardSubTitleLeftTextStyle,
              ),
              SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () => _openProfile(context, hostPartyUser),
                child: CirclePhoto(
                  photoUrl: photoUrl,
                  radius: 30.0,
                  isImageFromFile: false,
                ),
              ),
              SizedBox(
                width: 10.0,
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
          trailing: trailing,
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            width: double.infinity,
            child: Text(
              S.of(context).hostComment,
              style: userCardSubTitleLeftTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: double.infinity,
            child: Text(
              caption,
              style: userCardCaptionTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
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
