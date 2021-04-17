import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/view/common/components/user_card.dart';
import 'package:cheers_app/view/search_user/pages/components/user_card_for_search_user.dart';
import 'package:cheers_app/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchUserDelegate extends SearchDelegate<User> {

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
        brightness: Brightness.light
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        print("no result");
        close(context, null);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context);
  }

  Widget _buildResults(BuildContext context) {
    final searchViewModel = Provider.of<SearchViewModel>(context, listen: true);
    searchViewModel.searchUsers(query);

    return ListView.builder(
        itemCount: searchViewModel.soughtUsers.length,
        itemBuilder: (context, int index) {
          final user = searchViewModel.soughtUsers[index];
          return UserCardForSearchUser(
            photoUrl: user.photoUrl_1,
            title: user.inAppUserName,
            subTitle: user.residence,
            onTap: () {
              close(context, user);
            }
          );
        }
    );
  }

}