import 'package:flutter/material.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';

class AddToCartNotification extends Notification {
  final Product product;
  final List<ModifierItem> modifiers;
  final GlobalKey sourceKey;
  final VoidCallback? onAnimationComplete;

  const AddToCartNotification({
    required this.product,
    required this.modifiers,
    required this.sourceKey,
    this.onAnimationComplete,
  });
}
