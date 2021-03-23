import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/offer.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/style.dart';
import 'package:cheers_app/view/common/components/button_with_icon.dart';
import 'package:cheers_app/view/common/components/user_card.dart';
import 'package:cheers_app/view/feed/components/feed_post_detail_part.dart';
import 'package:cheers_app/view/home_screen.dart';
import 'package:cheers_app/view_models/feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FeedPostDetailScreen extends StatefulWidget {
  final HostParty hostParty;
  final User hostPartyUser;

  FeedPostDetailScreen({this.hostParty, this.hostPartyUser});

  @override
  _FeedPostDetailScreenState createState() => _FeedPostDetailScreenState();
}

class _FeedPostDetailScreenState extends State<FeedPostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    //自分がこの合コンに申し込み済かどうか判定
    Future(() => feedViewModel.checkIsOffer(widget.hostParty.hostPartyId));

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=> _openHomeScreen(context),
          )
        ),
        body: FutureBuilder(
            future:
                feedViewModel.getPartyMemberInfo(widget.hostParty.hostPartyId),
            builder: (context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final partyMembers = snapshot.data;
                return  Column(children: [
                        FeedPostDetailPart(
                          titleLeft: (S.of(context).hostLocation),
                          titleRight: widget.hostParty.selectedPrefecture,
                          subTitleLeft: (S.of(context).host),
                          photoUrl: widget.hostPartyUser.photoUrl_1,
                          subTitleRight: widget.hostPartyUser.inAppUserName,
                          hostPartyUser: widget.hostPartyUser,
                          caption: widget.hostParty.caption,
                          hostParty: widget.hostParty,
                          partyMembers: partyMembers,
                        ),
                        widget.hostPartyUser.uId ==
                                feedViewModel.currentUser.uId
                            ? Container()
                            : feedViewModel.isOffered == true
                                ? ButtonWithIcon(
                                    onPressed: () {
                                      setState(() {
                                        _cancelOfferParty(
                                            context, widget.hostParty);
                                        feedViewModel.isOffered = false;
                                      });
                                    },
                                    iconData: FontAwesomeIcons.angleDoubleRight,
                                    label: S.of(context).cancel,
                                  )
                                : ButtonWithIcon(
                                    onPressed: () {
                                      setState(() {
                                        _offerParty(context, widget.hostParty);
                                      });
                                    },
                                    iconData: FontAwesomeIcons.solidThumbsUp,
                                    label: S.of(context).offerParty,
                                  ),
                      ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  _offerParty(BuildContext context, HostParty hostParty) async {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    await feedViewModel.offerParty(hostParty);
  }

  void _cancelOfferParty(BuildContext context, HostParty hostParty) async {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    await feedViewModel.cancelOfferParty(hostParty);
  }

  _openHomeScreen(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),),);
  }
}
