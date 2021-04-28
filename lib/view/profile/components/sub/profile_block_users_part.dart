
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';

class ProfileBlockUsersPart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);

    return FutureBuilder(
      future: profileViewModel.getNumberOfBlockUsers(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final blockUsers = snapshot.data;
          return Column(
            children: [
              Text(blockUsers.toString(), style: numberOfOfferTextStyle,),
              Text(S.of(context).block, style: profileNumberInfoTextStyle,),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
