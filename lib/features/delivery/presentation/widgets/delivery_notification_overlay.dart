import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_order.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_channel.dart';
import 'package:gap/gap.dart';

class DeliveryNotificationOverlay extends StatelessWidget {
  final DeliveryOrder order;
  final VoidCallback onView;
  final VoidCallback onDismiss;

  const DeliveryNotificationOverlay({
    super.key,
    required this.order,
    required this.onView,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    Color brandColor = Colors.green;
    IconData brandIcon = Icons.delivery_dining;
    String brandName = "Delivery";

    if (order.channel == DeliveryChannel.gojek) {
      brandColor = Colors.green[800]!;
      brandName = "Gojek";
    } else if (order.channel == DeliveryChannel.grab) {
      brandColor = Colors.green;
      brandName = "GrabFood";
    }

    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
          border: Border.all(color: brandColor, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: brandColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(brandIcon, color: brandColor, size: 32)
                  .animate(onPlay: (c) => c.repeat())
                  .shake(hz: 8, curve: Curves.easeInOutCubic, duration: 1500.ms),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pesanan Baru dari $brandName!',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Order #${order.externalOrderId}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Gap(16),
            TextButton(
              onPressed: onDismiss,
              child: const Text('Tutup', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: brandColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: onView,
              child: const Text('Lihat Pesanan'),
            ),
          ],
        ),
      ),
    );
  }
}
