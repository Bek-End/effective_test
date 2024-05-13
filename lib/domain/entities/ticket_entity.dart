import 'package:equatable/equatable.dart';

class TicketEntity extends Equatable {
  const TicketEntity({
    required this.id,
    required this.price,
    required this.departureDate,
    required this.departureAirport,
    required this.arrivalDate,
    required this.arrivalAirport,
    required this.hasTransfer,
    required this.badge,
  });

  final int id;
  final int price;
  final DateTime departureDate;
  final String departureAirport;
  final DateTime arrivalDate;
  final String arrivalAirport;
  final bool hasTransfer;
  final String? badge;

  @override
  List<Object?> get props => [
        id,
        price,
        departureDate,
        departureAirport,
        arrivalDate,
        arrivalAirport,
        hasTransfer,
        badge,
      ];
}
