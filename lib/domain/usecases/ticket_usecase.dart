import 'package:effective_test/data/repositories/local_repo.dart';
import 'package:effective_test/data/repositories/ticket_repo.dart';
import 'package:effective_test/domain/entities/offer_entity.dart';
import 'package:effective_test/domain/entities/ticket_entity.dart';
import 'package:effective_test/domain/entities/ticket_offer_entity.dart';

class TicketUsecase {
  const TicketUsecase({
    required LocalRepo localRepo,
    required TicketRepo ticketRepo,
  })  : _localRepo = localRepo,
        _ticketRepo = ticketRepo;

  final LocalRepo _localRepo;
  final TicketRepo _ticketRepo;

  Future<String> getLastCountryFrom() async {
    return await _localRepo.getLastCountryFrom();
  }

  Future<void> setLastCountryFrom(String countryFrom) async {
    await _localRepo.setLastCountryFrom(countryFrom);
  }

  Future<List<OfferEntity>> getOffers() async {
    final offers = <OfferEntity>[];
    final offersModel = await _ticketRepo.getAllOffers();

    for (var offer in offersModel.offers) {
      offers.add(OfferEntity(
        id: offer.id,
        title: offer.title,
        town: offer.town,
        price: offer.price.value,
      ));
    }

    return offers;
  }

  Future<List<TicketOfferEntity>> getTicketOffers() async {
    final ticketOffers = <TicketOfferEntity>[];
    final ticketOfferModel = await _ticketRepo.getAllTicketOffers();

    for (var ticketOffer in ticketOfferModel.ticketsOffers) {
      ticketOffers.add(TicketOfferEntity(
        id: ticketOffer.id,
        title: ticketOffer.title,
        timeRange: ticketOffer.timeRange,
        price: ticketOffer.price.value,
      ));
    }

    return ticketOffers;
  }

  Future<List<TicketEntity>> getTickets() async {
    final tickets = <TicketEntity>[];
    final ticketModel = await _ticketRepo.getAllTickets();

    for (var ticket in ticketModel.tickets) {
      tickets.add(TicketEntity(
        id: ticket.id,
        price: ticket.price.value,
        departureDate: ticket.departure.date,
        departureAirport: ticket.departure.airport,
        arrivalDate: ticket.arrival.date,
        arrivalAirport: ticket.arrival.airport,
        hasTransfer: ticket.hasTransfer,
        badge: ticket.badge,
      ));
    }

    return tickets;
  }
}
