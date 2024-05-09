import 'package:device_preview/device_preview.dart';
import 'package:effective_test/common/di/bloc_scope.dart';
import 'package:effective_test/common/di/di.dart';
import 'package:effective_test/domain/repositories/local_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalRepository.init();
  DI.init();

  runApp(
    // BlocScope(
    // child: DevicePreview(
    //   enabled: true,
    //   builder: (_) =>
    const MyApp(),
  );
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Effective test',
      theme: ThemeData(useMaterial3: false),
      darkTheme: ThemeData.dark(useMaterial3: false),
      home: const NavBar(),
      builder: (context, child) {
        return Overlay(initialEntries: [
          OverlayEntry(builder: (context) {
            FToast().init(context);
            return child ?? const SizedBox.shrink();
          }),
        ]);
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
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Отели',
            icon: Icon(Icons.business_outlined),
            activeIcon: Icon(Icons.business),
          ),
          BottomNavigationBarItem(
            label: 'Короче',
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
          ),
          BottomNavigationBarItem(
            label: 'Подписки',
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
          ),
          BottomNavigationBarItem(
            label: 'Профиль',
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
          ),
        ],
      ),
    );
  }
}
