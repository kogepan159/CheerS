import 'dart:io';

import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view/common/components/circle_photo.dart';
import 'package:cheers_app/view/common/components/image_from_url.dart';
import 'package:cheers_app/view/common/dialog/confirm_dialog.dart';
import 'package:cheers_app/view/profile/components/circle_photo/profile_circle_photo_1.dart';
import 'package:cheers_app/view/profile/components/circle_photo/profile_circle_photo_2.dart';
import 'package:cheers_app/view/profile/components/circle_photo/profile_circle_photo_3.dart';
import 'package:cheers_app/view/profile/components/circle_photo/profile_circle_photo_4.dart';
import 'package:cheers_app/view/profile/components/circle_photo/profile_circle_photo_5.dart';
import 'package:cheers_app/view/profile/components/sub/profile_image.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePhotoScreen extends StatefulWidget {
  @override
  _ChangePhotoScreenState createState() => _ChangePhotoScreenState();
}

class _ChangePhotoScreenState extends State<ChangePhotoScreen> {
  bool _isImageFromFile_1;
  bool _isImageFromFile_2;
  bool _isImageFromFile_3;
  bool _isImageFromFile_4;
  bool _isImageFromFile_5;

  String photoUrl_1 = "";
  String photoUrl_2 = "";
  String photoUrl_3 = "";
  String photoUrl_4 = "";
  String photoUrl_5 = "";
  File profileImageFromFile_1;

  File profileImageFromFile_2;

  File profileImageFromFile_3;

  File profileImageFromFile_4;

  File profileImageFromFile_5;

  @override
  void initState() {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    final profileUser = profileViewModel.profileUser;

    //最初は、ネットワークから画像を取ってくるので

    _isImageFromFile_1 = false;
    _isImageFromFile_2 = false;
    _isImageFromFile_3 = false;
    _isImageFromFile_4 = false;
    _isImageFromFile_5 = false;

    photoUrl_1 = profileUser.photoUrl_1;
    photoUrl_2 = profileUser.photoUrl_2;
    photoUrl_3 = profileUser.photoUrl_3;
    photoUrl_4 = profileUser.photoUrl_4;
    photoUrl_5 = profileUser.photoUrl_5;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    Future(() => profileViewModel.getProfile());

    return Consumer<ProfileViewModel>(builder: (context, model, child) {
      final profileImageFromFile = model.imageFile;
      // final profileUser = profileViewModel.profileUser;

      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).changePhoto),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => showConfirmDialog(
                context: context,
                title: S.of(context).cancel,
                content: S.of(context).cancelConfirm,
                onConfirmed: (isConfirmed) {
                  if (isConfirmed) {
                    Navigator.pop(context);
                  }
                }),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () => showConfirmDialog(
                  context: context,
                  title: S.of(context).changePhoto,
                  content: S.of(context).editPhotoConfirm,
                  onConfirmed: (isConfirmed) {
                    if (isConfirmed) {
                      _updateProfilePhoto(context);
                    }
                  }),
            )
          ],
        ),
        body: model.isProcessing
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
//#################メイン写真######################
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: 200,
                                width: 200,
                                child: ProfileCirclePhoto1(
                                  photoUrl: photoUrl_1,
                                  radius: 100,
                                  onTap: null,
                                  isImageFromFile_1: _isImageFromFile_1,
                                )

                                // ImageFromUrl(
                                //   imageUrl: photoUrl_1,
                                //   isImageFromFile: _isImageFromFile,
                                //   profileImageFromFile: profileImageFromFile_1,
                                // ),
                                ),
                            Column(
                              children: [
                                Text(S.of(context).mainPhoto),
                                RaisedButton(
                                  child: Text(S.of(context).change),
                                  onPressed: () => pickProfileImage_1(),
                                ),
                              ],
                            ),
                          ]),
//###################サブ写真１######################
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: 200,
                                width: 200,
                                child: ProfileCirclePhoto2(
                                  photoUrl: photoUrl_2,
                                  radius: 100,
                                  onTap: null,
                                  isImageFromFile_2: _isImageFromFile_2,
                                )

                                // ImageFromUrl(
                                //   imageUrl: photoUrl_2,
                                //   isImageFromFile: _isImageFromFile,
                                //   profileImageFromFile: profileImageFromFile_2,
                                // ),
                                ),
                            Column(
                              children: [
                                Text(S.of(context).subPhoto_1),
                                photoUrl_2.length == 0
                                    ? RaisedButton(
                                        child: Text(S.of(context).add),
                                        onPressed: () => pickProfileImage_2(),
                                      )
                                    : RaisedButton(
                                        child: Text(S.of(context).change),
                                        onPressed: () => pickProfileImage_2(),
                                      ),
                                photoUrl_2.length == 0
                                    ? Container()
                                    : RaisedButton(
                                        child: Text(S.of(context).delete),
                                        onPressed: () {
                                          setState(() {
                                            photoUrl_2 = "";
                                          });
                                        },
                                      ),
                              ],
                            ),
                          ]),

//###################サブ写真２######################
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: 200,
                                width: 200,
                                child: ProfileCirclePhoto3(
                                  photoUrl: photoUrl_3,
                                  radius: 100,
                                  onTap: null,
                                  isImageFromFile_3: _isImageFromFile_3,
                                )

                                // ImageFromUrl(
                                //   imageUrl: photoUrl_3,
                                //   isImageFromFile: _isImageFromFile,
                                //   profileImageFromFile: profileImageFromFile_3,
                                // ),
                                ),
                            Column(
                              children: [
                                Text(S.of(context).subPhoto_2),
                                photoUrl_3.length == 0
                                    ? RaisedButton(
                                        child: Text(S.of(context).add),
                                        onPressed: () => pickProfileImage_3(),
                                      )
                                    : RaisedButton(
                                        child: Text(S.of(context).change),
                                        onPressed: () => pickProfileImage_3(),
                                      ),
                                photoUrl_3.length == 0
                                    ? Container()
                                    : RaisedButton(
                                        child: Text(S.of(context).delete),
                                        onPressed: () {
                                          setState(() {
                                            photoUrl_3 = "";
                                          });
                                        },
                                      ),
                              ],
                            ),
                          ]),
//###################サブ写真３######################
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: 200,
                                width: 200,
                                child: ProfileCirclePhoto4(
                                  photoUrl: photoUrl_4,
                                  radius: 100,
                                  onTap: null,
                                  isImageFromFile_4: _isImageFromFile_4,
                                )
                                // ImageFromUrl(
                                //   imageUrl: photoUrl_4,
                                //   isImageFromFile: _isImageFromFile,
                                //   profileImageFromFile: profileImageFromFile_4,
                                // ),
                                ),
                            Column(
                              children: [
                                Text(S.of(context).subPhoto_3),
                                photoUrl_4.length == 0
                                    ? RaisedButton(
                                        child: Text(S.of(context).add),
                                        onPressed: () => pickProfileImage_4(),
                                      )
                                    : RaisedButton(
                                        child: Text(S.of(context).change),
                                        onPressed: () => pickProfileImage_4(),
                                      ),
                                photoUrl_4.length == 0
                                    ? Container()
                                    : RaisedButton(
                                        child: Text(S.of(context).delete),
                                        onPressed: () {
                                          setState(() {
                                            photoUrl_4 = "";
                                          });
                                        },
                                      ),
                              ],
                            ),
                          ]),
//###################サブ写真４######################
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: 200,
                                width: 200,
                                child: ProfileCirclePhoto5(
                                  photoUrl: photoUrl_5,
                                  radius: 100,
                                  onTap: null,
                                  isImageFromFile_5: _isImageFromFile_5,
                                )
                                // ImageFromUrl(
                                //   imageUrl: photoUrl_5,
                                //   isImageFromFile: _isImageFromFile,
                                //   profileImageFromFile: profileImageFromFile_5,
                                // ),
                                ),
                            Column(
                              children: [
                                Text(S.of(context).subPhoto_4),
                                photoUrl_5.length == 0
                                    ? RaisedButton(
                                        child: Text(S.of(context).add),
                                        onPressed: () => pickProfileImage_5())
                                    : RaisedButton(
                                        child: Text(S.of(context).change),
                                        onPressed: () => pickProfileImage_5(),
                                      ),
                                photoUrl_5.length == 0
                                    ? Container()
                                    : RaisedButton(
                                        child: Text(S.of(context).delete),
                                        onPressed: () {
                                          setState(() {
                                            photoUrl_5 = "";
                                          });
                                        },
                                      ),
                              ],
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
      );
    });
  }

  //""""""""""""""""""""""""""""""""""""""""""端末から写真をとってくる"""""ここから""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  //端末から写真をとってくる（メイン写真）
  Future<void> pickProfileImage_1() async {
    _isImageFromFile_1 = false;
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    await profileViewModel.pickProfileImage_1();
    photoUrl_1 = profileViewModel.imageFile.path;

    setState(() {
      _isImageFromFile_1 = true;
    });
  }

  //端末から写真をとってくる（サブ写真１）
  Future<void> pickProfileImage_2() async {
    _isImageFromFile_2 = false;
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    await profileViewModel.pickProfileImage_2();
    photoUrl_2 = profileViewModel.imageFile.path;

    setState(() {
      _isImageFromFile_2 = true;
    });
  }

  //端末から写真をとってくる（サブ写真２）
  Future<void> pickProfileImage_3() async {
    _isImageFromFile_3 = false;
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    await profileViewModel.pickProfileImage_3();
    photoUrl_3 = profileViewModel.imageFile.path;

    setState(() {
      _isImageFromFile_3 = true;
    });
  }

  //端末から写真をとってくる（サブ写真３）
  Future<void> pickProfileImage_4() async {
    _isImageFromFile_4 = false;
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    await profileViewModel.pickProfileImage_4();
    photoUrl_4 = profileViewModel.imageFile.path;

    setState(() {
      _isImageFromFile_4 = true;
    });
  }

  //端末から写真をとってくる（サブ写真４）
  Future<void> pickProfileImage_5() async {
    _isImageFromFile_5 = false;
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    await profileViewModel.pickProfileImage_5();
    photoUrl_5 = profileViewModel.imageFile.path;

    setState(() {
      _isImageFromFile_5 = true;
    });
  }

  //""""""""""""""""""""""""""""""""""""""""""端末から写真をとってくる"""""ここまで""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  //""""""""""""""""""""""""""""""""""""""""""プロフィール写真を追加あるいは,プロフィール写真を追加あるいは"""""ここから""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  //
  //プロフィール写真を追加あるいは、アップデート
  void _updateProfilePhoto(BuildContext context) async {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);

    await profileViewModel.updateProfilePhoto_1(
      photoUrl_1,
      _isImageFromFile_1,
    );

    await profileViewModel.updateProfilePhoto_2(
      photoUrl_2,
      _isImageFromFile_2,
    );

    await profileViewModel.updateProfilePhoto_3(
      photoUrl_3,
      _isImageFromFile_3,
    );

    await profileViewModel.updateProfilePhoto_4(
      photoUrl_4,
      _isImageFromFile_4,
    );

    await profileViewModel.updateProfilePhoto_5(
      photoUrl_5,
      _isImageFromFile_5,
    );

    profileViewModel.isProcessing == true
        ? Center(child: CircularProgressIndicator())
        : Navigator.pop(context);
    // }
  }

//""""""""""""""""""""""""""""""""""""""""""プロフィール写真を追加あるいは,プロフィール写真を追加あるいは"""""ここまで""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  //

}
