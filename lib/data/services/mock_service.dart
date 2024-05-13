import 'package:dio/dio.dart';
import 'package:effective_test/data/models/offer_model.dart';
import 'package:effective_test/data/models/ticket_model.dart';
import 'package:effective_test/data/models/ticket_offer_model.dart';
import 'package:retrofit/retrofit.dart';

part 'mock_service.g.dart';

Dio? _dio;

@RestApi(baseUrl: 'https://run.mocky.io/v3')
abstract class MockService {
  factory MockService() => _MockService(_dio ??= Dio(BaseOptions()));

  @GET('/00727197-24ae-48a0-bcb3-63eb35d7a9de')
  Future<OfferModel> getAllOffers();

  @GET('/3424132d-a51a-4613-b6c9-42b2d214f35f')
  Future<TicketOfferModel> getAllTicketOffers();

  @GET('/2dbc0999-86bf-4c08-8671-bac4b7a5f7eb')
  Future<TicketModel> getAllTickets();
}
