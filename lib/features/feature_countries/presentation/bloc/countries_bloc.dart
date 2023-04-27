import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/features/feature_countries/domain/usecases/fetch_countries_from_api_use_case.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/country_entity.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc() : super(CountriesInitial()) {
    on<CountriesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadAllCountriesEvent>((event, emit) async {
      emit(LoadingAllCountriesState());
      final DataState<List<CountryEntity>> dataState = await FetchCountriesFromApiUseCase()();
      if (dataState is DataSuccess && dataState.data != null) {
        emit(LoadAllCountriesCompletedState(dataState.data!));
      } else if (dataState is DataFailed) {
        emit(LoadAllCountriesErrorState(dataState.error ?? 'خطا'));
      } else {
        emit(CountriesInitial());
      }
    });
  }
}
