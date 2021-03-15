// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `activities`
  String get activities {
    return Intl.message(
      'activities',
      name: 'activities',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment..`
  String get addComment {
    return Intl.message(
      'Add Comment..',
      name: 'addComment',
      desc: '',
      args: [],
    );
  }

  /// `CheerS`
  String get appTitle {
    return Intl.message(
      'CheerS',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want cancel?`
  String get cancelConfirm {
    return Intl.message(
      'Are you sure to want cancel?',
      name: 'cancelConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile Photo`
  String get changeProfilePhoto {
    return Intl.message(
      'Change Profile Photo',
      name: 'changeProfilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Change to Dart Theme`
  String get changeToDarkTheme {
    return Intl.message(
      'Change to Dart Theme',
      name: 'changeToDarkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Change to Light Theme`
  String get changeToLightTheme {
    return Intl.message(
      'Change to Light Theme',
      name: 'changeToLightTheme',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the contents`
  String get confirmation {
    return Intl.message(
      'Confirm the contents',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the updates`
  String get confirmationUpdates {
    return Intl.message(
      'Confirm the updates',
      name: 'confirmationUpdates',
      desc: '',
      args: [],
    );
  }

  /// `confirmation post`
  String get confirmationPost {
    return Intl.message(
      'confirmation post',
      name: 'confirmationPost',
      desc: '',
      args: [],
    );
  }

  /// `directMessage`
  String get dm {
    return Intl.message(
      'directMessage',
      name: 'dm',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete Comment`
  String get deleteComment {
    return Intl.message(
      'Delete Comment',
      name: 'deleteComment',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want to delete your comment?`
  String get deleteCommentConfirm {
    return Intl.message(
      'Are you sure to want to delete your comment?',
      name: 'deleteCommentConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete Post`
  String get deletePost {
    return Intl.message(
      'Delete Post',
      name: 'deletePost',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want to delete your post?`
  String get deletePostConfirm {
    return Intl.message(
      'Are you sure to want to delete your post?',
      name: 'deletePostConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Your post has been updated.`
  String get deletePostSucceeded {
    return Intl.message(
      'Your post has been updated.',
      name: 'deletePostSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want to update your profile?`
  String get editProfileConfirm {
    return Intl.message(
      'Are you sure to want to update your profile?',
      name: 'editProfileConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Profile edit failed.`
  String get editProfileFailed {
    return Intl.message(
      'Profile edit failed.',
      name: 'editProfileFailed',
      desc: '',
      args: [],
    );
  }

  /// `Your profile has been updated.`
  String get editProfileSucceeded {
    return Intl.message(
      'Your profile has been updated.',
      name: 'editProfileSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Edit Post`
  String get editPost {
    return Intl.message(
      'Edit Post',
      name: 'editPost',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want to update your post?`
  String get editPostConfirm {
    return Intl.message(
      'Are you sure to want to update your post?',
      name: 'editPostConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Post edit failed.`
  String get editPostFailed {
    return Intl.message(
      'Post edit failed.',
      name: 'editPostFailed',
      desc: '',
      args: [],
    );
  }

  /// `Your post has been updated.`
  String get editPostSucceeded {
    return Intl.message(
      'Your post has been updated.',
      name: 'editPostSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `Followings`
  String get followings {
    return Intl.message(
      'Followings',
      name: 'followings',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Host`
  String get host {
    return Intl.message(
      'Host',
      name: 'host',
      desc: '',
      args: [],
    );
  }

  /// `Introduction from host`
  String get hostComment {
    return Intl.message(
      'Introduction from host',
      name: 'hostComment',
      desc: '',
      args: [],
    );
  }

  /// `HostParty`
  String get hostParty {
    return Intl.message(
      'HostParty',
      name: 'hostParty',
      desc: '',
      args: [],
    );
  }

  /// `HostLocation`
  String get hostLocation {
    return Intl.message(
      'HostLocation',
      name: 'hostLocation',
      desc: '',
      args: [],
    );
  }

  /// `Input caption...`
  String get inputCaption {
    return Intl.message(
      'Input caption...',
      name: 'inputCaption',
      desc: '',
      args: [],
    );
  }

  /// `Add place`
  String get inputPlace {
    return Intl.message(
      'Add place',
      name: 'inputPlace',
      desc: '',
      args: [],
    );
  }

  /// `Within 800 characters`
  String get inputIntroduction {
    return Intl.message(
      'Within 800 characters',
      name: 'inputIntroduction',
      desc: '',
      args: [],
    );
  }

  /// `inviteFriends`
  String get inviteFriends {
    return Intl.message(
      'inviteFriends',
      name: 'inviteFriends',
      desc: '',
      args: [],
    );
  }

  /// `Latitude`
  String get latitude {
    return Intl.message(
      'Latitude',
      name: 'latitude',
      desc: '',
      args: [],
    );
  }

  /// `Likes`
  String get likes {
    return Intl.message(
      'Likes',
      name: 'likes',
      desc: '',
      args: [],
    );
  }

  /// `LocationName`
  String get locationName {
    return Intl.message(
      'LocationName',
      name: 'locationName',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get longitude {
    return Intl.message(
      'Longitude',
      name: 'longitude',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Offer party`
  String get offerParty {
    return Intl.message(
      'Offer party',
      name: 'offerParty',
      desc: '',
      args: [],
    );
  }

  /// `under offer`
  String get underOffer {
    return Intl.message(
      'under offer',
      name: 'underOffer',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to post?`
  String get postConfirm {
    return Intl.message(
      'Are you sure you want to post?',
      name: 'postConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Post Failed!`
  String get postFailed {
    return Intl.message(
      'Post Failed!',
      name: 'postFailed',
      desc: '',
      args: [],
    );
  }

  /// `Post Succeeded!`
  String get postSucceeded {
    return Intl.message(
      'Post Succeeded!',
      name: 'postSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `searchUser`
  String get searchUser {
    return Intl.message(
      'searchUser',
      name: 'searchUser',
      desc: '',
      args: [],
    );
  }

  /// `searchParty`
  String get searchParty {
    return Intl.message(
      'searchParty',
      name: 'searchParty',
      desc: '',
      args: [],
    );
  }

  /// `Select location info from below..`
  String get selectLocation {
    return Intl.message(
      'Select location info from below..',
      name: 'selectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Introduce yourself to host the party!`
  String get selfIntroductionToHostParty {
    return Intl.message(
      'Introduce yourself to host the party!',
      name: 'selfIntroductionToHostParty',
      desc: '',
      args: [],
    );
  }

  /// `Select Place`
  String get selectPlace {
    return Intl.message(
      'Select Place',
      name: 'selectPlace',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Sing In`
  String get signIn {
    return Intl.message(
      'Sing In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failed.`
  String get signInFailed {
    return Intl.message(
      'Sign in failed.',
      name: 'signInFailed',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to sign out?`
  String get signOutConfirm {
    return Intl.message(
      'Are you sure you want to sign out?',
      name: 'signOutConfirm',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `UnFollow`
  String get unFollow {
    return Intl.message(
      'UnFollow',
      name: 'unFollow',
      desc: '',
      args: [],
    );
  }

  /// `Processing...`
  String get underProcessing {
    return Intl.message(
      'Processing...',
      name: 'underProcessing',
      desc: '',
      args: [],
    );
  }

  /// `user`
  String get user {
    return Intl.message(
      'user',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Canceled by user.`
  String get userCancel {
    return Intl.message(
      'Canceled by user.',
      name: 'userCancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Edit Information`
  String get editInfo {
    return Intl.message(
      'Edit Information',
      name: 'editInfo',
      desc: '',
      args: [],
    );
  }

  /// `Self introduction`
  String get bio {
    return Intl.message(
      'Self introduction',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Residence`
  String get residence {
    return Intl.message(
      'Residence',
      name: 'residence',
      desc: '',
      args: [],
    );
  }

  /// `BirthPlace`
  String get birthPlace {
    return Intl.message(
      'BirthPlace',
      name: 'birthPlace',
      desc: '',
      args: [],
    );
  }

  /// `BloodType`
  String get bloodType {
    return Intl.message(
      'BloodType',
      name: 'bloodType',
      desc: '',
      args: [],
    );
  }

  /// `Living status`
  String get livingStatus {
    return Intl.message(
      'Living status',
      name: 'livingStatus',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `BodyShape`
  String get bodyShape {
    return Intl.message(
      'BodyShape',
      name: 'bodyShape',
      desc: '',
      args: [],
    );
  }

  /// `Educational Background`
  String get educationalBackground {
    return Intl.message(
      'Educational Background',
      name: 'educationalBackground',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get occupation {
    return Intl.message(
      'Occupation',
      name: 'occupation',
      desc: '',
      args: [],
    );
  }

  /// `Holiday`
  String get holiday {
    return Intl.message(
      'Holiday',
      name: 'holiday',
      desc: '',
      args: [],
    );
  }

  /// `Alcohol`
  String get alcohol {
    return Intl.message(
      'Alcohol',
      name: 'alcohol',
      desc: '',
      args: [],
    );
  }

  /// `Tobacco`
  String get tobacco {
    return Intl.message(
      'Tobacco',
      name: 'tobacco',
      desc: '',
      args: [],
    );
  }

  /// `Sociability`
  String get sociability {
    return Intl.message(
      'Sociability',
      name: 'sociability',
      desc: '',
      args: [],
    );
  }

  /// `Personality`
  String get personality {
    return Intl.message(
      'Personality',
      name: 'personality',
      desc: '',
      args: [],
    );
  }

  /// `Ideal number of party`
  String get idealNumberOfParty {
    return Intl.message(
      'Ideal number of party',
      name: 'idealNumberOfParty',
      desc: '',
      args: [],
    );
  }

  /// `ideal party atmosphere`
  String get idealPartyAtmosphere {
    return Intl.message(
      'ideal party atmosphere',
      name: 'idealPartyAtmosphere',
      desc: '',
      args: [],
    );
  }

  /// `Karaoke`
  String get karaoke {
    return Intl.message(
      'Karaoke',
      name: 'karaoke',
      desc: '',
      args: [],
    );
  }

  /// `PartyFee`
  String get partyFee {
    return Intl.message(
      'PartyFee',
      name: 'partyFee',
      desc: '',
      args: [],
    );
  }

  /// `If the self-introduction sentence is written firmly, it is easy to catch the eyes of the partner！（Within 1000 characters）`
  String get inputIntroductionForProfile {
    return Intl.message(
      'If the self-introduction sentence is written firmly, it is easy to catch the eyes of the partner！（Within 1000 characters）',
      name: 'inputIntroductionForProfile',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get nickName {
    return Intl.message(
      'Nickname',
      name: 'nickName',
      desc: '',
      args: [],
    );
  }

  /// `Within 10 characters`
  String get hintForNickName {
    return Intl.message(
      'Within 10 characters',
      name: 'hintForNickName',
      desc: '',
      args: [],
    );
  }

  /// `Select(Within 5 items)`
  String get select {
    return Intl.message(
      'Select(Within 5 items)',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `The party you are holding`
  String get partyInSession {
    return Intl.message(
      'The party you are holding',
      name: 'partyInSession',
      desc: '',
      args: [],
    );
  }

  /// `Please select prefecture`
  String get pleaseSelectPrefecture {
    return Intl.message(
      'Please select prefecture',
      name: 'pleaseSelectPrefecture',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `No prefecture is selected`
  String get noPrefectureIsSelected {
    return Intl.message(
      'No prefecture is selected',
      name: 'noPrefectureIsSelected',
      desc: '',
      args: [],
    );
  }

  /// `Some items have not been entered`
  String get someItemsHaveNotBeenEntered {
    return Intl.message(
      'Some items have not been entered',
      name: 'someItemsHaveNotBeenEntered',
      desc: '',
      args: [],
    );
  }

  /// `Change Photo`
  String get changePhoto {
    return Intl.message(
      'Change Photo',
      name: 'changePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Main photo`
  String get mainPhoto {
    return Intl.message(
      'Main photo',
      name: 'mainPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Sub photo1`
  String get subPhoto_1 {
    return Intl.message(
      'Sub photo1',
      name: 'subPhoto_1',
      desc: '',
      args: [],
    );
  }

  /// `Sub photo2`
  String get subPhoto_2 {
    return Intl.message(
      'Sub photo2',
      name: 'subPhoto_2',
      desc: '',
      args: [],
    );
  }

  /// `Sub photo3`
  String get subPhoto_3 {
    return Intl.message(
      'Sub photo3',
      name: 'subPhoto_3',
      desc: '',
      args: [],
    );
  }

  /// `Sub photo4`
  String get subPhoto_4 {
    return Intl.message(
      'Sub photo4',
      name: 'subPhoto_4',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want to change your photo?`
  String get editPhotoConfirm {
    return Intl.message(
      'Are you sure to want to change your photo?',
      name: 'editPhotoConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Become friend`
  String get becomeFriend {
    return Intl.message(
      'Become friend',
      name: 'becomeFriend',
      desc: '',
      args: [],
    );
  }

  /// `Quit being friends`
  String get quitBeingFriends {
    return Intl.message(
      'Quit being friends',
      name: 'quitBeingFriends',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelFriendRequest {
    return Intl.message(
      'Cancel',
      name: 'cancelFriendRequest',
      desc: '',
      args: [],
    );
  }

  /// `Friend request to you`
  String get friendRequestToYou {
    return Intl.message(
      'Friend request to you',
      name: 'friendRequestToYou',
      desc: '',
      args: [],
    );
  }

  /// `あなたから友達申請中`
  String get friendRequestFromYou {
    return Intl.message(
      'あなたから友達申請中',
      name: 'friendRequestFromYou',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get approval {
    return Intl.message(
      'Ok',
      name: 'approval',
      desc: '',
      args: [],
    );
  }

  /// `No one sent you the friend request`
  String get noOneSentTheFriendRequest {
    return Intl.message(
      'No one sent you the friend request',
      name: 'noOneSentTheFriendRequest',
      desc: '',
      args: [],
    );
  }

  /// `No user you are applying for a friend`
  String get noUserYouAreApplyingForAFriend {
    return Intl.message(
      'No user you are applying for a friend',
      name: 'noUserYouAreApplyingForAFriend',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}