import 'package:effective_test/data/repositories/local_repo.dart';
import 'package:effective_test/data/repositories/ticket_repo.dart';
import 'package:effective_test/data/services/mock_service.dart';
import 'package:effective_test/design/logic/ticket/ticket_bloc.dart';
import 'package:effective_test/domain/repositories/local_repository.dart';
import 'package:effective_test/domain/repositories/ticket_repository.dart';
import 'package:effective_test/domain/usecases/ticket_usecase.dart';
import 'package:get_it/get_it.dart';

abstract class DI {
  static void init() {
    final getIt = GetIt.I;

    getIt
      ..registerSingleton<MockService>(MockService())
      ..registerSingleton<LocalRepo>(LocalRepository())
      ..registerSingleton<TicketRepo>(TicketRepository(getIt.get()))
      ..registerSingleton<TicketUsecase>(
          TicketUsecase(localRepo: getIt.get(), ticketRepo: getIt.get()))
      ..registerSingleton<TicketBloc>(TicketBloc(getIt.get()));
  }

  static Future<void> dispose() async {
    return GetIt.I.reset();
  }
}
