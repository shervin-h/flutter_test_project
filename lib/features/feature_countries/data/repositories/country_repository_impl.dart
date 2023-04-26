
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/features/feature_countries/data/sources/remote/api_provider.dart';
import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';
import 'package:flutter_test_project/features/feature_countries/domain/repositories/country_repository.dart';
import 'package:flutter_test_project/locator.dart';

class CountryRepositoryImpl extends CountryRepository {

  final client = getIt.get<ApiClient>();

  @override
  Future<DataState<List<CountryEntity>>> getCountriesData() async {
    try {
      List<CountryEntity> countries = await client.getCountries();
      return DataSuccess(countries);
    } catch (e) {
      debugPrint(e.toString());
      return const DataFailed('خطا');
    }
  }

}