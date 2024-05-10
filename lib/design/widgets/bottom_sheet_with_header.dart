import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:flutter/material.dart';

class BottomSheetWithHeader extends StatelessWidget {
  const BottomSheetWithHeader({
    super.key,
    required this.content,
  });

  static Future<T> show<T>({
    required BuildContext context,
    required Widget content,
  }) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BottomSheetWithHeader(content: content),
    );
  }

  final Widget content;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final headerColor = AppTheme.of(context).colorScheme.basic.shade5;
    final size = mq.size;
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: size.width,
          maxHeight: size.height * 0.95,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
          child: Container(
            padding: mq.viewInsets + const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: ListView(
              children: [
                Center(
                  child: Container(
                    width: 38,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: headerColor,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ),
                content,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
