import 'package:flutter/material.dart';

//自分が投稿に対していいねしたのかを判定するクラス。自分が「合コンを申し込んだ」合コンの詳細画面を開いたとき、「合コンを申し込む」ボタンが、「申し込み中」などの表示にする
class OfferResult{
  final List<Offer> offers;
  final bool isOfferedToThisParty;

  OfferResult({this.offers, this.isOfferedToThisParty});

}

class Offer {
  String offerId; //オファーそのものの識別のためにIDをふる
  String hostPartyId; //どの合コンに申し込んだのかを示す
  String offerUserId; //オファーした人のID
  String hostPartyUserId; //合コンのホスト
  DateTime offerDateTime;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Offer({
    @required this.offerId,
    @required this.hostPartyId,
    @required this.offerUserId,
    @required this.hostPartyUserId,
    @required this.offerDateTime,
  });

  Offer copyWith({
    String offerId,
    String hostPartyId,
    String offerUserId,
    String hostPartyUserId,
    DateTime offerDateTime,
  }) {
    return new Offer(
      offerId: offerId ?? this.offerId,
      hostPartyId: hostPartyId ?? this.hostPartyId,
      offerUserId: offerUserId ?? this.offerUserId,
      hostPartyUserId: hostPartyUserId ?? this.hostPartyUserId,
      offerDateTime: offerDateTime ?? this.offerDateTime,
    );
  }

  @override
  String toString() {
    return 'Offer{offerId: $offerId, hostPartyId: $hostPartyId, offerUserId: $offerUserId, hostPartyUserId: $hostPartyUserId, offerDateTime: $offerDateTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Offer &&
          runtimeType == other.runtimeType &&
          offerId == other.offerId &&
          hostPartyId == other.hostPartyId &&
          offerUserId == other.offerUserId &&
          hostPartyUserId == other.hostPartyUserId &&
          offerDateTime == other.offerDateTime);

  @override
  int get hashCode =>
      offerId.hashCode ^
      hostPartyId.hashCode ^
      offerUserId.hashCode ^
      hostPartyUserId.hashCode ^
      offerDateTime.hashCode;

  factory Offer.fromMap(Map<String, dynamic> map) {
    return new Offer(
      offerId: map['offerId'] as String,
      hostPartyId: map['hostPartyId'] as String,
      offerUserId: map['offerUserId'] as String,
      hostPartyUserId: map['hostPartyUserId'] as String,
        offerDateTime: map['offerDateTime'] == null
          ? null
          : DateTime.parse(map['offerDateTime'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'offerId': this.offerId,
      'hostPartyId': this.hostPartyId,
      'offerUserId': this.offerUserId,
      'hostPartyUserId': this.hostPartyUserId,
      'offerDateTime': this.offerDateTime.toIso8601String(),
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
