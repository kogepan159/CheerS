import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/feed/feed_page.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {


  final User feedUser;
  final int index;
  final FeedMode feedMode;

  FeedScreen(
      {@required this.feedUser, @required this.index, @required this.feedMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S
            .of(context)
            .post),
      ),
      body: FeedPage(
          feedMode: FeedMode.FROM_PROFILE,
          feedUser: feedUser,
          index: index,
      ),
    );
  }
}
