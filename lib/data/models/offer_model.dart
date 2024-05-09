import 'package:effective_test/data/models/price_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_model.g.dart';

@JsonSerializable()
class OfferModel extends Equatable {
  const OfferModel({
    required this.offers,
  });

  final List<Offer> offers;

  @override
  List<Object?> get props => [offers];

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
}

@JsonSerializable()
class Offer extends Equatable {
  const Offer({
    required this.id,
    required this.title,
    required this.town,
    required this.price,
  });

  final int id;
  final String title;
  final String town;
  final PriceModel price;

  @override
  List<Object?> get props => [id, title, town, price];

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);
}
