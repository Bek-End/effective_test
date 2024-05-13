import 'package:effective_test/design/widgets/toast_widget.dart';
import 'package:effective_test/domain/entities/offer_entity.dart';
import 'package:effective_test/domain/entities/ticket_entity.dart';
import 'package:effective_test/domain/entities/ticket_offer_entity.dart';
import 'package:effective_test/domain/usecases/ticket_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc(this._ticketUsecase) : super(TicketLoadingState()) {
    on<TicketInitEvent>(_getOffers);
    on<TicketChangeDepartureDateEvent>(_changeDepartureDate);
    on<TicketGetTicketOffersEvent>(_getTicketOffers);
    on<TicketGetTicketsEvent>(_getTickets);
  }

  final TicketUsecase _ticketUsecase;

  void _getOffers(TicketInitEvent event, Emitter<TicketState> emit) async {
    final offers = <OfferEntity>[];
    String lastCountryFrom = '';

    try {
      offers.addAll(await _ticketUsecase.getOffers());
      lastCountryFrom = await _ticketUsecase.getLastCountryFrom();
    } catch (e, s) {
      print(s);
      showToast('Что то пошло не так. Повторите попытку позже');
    } finally {
      emit(TicketOffersState(offers: offers, lastCountryFrom: lastCountryFrom));
    }
  }

  void _changeDepartureDate(
      TicketChangeDepartureDateEvent event, Emitter<TicketState> emit) {
    final currState = state as TicketOfferTicketsState;
    emit(TicketOfferTicketsState(
      ticketOffers: currState.ticketOffers,
      departureDate: event.date,
    ));
  }

  void _getTicketOffers(
      TicketGetTicketOffersEvent event, Emitter<TicketState> emit) async {
    final ticketOffers = <TicketOfferEntity>[];
    try {
      ticketOffers.addAll(await _ticketUsecase.getTicketOffers());
    } catch (_) {
      showToast('Что то пошло не так. Повторите попытку позже');
    } finally {
      emit(TicketOfferTicketsState(
        ticketOffers: ticketOffers,
        departureDate: DateTime.now(),
      ));
    }
  }

  void _getTickets(
      TicketGetTicketsEvent event, Emitter<TicketState> emit) async {
    final tickets = <TicketEntity>[];
    try {
      tickets.addAll(await _ticketUsecase.getTickets());
    } catch (_) {
      showToast('Что то пошло не так. Повторите попытку позже');
    } finally {
      emit(TicketTicketsState(
        tickets: tickets,
        countryFrom: event.countryFrom,
        countryTo: event.countryTo,
        departureDate: event.departureDate,
      ));
    }
  }
}
