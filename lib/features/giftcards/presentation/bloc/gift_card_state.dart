part of 'gift_card_bloc.dart';

@freezed
class GiftCardState with _$GiftCardState {
  const factory GiftCardState.initial() = _Initial;
  const factory GiftCardState.loading() = _Loading;
  const factory GiftCardState.loaded({
    required List<GiftCard> cards,
    required GiftCardSummary summary,
  }) = _Loaded;
  const factory GiftCardState.error(String message) = _Error;
}
