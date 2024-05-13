import 'package:device_preview/device_preview.dart';
import 'package:effective_test/common/constants/assets.dart';
import 'package:effective_test/common/constants/theme/app_themes.dart';
import 'package:effective_test/common/di/bloc_scope.dart';
import 'package:effective_test/common/di/di.dart';
import 'package:effective_test/design/screens/home_screen.dart';
import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:effective_test/domain/repositories/local_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalRepository.init();
  DI.init();

  runApp(BlocScope(
    child: DevicePreview(
      enabled: true,
      builder: (_) => const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Effective test',
      theme: AppThemes.darkTheme,
      home: const NavBar(),
      builder: (context, child) {
        return AppTheme(
          child: Overlay(initialEntries: [
            OverlayEntry(builder: (context) {
              FToast().init(context);
              return child ?? const SizedBox.shrink();
            }),
          ]),
        );
      },
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Center(child: Text('Index 1: Отели')),
    Center(child: Text('Index 2: Короче')),
    Center(child: Text('Index 3: Подписки')),
    Center(child: Text('Index 4: Профиль')),
  ];

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppTheme.of(context).colorScheme;
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgPicture.asset(Assets.icons.airplane),
            activeIcon: SvgPicture.asset(
              Assets.icons.airplane,
              colorFilter: ColorFilter.mode(colorScheme.blue, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Отели',
            icon: SvgPicture.asset(Assets.icons.hotel),
            activeIcon: SvgPicture.asset(
              Assets.icons.hotel,
              colorFilter: ColorFilter.mode(colorScheme.blue, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Подписки',
            icon: SvgPicture.asset(Assets.icons.mapPin),
            activeIcon: SvgPicture.asset(
              Assets.icons.mapPin,
              colorFilter: ColorFilter.mode(colorScheme.blue, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Короче',
            icon: SvgPicture.asset(Assets.icons.bell),
            activeIcon: SvgPicture.asset(
              Assets.icons.bell,
              colorFilter: ColorFilter.mode(colorScheme.blue, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Профиль',
            icon: SvgPicture.asset(Assets.icons.person),
            activeIcon: SvgPicture.asset(
              Assets.icons.person,
              colorFilter: ColorFilter.mode(colorScheme.blue, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
