import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view_models/feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../style.dart';

class UserCardForInvitedFriendsPart extends StatelessWidget {
  final String friendName;
  final String photoUrl;
  final double radius;
  final VoidCallback onTap;
  final bool isImageFromFile;
  final User selectedFriend;

  UserCardForInvitedFriendsPart(
      {@required this.friendName,
      @required this.photoUrl,
      @required this.radius,
      this.onTap,
      @required this.isImageFromFile,
      @required this.selectedFriend});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CirclePhoto(
          photoUrl: photoUrl,
          radius: radius,
          isImageFromFile: isImageFromFile,
        ),
        Text(
          friendName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: userCardForInvitedFriendsTextStyle,
        ),
      ],
    );
  }
}
