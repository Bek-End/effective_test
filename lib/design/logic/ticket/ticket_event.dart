part of 'ticket_bloc.dart';

sealed class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

final class TicketInitEvent extends TicketEvent {}

final class TicketGetTicketOffersEvent extends TicketEvent {}

final class TicketChangeDepartureDateEvent extends TicketEvent {
  const TicketChangeDepartureDateEvent(this.date);

  final DateTime date;

  @override
  List<Object> get props => [...super.props, date];
}

final class TicketGetTicketsEvent extends TicketEvent {
  const TicketGetTicketsEvent({
    required this.countryFrom,
    required this.countryTo,
    required this.departureDate,
  });

  final String countryFrom;
  final String countryTo;
  final DateTime departureDate;

  @override
  List<Object> get props => [
        ...super.props,
        countryFrom,
        countryTo,
        departureDate,
      ];
}
