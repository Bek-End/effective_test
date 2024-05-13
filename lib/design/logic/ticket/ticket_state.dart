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
    required this.departureDate,
  });

  final List<TicketOfferEntity> ticketOffers;
  final DateTime departureDate;

  @override
  List<Object> get props => [...super.props, ticketOffers, departureDate];
}

final class TicketTicketsState extends TicketState {
  const TicketTicketsState({
    required this.tickets,
    required this.countryFrom,
    required this.countryTo,
    required this.departureDate,
  });

  final List<TicketEntity> tickets;
  final String countryFrom;
  final String countryTo;
  final DateTime departureDate;

  @override
  List<Object> get props => [...super.props, tickets, countryFrom, countryTo];
}
