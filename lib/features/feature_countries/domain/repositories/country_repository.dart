import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';

abstract class CountryRepository {
  Future<DataState<List<CountryEntity>>> getCountriesData();
}