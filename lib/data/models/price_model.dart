import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel extends Equatable {
  const PriceModel({required this.value});

  final int value;

  @override
  List<Object?> get props => [value];

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceModelToJson(this);
}
