import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view/host_party/components/user_card_for_inveted_friends_part.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view_models/host_party_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';

class InvitedFriendsPart extends StatelessWidget {
  final List<User> selectedFriends;
  final VoidCallback onTap;

  InvitedFriendsPart({@required this.selectedFriends, @required this.onTap});

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
          style: coloredHostPartyCaptionPartTextStyle,),
        Container(
          height: 150,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: selectedFriends.length,
              itemBuilder: (context, int index) {
                final selectedFriend = selectedFriends[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: UserCardForInvitedFriendsPart(
                    friendName: selectedFriend.inAppUserName,
                    photoUrl: selectedFriend.photoUrl_1,
                    radius: 25,
                    isImageFromFile: false,
                  ),
                );
              }),
        ),
      ],
    );
  }

}
