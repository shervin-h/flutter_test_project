import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/features/feature_countries/data/sources/remote/api_provider.dart';
import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


final dummyCountries = [
  CountryEntity(name: 'Test Name', capital: 'Test Capital', flag: 'Test Flag')
];

class MockApiClient extends Mock implements ApiClient {
  @override
  Future<List<CountryEntity>> getCountries() {
    return Future.value(
      dummyCountries
    );
  }
}



void main() {

  late MockApiClient apiClient;

  setUp(() async {
    apiClient = MockApiClient();
  });

  group(
    'retrofit test - get countries',
    () {
      test(
        'description',
        () async {
          final result = await apiClient.getCountries();
          expect(result, dummyCountries);
        }
      );

    },
  );
}