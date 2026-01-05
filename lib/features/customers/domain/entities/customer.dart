import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    required String uuid,
    required String name,
    String? phone,
    String? email,
    @Default(0.0) double totalPoints,
    DateTime? lastVisitAt,
  }) = _Customer;
}
