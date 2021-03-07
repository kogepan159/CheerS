import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/style.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view_models/feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/feed_post_tile.dart';

class FeedPage extends StatelessWidget {
  final FeedMode feedMode;
  final User feedUser;
  final int index;

  FeedPage({@required this.feedMode, this.feedUser, this.index});

  @override
  Widget build(BuildContext context) {
    final feedViewModel = Provider.of<FeedViewModel>(context, listen: false);

    feedViewModel.setFeedUser(feedMode, feedUser);

    //feedに投稿を表示させる
    Future(() => feedViewModel.getParty(feedMode));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).appTitle,
          style: TextStyle(fontFamily: TitleFont),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FeedViewModel>(
        builder: (context, model, child) {
          if (model.isProcessing) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: model.parties.length,
                itemBuilder: (context, index) {
                  return FeedPostTile(
                    feedMode: feedMode,
                    hostParty: model.parties[index],
                  );
                });
          }
        },
      ),
    );
  }
}
