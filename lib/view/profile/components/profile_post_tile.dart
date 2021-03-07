import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/utils/functions.dart';
import 'package:cheers_app/view/common/components/user_card.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePostTile extends StatelessWidget {

  final ProfileMode profileMode;
  final HostParty hostParty;
  ProfilePostTile({this.profileMode, this.hostParty});

  
  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);

    return FutureBuilder(
        future: profileViewModel.getPartyUserInfo(hostParty.uId),
        builder: (context, AsyncSnapshot<User> snapShot) {
          if (snapShot.hasData && snapShot.data != null) {
            final hostPartyUser = snapShot.data;
            final currentUser = profileViewModel.currentUser;
            print("hostPartyUser $hostPartyUser");
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: UserCard(
                    feedMode: FeedMode.FROM_PROFILE,
                    postDateTime: createTimeAgoString(hostParty.postDateTime),
                    titleLeft: (S.of(context).hostLocation),
                    titleRight: hostParty.selectedPrefecture,
                    subTitleLeft: (S.of(context).host),
                    photoUrl: hostPartyUser.photoUrl_1,
                    subTitleRight: hostPartyUser.inAppUserName,
                    currentUser: currentUser,
                    hostPartyUser: hostPartyUser,
                    caption: hostParty.caption,
                    hostPartyId: hostParty.hostPartyId,
                    hostParty: hostParty,
                    // onTap: () => null,
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }
  }

