import 'package:flutter/material.dart';

class ReceiptZigZagClipper extends CustomClipper<Path> {
  final double sawToothDepth;
  final double density; // Interpreted as tooth width (pixels)

  ReceiptZigZagClipper({this.sawToothDepth = 12.0, this.density = 20.0});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - sawToothDepth);

    // Draw teeth
    final double toothWidth = density;
    final double count = (size.width / toothWidth).floorToDouble();
    final double remainder = size.width - (count * toothWidth);
    final double adjustedToothWidth = toothWidth + (remainder / count);

    for (int i = 0; i < count; i++) {
       double x = i * adjustedToothWidth;
       path.lineTo(x + (adjustedToothWidth / 2), size.height);
       path.lineTo(x + adjustedToothWidth, size.height - sawToothDepth);
    }

    path.lineTo(size.width, 0); 
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
