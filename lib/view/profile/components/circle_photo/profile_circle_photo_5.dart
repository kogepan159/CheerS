import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:flutter/material.dart';

class ProfileCirclePhoto5 extends StatelessWidget {

  final String photoUrl;
  final double radius;
  final VoidCallback onTap;
  final bool isImageFromFile_5;
  final User currentUser;

  ProfileCirclePhoto5({@required this.photoUrl, @required this.radius, @required this.onTap, @required this.isImageFromFile_5, this.currentUser});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: isImageFromFile_5
          ? FileImage(File(photoUrl))
          : CachedNetworkImageProvider(
          photoUrl
      ),
    );
  }
}
