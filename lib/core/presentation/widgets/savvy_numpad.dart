import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class SavvyNumpad extends StatelessWidget {
  final Function(String) onInput;
  final VoidCallback onBackspace;
  final VoidCallback onClear;

  const SavvyNumpad({
    super.key,
    required this.onInput,
    required this.onBackspace,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Container(
      padding: EdgeInsets.all(theme.shapes.spacingMd),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRow(['1', '2', '3'], theme),
          SizedBox(height: theme.shapes.spacingMd),
          _buildRow(['4', '5', '6'], theme),
          SizedBox(height: theme.shapes.spacingMd),
          _buildRow(['7', '8', '9'], theme),
          SizedBox(height: theme.shapes.spacingMd),
          _buildRow(['00', '0', 'backspace'], theme),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> keys, SavvyTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.shapes.spacingXs),
            child: _NumpadButton(
              value: key,
              onTap: () {
                if (key == 'backspace') {
                  onBackspace();
                } else {
                  onInput(key);
                }
              },
              onLongPress: key == 'backspace' ? onClear : null,
              theme: theme,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _NumpadButton extends StatefulWidget {
  final String value;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final SavvyTheme theme;

  const _NumpadButton({
    required this.value,
    required this.onTap,
    this.onLongPress,
    required this.theme,
  });

  @override
  State<_NumpadButton> createState() => _NumpadButtonState();
}

class _NumpadButtonState extends State<_NumpadButton> {
  bool _isPressed = false;

  void _handleTap() {
    HapticFeedback.lightImpact();
    SystemSound.play(SystemSoundType.click);
    widget.onTap();
    
    // Trigger animation manually if needed, but InkResponse/AnimatedScale handles state
    setState(() => _isPressed = true);
    Future.delayed(100.ms, () {
      if (mounted) setState(() => _isPressed = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isBackspace = widget.value == 'backspace';
    
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
         setState(() => _isPressed = false);
         _handleTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      onLongPress: () {
        if (widget.onLongPress != null) {
          HapticFeedback.mediumImpact();
          widget.onLongPress!();
          setState(() => _isPressed = true);
          Future.delayed(100.ms, () { 
             if (mounted) setState(() => _isPressed = false); 
          });
        }
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.9 : 1.0,
        duration: 80.ms,
        curve: Curves.easeOutQuad,
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: _isPressed ? widget.theme.colors.bgPrimary : widget.theme.colors.bgElevated,
            borderRadius: BorderRadius.circular(widget.theme.shapes.radiusMd),
            border: Border.all(
              color: _isPressed 
                ? widget.theme.colors.brandPrimary 
                : widget.theme.colors.borderDefault,
              width: _isPressed ? 2 : 1,
            ),
            boxShadow: _isPressed ? [] : [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          alignment: Alignment.center,
          child: isBackspace
              ? Icon(Icons.backspace_outlined, color: widget.theme.colors.textSecondary)
              : SavvyText(
                  widget.value,
                  style: SavvyTextStyle.h2,
                  color: widget.theme.colors.textPrimary,
                ),
        ),
      ),
    );
  }
}
