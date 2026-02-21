import 'package:equatable/equatable.dart';

enum PaymentMethod {
  cash,
  card,
  qris,
  custom,
}

enum PaymentStatus {
  paid,
  voided,
  refunded,
}

class PaymentPart extends Equatable {
  final PaymentMethod method;
  final double amount;
  final double? tendered;
  final double? change;
  final String? referenceId; // e.g card auth code, qris ref
  final String? note;

  const PaymentPart({
    required this.method,
    required this.amount,
    this.tendered,
    this.change,
    this.referenceId,
    this.note,
  });

  @override
  List<Object?> get props => [method, amount, tendered, change, referenceId, note];
}

class PaymentTransaction extends Equatable {
  final String uuid;
  final String orderUuid;
  final PaymentMethod method;
  final double amount;
  final double? tendered;
  final double? change;
  final PaymentStatus status;
  final DateTime createdAt;
  final String? note;

  const PaymentTransaction({
    required this.uuid,
    required this.orderUuid,
    required this.method,
    required this.amount,
    required this.status,
    required this.createdAt,
    this.tendered,
    this.change,
    this.note,
  });

  @override
  List<Object?> get props => [uuid, orderUuid, method, amount, status, createdAt, tendered, change, note];
}
