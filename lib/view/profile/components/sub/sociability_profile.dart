import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';


class SociabilityProfile extends StatefulWidget {
  @override
  _SociabilityProfileState createState() => _SociabilityProfileState();
}

class _SociabilityProfileState extends State<SociabilityProfile> {

  String selectedSociability ;

  @override
  void initState() {

    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);
    final profileUser = profileViewModel.profileUser;

    profileViewModel.selectedSociability = profileUser.sociability;



    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //###################################社交性#########################################
        Row(
          children: [
            Text(S.of(context).sociability, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                items: [

                  DropdownMenuItem(
                    value: "大人数が好き",
                    child: Text("大人数が好き"),
                  ),
                  DropdownMenuItem(
                    value: "少人数が好き",
                    child: Text("少人数が好き"),
                  ),

                ],
                value: selectedSociability,
                onChanged: (selectedValue) {
                  setState(() {
                    selectedSociability = selectedValue;
                    _onUpdated();
                    //#############ドロップダウンを選択するとTextFieldにフォーカスしてしまうのを解決##############
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                }),
          ],
        ),
        Divider(
          thickness: 1.0,
        ),


      ],
    );
  }


  _onUpdated() {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);

    profileViewModel.selectedSociability = selectedSociability;

  }


}
