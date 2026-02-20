import 'package:flutter/material.dart';
import 'package:savvy_pos/features/auth/data/datasources/audit_log_table.dart';
import 'package:savvy_pos/features/auth/presentation/widgets/supervisor_auth_dialog.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SupervisorGuard — Action Interceptor Utility
//
// Wraps any sensitive POS action behind supervisor PIN authorization.
// Records every approved action to the local AuditLogTable automatically.
//
// ┌──────────────────────────────────────────────────────────────────────────┐
// │  Usage                                                                   │
// │                                                                          │
// │  // Void a line item:                                                    │
// │  await SupervisorGuard.require(                                          │
// │    context: context,                                                     │
// │    action: AuditAction.voidItem,                                         │
// │    title: 'Void Item',                                                   │
// │    reason: 'Requires manager approval to void items.',                   │
// │    orderUuid: order.uuid,                                                │
// │    detail: 'Item: ${item.name} ×${item.quantity}',                      │
// │    onSuccess: () => bloc.add(CartEvent.voidItem(item.uuid)),             │
// │  );                                                                      │
// │                                                                          │
// │  // Open cash drawer:                                                    │
// │  await SupervisorGuard.require(                                          │
// │    context: context,                                                     │
// │    action: AuditAction.openCashDrawer,                                   │
// │    title: 'Open Cash Drawer',                                            │
// │    reason: 'Manual cash drawer release.',                                │
// │    onSuccess: PrinterService.openDrawer,                                 │
// │  );                                                                      │
// │                                                                          │
// │  // Apply discount > 10%:                                                │
// │  await SupervisorGuard.requireForDiscount(                               │
// │    context: context,                                                     │
// │    discountPercent: 15.0,                                                │
// │    orderUuid: order.uuid,                                                │
// │    onSuccess: () => bloc.add(DiscountEvent.apply(15.0)),                 │
// │  );                                                                      │
// └──────────────────────────────────────────────────────────────────────────┘
// ─────────────────────────────────────────────────────────────────────────────

class SupervisorGuard {
  SupervisorGuard._(); // Utility class — no instantiation

  /// Discount threshold above which supervisor authorization is required.
  static const double discountThresholdPercent = 10.0;

  // ── Primary interceptor ─────────────────────────────────────────────────
  /// Shows the supervisor PIN dialog and calls [onSuccess] only if authorized.
  /// Always returns [SupervisorAuthResult] so callers can inspect who approved.
  static Future<SupervisorAuthResult> require({
    required BuildContext context,
    required AuditAction action,
    String title = 'Manager Approval Required',
    String? reason,
    String? orderUuid,
    String? orderItemUuid,
    String? detail,
    /// Called only on successful authorization, before returning.
    Future<void> Function()? onSuccess,
    /// Optional: called when user cancels — for graceful UI cleanup.
    VoidCallback? onDenied,
  }) async {
    final result = await SupervisorAuthDialog.show(
      context,
      title: title,
      reason: reason ?? _defaultReason(action),
      action: action,
      orderUuid: orderUuid,
      orderItemUuid: orderItemUuid,
      detail: detail,
    );

    if (result.authorized) {
      await onSuccess?.call();
    } else {
      onDenied?.call();
    }

    return result;
  }

  // ── Convenience: Void Item ───────────────────────────────────────────────
  static Future<SupervisorAuthResult> requireForVoidItem({
    required BuildContext context,
    required String itemName,
    int quantity = 1,
    String? orderUuid,
    String? orderItemUuid,
    Future<void> Function()? onSuccess,
  }) {
    return require(
      context: context,
      action: AuditAction.voidItem,
      title: 'Void Item',
      reason: 'Voiding items requires manager authorization.',
      orderUuid: orderUuid,
      orderItemUuid: orderItemUuid,
      detail: 'Item: $itemName ×$quantity',
      onSuccess: onSuccess,
    );
  }

  // ── Convenience: Void Order ──────────────────────────────────────────────
  static Future<SupervisorAuthResult> requireForVoidOrder({
    required BuildContext context,
    required String orderNumber,
    String? orderUuid,
    Future<void> Function()? onSuccess,
  }) {
    return require(
      context: context,
      action: AuditAction.voidOrder,
      title: 'Void Order',
      reason: 'Voiding entire orders requires manager authorization.',
      orderUuid: orderUuid,
      detail: 'Order: #$orderNumber',
      onSuccess: onSuccess,
    );
  }

  // ── Convenience: Open Cash Drawer ───────────────────────────────────────
  static Future<SupervisorAuthResult> requireForCashDrawer({
    required BuildContext context,
    String reason = 'Manual cash drawer release requires authorization.',
    Future<void> Function()? onSuccess,
  }) {
    return require(
      context: context,
      action: AuditAction.openCashDrawer,
      title: 'Open Cash Drawer',
      reason: reason,
      detail: 'Manual drawer release',
      onSuccess: onSuccess,
    );
  }

  // ── Convenience: Discount with threshold guard ───────────────────────────
  /// Only presents the auth dialog if [discountPercent] exceeds
  /// [discountThresholdPercent] (default: 10%). Below threshold, calls
  /// [onSuccess] directly without interrupting the cashier.
  static Future<SupervisorAuthResult> requireForDiscount({
    required BuildContext context,
    required double discountPercent,
    String? orderUuid,
    Future<void> Function()? onSuccess,
  }) async {
    if (discountPercent <= discountThresholdPercent) {
      // Below threshold: no auth needed, apply directly
      await onSuccess?.call();
      return const SupervisorAuthResult(authorized: true);
    }

    return require(
      context: context,
      action: AuditAction.applyDiscount,
      title: 'High Discount Approval',
      reason: 'Discounts above $discountThresholdPercent% require manager authorization.',
      orderUuid: orderUuid,
      detail: 'Discount: ${discountPercent.toStringAsFixed(1)}%',
      onSuccess: onSuccess,
    );
  }

  // ── Convenience: Price Override ──────────────────────────────────────────
  static Future<SupervisorAuthResult> requireForPriceOverride({
    required BuildContext context,
    required String itemName,
    required double originalPrice,
    required double newPrice,
    String? orderUuid,
    String? orderItemUuid,
    Future<void> Function()? onSuccess,
  }) {
    final diff = ((originalPrice - newPrice) / originalPrice * 100).abs();
    return require(
      context: context,
      action: AuditAction.priceOverride,
      title: 'Price Override',
      reason: 'Changing item prices requires manager authorization.',
      orderUuid: orderUuid,
      orderItemUuid: orderItemUuid,
      detail: '$itemName: \$${originalPrice.toStringAsFixed(2)} → \$${newPrice.toStringAsFixed(2)} (${diff.toStringAsFixed(1)}% change)',
      onSuccess: onSuccess,
    );
  }

  // ── Convenience: Refund ──────────────────────────────────────────────────
  static Future<SupervisorAuthResult> requireForRefund({
    required BuildContext context,
    required double amount,
    String? orderUuid,
    Future<void> Function()? onSuccess,
  }) {
    return require(
      context: context,
      action: AuditAction.refund,
      title: 'Authorize Refund',
      reason: 'Refunds require manager authorization.',
      orderUuid: orderUuid,
      detail: 'Refund amount: \$${amount.toStringAsFixed(2)}',
      onSuccess: onSuccess,
    );
  }

  // ── Internal helpers ─────────────────────────────────────────────────────
  static String _defaultReason(AuditAction action) {
    switch (action) {
      case AuditAction.voidItem:       return 'Voiding items requires manager authorization.';
      case AuditAction.voidOrder:      return 'Voiding orders requires manager authorization.';
      case AuditAction.openCashDrawer: return 'Cash drawer release requires manager authorization.';
      case AuditAction.applyDiscount:  return 'High discounts require manager authorization.';
      case AuditAction.priceOverride:  return 'Price overrides require manager authorization.';
      case AuditAction.refund:         return 'Refunds require manager authorization.';
      case AuditAction.supervisorLogin:return 'This action requires supervisor authorization.';
    }
  }
}
