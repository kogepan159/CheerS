import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/profile/pages/profile_page.dart';
import 'package:cheers_app/view/search_user/pages/search_user_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dm/pages/dm_page.dart';
import 'feed/feed_page.dart';
import 'host_party/pages/host_party_page.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    _pages = [
      FeedPage(feedMode: FeedMode.FROM_FEED,),
      HostPartyPage(),
      SearchUserPage(),
      DmPage(),
      ProfilePage(profileMode: ProfileMode.MYSELF),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            label: Text(S.of(context).searchParty).toString(),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.glassCheers),
            label: Text(S.of(context).hostParty).toString(),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            label: Text(S.of(context).searchParty).toString(),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.envelope),
            label: Text(S.of(context).dm).toString(),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: Text(S.of(context).user).toString(),
          ),

        ],
      ),
    );
  }
}
