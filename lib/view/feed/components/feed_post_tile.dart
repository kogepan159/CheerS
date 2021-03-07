import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/utils/functions.dart';
import 'package:cheers_app/view/common/components/user_card.dart';
import 'package:cheers_app/view/feed/screen/feed_post_detail_screen.dart';
import 'package:cheers_app/view_models/feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedPostTile extends StatelessWidget {
  final FeedMode feedMode;
  final HostParty hostParty;
  final User currentUser;

  FeedPostTile({this.feedMode, this.hostParty, this.currentUser});

  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);

    return FutureBuilder(
        future: feedViewModel.getPartyUserInfo(hostParty.uId),
        builder: (context, AsyncSnapshot<User> snapShot) {
          if (snapShot.hasData && snapShot.data != null) {
            final hostPartyUser = snapShot.data;
            final currentUser = feedViewModel.currentUser;
            print("hostPartyUser $hostPartyUser");
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: UserCard(
                    feedMode: FeedMode.FROM_FEED,
                    postDateTime: createTimeAgoString(hostParty.postDateTime),
                    titleLeft: (S.of(context).hostLocation),
                    titleRight: hostParty.selectedPrefecture,
                    subTitleLeft: (S.of(context).host),
                    photoUrl: hostPartyUser.photoUrl_1,
                    subTitleRight: hostPartyUser.inAppUserName,
                    currentUser: currentUser,
                    hostPartyUser: hostPartyUser,
                    caption: hostParty.caption,
                    onTap: () => _openFeedPostDetailScreen(
                        context, hostParty, hostPartyUser),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }

  _openFeedPostDetailScreen(
      BuildContext context, HostParty hostParty, User hostPartyUser) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedPostDetailScreen(
            hostParty: hostParty, hostPartyUser: hostPartyUser),
      ),
    );
  }

  //TODO
  _onPopUpMenuSelected(BuildContext context, value) {}
}
