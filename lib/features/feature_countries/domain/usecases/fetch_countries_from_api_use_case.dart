import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/core/usecases/use_case.dart';
import 'package:flutter_test_project/features/feature_countries/domain/entities/country_entity.dart';
import 'package:flutter_test_project/features/feature_countries/domain/repositories/country_repository.dart';
import 'package:flutter_test_project/locator.dart';

class FetchCountriesFromApiUseCase extends NoParamUseCase<List<CountryEntity>> {

  final countryRepository = getIt<CountryRepository>();

  @override
  Future<DataState<List<CountryEntity>>> call() async {
    try {
      return await countryRepository.getCountriesData();
    } catch (e) {
      debugPrint(e.toString());
      return const DataFailed('خطا');
    }
  }

}