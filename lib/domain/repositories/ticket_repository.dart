import 'package:effective_test/data/models/offer_model.dart';
import 'package:effective_test/data/models/ticket_model.dart';
import 'package:effective_test/data/models/ticket_offer_model.dart';
import 'package:effective_test/data/repositories/ticket_repo.dart';
import 'package:effective_test/data/services/mock_service.dart';

class TicketRepository implements TicketRepo {
  const TicketRepository(this._service);

  final MockService _service;

  @override
  Future<OfferModel> getAllOffers() async {
    return await _service.getAllOffers();
  }

  @override
  Future<TicketOfferModel> getAllTicketOffers() async {
    return await _service.getAllTicketOffers();
  }

  @override
  Future<TicketModel> getAllTickets() async {
    return await _service.getAllTickets();
  }
}
