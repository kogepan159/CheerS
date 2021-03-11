import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/generated/l10n.dart';
import 'package:cheers_app/view/common/dialog/confirm_dialog.dart';
import 'package:cheers_app/view/profile/components/sub/appearance_profile.dart';
import 'package:cheers_app/view/profile/components/sub/conditions_profile.dart';
import 'package:cheers_app/view/profile/components/sub/favorite_profile.dart';
import 'package:cheers_app/view/profile/components/sub/general_profile.dart';
import 'package:cheers_app/view/profile/components/sub/occupation_profile.dart';
import 'package:cheers_app/view/profile/components/sub/profile_likes_part.dart';
import 'package:cheers_app/view/profile/components/sub/sociability_profile.dart';
import 'package:cheers_app/view/profile/pages/profile_page.dart';
import 'package:cheers_app/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileEditScreen extends StatelessWidget {
  final HostParty hostParty;
  final String updateBio;
  final String updateInAppUserName;
  final User currentUser;

  ProfileEditScreen({this.hostParty, this.updateBio, this.updateInAppUserName, this.currentUser});

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).editProfile),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => showAlertOrConfirmDialog(context),
          )
        ],
      ),
      body: FutureBuilder(
          future: profileViewModel.getProfile(),
          builder: (context, AsyncSnapshot<User> snapShot) {
            if (snapShot.hasData && snapShot.data != null) {
              final profileData = snapShot.data;
              print("hostPartyUser $profileData");

              return (profileViewModel.isProcessing)
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            GeneralProfile(
                              profileData: profileData,
                            ),
                            AppearanceProfile(),
                            OccupationProfile(),
                            FavoriteProfile(),
                            SociabilityProfile(),
                            ConditionsProfile(),
                          ],
                        ),
                      ),
                    );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  showAlertOrConfirmDialog(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);

    if (profileViewModel.selectedPrefecture == null ||
        profileViewModel.updateBio.length == 0 ||
        profileViewModel.updateInAppUserName.length == 0 ||
        // profileViewModel.selectedGender == null ||
        // profileViewModel.selectedAge == null||
        profileViewModel.selectedResidence == null ||
        profileViewModel.selectedBirthPlace == null ||
        profileViewModel.selectedBloodType == null ||
        profileViewModel.selectedLivingStatus == null ||
        profileViewModel.selectedHeight == null ||
        profileViewModel.selectedBodyShape == null ||
        profileViewModel.selectedEducationalBackground == null ||
        profileViewModel.selectedOccupation == null ||
        profileViewModel.selectedHoliday == null ||
        profileViewModel.selectedAlcohol == null ||
        profileViewModel.selectedTobacco == null ||
        profileViewModel.selectedSociability == null ||
        profileViewModel.selectedIdealNumberOfParty == null ||
        profileViewModel.selectedIdealPartyAtmosphere == null ||
        profileViewModel.selectedKaraoke == null ||
        profileViewModel.selectedPartyFee == null) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
                title: Text(S.of(context).error),
                content: Text(S.of(context).someItemsHaveNotBeenEntered),
                actions: [
                  FlatButton(
                    child: Text(S.of(context).ok),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ));
    } else {
      showConfirmDialog(
          context: context,
          title: S.of(context).editProfile,
          content: S.of(context).editProfileConfirm,
          onConfirmed: (isConfirmed) {
            if (isConfirmed) {
              _updateProfile(context);
            }
          });
    }
  }

  void _updateProfile(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);

    profileViewModel.updateProfile();
    Navigator.pop(context);
  }
}
