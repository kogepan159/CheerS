
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';

class ProfileApplicationOfFriendsPart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);

    return FutureBuilder(
      future: profileViewModel.getNumberOfApplicationOfFriends(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final follower = snapshot.data;
          return Column(
            children: [
              Text(follower.toString(), style: numberOfOfferTextStyle,),
              Text(S.of(context).request, style: profileNumberInfoTextStyle,),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
