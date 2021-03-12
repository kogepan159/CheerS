import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';

class ConditionsProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //###########################理想の合コン人数##############################
        Row(
          children: [
            Text(S.of(context).idealNumberOfParty, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: "2:2",
                    child: Text("2:2"),
                  ),
                  DropdownMenuItem(
                    value: "3:3",
                    child: Text("3:3"),
                  ),
                  DropdownMenuItem(
                    value: "4:4",
                    child: Text("4:4"),
                  ),
                  DropdownMenuItem(
                    value: "5:5",
                    child: Text("5:5"),
                  ),
                  DropdownMenuItem(
                    value: "それ以上",
                    child: Text("それ以上"),
                  ),
                ],
                value: _profileViewModel.selectedIdealNumberOfParty,
                onChanged: (selectedValue) {
                  _profileViewModel.selectedIdealNumberOfParty = selectedValue;
                  //#############ドロップダウンを選択するとTextFieldにフォーカスしてしまうのを解決##############
                  FocusScope.of(context).requestFocus(new FocusNode());
                }),
          ],
        ),
        Divider(
          thickness: 1.0,
        ),

        //#################################好きな合コンの雰囲気##############################
        Row(
          children: [
            Text(S.of(context).idealPartyAtmosphere, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: "賑やか",
                    child: Text("賑やか"),
                  ),
                  DropdownMenuItem(
                    value: "落ち着いた",
                    child: Text("落ち着いた"),
                  ),
                  DropdownMenuItem(
                    value: "フレンドリー",
                    child: Text("フレンドリー"),
                  ),
                  DropdownMenuItem(
                    value: "リラックス",
                    child: Text("リラックス"),
                  ),
                ],
                value: _profileViewModel.selectedIdealPartyAtmosphere,
                onChanged: (selectedValue) {
                  _profileViewModel.selectedIdealPartyAtmosphere = selectedValue;
                  //#############ドロップダウンを選択するとTextFieldにフォーカスしてしまうのを解決##############
                  FocusScope.of(context).requestFocus(new FocusNode());
                }),
          ],
        ),
        Divider(
          thickness: 1.0,
        ),

        //#####################################カラオケ####################################
        Row(
          children: [
            Text(S.of(context).karaoke, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: "好き",
                    child: Text("好き"),
                  ),
                  DropdownMenuItem(
                    value: "聴くだけ",
                    child: Text("聴くだけ"),
                  ),
                  DropdownMenuItem(
                    value: "苦手",
                    child: Text("苦手"),
                  ),
                ],
                value: _profileViewModel.selectedKaraoke,
                onChanged: (selectedValue) {
                  _profileViewModel.selectedKaraoke = selectedValue;
                  //#############ドロップダウンを選択するとTextFieldにフォーカスしてしまうのを解決##############
                  FocusScope.of(context).requestFocus(new FocusNode());
                }),
          ],
        ),
        Divider(
          thickness: 1.0,
        ),

        //#########################################費用######################################
        Row(
          children: [
            Text(S.of(context).partyFee, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                autofocus: false,
                items: [
                  DropdownMenuItem(
                    value: "男性陣が全て払う",
                    child: Text("男性陣が全て払う"),
                  ),
                  DropdownMenuItem(
                    value: "男性陣が多めに払う",
                    child: Text("男性陣が多めに払う"),
                  ),
                  DropdownMenuItem(
                    value: "割り勘",
                    child: Text("割り勘"),
                  ),
                  DropdownMenuItem(
                    value: "相談して決める",
                    child: Text("相談して決める"),
                  ),
                  DropdownMenuItem(
                    value: "女性陣が多めに払う",
                    child: Text("女性陣が多めに払う"),
                  ),
                  DropdownMenuItem(
                    value: "女性陣が全て払う",
                    child: Text("女性陣が全て払う"),
                  ),
                ],
                value: _profileViewModel.selectedPartyFee,
                onChanged: (selectedValue) {
                  _profileViewModel.selectedPartyFee = selectedValue;
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
}
