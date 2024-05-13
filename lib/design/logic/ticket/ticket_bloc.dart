import 'package:effective_test/data/models/offer_model.dart';
import 'package:effective_test/data/models/ticket_model.dart';
import 'package:effective_test/data/models/ticket_offer_model.dart';
import 'package:effective_test/design/widgets/toast_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc(this._ticketUsecase) : super(TicketLoadingState()) {
    on<TicketInitEvent>(_getOffers);
    on<TicketGetTicketOffersEvent>(_getTicketOffers);
    on<TicketGetTicketsEvent>(_getTickets);
  }

  final dynamic _ticketUsecase;

  void _getOffers(TicketInitEvent event, Emitter<TicketState> emit) async {
    late final offers;
    try {
      offers = await _ticketUsecase.getOffers();
    } catch (_) {
      showToast('Что то пошло не так. Повторите попытку позже');
    } finally {
      emit(TicketOffersState(offerModel: offers, lastCountryFrom: ''));
    }
  }

  void _getTicketOffers(
      TicketGetTicketOffersEvent event, Emitter<TicketState> emit) async {
    late final ticketOffers;
    try {
      ticketOffers = await _ticketUsecase.getTicketOffers();
    } catch (_) {
      showToast('Что то пошло не так. Повторите попытку позже');
    } finally {
      emit(TicketOfferTicketsState(ticketOfferModel: ticketOffers));
    }
  }

  void _getTickets(
      TicketGetTicketsEvent event, Emitter<TicketState> emit) async {
    late final tickets;
    try {
      tickets = await _ticketUsecase.getTicketOffers();
    } catch (_) {
      showToast('Что то пошло не так. Повторите попытку позже');
    } finally {
      emit(TicketTicketsState(ticketModel: tickets));
    }
  }
}
