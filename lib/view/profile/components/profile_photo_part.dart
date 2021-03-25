import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/profile/screens/profile_photo_expanded_screen.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePhotoPart extends StatelessWidget {
  final ProfileMode mode;
  final bool isImageFromFile;
  final File profileImageFromFile;

  ProfilePhotoPart(
      {@required this.mode,
      @required this.isImageFromFile,
      @required this.profileImageFromFile});

  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final profileUser = profileViewModel.profileUser;

    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        //######################photoUrl_1#######################################

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 320,
            child: InkWell(
              onTap: () => _openProfilePhotoExpandedScreen_1(
                  context, profileUser.photoUrl_1, profileUser.inAppUserName),
              child: Hero(
                tag: profileUser.photoUrl_1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: profileUser.photoUrl_1,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    //プロフィール画像の投稿画像一覧の各画像を、正方形一杯一杯に画像を広げる（統一感のある表示に）
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),

        // ######################photoUrl_2#######################################

        Padding(
          padding: const EdgeInsets.all(8.0),
          child:profileUser.photoUrl_2.length == 0
              ? null
              : Container(
              width: 320,
              child:  Hero(
                      tag: profileUser.photoUrl_2,
                      child: Material(
                        child: InkWell(
                          onTap: () => _openProfilePhotoExpandedScreen_2(
                              context,
                              profileUser.photoUrl_2,
                              profileUser.inAppUserName),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: profileUser.photoUrl_2,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              //プロフィール画像の投稿画像一覧の各画像を、正方形一杯一杯に画像を広げる（統一感のある表示に）
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )),
        ),

        //######################photoUrl_3#######################################

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: profileUser.photoUrl_3.length == 0
              ? null
              : Container(
              width: 320,
              child:  Hero(
                tag: profileUser.photoUrl_3,
                child: Material(
                  child: InkWell(
                    onTap: () => _openProfilePhotoExpandedScreen_3(context,
                        profileUser.photoUrl_3, profileUser.inAppUserName),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: profileUser.photoUrl_3,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        //プロフィール画像の投稿画像一覧の各画像を、正方形一杯一杯に画像を広げる（統一感のある表示に）
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )),
        ),

        //######################photoUrl_4#######################################

        Padding(
          padding: const EdgeInsets.all(8.0),
          child:profileUser.photoUrl_4.length == 0
              ? null
              : Container(
              width: 320,
              child:  Hero(
                tag: profileUser.photoUrl_4,
                child: Material(
                  child: InkWell(
                    onTap: () => _openProfilePhotoExpandedScreen_4(context,
                        profileUser.photoUrl_4, profileUser.inAppUserName),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: profileUser.photoUrl_4,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        //プロフィール画像の投稿画像一覧の各画像を、正方形一杯一杯に画像を広げる（統一感のある表示に）
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )),
        ),

        //######################photoUrl_5#######################################

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: profileUser.photoUrl_5.length == 0
              ? null
              : Container(
              width: 320,
              child:Hero(
                tag: profileUser.photoUrl_5,
                child: Material(
                  child: InkWell(
                    onTap: () => _openProfilePhotoExpandedScreen_5(context,
                        profileUser.photoUrl_5, profileUser.inAppUserName),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: profileUser.photoUrl_5,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        //プロフィール画像の投稿画像一覧の各画像を、正方形一杯一杯に画像を広げる（統一感のある表示に）
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  _openProfilePhotoExpandedScreen_1(
      BuildContext context, String photoUrl_1, String inAppUserName) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePhotoExpandedScreen(
          photoUrl:photoUrl_1,
          inAppUserName: inAppUserName,
          tag: photoUrl_1,
        ),
      ),
    );
  }

  _openProfilePhotoExpandedScreen_2(
      BuildContext context, String photoUrl_2, String inAppUserName) {


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePhotoExpandedScreen(
          photoUrl: photoUrl_2,
          inAppUserName: inAppUserName,
          tag: photoUrl_2,
        ),
      ),
    );
  }

  _openProfilePhotoExpandedScreen_3(
      BuildContext context, String photoUrl_3, String inAppUserName) {


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePhotoExpandedScreen(
          photoUrl: photoUrl_3,
          inAppUserName: inAppUserName,
          tag: photoUrl_3,
        ),
      ),
    );
  }

  _openProfilePhotoExpandedScreen_4(
      BuildContext context, String photoUrl_4, String inAppUserName) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePhotoExpandedScreen(
          photoUrl: photoUrl_4,
          inAppUserName: inAppUserName,
          tag: photoUrl_4,
        ),
      ),
    );
  }

  _openProfilePhotoExpandedScreen_5(
      BuildContext context, String photoUrl_5, String inAppUserName) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePhotoExpandedScreen(
          photoUrl: photoUrl_5,
          inAppUserName: inAppUserName,
          tag: photoUrl_5,
        ),
      ),
    );
  }
}
