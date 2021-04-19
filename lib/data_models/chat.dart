
import 'package:flutter/material.dart';

class Chat {

  String chatRoomId;
  String offerUserId;
  String offerUserInAppUserName;
  String offerUserPhotoUrl;
  String offeredUserId;
  String offeredUserInAppUserName;
  String offeredUserPhotoUrl;
  String messageSenderId;
  DateTime lastSendDateTime;
  DateTime sendDateTime;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Chat({
    @required this.chatRoomId,
    @required this.offerUserId,
    @required this.offerUserInAppUserName,
    @required this.offerUserPhotoUrl,
    @required this.offeredUserId,
    @required this.offeredUserInAppUserName,
    @required this.offeredUserPhotoUrl,
    @required this.messageSenderId,
    @required this.lastSendDateTime,
    @required this.sendDateTime,
  });

  Chat copyWith({
    String chatRoomId,
    String offerUserId,
    String offerUserInAppUserName,
    String offerUserPhotoUrl,
    String offeredUserId,
    String offeredUserInAppUserName,
    String offeredUserPhotoUrl,
    String messageSenderId,
    DateTime lastSendDateTime,
    DateTime sendDateTime,
  }) {
    return new Chat(
      chatRoomId: chatRoomId ?? this.chatRoomId,
      offerUserId: offerUserId ?? this.offerUserId,
      offerUserInAppUserName:
          offerUserInAppUserName ?? this.offerUserInAppUserName,
      offerUserPhotoUrl: offerUserPhotoUrl ?? this.offerUserPhotoUrl,
      offeredUserId: offeredUserId ?? this.offeredUserId,
      offeredUserInAppUserName:
          offeredUserInAppUserName ?? this.offeredUserInAppUserName,
      offeredUserPhotoUrl: offeredUserPhotoUrl ?? this.offeredUserPhotoUrl,
      messageSenderId: messageSenderId ?? this.messageSenderId,
      lastSendDateTime: lastSendDateTime ?? this.lastSendDateTime,
      sendDateTime: sendDateTime ?? this.sendDateTime,
    );
  }

  @override
  String toString() {
    return 'Chat{chatRoomId: $chatRoomId, offerUserId: $offerUserId, offerUserInAppUserName: $offerUserInAppUserName, offerUserPhotoUrl: $offerUserPhotoUrl, offeredUserId: $offeredUserId, offeredUserInAppUserName: $offeredUserInAppUserName, offeredUserPhotoUrl: $offeredUserPhotoUrl, messageSenderId: $messageSenderId, lastSendDateTime: $lastSendDateTime, sendDateTime: $sendDateTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chat &&
          runtimeType == other.runtimeType &&
          chatRoomId == other.chatRoomId &&
          offerUserId == other.offerUserId &&
          offerUserInAppUserName == other.offerUserInAppUserName &&
          offerUserPhotoUrl == other.offerUserPhotoUrl &&
          offeredUserId == other.offeredUserId &&
          offeredUserInAppUserName == other.offeredUserInAppUserName &&
          offeredUserPhotoUrl == other.offeredUserPhotoUrl &&
          messageSenderId == other.messageSenderId &&
          lastSendDateTime == other.lastSendDateTime &&
          sendDateTime == other.sendDateTime);

  @override
  int get hashCode =>
      chatRoomId.hashCode ^
      offerUserId.hashCode ^
      offerUserInAppUserName.hashCode ^
      offerUserPhotoUrl.hashCode ^
      offeredUserId.hashCode ^
      offeredUserInAppUserName.hashCode ^
      offeredUserPhotoUrl.hashCode ^
      messageSenderId.hashCode ^
      lastSendDateTime.hashCode ^
      sendDateTime.hashCode;

  factory Chat.fromMap(Map<String, dynamic> map) {
    return new Chat(
      chatRoomId: map['chatRoomId'] as String,
      offerUserId: map['offerUserId'] as String,
      offerUserInAppUserName: map['offerUserInAppUserName'] as String,
      offerUserPhotoUrl: map['offerUserPhotoUrl'] as String,
      offeredUserId: map['offeredUserId'] as String,
      offeredUserInAppUserName: map['offeredUserInAppUserName'] as String,
      offeredUserPhotoUrl: map['offeredUserPhotoUrl'] as String,
      messageSenderId: map['messageSenderId'] as String,
      lastSendDateTime: map['lastSendDateTime'] == null
          ? null
          : DateTime.parse(map['lastSendDateTime'] as String),

      sendDateTime: map['sendDateTime'] == null
          ? null
          : DateTime.parse(map['sendDateTime'] as String),

    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'chatRoomId': this.chatRoomId,
      'offerUserId': this.offerUserId,
      'offerUserInAppUserName': this.offerUserInAppUserName,
      'offerUserPhotoUrl': this.offerUserPhotoUrl,
      'offeredUserId': this.offeredUserId,
      'offeredUserInAppUserName': this.offeredUserInAppUserName,
      'offeredUserPhotoUrl': this.offeredUserPhotoUrl,
      'messageSenderId': this.messageSenderId,
      'lastSendDateTime': this.lastSendDateTime.toIso8601String(),
      'sendDateTime': this.sendDateTime.toIso8601String(),
    } as Map<String, dynamic>;
  }

//</editor-fold>

}

