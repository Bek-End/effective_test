// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOfferModel _$TicketOfferModelFromJson(Map<String, dynamic> json) =>
    TicketOfferModel(
      ticketsOffers: (json['ticketsOffers'] as List<dynamic>)
          .map((e) => TicketsOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketOfferModelToJson(TicketOfferModel instance) =>
    <String, dynamic>{
      'ticketsOffers': instance.ticketsOffers,
    };

TicketsOffer _$TicketsOfferFromJson(Map<String, dynamic> json) => TicketsOffer(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      timeRange:
          (json['timeRange'] as List<dynamic>).map((e) => e as String).toList(),
      price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketsOfferToJson(TicketsOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'timeRange': instance.timeRange,
      'price': instance.price,
    };
