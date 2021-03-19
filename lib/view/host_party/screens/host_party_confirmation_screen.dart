import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/dialog/confirm_dialog.dart';
import 'package:cheers_app/view/host_party/pages/sub/host_party_caption_part.dart';
import 'package:cheers_app/view/host_party/screens/host_party_screen.dart';
import 'package:cheers_app/view_models/host_party_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../style.dart';
import '../../home_screen.dart';


class HostPartyConfirmationScreen extends StatelessWidget {

  final HostParty hostParty;
  final PostCaptionOpenMode from;
  final FeedMode feedMode;
  final User hostPartyUser;


  HostPartyConfirmationScreen({@required this.hostParty,@required this.from, this.feedMode, @required this.hostPartyUser});


  @override
  Widget build(BuildContext context) {
    final hostPartyViewModel =
        Provider.of<HostPartyViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: from == PostCaptionOpenMode.FROM_POST

        ? Text(S.of(context).confirmationPost)
        : Text(S.of(context).confirmationUpdates),
        actions: [

          //投稿の更新処理と、新規投稿の条件分岐

          from == PostCaptionOpenMode.FROM_POST

          //############新規投稿#############
          ? IconButton(icon: Icon(Icons.done),
              onPressed: ()=> showConfirmDialog(
                  context: context,
                  title: S.of(context).post,
                  content: S.of(context).postConfirm,
                  onConfirmed: (isConfirmed){
                    if(isConfirmed){
                      _postParty(context,);
                    }
                  }
              ),
              )

          //############投稿更新#############
              : IconButton(icon: Icon(Icons.done),
            onPressed: ()=> showConfirmDialog(
                context: context,
                title: S.of(context).update,
                content: S.of(context).editPostConfirm,
                onConfirmed: (isConfirmed){
                  if(isConfirmed){
                    _updateHostParty(context);
                  }
                }
            ),
          )

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0,),
            Row(
            children: [
              Text(S.of(context).hostLocation,style: coloredHostPartyCaptionPartTextStyle,),
              SizedBox(width: 30.0,),
              Text(hostPartyViewModel.selectedPrefecture,style: hostPartyCaptionPartTextStyle,),
            ],
          ),
            SizedBox(height: 20.0,),
            Text(S.of(context).selfIntroductionToHostParty, style: coloredHostPartyCaptionPartTextStyle,),
            Divider(),
            Text(hostPartyViewModel.caption.toString(), style: hostPartyCaptionPartTextStyle,),

            ],
        ),
      ),
    );
  }

  //新規投稿
  void _postParty(BuildContext context, ) async{

    final hostPartyViewModel = Provider.of<HostPartyViewModel>(context, listen: false);
    await hostPartyViewModel.postParty();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),),);

  }

//投稿を更新
  void _updateHostParty(BuildContext context)async {
    final hostPartyViewModel = Provider.of<HostPartyViewModel>(context, listen: false);
    await hostPartyViewModel.updateHostParty(hostParty,feedMode);

    print("HostPartyConfirmationScreen# hostPartyViewModel.updateHostParty invoked");

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),),);


  }
}
