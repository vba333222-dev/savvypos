import 'package:equatable/equatable.dart';

class Zone extends Equatable {
  final String id;
  final String name;
  final double width;
  final double
      height; // Physical dimensions in meters or grid units? Let's assume grid units (e.g. 1000x1000)

  const Zone({
    required this.id,
    required this.name,
    this.width = 1000,
    this.height = 1000,
  });

  @override
  List<Object?> get props => [id, name, width, height];
}
