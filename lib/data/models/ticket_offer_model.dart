import 'package:effective_test/data/models/price_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_offer_model.g.dart';

@JsonSerializable()
class TicketOfferModel extends Equatable {
  const TicketOfferModel({required this.ticketsOffers});

  final List<TicketsOffer> ticketsOffers;

  @override
  List<Object?> get props => [ticketsOffers];

  factory TicketOfferModel.fromJson(Map<String, dynamic> json) =>
      _$TicketOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketOfferModelToJson(this);
}

@JsonSerializable()
class TicketsOffer extends Equatable {
  const TicketsOffer({
    required this.id,
    required this.title,
    required this.timeRange,
    required this.price,
  });

  final int id;
  final String title;
  final List<String> timeRange;
  final PriceModel price;

  @override
  List<Object?> get props => [id, title, timeRange, price];

  factory TicketsOffer.fromJson(Map<String, dynamic> json) =>
      _$TicketsOfferFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsOfferToJson(this);
}
