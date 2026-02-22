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
  final bool isComposite; // Added

  const Product({
    required this.uuid,
    required this.name,
    this.sku,
    required this.price,
    this.imageUrl,
    this.colorHex,
    required this.categoryId,
    required this.trackStock,
    required this.isService,
    this.isComposite = false, // Added
    this.printerCategory = 'OTHER',
  });

  final String printerCategory; // 'FOOD', 'BEVERAGE', 'OTHER'

  @override
  List<Object?> get props => [
        uuid,
        name,
        sku,
        price,
        imageUrl,
        colorHex,
        categoryId,
        trackStock,
        isService,
        isComposite,
        printerCategory
      ];

  Product copyWith({
    String? uuid,
    String? name,
    String? sku,
    double? price,
    String? imageUrl,
    String? colorHex,
    String? categoryId,
    bool? trackStock,
    bool? isService,
    bool? isComposite,
    String? printerCategory,
  }) {
    return Product(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      colorHex: colorHex ?? this.colorHex,
      categoryId: categoryId ?? this.categoryId,
      trackStock: trackStock ?? this.trackStock,
      isService: isService ?? this.isService,
      isComposite: isComposite ?? this.isComposite,
      printerCategory: printerCategory ?? this.printerCategory,
    );
  }
}
