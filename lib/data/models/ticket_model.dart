import 'package:effective_test/data/models/price_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_model.g.dart';

@JsonSerializable()
class TicketModel extends Equatable {
  const TicketModel({required this.tickets});

  final List<Ticket> tickets;

  @override
  List<Object?> get props => [tickets];

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}

@JsonSerializable()
class Ticket extends Equatable {
  const Ticket({
    required this.id,
    required this.price,
    required this.providerName,
    required this.company,
    required this.departure,
    required this.arrival,
    required this.hasTransfer,
    required this.hasVisaTransfer,
    required this.luggage,
    required this.handLuggage,
    required this.isReturnable,
    required this.isExchangable,
    this.badge,
  });

  final int id;
  final String? badge;
  final PriceModel price;
  final String providerName;
  final String company;
  final Arrival departure;
  final Arrival arrival;
  final bool hasTransfer;
  final bool hasVisaTransfer;
  final Luggage luggage;
  final HandLuggage handLuggage;
  final bool isReturnable;
  final bool isExchangable;

  @override
  List<Object?> get props => [
        id,
        badge,
        price,
        providerName,
        company,
        departure,
        arrival,
        hasTransfer,
        hasVisaTransfer,
        luggage,
        handLuggage,
        isReturnable,
        isExchangable,
      ];

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);
}

@JsonSerializable()
class Arrival extends Equatable {
  const Arrival({
    required this.town,
    required this.date,
    required this.airport,
  });

  final String town;
  final DateTime date;
  final String airport;

  @override
  List<Object?> get props => [town, date, airport];

  factory Arrival.fromJson(Map<String, dynamic> json) =>
      _$ArrivalFromJson(json);

  Map<String, dynamic> toJson() => _$ArrivalToJson(this);
}

@JsonSerializable()
class HandLuggage extends Equatable {
  const HandLuggage({
    required this.hasHandLuggage,
    this.size,
  });

  final bool hasHandLuggage;
  final String? size;

  @override
  List<Object?> get props => [hasHandLuggage, size];

  factory HandLuggage.fromJson(Map<String, dynamic> json) =>
      _$HandLuggageFromJson(json);

  Map<String, dynamic> toJson() => _$HandLuggageToJson(this);
}

@JsonSerializable()
class Luggage extends Equatable {
  const Luggage({
    required this.hasLuggage,
    this.price,
  });

  final bool hasLuggage;
  final PriceModel? price;

  @override
  List<Object?> get props => [hasLuggage, price];

  factory Luggage.fromJson(Map<String, dynamic> json) =>
      _$LuggageFromJson(json);

  Map<String, dynamic> toJson() => _$LuggageToJson(this);
}
