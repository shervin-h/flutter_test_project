
import 'package:flutter_test_project/features/feature_auth/data/repositories/user_repository_impl.dart';
import 'package:flutter_test_project/features/feature_auth/domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_test_project/screens/splash/bloc/splash_bloc.dart';
import 'package:flutter_test_project/features/feature_auth/presentation/bloc/login_bloc.dart';
import 'package:flutter_test_project/features/feature_countries/presentation/bloc/countries_bloc.dart';


final getIt = GetIt.instance;

void setup() {

  /// remote api or local data source

  /// repositories
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());

  /// bloc
  getIt.registerSingleton<SplashBloc>(SplashBloc());
  getIt.registerSingleton<LoginBloc>(LoginBloc());
  getIt.registerSingleton<CountriesBloc>(CountriesBloc());
}