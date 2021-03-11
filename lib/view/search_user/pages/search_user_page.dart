import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/profile/screens/profile_screen.dart';
import 'package:cheers_app/view/search_user/pages/components/search_user_delegate.dart';
import 'package:flutter/material.dart';

import '../../../style.dart';

class SearchUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search),
        title: InkWell(
          splashColor: Colors.white,
          onTap: () => _searchUser(context),
          child: Text(
            S.of(context).searchUser,
            style: SearchUserBarTextStyle,
          ),
        ),
      ),
      body: Center(
        child: Text("SearchUserPage"),
      ),
    );
  }

  _searchUser(BuildContext context) async {
    final selectedUser = await showSearch(
      context: context,
      delegate: SearchUserDelegate(),
    );
    //ユーザー処理結果を受けた処理
    if (selectedUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
              profileMode: ProfileMode.OTHER, selectedUser: selectedUser),
        ),
      );
    }
  }
}
