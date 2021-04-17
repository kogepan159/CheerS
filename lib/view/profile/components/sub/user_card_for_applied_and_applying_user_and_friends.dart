import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:flutter/material.dart';

import '../../../../style.dart';

class UserCardForAppliedAndApplyingUserAndFriends extends StatelessWidget {
  final String photoUrl;
  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final Widget trailing;

  UserCardForAppliedAndApplyingUserAndFriends(
      {@required this.photoUrl,
        @required this.title,
        @required this.subTitle,
        this.trailing,
        @required this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          width: 100,
          height: 100,
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.blueAccent,
            child: CirclePhoto(
              photoUrl: photoUrl,
              isImageFromFile: false,
              radius: 30,
            ),
          ),
        ),
        title: Text(
          title,
          style: userCardForSearchUserTitleTextStyle,
        ),
        subtitle: Text(subTitle, style:  userCardForSearchUserTextStyle,),

        trailing: InkWell(
            splashColor: Colors.blueAccent,
            child: trailing),
      );
  }
}
