import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class DashboardGrid extends StatelessWidget {
  final List<Widget> children;

  const DashboardGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    // Responsive Columns
    final crossAxisCount = MediaQuery.of(context).size.width > 900 ? 4 : 2;

    return SingleChildScrollView(
      padding: EdgeInsets.all(theme.shapes.spacingLg),
      child: StaggeredGrid.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: theme.shapes.spacingMd,
        crossAxisSpacing: theme.shapes.spacingMd,
        children: children.map((child) {
          // Check if child is wrapped in a Tile wrapper that specifies extents,
          // otherwise default to 1x1.

          // Since StaggeredGrid children need StaggeredGridTile, we assume the children PASSED IN
          // are already StaggeredGridTile OR we wrap them here.
          // For generic usage, it's better if the parent wraps them, but to make it cleaner,
          // we can assume 'children' are tailored widgets.

          // Actually, let's accept [StaggeredGridTile] list? No, type safety issue if generic List<Widget>.
          // Let's expect the caller to pass StaggeredGridTile widgets directly in the list.

          return child;
        }).toList(),
      ),
    );
  }
}

class BentoTile extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const BentoTile({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(theme.shapes.radiusLg),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colors.bgElevated,
          borderRadius: BorderRadius.circular(theme.shapes.radiusLg),
          boxShadow: [
            BoxShadow(
                color: theme.colors.shadowSubtle,
                blurRadius: 10,
                offset: const Offset(0, 4)),
          ],
          border: Border.all(
              color: theme.colors.borderDefault.withValues(alpha: 0.5)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(theme.shapes.radiusLg),
          child: child,
        ),
      ),
    );
  }
}
