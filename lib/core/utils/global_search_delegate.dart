import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer.dart';
import 'package:savvy_pos/features/customers/domain/repositories/i_customer_repository.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';

class GlobalSearchDelegate extends SearchDelegate {
  final BuildContext context;

  GlobalSearchDelegate(this.context);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return const SizedBox.shrink();
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    
    return FutureBuilder(
      future: Future.wait([
        GetIt.I<IProductRepository>().searchProducts(query),
        GetIt.I<ICustomerRepository>().searchCustomers(query),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final products = snapshot.data![0] as List<Product>;
        final customers = snapshot.data![1] as List<Customer>;
        
        if (products.isEmpty && customers.isEmpty) {
          return const Center(child: Text('No results found.'));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (products.isNotEmpty) ...[
              Text('Products', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              const Divider(),
              ...products.map((p) => ListTile(
                leading: Icon(Icons.inventory_2, color: Colors.blue),
                title: Text(p.name),
                subtitle: Text(p.sku ?? ''),
                trailing: Text('\$${p.price.toStringAsFixed(2)}'),
                onTap: () {
                  context.read<CartBloc>().add(CartEvent.addProduct(p));
                  close(context, null);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${p.name} added to cart')));
                },
              )),
              const SizedBox(height: 16),
            ],
            
            if (customers.isNotEmpty) ...[
              Text('Customers', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              const Divider(),
              ...customers.map((c) => ListTile(
                leading: Icon(Icons.person, color: Colors.green),
                title: Text(c.name),
                subtitle: Text(c.phone ?? c.email ?? ''),
                onTap: () {
                  context.read<CartBloc>().add(CartEvent.selectCustomer(c));
                  close(context, null);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Customer ${c.name} selected')));
                },
              )),
            ],
          ],
        );
      },
    );
  }
}
