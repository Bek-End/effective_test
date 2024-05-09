// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      tickets: (json['tickets'] as List<dynamic>)
          .map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'tickets': instance.tickets,
    };

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      id: (json['id'] as num).toInt(),
      price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      providerName: json['providerName'] as String,
      company: json['company'] as String,
      departure: Arrival.fromJson(json['departure'] as Map<String, dynamic>),
      arrival: Arrival.fromJson(json['arrival'] as Map<String, dynamic>),
      hasTransfer: json['hasTransfer'] as bool,
      hasVisaTransfer: json['hasVisaTransfer'] as bool,
      luggage: Luggage.fromJson(json['luggage'] as Map<String, dynamic>),
      handLuggage:
          HandLuggage.fromJson(json['handLuggage'] as Map<String, dynamic>),
      isReturnable: json['isReturnable'] as bool,
      isExchangable: json['isExchangable'] as bool,
      badge: json['badge'] as String?,
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'badge': instance.badge,
      'price': instance.price,
      'providerName': instance.providerName,
      'company': instance.company,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'hasTransfer': instance.hasTransfer,
      'hasVisaTransfer': instance.hasVisaTransfer,
      'luggage': instance.luggage,
      'handLuggage': instance.handLuggage,
      'isReturnable': instance.isReturnable,
      'isExchangable': instance.isExchangable,
    };

Arrival _$ArrivalFromJson(Map<String, dynamic> json) => Arrival(
      town: json['town'] as String,
      date: DateTime.parse(json['date'] as String),
      airport: json['airport'] as String,
    );

Map<String, dynamic> _$ArrivalToJson(Arrival instance) => <String, dynamic>{
      'town': instance.town,
      'date': instance.date.toIso8601String(),
      'airport': instance.airport,
    };

HandLuggage _$HandLuggageFromJson(Map<String, dynamic> json) => HandLuggage(
      hasHandLuggage: json['hasHandLuggage'] as bool,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$HandLuggageToJson(HandLuggage instance) =>
    <String, dynamic>{
      'hasHandLuggage': instance.hasHandLuggage,
      'size': instance.size,
    };

Luggage _$LuggageFromJson(Map<String, dynamic> json) => Luggage(
      hasLuggage: json['hasLuggage'] as bool,
      price: json['price'] == null
          ? null
          : PriceModel.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LuggageToJson(Luggage instance) => <String, dynamic>{
      'hasLuggage': instance.hasLuggage,
      'price': instance.price,
    };
