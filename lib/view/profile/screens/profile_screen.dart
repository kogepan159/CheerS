import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:cheers_app/view/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  final ProfileMode profileMode;
  final User selectedUser;
  ProfileScreen({@required this.profileMode, @required this.selectedUser});

  @override
  Widget build(BuildContext context) {
    return   ProfilePage(
          profileMode: profileMode, selectedUser: selectedUser
        
    );
  }
}
