import 'dart:convert';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/screens/splash/bloc/splash_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance;
  getIt.registerSingleton<Dio>(Dio());

  group(
    'splash screen started event test',
    () {
      blocTest<SplashBloc, SplashState>(
        'emit SplashLoadingState and SplashCompletedState',
        build: () => SplashBloc(),
        act: (splashBloc) {
          splashBloc.add(SplashStartedEvent());
        },
        expect: () => <SplashState>[
          SplashLoadingState(),
          SplashCompletedState(),
        ]
      );
    }
  );
}