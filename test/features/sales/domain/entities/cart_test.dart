import 'package:flutter_test/flutter_test.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/sales/domain/entities/cart.dart';
import 'package:savvy_pos/features/sales/domain/entities/cart_item.dart';

void main() {
  group('Cart', () {
    final product = Product(
      uuid: 'p1',
      name: 'Burger',
      price: 10.0,
      categoryId: 'c1',
      trackStock: false,
      isService: false,
    );
    
    final item = CartItem.create(product: product, quantity: 2); // 2 * 10 = 20

    test('addItem adds to cart', () {
      final cart = const Cart().addItem(item);
      expect(cart.items.length, 1);
      expect(cart.subtotal, 20.0);
    });

    test('addItem merges identical items', () {
      var cart = const Cart().addItem(item);
      cart = cart.addItem(item); // Add same item again (quantity 2)
      
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 4);
      expect(cart.subtotal, 40.0);
    });

    test('updateQuantity updates quantity and total', () {
      var cart = const Cart().addItem(item);
      cart = cart.updateQuantity(cart.items.first.id, 5);
      
      expect(cart.items.first.quantity, 5);
      expect(cart.subtotal, 50.0);
    });

    test('updateQuantity removes item if quantity is 0', () {
      var cart = const Cart().addItem(item);
      cart = cart.updateQuantity(cart.items.first.id, 0);
      
      expect(cart.items.length, 0);
      expect(cart.subtotal, 0.0);
    });
    
    test('calculate totals with tax', () {
      final cart = const Cart(taxRate: 0.10).addItem(item); // 20.0
      expect(cart.subtotal, 20.0);
      expect(cart.taxAmount, 2.0);
      expect(cart.total, 22.0);
    });
  });
}
