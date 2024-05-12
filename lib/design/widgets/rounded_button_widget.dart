import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppTheme.of(context).colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: colorScheme.basic.shade2,
        ),
        child: child,
      ),
    );
  }
}
