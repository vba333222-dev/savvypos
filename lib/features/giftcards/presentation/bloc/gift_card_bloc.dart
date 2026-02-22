import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/giftcards/domain/entities/gift_card.dart';
import 'package:savvy_pos/features/giftcards/domain/repositories/i_gift_card_repository.dart';

part 'gift_card_event.dart';
part 'gift_card_state.dart';
part 'gift_card_bloc.freezed.dart';

@injectable
class GiftCardBloc extends Bloc<GiftCardEvent, GiftCardState> {
  final IGiftCardRepository _repository;

  GiftCardBloc(this._repository) : super(const GiftCardState.initial()) {
    on<_Started>(_onStarted);
    on<_SearchCards>(_onSearchCards);
    on<_IssueCard>(_onIssueCard);
    on<_RedeemCard>(_onRedeemCard);
    on<_WatchTransactions>(_onWatchTransactions);
  }

  Future<void> _onStarted(_Started event, Emitter<GiftCardState> emit) async {
    emit(const GiftCardState.loading());
    try {
      final cards = await _repository.getGiftCards();
      final summary = await _repository.getSummary();
      emit(GiftCardState.loaded(cards: cards, summary: summary));
    } catch (e) {
      emit(GiftCardState.error(e.toString()));
    }
  }

  Future<void> _onSearchCards(
      _SearchCards event, Emitter<GiftCardState> emit) async {
    // Keep current summary if possible
    final currentSummary = state.maybeMap(
      loaded: (s) => s.summary,
      orElse: () => null,
    );

    emit(const GiftCardState.loading());
    try {
      final cards = await _repository.getGiftCards(searchQuery: event.query);
      emit(GiftCardState.loaded(
        cards: cards,
        summary: currentSummary ?? await _repository.getSummary(),
      ));
    } catch (e) {
      emit(GiftCardState.error(e.toString()));
    }
  }

  Future<void> _onIssueCard(
      _IssueCard event, Emitter<GiftCardState> emit) async {
    try {
      await _repository.activateGiftCard(
        cardNumber: event.cardNumber,
        initialValue: event.amount,
        activatedByEmployeeUuid: 'system', // TODO: Get from auth
        activatedByEmployeeName: 'System Admin',
        customerName: event.customerName,
        notes: event.notes,
      );
      add(const GiftCardEvent.started());
    } catch (e) {
      emit(GiftCardState.error(e.toString()));
      // Re-fetch to restore state? Or just emit error overlay.
      // For now simple error state, but ideally show snackbar and stay loaded.
    }
  }

  Future<void> _onRedeemCard(
      _RedeemCard event, Emitter<GiftCardState> emit) async {
    // Usually handled by Sales Bloc or separate Pay Dialog, but good to have here.
  }

  Future<void> _onWatchTransactions(
      _WatchTransactions event, Emitter<GiftCardState> emit) async {
    // Implement if needed for detailed view
  }
}
