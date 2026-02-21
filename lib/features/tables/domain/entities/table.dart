import 'package:equatable/equatable.dart';

enum TableShape { rectangle, round }

enum TableSessionStatus { locked, ordering, waitingForFood, billed }

class SavvyTable extends Equatable {
  final String id;
  final String name;
  final String? zoneId;
  final double x;
  final double y;
  final double width;
  final double height;
  final double rotation; // In radians
  final TableShape shape;
  final int capacity;
  final bool isOccupied;
  final String? currentOrderUuid;
  
  // BYOD - Dynamic QR Session
  final String? currentSessionToken;
  final String? qrCodeUrl;
  final TableSessionStatus sessionStatus;
  
  final DateTime? updatedAt;

  const SavvyTable({
    required this.id,
    required this.name,
    this.zoneId,
    this.x = 0,
    this.y = 0,
    this.width = 100,
    this.height = 100,
    this.rotation = 0,
    this.shape = TableShape.rectangle,
    this.capacity = 4,
    this.isOccupied = false,
    this.currentOrderUuid,
    this.currentSessionToken,
    this.qrCodeUrl,
    this.sessionStatus = TableSessionStatus.locked,
    this.updatedAt,
  });

  SavvyTable copyWith({
    String? id,
    String? name,
    String? zoneId,
    double? x,
    double? y,
    double? width,
    double? height,
    double? rotation,
    TableShape? shape,
    int? capacity,
    bool? isOccupied,
    String? currentOrderUuid,
    String? currentSessionToken,
    String? qrCodeUrl,
    TableSessionStatus? sessionStatus,
    DateTime? updatedAt,
  }) {
    return SavvyTable(
      id: id ?? this.id,
      name: name ?? this.name,
      zoneId: zoneId ?? this.zoneId,
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
      rotation: rotation ?? this.rotation,
      shape: shape ?? this.shape,
      capacity: capacity ?? this.capacity,
      isOccupied: isOccupied ?? this.isOccupied,
      currentOrderUuid: currentOrderUuid ?? this.currentOrderUuid,
      currentSessionToken: currentSessionToken ?? this.currentSessionToken,
      qrCodeUrl: qrCodeUrl ?? this.qrCodeUrl,
      sessionStatus: sessionStatus ?? this.sessionStatus,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id, name, zoneId, x, y, width, height, rotation, shape, capacity, isOccupied, currentOrderUuid, currentSessionToken, qrCodeUrl, sessionStatus, updatedAt
  ];
}
