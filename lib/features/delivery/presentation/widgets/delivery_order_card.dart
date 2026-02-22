import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_channel.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_order.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_status.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DeliveryOrderCard extends StatelessWidget {
  final DeliveryOrder order;
  final VoidCallback onAccept;
  final VoidCallback onReject;
  final VoidCallback onMarkReady;
  final VoidCallback onComplete;

  const DeliveryOrderCard({
    super.key,
    required this.order,
    required this.onAccept,
    required this.onReject,
    required this.onMarkReady,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;
    final shapes = context.savvy.shapes;

    Color brandColor = Colors.grey;
    IconData brandIcon = Icons.delivery_dining;
    String brandName = "Delivery";

    if (order.channel == DeliveryChannel.gojek) {
      brandColor = Colors.green[800]!;
      brandName = "Gojek";
    } else if (order.channel == DeliveryChannel.grab) {
      brandColor = Colors.green;
      brandName = "GrabFood";
    }

    // Determine layout and buttons based on status
    final isNew = order.status == DeliveryStatus.newUnaccepted;
    final isPreparing = order.status == DeliveryStatus.accepted ||
        order.status == DeliveryStatus.preparing;
    final isReady = order.status == DeliveryStatus.readyForPickup;

    return Card(
      elevation: isNew ? 4 : 1,
      margin: EdgeInsets.only(bottom: shapes.spacingMd),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(shapes.radiusLg),
        side: BorderSide(
          color:
              isNew ? brandColor.withValues(alpha: 0.5) : colors.borderDefault,
          width: isNew ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── HEADER ──
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: shapes.spacingMd, vertical: shapes.spacingSm),
            decoration: BoxDecoration(
              color: brandColor.withValues(alpha: 0.1),
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(shapes.radiusLg)),
            ),
            child: Row(
              children: [
                Icon(brandIcon, color: brandColor, size: 20),
                const Gap(8),
                Text(brandName,
                    style: TextStyle(
                        color: brandColor, fontWeight: FontWeight.bold)),
                const Spacer(),
                if (isNew)
                  const Icon(Icons.timer, size: 16, color: Colors.orange)
                      .animate(onPlay: (c) => c.repeat(reverse: true))
                      .fade(),
                if (isNew) const Gap(4),
                if (isNew)
                  const Text('ETA: 5m',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(shapes.spacingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── ORDER ID ──
                Text(
                  order.externalOrderId,
                  style: typography.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900, letterSpacing: 1.2),
                ),
                const Gap(4),
                Text(
                  '1x Nasi Goreng Spesial\n1x Es Teh Manis', // Mock Items for now
                  style: typography.bodyMedium,
                ),

                // ── DRIVER INFO (Expandable) ──
                if (order.driverDetails != null)
                  _DriverInfoWidget(
                      brandColor: brandColor,
                      driverName: order.driverDetails!.name,
                      driverPlate: order.driverDetails!.licensePlate),

                const Gap(16),

                // ── ACTIONS ──
                if (isNew)
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: colors.stateError),
                              onPressed: onReject,
                              child: const Text('Tolak'))),
                      const Gap(8),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: brandColor,
                                foregroundColor: Colors.white),
                            onPressed: onAccept,
                            child: const Text('Terima & Proses')),
                      ),
                    ],
                  ),

                if (isPreparing)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colors.stateSuccess,
                          foregroundColor: colors.textInverse),
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text('Tandai Selesai (Ready)'),
                      onPressed: onMarkReady,
                    ),
                  ),

                if (isReady)
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: colors.textPrimary),
                      icon: const Icon(Icons.hail),
                      label: const Text('Konfirmasi Pickup'),
                      onPressed: onComplete,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DriverInfoWidget extends StatelessWidget {
  final Color brandColor;
  final String driverName;
  final String driverPlate;

  const _DriverInfoWidget(
      {required this.brandColor,
      required this.driverName,
      required this.driverPlate});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Row(
          children: [
            Icon(Icons.two_wheeler, color: brandColor, size: 20),
            const Gap(8),
            Text('Info Driver',
                style: TextStyle(
                    fontSize: 14,
                    color: brandColor,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: brandColor.withValues(alpha: 0.2),
                    child: Icon(Icons.person, color: brandColor)),
                const Gap(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(driverName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(driverPlate,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
