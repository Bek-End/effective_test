import 'package:effective_test/design/logic/ticket/ticket_bloc.dart';
import 'package:effective_test/design/screens/offers_screen.dart';
import 'package:effective_test/design/screens/search_result_screen.dart';
import 'package:effective_test/design/screens/tickets_screen.dart';
import 'package:effective_test/design/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketBloc, TicketState>(
      builder: (context, state) {
        if (state is TicketLoadingState) {
          return const LoadingWidget();
        }

        if (state is TicketOfferTicketsState) {
          return const SearchResultScreen();
        }

        if (state is TicketTicketsState) {
          return const TicketsScreen();
        }

        return const OffersScreen();
      },
    );
  }
}
