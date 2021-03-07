import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/offer.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/style.dart';
import 'package:cheers_app/view/common/components/button_with_icon.dart';
import 'package:cheers_app/view/common/components/user_card.dart';
import 'package:cheers_app/view/feed/components/user_card_for_feed_post_detail_screen.dart';
import 'package:cheers_app/view_models/feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FeedPostDetailScreen extends StatelessWidget {
  final HostParty hostParty;
  final User hostPartyUser;

  FeedPostDetailScreen({this.hostParty, this.hostPartyUser});

  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: feedViewModel.getOfferResult(hostParty.hostPartyId),
            builder: (context, AsyncSnapshot<OfferResult> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final offerResult = snapshot.data;

                return Column(children: [
                  UserCardForFeedPostDetailScreen(
                    titleLeft: (S.of(context).hostLocation),
                    titleRight: hostParty.selectedPrefecture,
                    subTitleLeft: (S.of(context).host),
                    photoUrl: hostPartyUser.photoUrl_1,
                    subTitleRight: hostPartyUser.inAppUserName,
                    hostPartyUser: hostPartyUser,
                    caption: hostParty.caption,
                    hostParty: hostParty,
                  ),
                  offerResult.isOfferedToThisParty
                      ? ButtonWithIcon(
                          onPressed: null,
                          iconData: FontAwesomeIcons.angleDoubleRight,
                          label: S.of(context).underOffer,
                        )
                      : ButtonWithIcon(
                          onPressed: () => _offerParty(context, hostParty),
                          iconData: FontAwesomeIcons.solidThumbsUp,
                          label: S.of(context).offerParty,
                        ),
                ]);
              } else {
                return Container();
              }
            }));
  }

  _offerParty(BuildContext context, HostParty hostParty) async {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);
    await feedViewModel.offerParty(hostParty);
  }
}
