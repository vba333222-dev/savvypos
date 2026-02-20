import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class DesignSystemPage extends StatelessWidget {
  const DesignSystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final savvy = context.savvy;
    // We can access tokens via context.savvy...

    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Gallery'),
        backgroundColor: savvy.colors.brandPrimary,
        foregroundColor: savvy.colors.textInverse,
      ),
      body: ListView(
        padding: EdgeInsets.all(savvy.shapes.spacingMd),
        children: [
          _SectionHeader(title: 'Colors'),
          _ColorGrid(colors: savvy.colors),
          
          _SectionHeader(title: 'Shapes & Spacing'),
          _SpacingDemo(shapes: savvy.shapes, color: savvy.colors.brandSecondary),

          _SectionHeader(title: 'Motion'),
          _MotionDemo(motion: savvy.motion, color: savvy.colors.brandAccent),
          
          _SectionHeader(title: 'Elevations'),
          _ElevationDemo(elevations: savvy.elevations, bg: savvy.colors.bgElevated),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.savvy.shapes.spacingMd),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: context.savvy.colors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ColorGrid extends StatelessWidget {
  final SavvyColors colors;
  const _ColorGrid({required this.colors});

  @override
  Widget build(BuildContext context) {
    final colorMap = {
      'brandPrimary': colors.brandPrimary,
      'brandSecondary': colors.brandSecondary,
      'brandAccent': colors.brandAccent,
      'bgPrimary': colors.bgPrimary,
      'bgSecondary': colors.bgSecondary,
      'bgElevated': colors.bgElevated,
      'textPrimary': colors.textPrimary,
      'textSecondary': colors.textSecondary,
      'textMuted': colors.textMuted,
      'textInverse': colors.textInverse,
      'borderDefault': colors.borderDefault,
      'stateSuccess': colors.stateSuccess,
      'stateError': colors.stateError,
      'stateWarning': colors.stateWarning,
    };

    return Wrap(
      spacing: context.savvy.shapes.spacingSm,
      runSpacing: context.savvy.shapes.spacingSm,
      children: colorMap.entries.map((e) => _ColorChip(name: e.key, color: e.value)).toList(),
    );
  }
}

class _ColorChip extends StatelessWidget {
  final String name;
  final Color color;
  const _ColorChip({required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(context.savvy.shapes.radiusMd),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      alignment: Alignment.center,
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10,
          color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}

class _SpacingDemo extends StatelessWidget {
  final SavvyShapes shapes;
  final Color color;
  const _SpacingDemo({required this.shapes, required this.color});

  @override
  Widget build(BuildContext context) {
    final spaces = {
      'Xs': shapes.spacingXs,
      'Sm': shapes.spacingSm,
      'Md': shapes.spacingMd,
      'Lg': shapes.spacingLg,
      'Xl': shapes.spacingXl,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: spaces.entries.map((e) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            SizedBox(width: 40, child: Text(e.key)),
            Container(
              height: 20,
              width: e.value,
              color: color,
            ),
            const SizedBox(width: 8),
            Text('${e.value}px'),
          ],
        ),
      )).toList(),
    );
  }
}

class _MotionDemo extends StatefulWidget {
  final SavvyMotion motion;
  final Color color;
  const _MotionDemo({required this.motion, required this.color});

  @override
  State<_MotionDemo> createState() => _MotionDemoState();
}

class _MotionDemoState extends State<_MotionDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => _expanded = !_expanded),
          child: const Text('Animate'),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _AnimatedBox(label: 'Fast', duration: widget.motion.durationFast, expanded: _expanded, color: widget.color),
            _AnimatedBox(label: 'Medium', duration: widget.motion.durationMedium, expanded: _expanded, color: widget.color),
            _AnimatedBox(label: 'Slow', duration: widget.motion.durationSlow, expanded: _expanded, color: widget.color),
          ],
        ),
      ],
    );
  }
}

class _AnimatedBox extends StatelessWidget {
  final String label;
  final Duration duration;
  final bool expanded;
  final Color color;

  const _AnimatedBox({
    required this.label,
    required this.duration,
    required this.expanded,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        AnimatedContainer(
          duration: duration,
          curve: Curves.easeInOut,
          width: expanded ? 80 : 40,
          height: expanded ? 80 : 40,
          color: color,
          margin: const EdgeInsets.only(top: 8),
        ),
        Text('${duration.inMilliseconds}ms'),
      ],
    );
  }
}

class _ElevationDemo extends StatelessWidget {
  final SavvyElevations elevations;
  final Color bg;
  const _ElevationDemo({required this.elevations, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ShadowBox(label: 'Sm', shadow: elevations.sm.isNotEmpty ? elevations.sm.first : const BoxShadow(), bg: bg),
        _ShadowBox(label: 'Md', shadow: elevations.md.isNotEmpty ? elevations.md.first : const BoxShadow(), bg: bg),
        _ShadowBox(label: 'Lg', shadow: elevations.lg.isNotEmpty ? elevations.lg.first : const BoxShadow(), bg: bg),
      ],
    );
  }
}

class _ShadowBox extends StatelessWidget {
  final String label;
  final BoxShadow shadow;
  final Color bg;

  const _ShadowBox({required this.label, required this.shadow, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.all(16), // margin to see shadow
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [shadow],
      ),
      alignment: Alignment.center,
      child: Text(label),
    );
  }
}
