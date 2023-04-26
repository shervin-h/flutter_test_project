part of 'countries_bloc.dart';

@immutable
abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class LoadingAllCountriesState extends CountriesState {}

class LoadAllCountriesCompletedState extends CountriesState {
  final List<CountryEntity> countries;
  LoadAllCountriesCompletedState(this.countries);
}

class LoadAllCountriesErrorState extends CountriesState {
  final String errorMessage;
  LoadAllCountriesErrorState(this.errorMessage);
}
