import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfilePhotoExpandedScreen extends StatelessWidget {
  final String photoUrl;
  final String inAppUserName;
  final String tag;

  ProfilePhotoExpandedScreen(
      {@required this.photoUrl, @required this.inAppUserName, @required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(inAppUserName),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Hero(
            tag: tag,
            child: CachedNetworkImage(
              imageUrl: photoUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              //プロフィール画像の投稿画像一覧の各画像を、正方形一杯一杯に画像を広げる（統一感のある表示に）
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
