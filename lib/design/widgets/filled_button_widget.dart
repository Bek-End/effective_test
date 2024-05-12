import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppTheme.of(context).colorScheme.blue,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
