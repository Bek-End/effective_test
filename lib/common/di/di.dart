import 'package:get_it/get_it.dart';

abstract class DI {
  static void init() {
    final getIt = GetIt.I;

    // getIt.registerSingleton<MockService>(MockService());
  }

  static Future<void> dispose() async {
    return GetIt.I.reset();
  }
}
