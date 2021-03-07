import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../style.dart';


class OccupationProfile extends StatefulWidget {




  @override
  _OccupationProfileState createState() => _OccupationProfileState();
}

class _OccupationProfileState extends State<OccupationProfile> {


  String selectedEducationalBackground ;
  String selectedOccupation ;
  String selectedHoliday ;

  @override
  void initState() {

    final profileViewModel =
    Provider.of<ProfileViewModel>(context, listen: false);
    final profileUser = profileViewModel.profileUser;

    profileViewModel.selectedEducationalBackground = profileUser.educationalBackground;
    profileViewModel.selectedOccupation = profileUser.bloodType;
    profileViewModel.selectedHoliday = profileUser.holiday;



    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //################################学歴###############################
        Row(
          children: [
            Text(S.of(context).educationalBackground, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                items: [
                      DropdownMenuItem(value: "高校卒", child: Text("高校卒"),),
                      DropdownMenuItem(value: "短大／専門学校卒", child: Text("短大／専門学校卒"),),
                      DropdownMenuItem(value: "大学卒", child: Text("大学卒"),),
                      DropdownMenuItem(value: "大学院卒", child: Text("大学院卒"),),
                      DropdownMenuItem(value: "その他", child: Text("その他"),),

                ],
                value: selectedEducationalBackground,
                onChanged: (selectedValue) {
                  setState(() {
                    selectedEducationalBackground = selectedValue;
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

        //#####################################職業#####################################
        Row(
          children: [
            Text(S.of(context).occupation, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                items: [

                  DropdownMenuItem(value: "会社員", child: Text("会社員"),),
                      DropdownMenuItem(value: "弁護士", child: Text("弁護士"),),
                      DropdownMenuItem(value: "公認会計士", child: Text("公認会計士"),),
                      DropdownMenuItem(value: "地方公務員", child: Text("地方公務員"),),
                      DropdownMenuItem(value: "外資系証券", child: Text("外資系証券"),),
                      DropdownMenuItem(value: "会社員（大手企業）", child: Text("会社員（大手企業）"),),
                      DropdownMenuItem(value: "外資系企業", child: Text("外資系企業"),),
                      DropdownMenuItem(value: "マスコミ", child: Text("マスコミ"),),
                      DropdownMenuItem(value: "デザイナー", child: Text("デザイナー"),),
                      DropdownMenuItem(value: "IT関連", child: Text("IT関連"),),
                      DropdownMenuItem(value: "パイロット", child: Text("パイロット"),),
                      DropdownMenuItem(value: "客室乗務員", child: Text("客室乗務員"),),
                      DropdownMenuItem(value: "芸能・モデル", child: Text("芸能・モデル"),),
                      DropdownMenuItem(value: "アパレル・ショップ店員", child: Text("アパレル・ショップ店員"),),
                      DropdownMenuItem(value: "サービス業", child: Text("サービス業"),),
                      DropdownMenuItem(value: "受付", child: Text("受付"),),
                      DropdownMenuItem(value: "秘書", child: Text("秘書"),),
                      DropdownMenuItem(value: "看護師", child: Text("看護師"),),
                      DropdownMenuItem(value: "保育士", child: Text("保育士"),),
                      DropdownMenuItem(value: "自由業", child: Text("自由業"),),
                      DropdownMenuItem(value: "学生", child: Text("学生"),),
                      DropdownMenuItem(value: "軍人・自衛隊員", child: Text("軍人・自衛隊員"),),
                      DropdownMenuItem(value: "経営者・役員", child: Text("経営者・役員"),),
                      DropdownMenuItem(value: "国家公務員", child: Text("国家公務員"),),
                      DropdownMenuItem(value: "歯科医師", child: Text("歯科医師"),),
                      DropdownMenuItem(value: "その他士業", child: Text("その他士業"),),
                      DropdownMenuItem(value: "コンサル", child: Text("コンサル"),),
                      DropdownMenuItem(value: "エンジニア", child: Text("エンジニア"),),
                      DropdownMenuItem(value: "農業", child: Text("農業"),),
                      DropdownMenuItem(value: "職人", child: Text("職人"),),
                      DropdownMenuItem(value: "講師・教師", child: Text("講師・教師"),),
                      DropdownMenuItem(value: "スポーツ選手", child: Text("スポーツ選手"),),
                      DropdownMenuItem(value: "美容関係", child: Text("美容関係"),),
                      DropdownMenuItem(value: "美容師・理容師", child: Text("美容師・理容師"),),
                      DropdownMenuItem(value: "介護士", child: Text("介護士"),),
                      DropdownMenuItem(value: "薬剤師", child: Text("薬剤師"),),
                      DropdownMenuItem(value: "栄養士", child: Text("栄養士"),),
                      DropdownMenuItem(value: "上場企業", child: Text("上場企業"),),
                      DropdownMenuItem(value: "獣医", child: Text("獣医"),),
                      DropdownMenuItem(value: "調理師", child: Text("調理師"),),
                      DropdownMenuItem(value: "消防士・レスキュー隊", child: Text("消防士・レスキュー隊"),),
                      DropdownMenuItem(value: "外資系金融", child: Text("外資系金融"),),
                      DropdownMenuItem(value: "銀行証券・保険", child: Text("銀行証券・保険"),),
                      DropdownMenuItem(value: "不動産", child: Text("不動産"),),
                      DropdownMenuItem(value: "税理士", child: Text("税理士"),),
                      DropdownMenuItem(value: "行政書士", child: Text("行政書士"),),
                      DropdownMenuItem(value: "社会保険労務士", child: Text("社会保険労務士"),),
                      DropdownMenuItem(value: "広告", child: Text("広告"),),
                      DropdownMenuItem(value: "出版", child: Text("出版"),),
                      DropdownMenuItem(value: "食品・飲料メーカー", child: Text("食品・飲料メーカー"),),
                      DropdownMenuItem(value: "機械・自動車メーカー", child: Text("機械・自動車メーカー"),),
                      DropdownMenuItem(value: "化粧品・生活用品メーカー", child: Text("化粧品・生活用品メーカー"),),
                      DropdownMenuItem(value: "電機・電子メーカー", child: Text("電機・電子メーカ"),),
                      DropdownMenuItem(value: "医療系メーカー", child: Text("医療系メーカー"),),
                      DropdownMenuItem(value: "運輸・物流", child: Text("運輸・物流"),),
                      DropdownMenuItem(value: "交通・鉄道", child: Text("交通・鉄道"),),
                      DropdownMenuItem(value: "旅行", child: Text("旅行"),),
                      DropdownMenuItem(value: "インテリア・建築", child: Text("インテリア・建築"),),
                      DropdownMenuItem(value: "ブライダル", child: Text("ブライダル"),),
                      DropdownMenuItem(value: "漫画家・イラストレーター", child: Text("漫画家・イラストレーター"),),
                      DropdownMenuItem(value: "カメラマン", child: Text("カメラマン"),),
                      DropdownMenuItem(value: "アーティスト", child: Text("アーティスト"),),
                      DropdownMenuItem(value: "スタイリスト", child: Text("スタイリスト"),),
                      DropdownMenuItem(value: "漁業", child: Text("漁業"),),
                      DropdownMenuItem(value: "その他", child: Text("その他"),),

                ],
                value: selectedOccupation,
                onChanged: (selectedValue) {
                  setState(() {
                    selectedOccupation = selectedValue;
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

        //########################################休日##########################################
        Row(
          children: [
            Text(S.of(context).holiday, style: profileEditTitleTextStyle),
            SizedBox(
              width: 30.0,
            ),
            DropdownButton(
                items: [
                      DropdownMenuItem(value: "土日祝", child: Text("土日祝"),),
                      DropdownMenuItem(value: "不定期", child: Text("不定期"),),
                      DropdownMenuItem(value: "その他", child: Text("その他"),),
                ],
                value: selectedHoliday,
                onChanged: (selectedValue) {
                  setState(() {
                    selectedHoliday = selectedValue;
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

    profileViewModel.selectedEducationalBackground = selectedEducationalBackground;
    profileViewModel.selectedOccupation = selectedOccupation;
    profileViewModel.selectedHoliday = selectedHoliday;



  }

  }


