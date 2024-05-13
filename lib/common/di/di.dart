import 'package:effective_test/data/repositories/local_repo.dart';
import 'package:effective_test/data/repositories/ticket_repo.dart';
import 'package:effective_test/design/logic/ticket/ticket_bloc.dart';
import 'package:effective_test/domain/repositories/local_repository.dart';
import 'package:effective_test/domain/repositories/ticket_repository.dart';
import 'package:get_it/get_it.dart';

abstract class DI {
  static void init() {
    final getIt = GetIt.I;

    getIt.registerSingleton<LocalRepo>(LocalRepository());
    getIt.registerSingleton<TicketRepo>(TicketRepository());
    getIt.registerSingleton<TicketBloc>(TicketBloc(null));
  }

  static Future<void> dispose() async {
    return GetIt.I.reset();
  }
}
