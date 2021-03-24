import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:cheers_app/style.dart';
import 'package:provider/provider.dart';

class GeneralProfile extends StatefulWidget {
  final User profileData;

  GeneralProfile({@required this.profileData});

  @override
  _GeneralProfileState createState() => _GeneralProfileState();
}

class _GeneralProfileState extends State<GeneralProfile> {
  TextEditingController bioController = TextEditingController();
  TextEditingController captionInAppUserNameController =
      TextEditingController();

  String updateBio = "";
  String updateInAppUserName = "";
  String selectedResidence = "";
  String selectedBirthPlace = "";
  String selectedBloodType = "";
  String selectedLivingStatus = "";

  @override
  void initState() {
    //既にDbにあるデータを表示させる

    bioController.text = widget.profileData.bio;
    captionInAppUserNameController.text = widget.profileData.inAppUserName;

    bioController.addListener(_onCaptionUpdated);
    captionInAppUserNameController.addListener(_onCaptionUpdated);

    super.initState();
  }

  @override
  void dispose() {
    bioController.dispose();
    captionInAppUserNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30.0,
        ),
        //####################自己紹介文#######################
        Text(S.of(context).bio, style: profileEditTitleTextStyle),
        Divider(
          thickness: 1.0,
        ),
        Container(
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLength: 1000,
            maxLengthEnforced: true,
            maxLines: null,
            controller: bioController,
            style: profileEditTextStyle,
            autofocus: true,
            decoration: InputDecoration(
              hintText: S.of(context).inputIntroductionForProfile,
              hintStyle: hintTextStyle,
              hintMaxLines: 10,
              border: InputBorder.none,
            ),
          ),
        ),
        Divider(
          thickness: 1.0,
        ),
        //#########################性別############################
        Row(
          children: [
            Text(S.of(context).gender, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            widget.profileData.gender == "male"
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
        //###################ニックネーム###################################

        Row(
          children: [
            Text(S.of(context).age, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            Text(widget.profileData.age.toString(),
                style: profileEditTextStyle),
          ],
        ),
        Divider(
          thickness: 1.0,
        ),

        Text(S.of(context).nickName, style: profileEditTitleTextStyle),
        Divider(
          thickness: 1.0,
        ),
        TextField(
          keyboardType: TextInputType.text,
          maxLengthEnforced: true,
          maxLength: 8,
          maxLines: 1,
          minLines: 1,
          controller: captionInAppUserNameController,
          style: profileEditTextStyle,
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: S.of(context).hintForNickName),
        ),
        Divider(
          thickness: 1.0,
        ),

        //####################################居住地######################################
        Row(
          children: [
            Text(S.of(context).residence, style: profileEditTitleTextStyle),
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
                    value: "北海道",
                    child: Text("北海道"),
                  ),
                  DropdownMenuItem(
                    value: "青森県",
                    child: Text("青森県"),
                  ),
                  DropdownMenuItem(
                    value: "岩手県",
                    child: Text("岩手県"),
                  ),
                  DropdownMenuItem(
                    value: "宮城県",
                    child: Text("宮城県"),
                  ),
                  DropdownMenuItem(
                    value: "秋田県",
                    child: Text("秋田県"),
                  ),
                  DropdownMenuItem(
                    value: "山形県",
                    child: Text("山形県"),
                  ),
                  DropdownMenuItem(
                    value: "福島県",
                    child: Text("福島県"),
                  ),
                  DropdownMenuItem(
                    value: "茨城県",
                    child: Text("茨城県"),
                  ),
                  DropdownMenuItem(
                    value: "栃木県",
                    child: Text("栃木県"),
                  ),
                  DropdownMenuItem(
                    value: "群馬県",
                    child: Text("群馬県"),
                  ),
                  DropdownMenuItem(
                    value: "埼玉県",
                    child: Text("埼玉県"),
                  ),
                  DropdownMenuItem(
                    value: "千葉県",
                    child: Text("千葉県"),
                  ),
                  DropdownMenuItem(
                    value: "東京都",
                    child: Text("東京都"),
                  ),
                  DropdownMenuItem(
                    value: "神奈川県",
                    child: Text("神奈川県"),
                  ),
                  DropdownMenuItem(
                    value: "新潟県",
                    child: Text("新潟県"),
                  ),
                  DropdownMenuItem(
                    value: "富山県",
                    child: Text("富山県"),
                  ),
                  DropdownMenuItem(
                    value: "石川県",
                    child: Text("石川県"),
                  ),
                  DropdownMenuItem(
                    value: "福井県",
                    child: Text("福井県"),
                  ),
                  DropdownMenuItem(
                    value: "山梨県",
                    child: Text("山梨県"),
                  ),
                  DropdownMenuItem(
                    value: "長野県",
                    child: Text("長野県"),
                  ),
                  DropdownMenuItem(
                    value: "岐阜県",
                    child: Text("岐阜県"),
                  ),
                  DropdownMenuItem(
                    value: "静岡県",
                    child: Text("静岡県"),
                  ),
                  DropdownMenuItem(
                    value: "愛知県",
                    child: Text("愛知県"),
                  ),
                  DropdownMenuItem(
                    value: "三重県",
                    child: Text("三重県"),
                  ),
                  DropdownMenuItem(
                    value: "滋賀県",
                    child: Text("滋賀県"),
                  ),
                  DropdownMenuItem(
                    value: "京都府",
                    child: Text("京都府"),
                  ),
                  DropdownMenuItem(
                    value: "大阪府",
                    child: Text("大阪府"),
                  ),
                  DropdownMenuItem(
                    value: "兵庫県",
                    child: Text("兵庫県"),
                  ),
                  DropdownMenuItem(
                    value: "奈良県",
                    child: Text("奈良県"),
                  ),
                  DropdownMenuItem(
                    value: "和歌山県",
                    child: Text("和歌山県"),
                  ),
                  DropdownMenuItem(
                    value: "鳥取県",
                    child: Text("鳥取県"),
                  ),
                  DropdownMenuItem(
                    value: "島根県",
                    child: Text("島根県"),
                  ),
                  DropdownMenuItem(
                    value: "岡山県",
                    child: Text("岡山県"),
                  ),
                  DropdownMenuItem(
                    value: "広島県",
                    child: Text("広島県"),
                  ),
                  DropdownMenuItem(
                    value: "山口県",
                    child: Text("山口県"),
                  ),
                  DropdownMenuItem(
                    value: "徳島県",
                    child: Text("徳島県"),
                  ),
                  DropdownMenuItem(
                    value: "香川県",
                    child: Text("香川県"),
                  ),
                  DropdownMenuItem(
                    value: "愛媛県",
                    child: Text("愛媛県"),
                  ),
                  DropdownMenuItem(
                    value: "高知県",
                    child: Text("高知県"),
                  ),
                  DropdownMenuItem(
                    value: "福岡県",
                    child: Text("福岡県"),
                  ),
                  DropdownMenuItem(
                    value: "佐賀県",
                    child: Text("佐賀県"),
                  ),
                  DropdownMenuItem(
                    value: "長崎県",
                    child: Text("長崎県"),
                  ),
                  DropdownMenuItem(
                    value: "熊本県",
                    child: Text("熊本県"),
                  ),
                  DropdownMenuItem(
                    value: "大分県",
                    child: Text("大分県"),
                  ),
                  DropdownMenuItem(
                    value: "宮崎県",
                    child: Text("宮崎県"),
                  ),
                  DropdownMenuItem(
                    value: "鹿児島県",
                    child: Text("鹿児島県"),
                  ),
                  DropdownMenuItem(
                    value: "沖縄県",
                    child: Text("沖縄県"),
                  ),
                ],
                value: _profileViewModel.selectedResidence.length == 0
                    ? selectedResidence
                    : _profileViewModel.selectedResidence,
                onChanged: (selectedValue) {
                  setState(() {

                    if(_profileViewModel.selectedResidence.length == 0){
                      selectedResidence = selectedValue;
                      _onUpdate();
                    }else{
                     _profileViewModel.selectedResidence = selectedValue;
                    }

                    //#############ドロップダウンを選択するとTextFieldにフォーカスしてしまうのを解決##############
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                }),
          ],
        ),
        Divider(
          thickness: 1.0,
        ),

        //#####################################出身地#########################################
        Row(
          children: [
            Text(S.of(context).birthPlace, style: profileEditTitleTextStyle),
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
                    value: "北海道",
                    child: Text("北海道"),
                  ),
                  DropdownMenuItem(
                    value: "青森県",
                    child: Text("青森県"),
                  ),
                  DropdownMenuItem(
                    value: "岩手県",
                    child: Text("岩手県"),
                  ),
                  DropdownMenuItem(
                    value: "宮城県",
                    child: Text("宮城県"),
                  ),
                  DropdownMenuItem(
                    value: "秋田県",
                    child: Text("秋田県"),
                  ),
                  DropdownMenuItem(
                    value: "山形県",
                    child: Text("山形県"),
                  ),
                  DropdownMenuItem(
                    value: "福島県",
                    child: Text("福島県"),
                  ),
                  DropdownMenuItem(
                    value: "茨城県",
                    child: Text("茨城県"),
                  ),
                  DropdownMenuItem(
                    value: "栃木県",
                    child: Text("栃木県"),
                  ),
                  DropdownMenuItem(
                    value: "群馬県",
                    child: Text("群馬県"),
                  ),
                  DropdownMenuItem(
                    value: "埼玉県",
                    child: Text("埼玉県"),
                  ),
                  DropdownMenuItem(
                    value: "千葉県",
                    child: Text("千葉県"),
                  ),
                  DropdownMenuItem(
                    value: "東京都",
                    child: Text("東京都"),
                  ),
                  DropdownMenuItem(
                    value: "神奈川県",
                    child: Text("神奈川県"),
                  ),
                  DropdownMenuItem(
                    value: "新潟県",
                    child: Text("新潟県"),
                  ),
                  DropdownMenuItem(
                    value: "富山県",
                    child: Text("富山県"),
                  ),
                  DropdownMenuItem(
                    value: "石川県",
                    child: Text("石川県"),
                  ),
                  DropdownMenuItem(
                    value: "福井県",
                    child: Text("福井県"),
                  ),
                  DropdownMenuItem(
                    value: "山梨県",
                    child: Text("山梨県"),
                  ),
                  DropdownMenuItem(
                    value: "長野県",
                    child: Text("長野県"),
                  ),
                  DropdownMenuItem(
                    value: "岐阜県",
                    child: Text("岐阜県"),
                  ),
                  DropdownMenuItem(
                    value: "静岡県",
                    child: Text("静岡県"),
                  ),
                  DropdownMenuItem(
                    value: "愛知県",
                    child: Text("愛知県"),
                  ),
                  DropdownMenuItem(
                    value: "三重県",
                    child: Text("三重県"),
                  ),
                  DropdownMenuItem(
                    value: "滋賀県",
                    child: Text("滋賀県"),
                  ),
                  DropdownMenuItem(
                    value: "京都府",
                    child: Text("京都府"),
                  ),
                  DropdownMenuItem(
                    value: "大阪府",
                    child: Text("大阪府"),
                  ),
                  DropdownMenuItem(
                    value: "兵庫県",
                    child: Text("兵庫県"),
                  ),
                  DropdownMenuItem(
                    value: "奈良県",
                    child: Text("奈良県"),
                  ),
                  DropdownMenuItem(
                    value: "和歌山県",
                    child: Text("和歌山県"),
                  ),
                  DropdownMenuItem(
                    value: "鳥取県",
                    child: Text("鳥取県"),
                  ),
                  DropdownMenuItem(
                    value: "島根県",
                    child: Text("島根県"),
                  ),
                  DropdownMenuItem(
                    value: "岡山県",
                    child: Text("岡山県"),
                  ),
                  DropdownMenuItem(
                    value: "広島県",
                    child: Text("広島県"),
                  ),
                  DropdownMenuItem(
                    value: "山口県",
                    child: Text("山口県"),
                  ),
                  DropdownMenuItem(
                    value: "徳島県",
                    child: Text("徳島県"),
                  ),
                  DropdownMenuItem(
                    value: "香川県",
                    child: Text("香川県"),
                  ),
                  DropdownMenuItem(
                    value: "愛媛県",
                    child: Text("愛媛県"),
                  ),
                  DropdownMenuItem(
                    value: "高知県",
                    child: Text("高知県"),
                  ),
                  DropdownMenuItem(
                    value: "福岡県",
                    child: Text("福岡県"),
                  ),
                  DropdownMenuItem(
                    value: "佐賀県",
                    child: Text("佐賀県"),
                  ),
                  DropdownMenuItem(
                    value: "長崎県",
                    child: Text("長崎県"),
                  ),
                  DropdownMenuItem(
                    value: "熊本県",
                    child: Text("熊本県"),
                  ),
                  DropdownMenuItem(
                    value: "大分県",
                    child: Text("大分県"),
                  ),
                  DropdownMenuItem(
                    value: "宮崎県",
                    child: Text("宮崎県"),
                  ),
                  DropdownMenuItem(
                    value: "鹿児島県",
                    child: Text("鹿児島県"),
                  ),
                  DropdownMenuItem(
                    value: "沖縄県",
                    child: Text("沖縄県"),
                  ),
                ],
                value: _profileViewModel.selectedBirthPlace.length == 0
                    ? selectedBirthPlace
                    : _profileViewModel.selectedBirthPlace,
                onChanged: (selectedValue) {
                  setState(() {
                    if(_profileViewModel.selectedBirthPlace.length == 0 ){
                      selectedBirthPlace = selectedValue;
                      _onUpdate();
                    }else{
                     _profileViewModel.selectedBirthPlace = selectedValue;
                    }
                    //#############ドロップダウンを選択するとTextFieldにフォーカスしてしまうのを解決##############
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                }),
          ],
        ),
        Divider(
          thickness: 1.0,
        ),

        //##########################################血液型############################################
        Row(
          children: [
            Text(S.of(context).bloodType, style: profileEditTitleTextStyle),
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
                    value: "A型",
                    child: Text("A型"),
                  ),
                  DropdownMenuItem(
                    value: "B型",
                    child: Text("B型"),
                  ),
                  DropdownMenuItem(
                    value: "O型",
                    child: Text("O型"),
                  ),
                  DropdownMenuItem(
                    value: "AB型",
                    child: Text("AB型"),
                  ),
                ],
                value: _profileViewModel.selectedBloodType.length == 0
                    ? selectedBloodType
                    : _profileViewModel.selectedBloodType,
                onChanged: (selectedValue) {
                  setState(() {
                    if( _profileViewModel.selectedBloodType.length == 0 ){
                      selectedBloodType = selectedValue;
                      _onUpdate();
                    }else{
                      _profileViewModel.selectedBloodType = selectedValue;
                    }
                    //#############ドロップダウンを選択するとTextFieldにフォーカスしてしまうのを解決##############
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                }),
          ],
        ),
        Divider(
          thickness: 1.0,
        ),

        //#######################################同居人############################################
        Row(
          children: [
            Text(S.of(context).livingStatus, style: profileEditTitleTextStyle),
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
                    value: "一人暮らし",
                    child: Text("一人暮らし"),
                  ),
                  DropdownMenuItem(
                    value: "親と同居",
                    child: Text("親と同居"),
                  ),
                  DropdownMenuItem(
                    value: "ルームシェア",
                    child: Text("ルームシェア"),
                  ),
                  DropdownMenuItem(
                    value: "その他",
                    child: Text("その他"),
                  ),
                ],
                value: _profileViewModel.selectedLivingStatus.length == 0
                ? selectedLivingStatus
                : _profileViewModel.selectedLivingStatus ,
                onChanged: (selectedValue) {
                  setState(() {
                    if( _profileViewModel.selectedLivingStatus.length == 0){
                      selectedLivingStatus = selectedValue;
                      _onUpdate();
                    }else{
                    _profileViewModel.selectedLivingStatus = selectedValue;
                    }
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

  _onCaptionUpdated() {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    profileViewModel.updateBio = bioController.text;
    profileViewModel.updateInAppUserName = captionInAppUserNameController.text;
  }

  void _onUpdate() {
    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);

    profileViewModel.selectedResidence = selectedResidence ;
    profileViewModel.selectedBirthPlace = selectedBirthPlace;
    profileViewModel.selectedBloodType = selectedBloodType;
    profileViewModel.selectedLivingStatus = selectedLivingStatus;

  }
}
