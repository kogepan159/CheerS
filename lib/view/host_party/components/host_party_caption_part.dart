


import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/style.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view_models/host_party_view_model.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class HostPartyCaptionPart extends StatefulWidget {
  final PostCaptionOpenMode from;
  final HostParty hostParty;
  final String hostPartyId;
  final User profileUser;
  final HostParty partyData;


  HostPartyCaptionPart(
      {@required this.hostPartyId, @required this.from, @required this.hostParty, this.profileUser,@required this.partyData});


  @override
  _HostPartyCaptionPartState createState() => _HostPartyCaptionPartState();

}

class _HostPartyCaptionPartState extends State<HostPartyCaptionPart> {


  TextEditingController captionController = TextEditingController();

  String selectedPrefecture ;

  HostParty party = HostParty();
  List<String> prefectures = List();
  String updatedPrefecture = "";
  String caption = "";

  Future<String> lastSelectedPrefecture ;






  @override
  void initState() {
    super.initState();

    if(widget.from == PostCaptionOpenMode.FROM_PROFILE ) {
      getLastPartyInfo();
      //既にDbにあるデータを表示させる
      captionController.text = widget.hostParty.caption;
    }
    captionController.text = widget.partyData.caption;
    // caption = captionController.text;
    captionController.addListener(_onCaptionUpdated);

  }



  @override
  void dispose() {
    captionController.dispose();
    super.dispose();
  }






  @override
  Widget build(BuildContext context) {


            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Consumer<HostPartyViewModel>(builder: (context, model, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        Text(S
                            .of(context)
                            .hostLocation,
                          style: coloredHostPartyCaptionPartTextStyle,),
                        SizedBox(width: 30.0,),
                        Divider(),
                        DropdownButton(
                            items:
                            [
                                  DropdownMenuItem(value: "北海道", child: Text("北海道"),),
                                  DropdownMenuItem(value: "青森県", child: Text("青森県"),),
                                  DropdownMenuItem(value: "岩手県", child: Text("岩手県"),),
                                  DropdownMenuItem(value: "宮城県", child: Text("宮城県"),),
                                  DropdownMenuItem(value: "秋田県", child: Text("秋田県"),),
                                  DropdownMenuItem(value: "山形県", child: Text("山形県"),),
                                  DropdownMenuItem(value: "福島県", child: Text("福島県"),),
                                  DropdownMenuItem(value: "茨城県", child: Text("茨城県"),),
                                  DropdownMenuItem(value: "栃木県", child: Text("栃木県"),),
                                  DropdownMenuItem(value: "群馬県", child: Text("群馬県"),),
                                  DropdownMenuItem(value: "埼玉県", child: Text("埼玉県"),),
                                  DropdownMenuItem(value: "千葉県", child: Text("千葉県"),),
                                  DropdownMenuItem(value: "東京都", child: Text("東京都"),),
                                  DropdownMenuItem(value: "神奈川県", child: Text("神奈川県"),),
                                  DropdownMenuItem(value: "新潟県", child: Text("新潟県"),),
                                  DropdownMenuItem(value: "富山県", child: Text("富山県"),),
                                  DropdownMenuItem(value: "石川県", child: Text("石川県"),),
                                  DropdownMenuItem(value: "福井県", child: Text("福井県"),),
                                  DropdownMenuItem(value: "山梨県", child: Text("山梨県"),),
                                  DropdownMenuItem(value: "長野県", child: Text("長野県"),),
                                  DropdownMenuItem(value: "岐阜県", child: Text("岐阜県"),),
                                  DropdownMenuItem(value: "静岡県", child: Text("静岡県"),),
                                  DropdownMenuItem(value: "愛知県", child: Text("愛知県"),),
                                  DropdownMenuItem(value: "三重県", child: Text("三重県"),),
                                  DropdownMenuItem(value: "滋賀県", child: Text("滋賀県"),),
                                  DropdownMenuItem(value: "京都府", child: Text("京都府"),),
                                  DropdownMenuItem(value: "大阪府", child: Text("大阪府"),),
                                  DropdownMenuItem(value: "兵庫県", child: Text("兵庫県"),),
                                  DropdownMenuItem(value: "奈良県", child: Text("奈良県"),),
                                  DropdownMenuItem(value: "和歌山県", child: Text("和歌山県"),),
                                  DropdownMenuItem(value: "鳥取県", child: Text("鳥取県"),),
                                  DropdownMenuItem(value: "島根県", child: Text("島根県"),),
                                  DropdownMenuItem(value: "岡山県", child: Text("岡山県"),),
                                  DropdownMenuItem(value: "広島県", child: Text("広島県"),),
                                  DropdownMenuItem(value: "山口県", child: Text("山口県"),),
                                  DropdownMenuItem(value: "徳島県", child: Text("徳島県"),),
                                  DropdownMenuItem(value: "香川県", child: Text("香川県"),),
                                  DropdownMenuItem(value: "愛媛県", child: Text("愛媛県"),),
                                  DropdownMenuItem(value: "高知県", child: Text("高知県"),),
                                  DropdownMenuItem(value: "福岡県", child: Text("福岡県"),),
                                  DropdownMenuItem(value: "佐賀県", child: Text("佐賀県"),),
                                  DropdownMenuItem(value: "長崎県", child: Text("長崎県"),),
                                  DropdownMenuItem(value: "熊本県", child: Text("熊本県"),),
                                  DropdownMenuItem(value: "大分県", child: Text("大分県"),),
                                  DropdownMenuItem(value: "宮崎県", child: Text("宮崎県"),),
                                  DropdownMenuItem(value: "鹿児島県", child: Text("鹿児島県"),),
                                  DropdownMenuItem(value: "沖縄県", child: Text("沖縄県"),),
                            ],
                            value: selectedPrefecture,
                            onChanged: (selectedValue) {
                              setState(() {
                                selectedPrefecture = selectedValue;
                              });
                            }
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Text(S
                        .of(context)
                        .selfIntroductionToHostParty,
                      style: coloredHostPartyCaptionPartTextStyle,),
                    Divider(),
                    Container(
                      height: 200,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLength: 800,
                        maxLengthEnforced: true,
                        maxLines: null,
                        controller: captionController,
                        style: hostPartyCaptionPartTextStyle,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: S
                              .of(context)
                              .inputIntroduction, hintStyle: hintTextStyle,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            );
          }

    _onCaptionUpdated() {
    if (widget.from == PostCaptionOpenMode.FROM_POST) {
      final hostPartyViewModel =
      Provider.of<HostPartyViewModel>(context, listen: false);
      hostPartyViewModel.caption = captionController.text;
      hostPartyViewModel.selectedPrefecture = selectedPrefecture;
      print("hostPartyViewModel caption: ${hostPartyViewModel.caption}");
    } else {
      final profileViewModel =
      Provider.of<ProfileViewModel>(context, listen: false);
      profileViewModel.caption = captionController.text;
      profileViewModel.selectedPrefecture = selectedPrefecture;
      print("hostPartyViewModel caption: ${profileViewModel.caption}");
    }
  }

  Future<String> getLastPartyInfo()async{

    final hostPartyViewModel =
    Provider.of<HostPartyViewModel>(context, listen: false);

   party =  (await hostPartyViewModel.getPartyForEdit(widget.hostPartyId));
   print("party: $party");


   var result = party.selectedPrefecture.toString();
    print("result: $result");

    captionController.text = party.caption;

    return result;



  }


  }





