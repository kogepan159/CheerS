import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/style.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view/common/dialog/confirm_dialog.dart';
import 'package:cheers_app/view/host_party/screens/host_party_screen.dart';
import 'package:cheers_app/view_models/feed_view_model.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  final FeedMode feedMode;
  final ProfileMode profileMode;
  final String postDateTime;
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
  final String hostPartyId;
  final String numberOfInvitedMembers;

  UserCard(
      {@required this.feedMode,
      this.profileMode,
      @required this.postDateTime,
      @required this.photoUrl,
      @required this.titleLeft,
      @required this.titleRight,
      @required this.subTitleLeft,
      @required this.subTitleRight,
      @required this.trailing,
      @required this.onTap,
      this.currentUser,
      @required this.hostPartyUser,
      @required this.caption,
      @required this.hostParty,
      this.hostPartyId,
        @required this.numberOfInvitedMembers,

      });

  @override

  Widget build(BuildContext context) {

    
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        splashColor: Colors.blueAccent,
        onTap: onTap,
        child: Column(
          children: [
            ListTile(
              //リストビューの右上の三点ボタン
              trailing: feedMode == FeedMode.FROM_PROFILE
                  ? PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      onSelected: (value) =>
                          _omPopUpmMenuSelected(context, value),
                      itemBuilder: (context) {
                        //投稿者が自分の場合に表示する。
                        if (hostPartyUser.uId == currentUser.uId) {
                          return [
                            PopupMenuItem(
                              value: HostPartyMenu.EDIT,
                              child: Text(S.of(context).edit),
                            ),
                            PopupMenuItem(
                              value: HostPartyMenu.DELETE,
                              child: Text(S.of(context).delete),
                            ),
                          ];
                        } else {
                          return null;
                        }
                      })
                  : null,

              title: Row(
                children: [
                  Text(
                    titleLeft.toString(),
                    style: userCardTitleLeftTextStyle,
                  ),
                  SizedBox(
                    width: 40.0,
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
                    width: 30.0,
                  ),
                  CirclePhoto(
                    photoUrl: hostPartyUser.photoUrl_1,
                    radius: 60.0,
                    isImageFromFile: false,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Row(
                    children: [
                      Text(S.of(context).plus,style: userCardTitleRightTextStyle,),
                      Text(numberOfInvitedMembers,style: userCardTitleRightTextStyle,),
                      Text(S.of(context).people,style: userCardTitleRightTextStyle,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              subTitleRight,
              style: userCardSubTitleRightTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                child: Text(
                  caption,
                  style: userCardCaptionTextStyle,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
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
                  postDateTime.toString(),
                  textAlign: TextAlign.left,
                  style: userCardTimeAgoTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _omPopUpmMenuSelected(BuildContext context, HostPartyMenu selectedMenu) {
    switch (selectedMenu) {
      case HostPartyMenu.EDIT:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HostPartyScreen(
              hostPartyId: hostPartyId,
              hostParty: hostParty,
              from: PostCaptionOpenMode.FROM_PROFILE,
              hostPartyUser: hostPartyUser,
            ),
          ),
        );
        break;

      case HostPartyMenu.DELETE:
        showConfirmDialog(
            context: context,
            title: S.of(context).deletePost,
            content: S.of(context).deletePostConfirm,
            onConfirmed: (isConfirmed) {
              if (isConfirmed) _deleteHostParty(context, hostPartyId);
            });
    }
  }

  void _deleteHostParty(BuildContext context, String hostPartyId) async {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    await profileViewModel.deleteHostParty(hostPartyId, profileMode);
  }
}
