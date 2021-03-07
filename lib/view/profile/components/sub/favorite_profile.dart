import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';


class FavoriteProfile extends StatefulWidget {
  @override
  _FavoriteProfileState createState() => _FavoriteProfileState();
}

class _FavoriteProfileState extends State<FavoriteProfile> {


  String selectedAlcohol ;
  String selectedTobacco ;


  @override
  void initState() {

    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);
    final profileUser = profileViewModel.profileUser;

    profileViewModel.selectedAlcohol = profileUser.alcohol;
    profileViewModel.selectedTobacco = profileUser.tobacco;



    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //####################################お酒#######################################
        Row(
          children: [
            Text(S.of(context).alcohol, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                items: [
                      DropdownMenuItem(value: "飲まない", child: Text("飲まない"),),
                      DropdownMenuItem(value: "時々飲む", child: Text("時々飲む"),),
                      DropdownMenuItem(value: "飲む", child: Text("飲む"),),

                ],
                value: selectedAlcohol,
                onChanged: (selectedValue) {
                  setState(() {
                    selectedAlcohol = selectedValue;
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


        //#####################################タバコ#######################################
        Row(
          children: [
            Text(S.of(context).tobacco, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                items: [
                      DropdownMenuItem(value: "吸わない", child: Text("吸わない"),),
                      DropdownMenuItem(value: "時々吸う", child: Text("時々吸う"),),
                      DropdownMenuItem(value: "吸う", child: Text("吸う"),),

                ],
                value: selectedTobacco,
                onChanged: (selectedValue) {
                  setState(() {
                    selectedTobacco = selectedValue;
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

    profileViewModel.selectedAlcohol = selectedAlcohol;
    profileViewModel.selectedTobacco = selectedTobacco;



  }


}
