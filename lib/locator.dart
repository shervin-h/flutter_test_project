
import 'dart:convert';

import 'package:flutter_test_project/config/app_settings/app_settings_cubit.dart';
import 'package:flutter_test_project/features/feature_auth/data/repositories/user_repository_impl.dart';
import 'package:flutter_test_project/features/feature_auth/domain/repositories/user_repository.dart';
import 'package:flutter_test_project/features/feature_countries/data/repositories/country_repository_impl.dart';
import 'package:flutter_test_project/features/feature_countries/data/sources/remote/api_provider.dart';
import 'package:flutter_test_project/features/feature_countries/domain/repositories/country_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_test_project/screens/splash/bloc/splash_bloc.dart';
import 'package:flutter_test_project/features/feature_auth/presentation/bloc/login_bloc.dart';
import 'package:flutter_test_project/features/feature_countries/presentation/bloc/countries_bloc.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


final getIt = GetIt.instance;

void setup() {

  /// remote api or local data source
  final dio = Dio(BaseOptions(contentType: "application/json"))
    ..interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          if (response.requestOptions.method == HttpMethod.GET) {
            response.data = jsonDecode(response.data as String);
          }
          return handler.next(response);
        },
      ),
    );

  getIt.registerSingleton<Dio>(dio);
  final client = ApiClient(getIt.get<Dio>());
  getIt.registerSingleton<ApiClient>(client);

  /// repositories
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
  getIt.registerSingleton<CountryRepository>(CountryRepositoryImpl());

  /// bloc
  getIt.registerSingleton<AppSettingsCubit>(AppSettingsCubit());
  getIt.registerSingleton<SplashBloc>(SplashBloc());
  getIt.registerSingleton<LoginBloc>(LoginBloc());
  getIt.registerSingleton<CountriesBloc>(CountriesBloc());
}