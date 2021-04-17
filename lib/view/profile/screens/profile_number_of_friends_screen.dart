import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/models/repositories/user_repository.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/common/components/button_with_icon.dart';
import 'package:cheers_app/view/host_party/screens/host_party_screen.dart';
import 'package:cheers_app/view/profile/components/sub/user_card_for_applied_and_applying_user_and_friends.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view_models/host_party_view_model.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../style.dart';
import '../../home_screen.dart';

class ProfileNumberOfFriendsScreen extends StatefulWidget {
  final HostParty hostParty;
  final NumberOfFriendsScreenOpenMode numberOfFriendsScreenOpenMode;
  final PostCaptionOpenMode from;

  ProfileNumberOfFriendsScreen(
      {this.hostParty,
      @required this.numberOfFriendsScreenOpenMode,
      @required this.from});

  @override
  _ProfileNumberOfFriendsScreenState createState() =>
      _ProfileNumberOfFriendsScreenState();
}

class _ProfileNumberOfFriendsScreenState
    extends State<ProfileNumberOfFriendsScreen> {
  final List<int> _selectedIndex = [];
  final List<User> selectedFriends = List();

  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final hostPartyViewModel =
        Provider.of<HostPartyViewModel>(context, listen: false);

    if (widget.numberOfFriendsScreenOpenMode ==
        NumberOfFriendsScreenOpenMode.FROM_PROFILE) {
      //友達リストを取ってくる
      Future(() => profileViewModel.getFriends());
    } else {
      Future(() => hostPartyViewModel.getFriends(UserRepository.currentUser.uId));
    }

    return Scaffold(
      appBar: AppBar(
        title: widget.numberOfFriendsScreenOpenMode ==
                NumberOfFriendsScreenOpenMode.FROM_PROFILE
            ? Text(S.of(context).friends)
            : Text(S.of(context).numberOfPeopleLimitAppBar),
        leading: GestureDetector(
            onTap: () => _cancelPost(context),
            child: Icon(
              Icons.arrow_back,
            )),
      ),
      body: FutureBuilder(
        future: widget.numberOfFriendsScreenOpenMode ==
                NumberOfFriendsScreenOpenMode.FROM_PROFILE
            ? profileViewModel.getFriends()
            : hostPartyViewModel.getFriends(UserRepository.currentUser.uId),
        builder: (context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData &&
              snapshot.data.length > 0 &&
              snapshot.data != null) {
            final friends = snapshot.data;
            //viewModelでfalseに戻せないからここでfalseにする
            hostPartyViewModel.isProcessing = false;
            return Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: friends.length,
                    itemBuilder: (context, int index) {
                      final user = friends[index];
                      return UserCardForAppliedAndApplyingUserAndFriends(
                        photoUrl: user.photoUrl_1,
                        title: user.inAppUserName,
                        onTap: () => _openProfileScreen(
                          context,
                          user,
                        ),
                        subTitle: user.residence,
                        trailing: widget.numberOfFriendsScreenOpenMode ==
                                NumberOfFriendsScreenOpenMode.FROM_PROFILE
                            ? FlatButton(
                                //trailingに何か入れないとエラーになる
                                color: Colors.white,
                              )
                            : Checkbox(
                                value: _selectedIndex.contains(index),
                                onChanged: (e) {
                                  setState(() {
                                    _handleCheckbox(
                                        index, e, selectedFriends, friends);
                                  });
                                }),
                      );
                    }),
                widget.numberOfFriendsScreenOpenMode ==
                        NumberOfFriendsScreenOpenMode.FROM_HostParty
                    ? ButtonWithIcon(
                        onPressed: () {
                          //selectedFriendsに入る友達（＝招待できる友達）は、１〜９人の間
                          if (selectedFriends.length == 0 ||
                              selectedFriends.length > 9) {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(S.of(context).error),
                                      content: Text(
                                          S.of(context).numberOfPeopleLimit),
                                      actions: [
                                        FlatButton(
                                          child: Text(S.of(context).ok),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ));
                          } else {
                            _openHostPartyScreen(context, selectedFriends,
                                widget.from, widget.hostParty);
                          }
                        },
                        iconData: FontAwesomeIcons.userFriends,
                        label: S.of(context).inviteFriends,
                      )
                    : Container(),
              ],
            );
          } else if (hostPartyViewModel.isProcessing) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text(
                S.of(context).noFriends,
                style: profileApplicationOfFriendsTextStyle,
              ),
            );
          }
        },
      ),
    );
  }

  _openProfileScreen(
    BuildContext context,
    User user,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(
          profileMode: ProfileMode.OTHER,
          selectedUser: user,
        ),
      ),
    );
  }

  void _handleCheckbox(
    int index,
    bool e,
    List<User> selectedFriends,
    List<User> friends,
  ) {
    setState(() {
      // 選択が解除されたらリストから消す
      if (_selectedIndex.contains(index)) {
        _selectedIndex.remove(index);
        selectedFriends.remove(friends[index]);
      } else {
        // 選択されたらリストに追加する
        _selectedIndex.add(index);
        selectedFriends.add(friends[index]);
      }
      print("selectedFriends $selectedFriends");
    });
  }
}

_openHostPartyScreen(BuildContext context, List<User> selectedFriends,
    PostCaptionOpenMode from, HostParty hostParty) {

  //プロフィールから編集か、新規作成かで条件分岐する。
  // 編集の場合は、hostPartyIdを持っていく。新規の場合は持っていかない。（エラ〜対応）
  from == PostCaptionOpenMode.FROM_PROFILE
      ? Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HostPartyScreen(
                    from: from,
                    selectedFriends: selectedFriends,
                    hostParty: hostParty,
                    hostPartyId: hostParty.hostPartyId,
                  )),
        )
      : Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HostPartyScreen(
              from: from,
              selectedFriends: selectedFriends,
              hostParty: hostParty,
            ),
          ),
        );
}

_cancelPost(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ),
  );
}
