import 'package:flutter/material.dart';

class FeatureTourOverlay extends StatelessWidget {
  final Rect targetRect;
  final String title;
  final String description;
  final VoidCallback onDismiss;

  const FeatureTourOverlay({
    super.key,
    required this.targetRect,
    required this.title,
    required this.description,
    required this.onDismiss,
  });

  /// Static helper to show the tour
  static void show({
    required BuildContext context,
    required GlobalKey targetKey,
    required String title,
    required String description,
  }) {
    final RenderBox? renderBox =
        targetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final rect = offset & size;

    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      barrierDismissible: true,
      useSafeArea: false,
      builder: (_) => FeatureTourOverlay(
        targetRect: rect,
        title: title,
        description: description,
        onDismiss: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Using direct colors instead of theme for dialog context safety

    return Stack(
      children: [
        // Cutout Painter (Hole in the dark overlay) comes from barrierColor primarily,
        // but to make a "hole", we actually need a CustomPainter full screen.
        // Since showDialog provides barrier, we can't easily punch a hole in it.
        // Alternative: transparent barrier and CustomPaint full screen.
        Positioned.fill(
          child: GestureDetector(
            onTap: onDismiss,
            child: CustomPaint(
              painter: _SpotlightPainter(targetRect),
            ),
          ),
        ),

        // Description Card (positioned below or above target)
        Positioned(
          top: targetRect.bottom + 20,
          left: 20,
          right: 20,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(description, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: onDismiss, child: const Text("Got it")),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  final Rect target;

  _SpotlightPainter(this.target);

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw full screen dark overlay
    final paint = Paint()..color = Colors.black.withValues(alpha: 0.78);
    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(target, const Radius.circular(8)))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);

    // 2. Draw border around target
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawRRect(
        RRect.fromRectAndRadius(target.inflate(4), const Radius.circular(12)),
        borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
