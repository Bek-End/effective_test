import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String hint;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).textTheme.buttonText;
    return TextField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly,
      style: style,
      decoration: InputDecoration(
        hintText: hint,
        helperStyle: style,
        contentPadding: const EdgeInsets.only(left: 8),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        prefixIconConstraints: const BoxConstraints(maxWidth: 32),
        suffixIconConstraints: const BoxConstraints(maxWidth: 32),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: prefixIcon,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: suffixIcon,
        ),
      ),
    );
  }
}
