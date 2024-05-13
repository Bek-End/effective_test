part of 'ticket_bloc.dart';

sealed class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

final class TicketInitEvent extends TicketEvent {}

final class TicketGetTicketOffersEvent extends TicketEvent {}

final class TicketGetTicketsEvent extends TicketEvent {}
