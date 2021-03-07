import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileImage extends StatelessWidget {
  final String photoUrl;
  final double radius;
  final VoidCallback onTap;
  final bool isImageFromFile;

  final String photoUrl_1;
  final String photoUrl_2;
  final String photoUrl_3;
  final String photoUrl_4;
  final String photoUrl_5;

  ProfileImage({
    @required this.photoUrl,
    this.radius,
    this.onTap,
    @required this.isImageFromFile,
    this.photoUrl_1,
    this.photoUrl_2,
    this.photoUrl_3,
    this.photoUrl_4,
    this.photoUrl_5,
  });

  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final profileUser = profileViewModel.profileUser;
    // final List<String> photoUrls = [
    //   profileUser.photoUrl_1,
    //   profileUser.photoUrl_2,
    //   profileUser.photoUrl_3,
    //   profileUser.photoUrl_4,
    //   profileUser.photoUrl_5,
    // ];

    // return ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: photoUrls.length,
    //     itemBuilder: (context, index) {
          return Column(
            children: [
              CirclePhoto(
                photoUrl: profileUser.photoUrl_1,
                radius: 20,
                onTap: null,
                isImageFromFile: false,
              ),

              CirclePhoto(
                photoUrl: profileUser.photoUrl_2,
                radius: 20,
                onTap: null,
                isImageFromFile: false,
              ),

              CirclePhoto(
                photoUrl: profileUser.photoUrl_3,
                radius: 20,
                onTap: null,
                isImageFromFile: false,
              ),


              CirclePhoto(
                photoUrl: profileUser.photoUrl_4,
                radius: 20,
                onTap: null,
                isImageFromFile: false,
              ),

              CirclePhoto(
                photoUrl: profileUser.photoUrl_5,
                radius: 20,
                onTap: null,
                isImageFromFile: false,
              ),




            ],
          );
        // }
        // );
  }
}
