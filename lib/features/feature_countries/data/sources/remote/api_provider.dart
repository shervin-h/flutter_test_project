import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_provider.g.dart';

@RestApi(baseUrl: 'https://raw.githubusercontent.com/esmaeil-ahmadipour/restcountries/main/json/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('countriesV2.json')
  Future<List<CountryEntity>> getCountries();
}