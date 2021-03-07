import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:flutter/material.dart';

class ProfileCirclePhoto3 extends StatelessWidget {

  final String photoUrl;
  final double radius;
  final VoidCallback onTap;
  final bool isImageFromFile_3;
  final User currentUser;

  ProfileCirclePhoto3({@required this.photoUrl, @required this.radius, @required this.onTap, @required this.isImageFromFile_3, this.currentUser});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: isImageFromFile_3
          ? FileImage(File(photoUrl))
          : CachedNetworkImageProvider(
          photoUrl
      ),
    );
  }
}
