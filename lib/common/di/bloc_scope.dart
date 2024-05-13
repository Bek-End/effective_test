import 'package:effective_test/design/logic/ticket/ticket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BlocScope extends StatelessWidget {
  const BlocScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt.get<TicketBloc>()..add(TicketInitEvent())),
      ],
      child: child,
    );
  }
}
