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
  String selectedAlcohol = "";
  String selectedTobacco = "";
  @override
  Widget build(BuildContext context) {


    final _profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

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
                  DropdownMenuItem(
                    value: "",
                    child: Text(""),
                  ),
                  DropdownMenuItem(
                    value: "飲まない",
                    child: Text("飲まない"),
                  ),
                  DropdownMenuItem(
                    value: "時々飲む",
                    child: Text("時々飲む"),
                  ),
                  DropdownMenuItem(
                    value: "飲む",
                    child: Text("飲む"),
                  ),
                ],
                value: _profileViewModel.selectedAlcohol.length == 0
                    ? selectedAlcohol
                    : _profileViewModel.selectedAlcohol,
                onChanged: (selectedValue) {

                  if( _profileViewModel.selectedAlcohol.length == 0){
                  selectedAlcohol = selectedValue;
                  _onUpdate();
                  }else{
                   _profileViewModel.selectedAlcohol = selectedValue;
                  }

                  //#############ドロップダウンを選択するとTextFieldにフォーカスしてしまうのを解決##############
                  FocusScope.of(context).requestFocus(new FocusNode());
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
                  DropdownMenuItem(
                    value: "",
                    child: Text(""),
                  ),
                  DropdownMenuItem(
                    value: "吸わない",
                    child: Text("吸わない"),
                  ),
                  DropdownMenuItem(
                    value: "時々吸う",
                    child: Text("時々吸う"),
                  ),
                  DropdownMenuItem(
                    value: "吸う",
                    child: Text("吸う"),
                  ),
                ],
                value: _profileViewModel.selectedTobacco.length == 0
                ? selectedTobacco
                : _profileViewModel.selectedTobacco,
                onChanged: (selectedValue) {
                  if(_profileViewModel.selectedTobacco.length == 0 ){
                   selectedTobacco = selectedValue ;
                   _onUpdate();
                  }else{
                   _profileViewModel.selectedTobacco = selectedValue;
                  }
                  //#############ドロップダウンを選択するとTextFieldにフォーカスしてしまうのを解決##############
                  FocusScope.of(context).requestFocus(new FocusNode());
                }),
          ],
        ),
        Divider(
          thickness: 1.0,
        ),
      ],
    );
  }

  void _onUpdate() {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);

    profileViewModel.selectedAlcohol = selectedAlcohol;
    profileViewModel.selectedTobacco = selectedTobacco;

  }
}
