import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';

class ProfileLikesPart extends StatelessWidget {
  final HostParty hostParty;

  ProfileLikesPart({this.hostParty});

  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    return FutureBuilder(
      future: profileViewModel.getNumberOfOffer(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final numberOfOfferResult = snapshot.data;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.thumbsUp),
              SizedBox(width: 5.0,),
              Text(numberOfOfferResult.toString(), style: numberOfOfferTextStyle,),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
