import 'package:flutter/material.dart';

class ReceiptEdgePainter extends CustomPainter {
  final Color color;
  final double toothWidth;
  final double toothHeight;

  ReceiptEdgePainter({
    required this.color,
    this.toothWidth = 12.0,
    this.toothHeight = 8.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width == 0 || size.height == 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // We draw the main rectangle AND the zig zag at the bottom.
    // However, usually this painter is attached to a Container that already has a color.
    // If we want transparency between teeth, we should treat this as a clipper or draw specifically.
    // Given the request is "Painter untuk menggambar pinggiran kertas struk",
    // it's easiest to draw the *entire* background shape including teeth.

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0); // Top
    path.lineTo(size.width,
        size.height - toothHeight); // Right side down to teeth start

    // Teeth Loop
    final double teethCount = size.width / toothWidth;
    for (int i = 0; i < teethCount; i++) {
      double x = size.width - (i * toothWidth);
      // Zig Zag logic
      path.lineTo(x - (toothWidth / 2), size.height); // Pointy Tip down
      path.lineTo(x - toothWidth, size.height - toothHeight); // Up notch
    }

    path.lineTo(0, 0); // Close to top left
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
