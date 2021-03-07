import 'package:flutter/material.dart';

//firebase に値を渡すためのデータクラス
class HostParty {
  String hostPartyId;
  String uId;
  String selectedPrefecture;
  String caption;
  DateTime postDateTime;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  HostParty({
    @required this.hostPartyId,
    @required this.uId,
    @required this.selectedPrefecture,
    @required this.caption,
    @required this.postDateTime,
  });

  HostParty copyWith({
    String hostPartyId,
    String uId,
    String selectedPrefecture,
    String caption,
    DateTime postDateTime,
  }) {
    return new HostParty(
      hostPartyId: hostPartyId ?? this.hostPartyId,
      uId: uId ?? this.uId,
      selectedPrefecture: selectedPrefecture ?? this.selectedPrefecture,
      caption: caption ?? this.caption,
      postDateTime: postDateTime ?? this.postDateTime,
    );
  }

  @override
  String toString() {
    return 'HostParty{hostPartyId: $hostPartyId, uId: $uId, selectedPrefecture: $selectedPrefecture, caption: $caption, postDateTime: $postDateTime}';
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
          postDateTime == other.postDateTime);

  @override
  int get hashCode =>
      hostPartyId.hashCode ^
      uId.hashCode ^
      selectedPrefecture.hashCode ^
      caption.hashCode ^
      postDateTime.hashCode;

  factory HostParty.fromMap(Map<String, dynamic> map) {
    return new HostParty(
      hostPartyId: map['hostPartyId'] as String,
      uId: map['uId'] as String,
      selectedPrefecture: map['selectedPrefecture'] as String,
      caption: map['caption'] as String,
      //postDateTime: map['postDateTime'] as DateTime,
      postDateTime: map['postDateTime'] == null
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
      'postDateTime': this.postDateTime.toIso8601String(),
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
