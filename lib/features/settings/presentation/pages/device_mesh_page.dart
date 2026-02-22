import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class DeviceMeshPage extends StatefulWidget {
  const DeviceMeshPage({super.key});

  @override
  State<DeviceMeshPage> createState() => _DeviceMeshPageState();
}

class _DeviceMeshPageState extends State<DeviceMeshPage>
    with TickerProviderStateMixin {
  late AnimationController _sonarController;
  final List<_PrinterNode> _printers = [
    _PrinterNode(
        'Kitchen Printer', '192.168.1.101', true, const Offset(0.5, 0.3)),
    _PrinterNode(
        'Receipt Printer', 'Bluetooth - TSP100', true, const Offset(0.2, 0.6)),
    _PrinterNode('Bar Printer', 'Disconnected', false, const Offset(0.8, 0.6)),
  ];

  // Particle System
  final List<_DataParticle> _particles = [];
  late AnimationController _particleController;

  @override
  void initState() {
    super.initState();
    _sonarController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..repeat();

    _particleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {
              // Remove finished particles
              _particles.removeWhere((p) => p.progress >= 1.0);
            });
          });
  }

  void _firePulse(Offset endPos) {
    setState(() {
      _particles.add(_DataParticle(
        start: const Offset(0.5, 0.5), // Center (Phone)
        end: endPos,
        startTime: DateTime.now(),
      ));
    });
    // Restart controller to drive animation loop if idle
    if (!_particleController.isAnimating) {
      _particleController.repeat();
    }
  }

  @override
  void dispose() {
    _sonarController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('DEVICE MESH'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 1. Radar Background
          Positioned.fill(
            child: CustomPaint(
              painter: _RadarPainter(
                animation: _sonarController,
                color: theme.colors.brandPrimary,
              ),
            ),
          ),

          // 2. Data Particles
          ..._particles.map((p) => _buildParticle(p, theme)),

          // 3. Center Node (Hub)
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colors.brandPrimary,
                boxShadow: [
                  BoxShadow(
                      color: theme.colors.brandPrimary.withValues(alpha: 0.5),
                      blurRadius: 20,
                      spreadRadius: 5)
                ],
              ),
              child:
                  const Icon(Icons.phone_iphone, color: Colors.white, size: 40),
            ),
          ),

          // 4. Printer Nodes
          ..._printers.map((node) => _buildPrinterNode(node, theme)),

          // 5. Scan Button
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton.extended(
                onPressed: () {
                  // Simulate discovery pulse
                  _sonarController.forward(from: 0);
                },
                backgroundColor: theme.colors.brandPrimary,
                icon: const Icon(Icons.radar),
                label: const Text('SCAN FOR DEVICES'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildParticle(_DataParticle particle, SavvyTheme theme) {
    // Calculate current position based on time
    final now = DateTime.now();
    final elapsed = now.difference(particle.startTime).inMilliseconds;
    final progress = (elapsed / 1000).clamp(0.0, 1.0); // 1 second travel time
    particle.progress = progress;

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        // Lerp position
        final dx = math.min(
            w * particle.start.dx +
                (w * particle.end.dx - w * particle.start.dx) * progress,
            w);
        final dy = math.min(
            h * particle.start.dy +
                (h * particle.end.dy - h * particle.start.dy) * progress,
            h);

        return Positioned(
          left: dx - 6,
          top: dy - 6,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: theme.colors.brandAccent,
                    blurRadius: 10,
                    spreadRadius: 2)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPrinterNode(_PrinterNode node, SavvyTheme theme) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Positioned(
          left: w * node.position.dx - 40,
          top: h * node.position.dy - 40,
          child: GestureDetector(
            onTap: () {
              if (node.isOnline) _firePulse(node.position);
            },
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: node.isOnline
                        ? theme.colors.bgElevated
                        : Colors.grey[800],
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: node.isOnline
                            ? theme.colors.stateSuccess
                            : Colors.grey,
                        width: 2),
                    boxShadow: node.isOnline
                        ? [
                            BoxShadow(
                                color: theme.colors.stateSuccess
                                    .withValues(alpha: 0.3),
                                blurRadius: 15)
                          ]
                        : [],
                  ),
                  child: Icon(Icons.print,
                      color: node.isOnline
                          ? theme.colors.textPrimary
                          : Colors.grey),
                )
                    .animate(target: node.isOnline ? 1 : 0)
                    .scale(
                        duration: 2.seconds,
                        begin: const Offset(1, 1),
                        end: const Offset(1.05, 1.05),
                        curve: Curves.easeInOut)
                    .then()
                    .scale(
                        begin: const Offset(1.05, 1.05),
                        end: const Offset(1, 1)),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    node.name,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                if (node.isOnline)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text("Tap to Test",
                        style: TextStyle(
                            color: theme.colors.textMuted, fontSize: 10)),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DataParticle {
  final Offset start;
  final Offset end;
  final DateTime startTime;
  double progress = 0.0;
  _DataParticle(
      {required this.start, required this.end, required this.startTime});
}

class _PrinterNode {
  final String name;
  final String ip;
  final bool isOnline;
  final Offset position; // Normalized 0-1
  _PrinterNode(this.name, this.ip, this.isOnline, this.position);
}

class _RadarPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  _RadarPainter({required this.animation, required this.color})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius =
        math.sqrt(size.width * size.width + size.height * size.height) / 2;

    final paint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Static Rings
    for (int i = 1; i <= 4; i++) {
      canvas.drawCircle(center, maxRadius * (i / 4), paint);
    }

    // Ripple
    final rippleRadius = maxRadius * animation.value;
    final ripplePaint = Paint()
      ..color = color.withValues(alpha: 1.0 - animation.value)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, rippleRadius, ripplePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
