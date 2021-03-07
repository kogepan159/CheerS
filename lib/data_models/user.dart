import 'package:flutter/material.dart';

class User {


  final String uId;
  final String email;
  final String name;//firebaseに登録した情報に紐づいているユーザー名（編集不可）
  final String inAppUserName;//このアプリの中で編集できるユーザーネーム
  final String imageStoragePath_1;
  final String imageStoragePath_2;
  final String imageStoragePath_3;
  final String imageStoragePath_4;
  final String imageStoragePath_5;
  final String photoUrl_1;
  final String photoUrl_2;
  final String photoUrl_3;
  final String photoUrl_4;
  final String photoUrl_5;
  final int friends;
  final String birthday;
  final String bio;
  final String gender;
  final int age;
  final String residence;
  final String birthPlace;
  final String bloodType;
  final String livingStatus;
  final int height;
  final String bodyShape;
  final String educationalBackground;
  final String occupation;
  final String holiday;
  final String alcohol;
  final String tobacco;
  final String sociability;
  final String idealNumberOfParty;
  final String idealPartyAtmosphere;
  final String karaoke;
  final String partyFee;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const User({
    @required this.uId,
    @required this.email,
    @required this.name,
    @required this.inAppUserName,
    @required this.imageStoragePath_1,
    @required this.imageStoragePath_2,
    @required this.imageStoragePath_3,
    @required this.imageStoragePath_4,
    @required this.imageStoragePath_5,
    @required this.photoUrl_1,
    @required this.photoUrl_2,
    @required this.photoUrl_3,
    @required this.photoUrl_4,
    @required this.photoUrl_5,
    @required this.friends,
    @required this.birthday,
    @required this.bio,
    @required this.gender,
    @required this.age,
    @required this.residence,
    @required this.birthPlace,
    @required this.bloodType,
    @required this.livingStatus,
    @required this.height,
    @required this.bodyShape,
    @required this.educationalBackground,
    @required this.occupation,
    @required this.holiday,
    @required this.alcohol,
    @required this.tobacco,
    @required this.sociability,
    @required this.idealNumberOfParty,
    @required this.idealPartyAtmosphere,
    @required this.karaoke,
    @required this.partyFee,
  });

  User copyWith({
    String uId,
    String email,
    String name,
    String inAppUserName,
    String imageStoragePath_1,
    String imageStoragePath_2,
    String imageStoragePath_3,
    String imageStoragePath_4,
    String imageStoragePath_5,
    String photoUrl_1,
    String photoUrl_2,
    String photoUrl_3,
    String photoUrl_4,
    String photoUrl_5,
    int friends,
    String birthday,
    String bio,
    String gender,
    int age,
    String residence,
    String birthPlace,
    String bloodType,
    String livingStatus,
    int height,
    String bodyShape,
    String educationalBackground,
    String occupation,
    String holiday,
    String alcohol,
    String tobacco,
    String sociability,
    String idealNumberOfParty,
    String idealPartyAtmosphere,
    String karaoke,
    String partyFee,
  }) {
    if ((uId == null || identical(uId, this.uId)) &&
        (email == null || identical(email, this.email)) &&
        (name == null || identical(name, this.name)) &&
        (inAppUserName == null ||
            identical(inAppUserName, this.inAppUserName)) &&
        (imageStoragePath_1 == null ||
            identical(imageStoragePath_1, this.imageStoragePath_1)) &&
        (imageStoragePath_2 == null ||
            identical(imageStoragePath_2, this.imageStoragePath_2)) &&
        (imageStoragePath_3 == null ||
            identical(imageStoragePath_3, this.imageStoragePath_3)) &&
        (imageStoragePath_4 == null ||
            identical(imageStoragePath_4, this.imageStoragePath_4)) &&
        (imageStoragePath_5 == null ||
            identical(imageStoragePath_5, this.imageStoragePath_5)) &&
        (photoUrl_1 == null || identical(photoUrl_1, this.photoUrl_1)) &&
        (photoUrl_2 == null || identical(photoUrl_2, this.photoUrl_2)) &&
        (photoUrl_3 == null || identical(photoUrl_3, this.photoUrl_3)) &&
        (photoUrl_4 == null || identical(photoUrl_4, this.photoUrl_4)) &&
        (photoUrl_5 == null || identical(photoUrl_5, this.photoUrl_5)) &&
        (friends == null || identical(friends, this.friends)) &&
        (birthday == null || identical(birthday, this.birthday)) &&
        (bio == null || identical(bio, this.bio)) &&
        (gender == null || identical(gender, this.gender)) &&
        (age == null || identical(age, this.age)) &&
        (residence == null || identical(residence, this.residence)) &&
        (birthPlace == null || identical(birthPlace, this.birthPlace)) &&
        (bloodType == null || identical(bloodType, this.bloodType)) &&
        (livingStatus == null || identical(livingStatus, this.livingStatus)) &&
        (height == null || identical(height, this.height)) &&
        (bodyShape == null || identical(bodyShape, this.bodyShape)) &&
        (educationalBackground == null ||
            identical(educationalBackground, this.educationalBackground)) &&
        (occupation == null || identical(occupation, this.occupation)) &&
        (holiday == null || identical(holiday, this.holiday)) &&
        (alcohol == null || identical(alcohol, this.alcohol)) &&
        (tobacco == null || identical(tobacco, this.tobacco)) &&
        (sociability == null || identical(sociability, this.sociability)) &&
        (idealNumberOfParty == null ||
            identical(idealNumberOfParty, this.idealNumberOfParty)) &&
        (idealPartyAtmosphere == null ||
            identical(idealPartyAtmosphere, this.idealPartyAtmosphere)) &&
        (karaoke == null || identical(karaoke, this.karaoke)) &&
        (partyFee == null || identical(partyFee, this.partyFee))) {
      return this;
    }

    return new User(
      uId: uId ?? this.uId,
      email: email ?? this.email,
      name: name ?? this.name,
      inAppUserName: inAppUserName ?? this.inAppUserName,
      imageStoragePath_1: imageStoragePath_1 ?? this.imageStoragePath_1,
      imageStoragePath_2: imageStoragePath_2 ?? this.imageStoragePath_2,
      imageStoragePath_3: imageStoragePath_3 ?? this.imageStoragePath_3,
      imageStoragePath_4: imageStoragePath_4 ?? this.imageStoragePath_4,
      imageStoragePath_5: imageStoragePath_5 ?? this.imageStoragePath_5,
      photoUrl_1: photoUrl_1 ?? this.photoUrl_1,
      photoUrl_2: photoUrl_2 ?? this.photoUrl_2,
      photoUrl_3: photoUrl_3 ?? this.photoUrl_3,
      photoUrl_4: photoUrl_4 ?? this.photoUrl_4,
      photoUrl_5: photoUrl_5 ?? this.photoUrl_5,
      friends: friends ?? this.friends,
      birthday: birthday ?? this.birthday,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      residence: residence ?? this.residence,
      birthPlace: birthPlace ?? this.birthPlace,
      bloodType: bloodType ?? this.bloodType,
      livingStatus: livingStatus ?? this.livingStatus,
      height: height ?? this.height,
      bodyShape: bodyShape ?? this.bodyShape,
      educationalBackground:
          educationalBackground ?? this.educationalBackground,
      occupation: occupation ?? this.occupation,
      holiday: holiday ?? this.holiday,
      alcohol: alcohol ?? this.alcohol,
      tobacco: tobacco ?? this.tobacco,
      sociability: sociability ?? this.sociability,
      idealNumberOfParty: idealNumberOfParty ?? this.idealNumberOfParty,
      idealPartyAtmosphere: idealPartyAtmosphere ?? this.idealPartyAtmosphere,
      karaoke: karaoke ?? this.karaoke,
      partyFee: partyFee ?? this.partyFee,
    );
  }

  @override
  String toString() {
    return 'User{uId: $uId, email: $email, name: $name, inAppUserName: $inAppUserName, imageStoragePath_1: $imageStoragePath_1, imageStoragePath_2: $imageStoragePath_2, imageStoragePath_3: $imageStoragePath_3, imageStoragePath_4: $imageStoragePath_4, imageStoragePath_5: $imageStoragePath_5, photoUrl_1: $photoUrl_1, photoUrl_2: $photoUrl_2, photoUrl_3: $photoUrl_3, photoUrl_4: $photoUrl_4, photoUrl_5: $photoUrl_5, friends: $friends, birthday: $birthday, bio: $bio, gender: $gender, age: $age, residence: $residence, birthPlace: $birthPlace, bloodType: $bloodType, livingStatus: $livingStatus, height: $height, bodyShape: $bodyShape, educationalBackground: $educationalBackground, occupation: $occupation, holiday: $holiday, alcohol: $alcohol, tobacco: $tobacco, sociability: $sociability, idealNumberOfParty: $idealNumberOfParty, idealPartyAtmosphere: $idealPartyAtmosphere, karaoke: $karaoke, partyFee: $partyFee}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          uId == other.uId &&
          email == other.email &&
          name == other.name &&
          inAppUserName == other.inAppUserName &&
          imageStoragePath_1 == other.imageStoragePath_1 &&
          imageStoragePath_2 == other.imageStoragePath_2 &&
          imageStoragePath_3 == other.imageStoragePath_3 &&
          imageStoragePath_4 == other.imageStoragePath_4 &&
          imageStoragePath_5 == other.imageStoragePath_5 &&
          photoUrl_1 == other.photoUrl_1 &&
          photoUrl_2 == other.photoUrl_2 &&
          photoUrl_3 == other.photoUrl_3 &&
          photoUrl_4 == other.photoUrl_4 &&
          photoUrl_5 == other.photoUrl_5 &&
          friends == other.friends &&
          birthday == other.birthday &&
          bio == other.bio &&
          gender == other.gender &&
          age == other.age &&
          residence == other.residence &&
          birthPlace == other.birthPlace &&
          bloodType == other.bloodType &&
          livingStatus == other.livingStatus &&
          height == other.height &&
          bodyShape == other.bodyShape &&
          educationalBackground == other.educationalBackground &&
          occupation == other.occupation &&
          holiday == other.holiday &&
          alcohol == other.alcohol &&
          tobacco == other.tobacco &&
          sociability == other.sociability &&
          idealNumberOfParty == other.idealNumberOfParty &&
          idealPartyAtmosphere == other.idealPartyAtmosphere &&
          karaoke == other.karaoke &&
          partyFee == other.partyFee);

  @override
  int get hashCode =>
      uId.hashCode ^
      email.hashCode ^
      name.hashCode ^
      inAppUserName.hashCode ^
      imageStoragePath_1.hashCode ^
      imageStoragePath_2.hashCode ^
      imageStoragePath_3.hashCode ^
      imageStoragePath_4.hashCode ^
      imageStoragePath_5.hashCode ^
      photoUrl_1.hashCode ^
      photoUrl_2.hashCode ^
      photoUrl_3.hashCode ^
      photoUrl_4.hashCode ^
      photoUrl_5.hashCode ^
      friends.hashCode ^
      birthday.hashCode ^
      bio.hashCode ^
      gender.hashCode ^
      age.hashCode ^
      residence.hashCode ^
      birthPlace.hashCode ^
      bloodType.hashCode ^
      livingStatus.hashCode ^
      height.hashCode ^
      bodyShape.hashCode ^
      educationalBackground.hashCode ^
      occupation.hashCode ^
      holiday.hashCode ^
      alcohol.hashCode ^
      tobacco.hashCode ^
      sociability.hashCode ^
      idealNumberOfParty.hashCode ^
      idealPartyAtmosphere.hashCode ^
      karaoke.hashCode ^
      partyFee.hashCode;

  factory User.fromMap(Map<String, dynamic> map) {
    return new User(
      uId: map['uId'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      inAppUserName: map['inAppUserName'] as String,
      imageStoragePath_1: map['imageStoragePath_1'] as String,
      imageStoragePath_2: map['imageStoragePath_2'] as String,
      imageStoragePath_3: map['imageStoragePath_3'] as String,
      imageStoragePath_4: map['imageStoragePath_4'] as String,
      imageStoragePath_5: map['imageStoragePath_5'] as String,
      photoUrl_1: map['photoUrl_1'] as String,
      photoUrl_2: map['photoUrl_2'] as String,
      photoUrl_3: map['photoUrl_3'] as String,
      photoUrl_4: map['photoUrl_4'] as String,
      photoUrl_5: map['photoUrl_5'] as String,
      friends: map['friends'] as int,
      birthday: map['birthday'] as String,
      bio: map['bio'] as String,
      gender: map['gender'] as String,
      age: map['age'] as int,
      residence: map['residence'] as String,
      birthPlace: map['birthPlace'] as String,
      bloodType: map['bloodType'] as String,
      livingStatus: map['livingStatus'] as String,
      height: map['height'] as int,
      bodyShape: map['bodyShape'] as String,
      educationalBackground: map['educationalBackground'] as String,
      occupation: map['occupation'] as String,
      holiday: map['holiday'] as String,
      alcohol: map['alcohol'] as String,
      tobacco: map['tobacco'] as String,
      sociability: map['sociability'] as String,
      idealNumberOfParty: map['idealNumberOfParty'] as String,
      idealPartyAtmosphere: map['idealPartyAtmosphere'] as String,
      karaoke: map['karaoke'] as String,
      partyFee: map['partyFee'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'uId': this.uId,
      'email': this.email,
      'name': this.name,
      'inAppUserName': this.inAppUserName,
      'imageStoragePath_1': this.imageStoragePath_1,
      'imageStoragePath_2': this.imageStoragePath_2,
      'imageStoragePath_3': this.imageStoragePath_3,
      'imageStoragePath_4': this.imageStoragePath_4,
      'imageStoragePath_5': this.imageStoragePath_5,
      'photoUrl_1': this.photoUrl_1,
      'photoUrl_2': this.photoUrl_2,
      'photoUrl_3': this.photoUrl_3,
      'photoUrl_4': this.photoUrl_4,
      'photoUrl_5': this.photoUrl_5,
      'friends': this.friends,
      'birthday': this.birthday,
      'bio': this.bio,
      'gender': this.gender,
      'age': this.age,
      'residence': this.residence,
      'birthPlace': this.birthPlace,
      'bloodType': this.bloodType,
      'livingStatus': this.livingStatus,
      'height': this.height,
      'bodyShape': this.bodyShape,
      'educationalBackground': this.educationalBackground,
      'occupation': this.occupation,
      'holiday': this.holiday,
      'alcohol': this.alcohol,
      'tobacco': this.tobacco,
      'sociability': this.sociability,
      'idealNumberOfParty': this.idealNumberOfParty,
      'idealPartyAtmosphere': this.idealPartyAtmosphere,
      'karaoke': this.karaoke,
      'partyFee': this.partyFee,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}