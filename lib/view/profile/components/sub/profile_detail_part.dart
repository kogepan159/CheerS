import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';

class ProfileDetailPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(
        context, listen: false);

    return FutureBuilder(
      future: profileViewModel.getProfile(),
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final profileData = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30.0,
                ),
                //"""""""""自己紹介文"""""""""""
                Text(S.of(context).bio, style: profileEditTitleTextStyle),
                Divider(
                  thickness: 1.0,
                ),
                Container(
                  child: Text(profileData.bio, style: profileEditTextStyle,
                    ),
                  ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""性別"""""""""""

                Row(
                  children: [
                    Text(S.of(context).gender, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 45.0,
                    ),
                    profileData.gender == "male"
                        ? Text(
                      "男性",
                      style: profileEditTextStyle,
                    )
                        : Text(
                      "女性",
                      style: profileEditTextStyle,
                    )
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""年齢"""""""""""
                Row(
                  children: [
                    Text(S.of(context).age, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 45.0,
                    ),
                    Text(profileData.age.toString(), style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),



                //"""""""""ニックネーム"""""""""""
                Row(
                  children: [
                    Text(S.of(context).nickName, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(profileData.inAppUserName, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

               //"""""""""居住地"""""""""""
                Row(
                  children: [
                    Text(S.of(context).residence, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(profileData.residence, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""出身地"""""""""""
                Row(
                  children: [
                    Text(S.of(context).birthPlace, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(profileData.birthPlace, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""血液型"""""""""""
                Row(
                  children: [
                    Text(S.of(context).bloodType, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(profileData.bloodType, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),


                //"""""""""同居人"""""""""""
                Row(
                  children: [
                    Text(S.of(context).livingStatus, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(profileData.livingStatus, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""身長"""""""""""
                Row(
                  children: [
                    Text(S.of(context).height, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 45.0,
                    ),
                    Text(profileData.height.toString() + "cm", style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),


                //"""""""""体型"""""""""""
                Row(
                  children: [
                    Text(S.of(context).bodyShape, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 45.0,
                    ),
                    Text(profileData.bodyShape, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""学歴"""""""""""
                Row(
                  children: [
                    Text(S.of(context).educationalBackground, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 45.0,
                    ),
                    Text(profileData.educationalBackground, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""職業"""""""""""
                Row(
                  children: [
                    Text(S.of(context).occupation, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 45.0,
                    ),
                    Text(profileData.occupation, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""休日"""""""""""
                Row(
                  children: [
                    Text(S.of(context).holiday, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 45.0,
                    ),
                    Text(profileData.holiday, style: profileEditTextStyle),                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""お酒"""""""""""
                Row(
                  children: [
                    Text(S.of(context).alcohol, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 45.0,
                    ),
                    Text(profileData.alcohol, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),


                //"""""""""タバコ"""""""""""
                Row(
                  children: [
                    Text(S.of(context).tobacco, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(profileData.tobacco, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""社交性"""""""""""
                Row(
                  children: [
                    Text(S.of(context).sociability, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(profileData.sociability, style: profileEditTextStyle),
                  ],
                ),

                Divider(
                  thickness: 1.0,
                ),



                //""""""""理想の合コン人数""""""""""""
                Row(
                  children: [
                    Text(S.of(context).idealNumberOfParty, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(profileData.idealNumberOfParty, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //""""""""""""好きな合コンの雰囲気"""""""""""""""
                Row(
                  children: [
                    Text(S.of(context).idealPartyAtmosphere, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(profileData.idealPartyAtmosphere, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),


                //""""""""""""""""""カラオケ"""""""""""""""""""
                Row(
                  children: [
                    Text(S.of(context).karaoke, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(profileData.karaoke, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),

                //"""""""""""""""""""""費用""""""""""""""""""""""
                Row(
                  children: [
                    Text(S.of(context).partyFee, style: profileEditTitleTextStyle),
                    SizedBox(
                      width: 45.0,
                    ),
                    Text(profileData.partyFee, style: profileEditTextStyle),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),


              ],

            ),
          );
        } else {
          return Container();
        }
      },
    );

  }
}
