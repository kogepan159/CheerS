import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';

class AppearanceProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //##################################身長###############################
        Row(
          children: [
            Text(S.of(context).height, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(""),
                  ),
                  DropdownMenuItem(
                    value: 140,
                    child: Text("140cm以下"),
                  ),
                  DropdownMenuItem(
                    value: 141,
                    child: Text("141cm"),
                  ),
                  DropdownMenuItem(
                    value: 142,
                    child: Text("142cm"),
                  ),
                  DropdownMenuItem(
                    value: 143,
                    child: Text("143cm"),
                  ),
                  DropdownMenuItem(
                    value: 144,
                    child: Text("144cm"),
                  ),
                  DropdownMenuItem(
                    value: 145,
                    child: Text("145cm"),
                  ),
                  DropdownMenuItem(
                    value: 146,
                    child: Text("146cm"),
                  ),
                  DropdownMenuItem(
                    value: 147,
                    child: Text("147cm"),
                  ),
                  DropdownMenuItem(
                    value: 148,
                    child: Text("148cm"),
                  ),
                  DropdownMenuItem(
                    value: 149,
                    child: Text("149cm"),
                  ),
                  DropdownMenuItem(
                    value: 150,
                    child: Text("150cm"),
                  ),
                  DropdownMenuItem(
                    value: 151,
                    child: Text("151cm"),
                  ),
                  DropdownMenuItem(
                    value: 152,
                    child: Text("152cm"),
                  ),
                  DropdownMenuItem(
                    value: 153,
                    child: Text("153cm"),
                  ),
                  DropdownMenuItem(
                    value: 154,
                    child: Text("154cm"),
                  ),
                  DropdownMenuItem(
                    value: 155,
                    child: Text("155cm"),
                  ),
                  DropdownMenuItem(
                    value: 156,
                    child: Text("156cm"),
                  ),
                  DropdownMenuItem(
                    value: 157,
                    child: Text("157cm"),
                  ),
                  DropdownMenuItem(
                    value: 158,
                    child: Text("158cm"),
                  ),
                  DropdownMenuItem(
                    value: 159,
                    child: Text("159cm"),
                  ),
                  DropdownMenuItem(
                    value: 160,
                    child: Text("160cm"),
                  ),
                  DropdownMenuItem(
                    value: 161,
                    child: Text("161cm"),
                  ),
                  DropdownMenuItem(
                    value: 162,
                    child: Text("162cm"),
                  ),
                  DropdownMenuItem(
                    value: 163,
                    child: Text("163cm"),
                  ),
                  DropdownMenuItem(
                    value: 164,
                    child: Text("164cm"),
                  ),
                  DropdownMenuItem(
                    value: 165,
                    child: Text("165cm"),
                  ),
                  DropdownMenuItem(
                    value: 166,
                    child: Text("166cm"),
                  ),
                  DropdownMenuItem(
                    value: 167,
                    child: Text("167cm"),
                  ),
                  DropdownMenuItem(
                    value: 168,
                    child: Text("168cm"),
                  ),
                  DropdownMenuItem(
                    value: 169,
                    child: Text("169cm"),
                  ),
                  DropdownMenuItem(
                    value: 170,
                    child: Text("170cm"),
                  ),
                  DropdownMenuItem(
                    value: 171,
                    child: Text("171cm"),
                  ),
                  DropdownMenuItem(
                    value: 172,
                    child: Text("172cm"),
                  ),
                  DropdownMenuItem(
                    value: 173,
                    child: Text("173cm"),
                  ),
                  DropdownMenuItem(
                    value: 174,
                    child: Text("174cm"),
                  ),
                  DropdownMenuItem(
                    value: 175,
                    child: Text("175cm"),
                  ),
                  DropdownMenuItem(
                    value: 176,
                    child: Text("176cm"),
                  ),
                  DropdownMenuItem(
                    value: 177,
                    child: Text("177cm"),
                  ),
                  DropdownMenuItem(
                    value: 178,
                    child: Text("178cm"),
                  ),
                  DropdownMenuItem(
                    value: 179,
                    child: Text("179cm"),
                  ),
                  DropdownMenuItem(
                    value: 180,
                    child: Text("180cm"),
                  ),
                  DropdownMenuItem(
                    value: 181,
                    child: Text("181cm"),
                  ),
                  DropdownMenuItem(
                    value: 182,
                    child: Text("182cm"),
                  ),
                  DropdownMenuItem(
                    value: 183,
                    child: Text("183cm"),
                  ),
                  DropdownMenuItem(
                    value: 184,
                    child: Text("184cm"),
                  ),
                  DropdownMenuItem(
                    value: 185,
                    child: Text("185cm"),
                  ),
                  DropdownMenuItem(
                    value: 186,
                    child: Text("186cm"),
                  ),
                  DropdownMenuItem(
                    value: 187,
                    child: Text("187cm"),
                  ),
                  DropdownMenuItem(
                    value: 188,
                    child: Text("188cm"),
                  ),
                  DropdownMenuItem(
                    value: 189,
                    child: Text("189cm"),
                  ),
                  DropdownMenuItem(
                    value: 190,
                    child: Text("190cm"),
                  ),
                  DropdownMenuItem(
                    value: 191,
                    child: Text("191cm"),
                  ),
                  DropdownMenuItem(
                    value: 192,
                    child: Text("192cm"),
                  ),
                  DropdownMenuItem(
                    value: 193,
                    child: Text("193cm"),
                  ),
                  DropdownMenuItem(
                    value: 194,
                    child: Text("194cm"),
                  ),
                  DropdownMenuItem(
                    value: 195,
                    child: Text("195cm"),
                  ),
                  DropdownMenuItem(
                    value: 196,
                    child: Text("196cm"),
                  ),
                  DropdownMenuItem(
                    value: 197,
                    child: Text("197cm"),
                  ),
                  DropdownMenuItem(
                    value: 198,
                    child: Text("198cm"),
                  ),
                  DropdownMenuItem(
                    value: 199,
                    child: Text("199cm"),
                  ),
                  DropdownMenuItem(
                    value: 200,
                    child: Text("200cm以上"),
                  ),
                ],
                value: _profileViewModel.selectedHeight,
                onChanged: (selectedValue) {
                  _profileViewModel.selectedHeight = selectedValue;
                  // _onUpdated(context);
                  //#############ドロップダウンを選択するとTextFieldにフォーカスしてしまうのを解決##############
                  FocusScope.of(context).requestFocus(new FocusNode());
                }),
          ],
        ),
        Divider(
          thickness: 1.0,
        ),

        //######################################体型#######################################
        Row(
          children: [
            Text(S.of(context).bodyShape, style: profileEditTitleTextStyle),
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
                    value: "スリム",
                    child: Text("スリム"),
                  ),
                  DropdownMenuItem(
                    value: "やや細め",
                    child: Text("やや細め"),
                  ),
                  DropdownMenuItem(
                    value: "普通",
                    child: Text("普通"),
                  ),
                  DropdownMenuItem(
                    value: "グラマー",
                    child: Text("グラマー"),
                  ),
                  DropdownMenuItem(
                    value: "筋肉質",
                    child: Text("筋肉質"),
                  ),
                  DropdownMenuItem(
                    value: "ややぽっちゃり",
                    child: Text("ややぽっちゃり"),
                  ),
                  DropdownMenuItem(
                    value: "太め",
                    child: Text("太め"),
                  ),
                ],
                value: _profileViewModel.selectedBodyShape,
                onChanged: (selectedValue) {
                  _profileViewModel.selectedBodyShape = selectedValue;
                  // _onUpdated(context);
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
