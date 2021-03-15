import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/button_with_icon.dart';
import 'package:cheers_app/view/common/dialog/confirm_dialog.dart';
import 'package:cheers_app/view/home_screen.dart';
import 'package:cheers_app/view/host_party/components/host_party_caption_part.dart';
import 'package:cheers_app/view/host_party/components/host_party_caption_part.dart';
import 'package:cheers_app/view/host_party/screens/host_party_confirmation_screen.dart';
import 'package:cheers_app/view_models/host_party_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HostPartyScreen extends StatelessWidget {
  final HostParty hostParty;
  final String hostPartyId;
  final PostCaptionOpenMode from;
  final User hostPartyUser;

  HostPartyScreen({@required this.hostParty, this.hostPartyId, this.from,@required this.hostPartyUser});

  @override
  Widget build(BuildContext context) {
    final hostPartyViewModel =
        Provider.of<HostPartyViewModel>(context, listen: false);



    return FutureBuilder(
        future: hostPartyViewModel.getPartyForEdit(hostPartyId),
    builder: (context, AsyncSnapshot<HostParty> snapShot) {
    if (snapShot.hasData && snapShot.data != null) {
      final partyData = snapShot.data;
      print("hostPartyUser $partyData");


      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => cancelPost(context),
          ),
          title: Text(S
              .of(context)
              .post),
        ),
        body: Column(
          children: [
            HostPartyCaptionPart(
              hostParty: hostParty,
              from: from,
              partyData: partyData,
            ),
            ButtonWithIcon(
              //TODO　友達招待処理
              iconData: FontAwesomeIcons.userFriends,
              label: S
                  .of(context)
                  .inviteFriends,
              onPressed: () => _openInviteFriendsScreen(context),
            ),
            (from == PostCaptionOpenMode.FROM_PROFILE)
                ? ButtonWithIcon(
              iconData: FontAwesomeIcons.check,
              label: S
                  .of(context)
                  .confirmationUpdates,
              onPressed: () => _openHostPartyConfirmationScreen(context),
            )
                : ButtonWithIcon(
              iconData: FontAwesomeIcons.check,
              label: S
                  .of(context)
                  .confirmation,
              onPressed: () => _openHostPartyConfirmationScreen(context),
            ),
          ],
        ),
      );
    }else{
      return Center(child: CircularProgressIndicator());
    }
    }
    );
  }

  cancelPost(BuildContext context) {
    //TODO viewmodelでのメソッド作成
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  _openInviteFriendsScreen(BuildContext context) {}

  _openHostPartyConfirmationScreen(BuildContext context) {
    final hostPartyViewModel =
    Provider.of<HostPartyViewModel>(context, listen: false);

    hostPartyViewModel.selectedPrefecture == null
        ? showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text(S
                  .of(context)
                  .error),
              content: Text(S
                  .of(context)
                  .noPrefectureIsSelected),
              actions: [
                FlatButton(
                  child: Text(S
                      .of(context)
                      .ok),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            )
    )
        : Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              HostPartyConfirmationScreen(
                hostParty: hostParty,
                hostPartyUser: hostPartyUser,
                from: from,
              )),
    );



  }
}
