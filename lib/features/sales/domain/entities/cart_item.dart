import 'package:equatable/equatable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:uuid/uuid.dart';

class CartItem extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  final List<String> modifiers; // For now just strings, later Modifier entities
  final String? note;

  const CartItem({
    required this.id,
    required this.product,
    this.quantity = 1,
    this.modifiers = const [],
    this.note,
  });

  factory CartItem.create({
    required Product product,
    int quantity = 1,
    List<String> modifiers = const [],
    String? note,
  }) {
    return CartItem(
      id: const Uuid().v4(),
      product: product,
      quantity: quantity,
      modifiers: modifiers,
      note: note,
    );
  }

  double get total => product.price * quantity;

  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    List<String>? modifiers,
    String? note,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      modifiers: modifiers ?? this.modifiers,
      note: note ?? this.note,
    );
  }

  @override
  List<Object?> get props => [id, product, quantity, modifiers, note];
}
