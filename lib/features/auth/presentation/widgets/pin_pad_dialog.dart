import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme_config.dart';

class PinPadDialog extends StatefulWidget {
  final bool isLogin;
  final String? expectedPin; // If provided, performs local check (for simple auth gates)

  const PinPadDialog({
    Key? key,
    this.isLogin = false,
    this.expectedPin,
  }) : super(key: key);

  @override
  State<PinPadDialog> createState() => _PinPadDialogState();
}

class _PinPadDialogState extends State<PinPadDialog> {
  String _pin = '';

  void _onKeyPress(String val) {
    if (_pin.length < 6) {
      setState(() => _pin += val);
    }
  }

  void _onDelete() {
    if (_pin.isNotEmpty) {
      setState(() => _pin = _pin.substring(0, _pin.length - 1));
    }
  }

  void _onSubmit() {
    if (widget.expectedPin != null) {
      if (_pin == widget.expectedPin) {
        Navigator.pop(context, true);
      } else {
        // Shake or error
        setState(() => _pin = '');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid PIN')));
      }
    } else {
      // Return PIN for processing (e.g. Login)
      Navigator.pop(context, _pin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: colors.bgElevated,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(24),
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.isLogin ? 'Staff Login' : 'Enter PIN', 
              style: typography.headlineSmall
            ),
            const SizedBox(height: 24),
            
            // PIN Display
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index < _pin.length ? colors.brandPrimary : colors.bgInverse.withValues(alpha: 0.1),
                    ),
                  );
                }),
              ),
            ),
            
            const SizedBox(height: 24),

            // Numpad
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                if (index == 9) return const SizedBox.shrink(); // Empty bottom-left
                
                if (index == 10) {
                  return _OptionButton(
                     label: '0', 
                     onTap: () => _onKeyPress('0'),
                  );
                }
                
                if (index == 11) {
                  return IconButton(
                    onPressed: _onDelete,
                    icon: Icon(Icons.backspace, color: colors.textSecondary),
                  );
                }

                // 1-9
                final val = (index + 1).toString();
                return _OptionButton(
                  label: val,
                  onTap: () => _onKeyPress(val),
                );
              },
            ),
            
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _pin.length >= 4 ? _onSubmit : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.brandPrimary,
                  foregroundColor: colors.textInverse,
                ),
                child: const Text('Confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  
  const _OptionButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
