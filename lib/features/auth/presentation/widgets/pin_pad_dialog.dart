import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/utils/haptic_helper.dart';

class PinPadDialog extends StatefulWidget {
  final bool isLogin;
  final String? expectedPin; 

  const PinPadDialog({
    super.key,
    this.isLogin = false,
    this.expectedPin,
  });

  @override
  State<PinPadDialog> createState() => _PinPadDialogState();
}

class _PinPadDialogState extends State<PinPadDialog> {
  String _pin = '';

  void _onKeyPress(String val) {
    if (_pin.length < 6) {
      HapticHelper.onTap();
      setState(() => _pin += val);
    } else {
      HapticHelper.onError(); // Too long
    }
  }

  void _onDelete() {
    if (_pin.isNotEmpty) {
      HapticHelper.onTap();
      setState(() => _pin = _pin.substring(0, _pin.length - 1));
    }
  }

  void _onSubmit() {
    if (widget.expectedPin != null) {
      if (_pin == widget.expectedPin) {
        HapticHelper.onSelection();
        Navigator.pop(context, true);
      } else {
        HapticHelper.onError();
        setState(() => _pin = '');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const SavvyText.body('Invalid PIN', color: Colors.white), 
            backgroundColor: context.savvy.colors.stateError
          )
        );
      }
    } else {
      HapticHelper.onSelection();
      Navigator.pop(context, _pin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Dialog(
      backgroundColor: theme.colors.bgElevated,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusLg)),
      child: Container(
        padding: EdgeInsets.all(theme.shapes.spacingLg),
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SavvyText(
              widget.isLogin ? 'Staff Login' : 'Enter PIN', 
              style: SavvyTextStyle.h3,
              color: theme.colors.textPrimary,
            ),
            SizedBox(height: theme.shapes.spacingXl),
            
            // PIN Display
            Container(
              height: 40,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  final isFilled = index < _pin.length;
                  return AnimatedContainer(
                    duration: theme.motion.durationFast,
                    curve: Curves.easeOutBack,
                    margin: EdgeInsets.symmetric(horizontal: theme.shapes.spacingXs),
                    width: isFilled ? 18 : 12,
                    height: isFilled ? 18 : 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFilled ? theme.colors.brandPrimary : theme.colors.textMuted.withValues(alpha: 0.2),
                      boxShadow: isFilled ? theme.elevations.sm : [],
                    ),
                  );
                }),
              ),
            ),
            
            SizedBox(height: theme.shapes.spacingXl),

            // Numpad
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.4,
                crossAxisSpacing: theme.shapes.spacingMd,
                mainAxisSpacing: theme.shapes.spacingMd,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                if (index == 9) return const SizedBox.shrink(); // Empty bottom-left
                
                if (index == 10) {
                  return _PinButton(
                     label: '0', 
                     onTap: () => _onKeyPress('0'),
                     theme: theme,
                  );
                }
                
                if (index == 11) {
                  return InkWell(
                    onTap: _onDelete,
                    borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                    child: Icon(Icons.backspace_outlined, color: theme.colors.textMuted, size: 28),
                  );
                }

                // 1-9
                final val = (index + 1).toString();
                return _PinButton(
                  label: val,
                  onTap: () => _onKeyPress(val),
                  theme: theme,
                );
              },
            ),
            
            SizedBox(height: theme.shapes.spacingXl),
            
            // Submit
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _pin.length >= 4 ? _onSubmit : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colors.brandPrimary,
                  foregroundColor: theme.colors.textInverse,
                  disabledBackgroundColor: theme.colors.bgSecondary,
                  disabledForegroundColor: theme.colors.textMuted,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusMd)),
                ),
                child: const SavvyText('Confirm', style: SavvyTextStyle.labelLarge, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ).animate().scale(duration: theme.motion.durationFast, curve: Curves.easeOutBack);
  }
}

class _PinButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final SavvyTheme theme;
  
  const _PinButton({required this.label, required this.onTap, required this.theme});

  @override
  State<_PinButton> createState() => _PinButtonState();
}

class _PinButtonState extends State<_PinButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
         setState(() => _isPressed = true);
         widget.onTap();
      },
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.9 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: SavvyBox(
          color: _isPressed ? widget.theme.colors.brandPrimary.withValues(alpha: 0.1) : widget.theme.colors.bgPrimary,
          border: Border.all(
            color: _isPressed ? widget.theme.colors.brandPrimary : widget.theme.colors.borderDefault,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(widget.theme.shapes.radiusMd),
          child: Center(
            child: SavvyText(
              widget.label,
              style: SavvyTextStyle.h2,
              color: _isPressed ? widget.theme.colors.brandPrimary : widget.theme.colors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
