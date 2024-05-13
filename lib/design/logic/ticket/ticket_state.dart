part of 'ticket_bloc.dart';

sealed class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object> get props => [];
}

final class TicketFailedState extends TicketState {}

final class TicketLoadingState extends TicketState {}

final class TicketOffersState extends TicketState {
  const TicketOffersState({
    required this.offers,
    required this.lastCountryFrom,
  });

  final List<OfferEntity> offers;
  final String lastCountryFrom;

  @override
  List<Object> get props => [...super.props, offers, lastCountryFrom];
}

final class TicketOfferTicketsState extends TicketState {
  const TicketOfferTicketsState({
    required this.ticketOffers,
  });

  final List<TicketOfferEntity> ticketOffers;

  @override
  List<Object> get props => [...super.props, ticketOffers];
}

final class TicketTicketsState extends TicketState {
  const TicketTicketsState({
    required this.tickets,
  });

  final List<TicketEntity> tickets;

  @override
  List<Object> get props => [...super.props, tickets];
}
