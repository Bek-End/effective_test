import 'package:effective_test/design/logic/ticket/ticket_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class DI {
  static void init() {
    final getIt = GetIt.I;

    getIt.registerSingleton<TicketBloc>(TicketBloc(null));
  }

  static Future<void> dispose() async {
    return GetIt.I.reset();
  }
}
