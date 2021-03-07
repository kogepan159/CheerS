import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageFromUrl extends StatelessWidget {
  final String imageUrl;
  final bool isImageFromFile;
  final File profileImageFromFile;

  ImageFromUrl(
      {@required this.imageUrl,
      @required this.isImageFromFile,
      this.profileImageFromFile});

  @override
  Widget build(BuildContext context) {
    //データベースに画像が無かったら、壊れた画像イメージを出す
    if (imageUrl.length == 0) {
      return const Icon(Icons.broken_image);
    } else {
      //データベースに画像があったら、imageUrlをたたいて表示する。
      return isImageFromFile == true
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(profileImageFromFile),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                //プロフィール画像の投稿画像一覧の各画像を、正方形一杯一杯に画像を広げる（統一感のある表示に）
                fit: BoxFit.cover,
              ),
            );
    }
  }
}
