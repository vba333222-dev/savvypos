import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String? colorHex;

  const Category({
    required this.id,
    required this.name,
    this.colorHex,
  });

  @override
  List<Object?> get props => [id, name, colorHex];
}
