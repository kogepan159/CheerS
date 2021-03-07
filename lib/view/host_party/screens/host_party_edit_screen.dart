import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/button_with_icon.dart';
import 'package:cheers_app/view/host_party/components/host_party_caption_part.dart';
import 'package:cheers_app/view/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'host_party_confirmation_screen.dart';

class HostPartyEditScreen extends StatelessWidget {
  final HostParty hostParty;
  final User profileUser;
  final String hostPartyId;

  HostPartyEditScreen({@required this.hostParty, @required this.profileUser, @required this.hostPartyId});

  @override
  Widget build(BuildContext context) {
    // final hostPartyViewModel =
    //     Provider.of<HostPartyViewModel>(context, listen: false);

    // return Consumer<HostPartyViewModel>(builder: (context, model, child) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => cancelPost(context),
        ),
        title: Text(S.of(context).post),
      ),
      body: Column(
        children: [
          HostPartyCaptionPart(
            hostParty: hostParty,
            from: PostCaptionOpenMode.FROM_PROFILE,
            profileUser: profileUser,
            hostPartyId: hostPartyId,
          ),
          ButtonWithIcon(
            //TODO　友達招待処理
            iconData: FontAwesomeIcons.userFriends,
            label: S.of(context).inviteFriends,
            onPressed: () => _openInviteFriendsScreen(context),
          ),
          ButtonWithIcon(
            iconData: FontAwesomeIcons.check,
            label: S.of(context).confirmation,
            onPressed: () => _openHostPartyConfirmationScreen(context),
          ),
        ],
      ),
    );
  }

  cancelPost(BuildContext context) {
    //TODO viewmodelでのメソッド作成
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );
  }

  //TODO
  _openInviteFriendsScreen(BuildContext context) {}

  _openHostPartyConfirmationScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HostPartyConfirmationScreen(hostPartyUser: profileUser,)),
    );
  }
}
