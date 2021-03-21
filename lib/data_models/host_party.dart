
import 'package:flutter/material.dart';

//firebase に値を渡すためのデータクラス
class HostParty {
  String hostPartyId;
  String uId;
  String selectedPrefecture;
  String caption;
  String member1Id;
  String member2Id;
  String member3Id;
  String member4Id;
  String member5Id;
  String member6Id;
  String member7Id;
  String member8Id;
  String member9Id;
  String member10Id;
  int    numberOfInvitedMember;
  DateTime postDateTime;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  HostParty({
    @required this.hostPartyId,
    @required this.uId,
    @required this.selectedPrefecture,
    @required this.caption,
    @required this.member1Id,
    @required this.member2Id,
    @required this.member3Id,
    @required this.member4Id,
    @required this.member5Id,
    @required this.member6Id,
    @required this.member7Id,
    @required this.member8Id,
    @required this.member9Id,
    @required this.member10Id,
    @required this.numberOfInvitedMember,
    @required this.postDateTime,
  });

  HostParty copyWith({
    String hostPartyId,
    String uId,
    String selectedPrefecture,
    String caption,
    String member1Id,
    String member2Id,
    String member3Id,
    String member4Id,
    String member5Id,
    String member6Id,
    String member7Id,
    String member8Id,
    String member9Id,
    String member10Id,
    int numberOfInvitedMember,
    DateTime postDateTime,
  }) {
    return new HostParty(
      hostPartyId: hostPartyId ?? this.hostPartyId,
      uId: uId ?? this.uId,
      selectedPrefecture: selectedPrefecture ?? this.selectedPrefecture,
      caption: caption ?? this.caption,
      member1Id: member1Id ?? this.member1Id,
      member2Id: member2Id ?? this.member2Id,
      member3Id: member3Id ?? this.member3Id,
      member4Id: member4Id ?? this.member4Id,
      member5Id: member5Id ?? this.member5Id,
      member6Id: member6Id ?? this.member6Id,
      member7Id: member7Id ?? this.member7Id,
      member8Id: member8Id ?? this.member8Id,
      member9Id: member9Id ?? this.member9Id,
      member10Id: member10Id ?? this.member10Id,
      numberOfInvitedMember:
          numberOfInvitedMember ?? this.numberOfInvitedMember,
      postDateTime: postDateTime ?? this.postDateTime,
    );
  }

  @override
  String toString() {
    return 'HostParty{hostPartyId: $hostPartyId, uId: $uId, selectedPrefecture: $selectedPrefecture, caption: $caption, member1Id: $member1Id, member2Id: $member2Id, member3Id: $member3Id, member4Id: $member4Id, member5Id: $member5Id, member6Id: $member6Id, member7Id: $member7Id, member8Id: $member8Id, member9Id: $member9Id, member10Id: $member10Id, numberOfInvitedMember: $numberOfInvitedMember, postDateTime: $postDateTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HostParty &&
          runtimeType == other.runtimeType &&
          hostPartyId == other.hostPartyId &&
          uId == other.uId &&
          selectedPrefecture == other.selectedPrefecture &&
          caption == other.caption &&
          member1Id == other.member1Id &&
          member2Id == other.member2Id &&
          member3Id == other.member3Id &&
          member4Id == other.member4Id &&
          member5Id == other.member5Id &&
          member6Id == other.member6Id &&
          member7Id == other.member7Id &&
          member8Id == other.member8Id &&
          member9Id == other.member9Id &&
          member10Id == other.member10Id &&
          numberOfInvitedMember == other.numberOfInvitedMember &&
          postDateTime == other.postDateTime);

  @override
  int get hashCode =>
      hostPartyId.hashCode ^
      uId.hashCode ^
      selectedPrefecture.hashCode ^
      caption.hashCode ^
      member1Id.hashCode ^
      member2Id.hashCode ^
      member3Id.hashCode ^
      member4Id.hashCode ^
      member5Id.hashCode ^
      member6Id.hashCode ^
      member7Id.hashCode ^
      member8Id.hashCode ^
      member9Id.hashCode ^
      member10Id.hashCode ^
      numberOfInvitedMember.hashCode ^
      postDateTime.hashCode;

  factory HostParty.fromMap(Map<String, dynamic> map) {
    return new HostParty(
      hostPartyId: map['hostPartyId'] as String,
      uId: map['uId'] as String,
      selectedPrefecture: map['selectedPrefecture'] as String,
      caption: map['caption'] as String,
      member1Id: map['member1Id'] as String,
      member2Id: map['member2Id'] as String,
      member3Id: map['member3Id'] as String,
      member4Id: map['member4Id'] as String,
      member5Id: map['member5Id'] as String,
      member6Id: map['member6Id'] as String,
      member7Id: map['member7Id'] as String,
      member8Id: map['member8Id'] as String,
      member9Id: map['member9Id'] as String,
      member10Id: map['member10Id'] as String,
      numberOfInvitedMember: map['numberOfInvitedMember'] as int,
      postDateTime: map['postDateTime'] ==null
          ? null
          : DateTime.parse(map['postDateTime'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'hostPartyId': this.hostPartyId,
      'uId': this.uId,
      'selectedPrefecture': this.selectedPrefecture,
      'caption': this.caption,
      'member1Id': this.member1Id,
      'member2Id': this.member2Id,
      'member3Id': this.member3Id,
      'member4Id': this.member4Id,
      'member5Id': this.member5Id,
      'member6Id': this.member6Id,
      'member7Id': this.member7Id,
      'member8Id': this.member8Id,
      'member9Id': this.member9Id,
      'member10Id': this.member10Id,
      'numberOfInvitedMember': this.numberOfInvitedMember,
      'postDateTime': this.postDateTime.toIso8601String(),
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
