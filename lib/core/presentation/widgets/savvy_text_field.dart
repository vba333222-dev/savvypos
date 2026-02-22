import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class SavvyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const SavvyTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.maxLength,
    this.autoFocus = false,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          SavvyText(labelText!,
              style: SavvyTextStyle.labelSmall,
              color: theme.colors.textSecondary),
          SizedBox(height: theme.shapes.spacingXs),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: maxLength,
          autofocus: autoFocus,
          onChanged: onChanged,
          validator: validator,
          style: TextStyle(color: theme.colors.textPrimary),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: theme.colors.textDisabled),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: theme.colors.bgSurface,
            contentPadding: EdgeInsets.all(theme.shapes.spacingMd),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
              borderSide: BorderSide(color: theme.colors.borderDefault),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
              borderSide: BorderSide(color: theme.colors.borderDefault),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
              borderSide:
                  BorderSide(color: theme.colors.brandPrimary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
              borderSide: BorderSide(color: theme.colors.stateError),
            ),
          ),
        ),
      ],
    );
  }
}
