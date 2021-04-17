import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:flutter/material.dart';

import '../../../../style.dart';

class UserCardForSearchUser extends StatelessWidget {
  final String photoUrl;
  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final Widget trailing;

  UserCardForSearchUser(
      {@required this.photoUrl,
      @required this.title,
      @required this.subTitle,
      this.trailing,
      @required this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blueGrey,
      onTap: onTap,
      child: ListTile(
        leading: Container(
          width: 100,
          height: 100,
          child: CirclePhoto(
                  photoUrl: photoUrl,
                  isImageFromFile: false,
                  radius: 30,
                  onTap: null,
                ),
        ),
        title: Text(
          title,
          style: userCardForSearchUserTitleTextStyle,
        ),
        subtitle: Text(
          subTitle,
          style: userCardForSearchUserTextStyle,
        ),
        trailing: trailing,
      ),
    );
  }
}
