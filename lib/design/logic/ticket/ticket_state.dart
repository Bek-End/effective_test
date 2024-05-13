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
    required this.offerModel,
    required this.lastCountryFrom,
  });

  final OfferModel offerModel;
  final String lastCountryFrom;

  @override
  List<Object> get props => [...super.props, offerModel, lastCountryFrom];
}

final class TicketOfferTicketsState extends TicketState {
  const TicketOfferTicketsState({
    required this.ticketOfferModel,
  });

  final TicketOfferModel ticketOfferModel;

  @override
  List<Object> get props => [...super.props, ticketOfferModel];
}

final class TicketTicketsState extends TicketState {
  const TicketTicketsState({
    required this.ticketModel,
  });

  final TicketModel ticketModel;

  @override
  List<Object> get props => [...super.props, ticketModel];
}
