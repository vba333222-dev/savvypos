import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/features/sales/presentation/bloc/sales_bloc.dart';

class CategorySelectorWidget extends StatelessWidget {
  const CategorySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesBloc, SalesState>(
      builder: (context, state) {
        if (state.categories.isEmpty) return const SizedBox.shrink();

        return SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length + 1, // +1 for "All"
            itemBuilder: (context, index) {
              final isAll = index == 0;
              final category = isAll ? null : state.categories[index - 1];
              final isSelected = isAll
                  ? state.selectedCategoryId == null
                  : state.selectedCategoryId == category!.id;

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                child: ChoiceChip(
                  label: Text(isAll ? 'All' : category!.name),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      context.read<SalesBloc>().add(SalesEvent.categorySelected(
                          isAll ? null : category!.id));
                    }
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
