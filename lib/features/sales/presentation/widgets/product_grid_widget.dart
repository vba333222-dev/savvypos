import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/features/sales/presentation/bloc/sales_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesBloc, SalesState>(
      builder: (context, state) {
        if (state.isLoading)
          return const Center(child: CircularProgressIndicator());
        if (state.products.isEmpty)
          return const Center(child: Text('No Products'));

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                3, // Responsive logic needed for real app (LayoutBuilder)
            childAspectRatio: 0.8,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            final product = state.products[index];
            return InkWell(
              onTap: () {
                context
                    .read<SalesBloc>()
                    .add(SalesEvent.selectProduct(product));
              },
              child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: product.imageUrl != null
                          ? CachedNetworkImage(
                              imageUrl: product.imageUrl!,
                              fit: BoxFit.cover,
                              errorWidget: (_, __, ___) =>
                                  const Icon(Icons.image_not_supported),
                            )
                          : Container(
                              color: Colors.blueGrey[100],
                              child: const Icon(Icons.fastfood,
                                  size: 40, color: Colors.blueGrey),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text('\$${product.price.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
