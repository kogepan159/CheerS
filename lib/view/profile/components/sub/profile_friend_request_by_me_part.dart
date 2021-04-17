
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';

class ProfileFriendRequestByMePart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);

    return FutureBuilder(
      future: profileViewModel.getNumberOfFriendRequestByMe(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final request = snapshot.data;
          return Column(
            children: [
              Text(request.toString(), style: numberOfOfferTextStyle,),
              Text(S.of(context).requestFromYou, style: profileNumberInfoTextStyle,),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
