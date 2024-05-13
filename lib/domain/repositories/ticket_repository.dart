import 'package:effective_test/data/models/offer_model.dart';
import 'package:effective_test/data/models/ticket_model.dart';
import 'package:effective_test/data/models/ticket_offer_model.dart';
import 'package:effective_test/data/repositories/ticket_repo.dart';

class TicketRepository implements TicketRepo {
  static final TicketRepository _instance = TicketRepository._();
  factory TicketRepository() => _instance;
  TicketRepository._();

  @override
  Future<OfferModel> getAllOffers() {
    // TODO: implement getAllOffers
    throw UnimplementedError();
  }

  @override
  Future<TicketOfferModel> getAllTicketOffers() {
    // TODO: implement getAllTicketOffers
    throw UnimplementedError();
  }

  @override
  Future<TicketModel> getAllTickets() {
    // TODO: implement getAllTickets
    throw UnimplementedError();
  }
}
