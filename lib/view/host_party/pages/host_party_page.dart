import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/button_with_icon.dart';
import 'package:cheers_app/view/profile/screens/profile_number_of_friends_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HostPartyPage extends StatelessWidget {

  final HostParty hostParty;
  HostPartyPage({this.hostParty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWithIcon(
              iconData: FontAwesomeIcons.glassCheers,
              label: S.of(context).hostParty,
              //TODO
              onPressed: () => _openProfileNumberOfFriendsScreen(context),
            ),
          ],
        ),
      ),
    );
  }

  _openProfileNumberOfFriendsScreen(BuildContext context) {

    Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProfileNumberOfFriendsScreen(numberOfFriendsScreenOpenMode: NumberOfFriendsScreenOpenMode.FROM_HostParty,from: PostCaptionOpenMode.FROM_POST,),));

  }
}
