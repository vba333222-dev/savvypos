import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_details.freezed.dart';
part 'driver_details.g.dart';

@freezed
class DriverDetails with _$DriverDetails {
  const factory DriverDetails({
    required String name,
    required String licensePlate,
    required String phone,
    DateTime? eta,
  }) = _DriverDetails;

  factory DriverDetails.fromJson(Map<String, dynamic> json) =>
      _$DriverDetailsFromJson(json);
}
