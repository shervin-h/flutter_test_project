part of 'countries_bloc.dart';

@immutable
abstract class CountriesState extends Equatable {}

class CountriesInitial extends CountriesState {
  @override
  List<Object?> get props => [];
}

class LoadingAllCountriesState extends CountriesState {
  @override
  List<Object?> get props => [];
}

class LoadAllCountriesCompletedState extends CountriesState {
  final List<CountryEntity> countries;
  LoadAllCountriesCompletedState(this.countries);

  @override
  List<Object?> get props => [countries];
}

class LoadAllCountriesErrorState extends CountriesState {
  final String errorMessage;
  LoadAllCountriesErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
