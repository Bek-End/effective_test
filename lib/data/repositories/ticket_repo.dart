import 'package:effective_test/data/models/offer_model.dart';
import 'package:effective_test/data/models/ticket_model.dart';
import 'package:effective_test/data/models/ticket_offer_model.dart';

abstract class TicketRepo {
  Future<OfferModel> getAllOffers();
  Future<TicketOfferModel> getAllTicketOffers();
  Future<TicketModel> getAllTickets();
}
