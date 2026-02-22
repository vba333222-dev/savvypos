part of 'gift_card_bloc.dart';

@freezed
class GiftCardEvent with _$GiftCardEvent {
  const factory GiftCardEvent.started() = _Started;
  const factory GiftCardEvent.searchCards(String query) = _SearchCards;
  const factory GiftCardEvent.issueCard({
    required String cardNumber,
    required double amount,
    String? customerName,
    String? notes,
  }) = _IssueCard;
  const factory GiftCardEvent.redeemCard({
    required String cardUuid,
    required double amount,
  }) = _RedeemCard;
  const factory GiftCardEvent.watchTransactions(String cardUuid) =
      _WatchTransactions;
}
