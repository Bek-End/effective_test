import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  const OfferEntity({
    required this.id,
    required this.title,
    required this.town,
    required this.price,
  });

  final int id;
  final String title;
  final String town;
  final int price;

  @override
  List<Object?> get props => [id, title, town, price];
}
