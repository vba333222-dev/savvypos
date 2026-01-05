import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String uuid;
  final String name;
  final String? sku;
  final double price;
  final String? imageUrl;
  final String? colorHex;
  final String categoryId;
  final bool trackStock;
  final bool isService;

  const Product({
    required this.uuid,
    required this.name,
    this.sku,
    required this.price,
    this.imageUrl,
    this.colorHex,
    required this.categoryId,
    required this.trackStock,
    required this.trackStock,
    this.isService = false,
    this.printerCategory = 'OTHER',
  });
  
  final String printerCategory; // 'FOOD', 'BEVERAGE', 'OTHER'

  @override
  List<Object?> get props => [uuid, name, sku, price, imageUrl, colorHex, categoryId, trackStock, isService, printerCategory];
}
