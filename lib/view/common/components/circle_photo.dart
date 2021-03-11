import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:flutter/material.dart';

class CirclePhoto extends StatelessWidget {

  final String photoUrl;
  final double radius;
  final VoidCallback onTap;
  final bool isImageFromFile;
  final User currentUser;

  CirclePhoto({@required this.photoUrl, @required this.radius, @required this.onTap, @required this.isImageFromFile, this.currentUser});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: isImageFromFile
      ? FileImage(File(photoUrl))
      :  CachedNetworkImageProvider(
          photoUrl
      ),
    );
  }
}
