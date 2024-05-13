import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({
    super.key,
    required this.screenName,
  });

  final String screenName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          screenName,
          style: AppTheme.of(context).textTheme.title1,
        ),
      ),
    );
  }
}
