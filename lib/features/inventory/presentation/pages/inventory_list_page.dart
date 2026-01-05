import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/inventory_management_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/product_form_page.dart';

class InventoryListPage extends StatelessWidget {
  const InventoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<InventoryManagementBloc>(),
      child: const _InventoryListView(),
    );
  }
}

class _InventoryListView extends StatelessWidget {
  const _InventoryListView();

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;
    final shapes = context.savvy.shapes;
    
    // Retrieve repository directly to stream products.
    // Usually we would use a Bloc for "Listing", but to save complexity we use StreamBuilder directly for now
    // or reuse ProductBloc if it exposed a stream. 
    // Since ProductBloc is for POS (grid), let's just use the repo stream here for simplicity and real-time updates.
    final repo = GetIt.I<IProductRepository>();

    return Scaffold(
      backgroundColor: colors.bgPrimary,
      appBar: AppBar(
        title: const Text('Inventory Management'),
        backgroundColor: colors.bgPrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context, 
          MaterialPageRoute(builder: (_) => const ProductFormPage()),
        ).then((_) {
            // Trigger refresh if needed, but StreamBuilder handles it.
        }),
        backgroundColor: colors.brandPrimary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: StreamBuilder<List<Product>>(
        stream: repo.watchAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
             return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          
          final products = snapshot.data!;
          if (products.isEmpty) {
            return Center(child: Text('No products found', style: typography.bodyLarge));
          }

          return ListView.separated(
            padding: EdgeInsets.all(shapes.spacingMd),
            itemCount: products.length,
            separatorBuilder: (_, __) => SizedBox(height: shapes.spacingSm),
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                elevation: 0,
                color: colors.bgElevated,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(shapes.radiusMd),
                  side: BorderSide(color: colors.borderDefault),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(shapes.spacingMd),
                  leading: Container(
                    width: 50, height: 50,
                    decoration: BoxDecoration(
                      color: colors.bgPrimary,
                      borderRadius: BorderRadius.circular(shapes.radiusSm),
                      image: product.imageUrl != null 
                        ? DecorationImage(image: FileImage(File(product.imageUrl!)), fit: BoxFit.cover)
                        : null,
                    ),
                    child: product.imageUrl == null 
                       ? Icon(Icons.inventory_2, color: colors.textSecondary)
                       : null,
                  ),
                  title: Text(product.name, style: typography.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SKU: ${product.sku ?? '-'}', style: typography.bodySmall),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}', style: typography.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                          if (product.trackStock) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: colors.stateInfo.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text('Stock: N/A', style: TextStyle(fontSize: 10, color: colors.stateInfo)), 
                              // Use InventoryLedger for real stock, but Product entity doesn't have it joined yet.
                              // Keeping it simple as per Entity definition.
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: colors.brandPrimary),
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (_) => ProductFormPage(product: product),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
