import 'package:effective_test/common/constants/theme/app_colors_schemes.dart';
import 'package:effective_test/common/constants/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme extends StatefulWidget {
  final Widget child;

  const AppTheme({
    required this.child,
    super.key,
  });

  static AppThemeData of(BuildContext context) {
    final inheritedAppTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedAppTheme>();

    return inheritedAppTheme?.data ?? AppThemeData.fallback();
  }

  @override
  State<AppTheme> createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {
  late AppThemeData _appThemeData;
  Brightness? _previousBrightness;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final theme = Theme.of(context);
    final AppTextTheme textTheme;
    final AppColorScheme colorScheme;

    switch (theme.brightness) {
      case Brightness.dark:
      case Brightness.light:
        colorScheme = DarkColorSchemes();
        textTheme = DarkAppTextTheme();
    }

    if (_previousBrightness != theme.brightness) {
      _previousBrightness = theme.brightness;
      _appThemeData = AppThemeData(
        flutterTheme: theme,
        textTheme: textTheme,
        colorScheme: colorScheme,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAppTheme(_appThemeData, widget.child);
  }
}

class _InheritedAppTheme extends InheritedWidget {
  final AppThemeData data;

  const _InheritedAppTheme(this.data, Widget child) : super(child: child);

  @override
  bool updateShouldNotify(_InheritedAppTheme old) => old.data != data;
}

class AppThemeData {
  final ThemeData flutterTheme;
  final AppTextTheme textTheme;
  final AppColorScheme colorScheme;

  const AppThemeData({
    required this.flutterTheme,
    required this.textTheme,
    required this.colorScheme,
  });

  factory AppThemeData.fallback() {
    final theme = ThemeData.fallback();
    final AppTextTheme textTheme;
    final AppColorScheme colorScheme;

    switch (theme.brightness) {
      case Brightness.dark:
      case Brightness.light:
        colorScheme = DarkColorSchemes();
        textTheme = DarkAppTextTheme();
    }

    return AppThemeData(
      flutterTheme: theme,
      textTheme: textTheme,
      colorScheme: colorScheme,
    );
  }
}
