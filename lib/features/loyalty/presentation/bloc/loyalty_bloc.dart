import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/loyalty/domain/repositories/i_loyalty_repository.dart';
import 'package:savvy_pos/features/loyalty/presentation/bloc/loyalty_event.dart';
import 'package:savvy_pos/features/loyalty/presentation/bloc/loyalty_state.dart';

@injectable
class LoyaltyBloc extends Bloc<LoyaltyEvent, LoyaltyState> {
  final ILoyaltyRepository _repo;

  LoyaltyBloc(this._repo) : super(LoyaltyState.initial()) {
    on<LoadMember>(_onLoadMember);
    on<EnrollMember>(_onEnroll);
    on<EarnPoints>(_onEarn);
    on<RedeemReward>(_onRedeem);
    on<LoadRewards>(_onLoadRewards);

    add(const LoyaltyEvent.loadRewards());
  }

  Future<void> _onLoadRewards(
      LoadRewards event, Emitter<LoyaltyState> emit) async {
    try {
      final rewards = await _repo.getAvailableRewards();
      final config = await _repo.getConfig();
      emit(state.copyWith(availableRewards: rewards, config: config));
    } catch (e) {
      // silent fail for rewards load?
    }
  }

  Future<void> _onLoadMember(
      LoadMember event, Emitter<LoyaltyState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final member = await _repo.getMember(event.customerUuid);
      if (member != null) {
        final history = await _repo.getTransactionHistory(event.customerUuid);
        emit(state.copyWith(
          isLoading: false,
          member: member,
          isEnrolled: true,
          history: history,
        ));
      } else {
        emit(state.copyWith(isLoading: false, member: null, isEnrolled: false));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onEnroll(EnrollMember event, Emitter<LoyaltyState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final member = await _repo.enrollCustomer(
          event.customerUuid, event.name, event.phone);
      emit(state.copyWith(isLoading: false, member: member, isEnrolled: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Enrollment failed: $e'));
    }
  }

  Future<void> _onEarn(EarnPoints event, Emitter<LoyaltyState> emit) async {
    try {
      final member = await _repo.earnPoints(event.customerUuid, event.amount,
          orderUuid: event.orderUuid);
      final history = await _repo.getTransactionHistory(event.customerUuid);
      emit(state.copyWith(member: member, history: history));
    } catch (e) {
      emit(state.copyWith(error: 'Failed to add points'));
    }
  }

  Future<void> _onRedeem(RedeemReward event, Emitter<LoyaltyState> emit) async {
    try {
      final member = await _repo.redeemPoints(event.customerUuid,
          event.reward.pointsCost, 'Redeemed: ${event.reward.name}',
          orderUuid: event.orderUuid);
      final history = await _repo.getTransactionHistory(event.customerUuid);
      emit(state.copyWith(member: member, history: history));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
