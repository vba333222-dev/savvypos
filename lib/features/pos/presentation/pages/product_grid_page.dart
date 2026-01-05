import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/inventory/data/repositories/product_repository_impl.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/get_products.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/product/product_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/product_card.dart';
import 'package:savvy_pos/bootstrap.dart'; // Access global db for now
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/product_modifier_dialog.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';

class ProductGridPage extends StatelessWidget {
  const ProductGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection (Manual for now)
    final repo = ProductRepositoryImpl(db); 
    final useCase = GetProductsUseCase(repo);

    return BlocProvider(
      create: (context) => ProductBloc(useCase)..add(LoadProducts()),
      child: const ProductGridView(),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      appBar: AppBar(
        title: Text("Savvy POS (Free Tier)", style: TextStyle(color: theme.colors.textPrimary)),
        backgroundColor: theme.colors.bgSecondary,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: theme.colors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is ProductLoaded) {
            if (state.products.isEmpty) {
              return Center(
                child: Text(
                  "No Products Found",
                  style: TextStyle(color: theme.colors.textMuted),
                ),
              );
            }
            return GridView.builder(
              padding: EdgeInsets.all(theme.shapes.spacingMd),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Responsive logic can be added here
                childAspectRatio: 0.7,
                crossAxisSpacing: theme.shapes.spacingMd,
                mainAxisSpacing: theme.shapes.spacingMd,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(
                  product: product,
                  onTap: () async {
                     // Check Modifiers
                     try {
                        final modifiers = await GetIt.I<IProductRepository>().getModifiersForProduct(product.uuid);
                        if (!context.mounted) return;

                        if (modifiers.isEmpty) {
                          context.read<CartBloc>().add(CartEvent.addProduct(product));
                        } else {
                          // Show Dialog
                          final result = await showDialog<List<ModifierItem>>(
                            context: context,
                            builder: (_) => ProductModifierDialog(product: product),
                          );
                          
                          if (result != null && context.mounted) {
                            context.read<CartBloc>().add(CartEvent.addProduct(product, modifiers: result));
                          }
                        }
                     } catch (e) {
                       // Fallback or Toast?
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error loading options: $e')));
                     }
                  },
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colors.brandPrimary,
        child: const Icon(Icons.add),
        onPressed: () async {
          // Temporary Seeder
          final repo = ProductRepositoryImpl(db); 
          final uuid = DateTime.now().millisecondsSinceEpoch.toString();
          final product = Product(
            uuid: uuid,
            name: "Latte ${uuid.substring(uuid.length - 4)}",
            price: 3.50,
            categoryId: "coffee",
            trackStock: true,
            colorHex: "#F4B860", // Brand Accent
          );
          await repo.saveProduct(product);
          // Bloc listens to stream, so it should auto-update
        },
      ),
    );
  }
}
