import 'package:equatable/equatable.dart';
import 'package:savvy_pos/features/sales/domain/entities/cart_item.dart';

class Cart extends Equatable {
  final List<CartItem> items;
  final double taxRate;
  
  const Cart({
    this.items = const [],
    this.taxRate = 0.10, // 10% default
  });

  double get subtotal => items.fold(0, (sum, item) => sum + item.total);
  double get taxAmount => subtotal * taxRate;
  double get total => subtotal + taxAmount;
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  Cart addItem(CartItem newItem) {
    // Check if same product exists with same modifiers? 
    // For simplicity, we just add unique items for now, or match by product ID if no modifiers.
    // If exact match (modifiers etc), merge. 
    
    // MVP: Always add new item unless completely identical?
    // Let's implement basic merging logic.
    
    final index = items.indexWhere((i) => 
      i.product.uuid == newItem.product.uuid && 
      i.modifiers.join(',') == newItem.modifiers.join(',') // naive modifier check
    );

    if (index >= 0) {
      final existing = items[index];
      final updated = existing.copyWith(quantity: existing.quantity + newItem.quantity);
      final newItems = List<CartItem>.from(items)..[index] = updated;
      return copyWith(items: newItems);
    } else {
      return copyWith(items: [...items, newItem]);
    }
  }

  Cart removeItem(String itemId) {
    return copyWith(items: items.where((i) => i.id != itemId).toList());
  }

  Cart updateQuantity(String itemId, int quantity) {
    if (quantity <= 0) return removeItem(itemId);
    
    final newItems = items.map((item) {
      if (item.id == itemId) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();
    
    return copyWith(items: newItems);
  }
  
  Cart clear() {
    return const Cart(items: [], taxRate: 0.10);
  }

  Cart copyWith({
    List<CartItem>? items,
    double? taxRate,
  }) {
    return Cart(
      items: items ?? this.items,
      taxRate: taxRate ?? this.taxRate,
    );
  }

  @override
  List<Object?> get props => [items, taxRate];
}
