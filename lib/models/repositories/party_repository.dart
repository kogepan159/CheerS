import 'package:cheers_app/data_models/host_party.dart';
import 'package:cheers_app/data_models/offer.dart';
import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/models/db/database_manager.dart';
import 'package:cheers_app/utils/constants.dart';
import 'package:uuid/uuid.dart';

class PartyRepository {
  final DatabaseManager dbManager;

  PartyRepository({this.dbManager});

  //合コン企画を投稿
  Future<void> postParty(
      User currentUser,
      String selectedPrefecture,
      String caption,
      String  member2Id,
      String  member3Id,
      String  member4Id,
      String  member5Id,
      String  member6Id,
      String   member7Id,
      String   member8Id,
      String   member9Id,
      String   member10Id

      ) async {
    final hostParty = HostParty(
      hostPartyId: Uuid().v1(),
      uId: currentUser.uId,
      selectedPrefecture: selectedPrefecture,
      caption: caption,
      postDateTime: DateTime.now(),
      member1Id: currentUser.uId,
      member2Id: member2Id,
      member3Id: member3Id,
      member4Id: member4Id,
      member5Id: member5Id,
      member6Id: member6Id,
      member7Id: member7Id,
      member8Id: member8Id,
      member9Id: member9Id,
      member10Id: member10Id,
    );
    print("dbManager.hostParty invoked");
    await dbManager.insertPostParty(hostParty);
    // caption = "";
  }

  //合コンデータを取得（フィード画面に表示）
  Future<List<HostParty>> getParty(FeedMode feedMode, User feedUser) async {
    if (feedMode == FeedMode.FROM_FEED) {
      //自分＋全員の投稿を取得
      return dbManager.getAllParty(feedUser.uId);
    } else {
      //プロフィール画面に表示されているユーザーの投稿を取得
      return dbManager.getPartiesByUser(feedUser.uId);
    }
  }

  Future<void> offerParty(HostParty hostParty, User currentUser) async {
    final offer = Offer(
      offerUserId: currentUser.uId,
      offerId: Uuid().v1(),
      hostPartyId: hostParty.hostPartyId,
      hostPartyUserId: hostParty.uId,
      offerDateTime: DateTime.now(),
    );
    await dbManager.offerParty(offer);
  }

  Future<OfferResult> getOfferResult(
      String hostPartyId, User currentUser) async {
    //合コンオファー（いいね）の取得
    final offers = await dbManager.getOffers(hostPartyId);

    //自分がその合コンにオファーしたかどうか判定
    var isOfferedToThisParty = false;
    for (var offer in offers) {
      if (offer.offerUserId == currentUser.uId) {
        isOfferedToThisParty = true;
        break;
      }
    }
    return OfferResult(
        offers: offers, isOfferedToThisParty: isOfferedToThisParty);
  }

  //合コンオファー（いいね）の数を取得
  Future<int> getNumberOfOffer(User profileUser) async {
    return (await dbManager.getNumberOfOffer(profileUser.uId)).length;
  }

  //プロフィール画面に表示する合コンデータをとってくる
  Future<List<HostParty>> getParties(
      ProfileMode profileMode, User profileUser) {
    if (profileMode == ProfileMode.MYSELF) {
      //自分の投稿を取得
      return dbManager.getMyParties(profileUser.uId);
    } else {
      //他人の投稿を取得
      return dbManager.getPartiesByUser(profileUser.uId);
    }
  }

  //プロフィール画面から来た場合に、編集用に既にデータベースにある合コンデータをとってくる
  Future<HostParty> getPartyForEdit(String hostPartyId) async {
    return await dbManager.getMyParty(hostPartyId);
  }

  Future<void> deleteHostParty(String hostPartyId) async {
    await dbManager.deleteHostParty(hostPartyId);
  }

  //投稿内容を更新
  Future<void> updateHostParty(HostParty updateHostParty) async {
    print("partyRepository# dbManager.updateHostParty invoked");

    return dbManager.updateHostParty(updateHostParty);
  }
}
