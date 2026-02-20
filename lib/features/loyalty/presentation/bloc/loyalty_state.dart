import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/loyalty/domain/entities/loyalty_entities.dart';

part 'loyalty_state.freezed.dart';

@freezed
class LoyaltyState with _$LoyaltyState {
  const factory LoyaltyState({
    @Default(false) bool isLoading,
    String? error,
    LoyaltyMember? member,
    @Default([]) List<LoyaltyReward> availableRewards,
    @Default([]) List<LoyaltyTransaction> history,
    @Default(null) LoyaltyConfig? config,
    @Default(false) bool isEnrolled, // Convenience
  }) = _LoyaltyState;

  factory LoyaltyState.initial() => const LoyaltyState();
}
