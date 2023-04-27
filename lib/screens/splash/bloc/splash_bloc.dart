import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/core/usecases/is_online_usecase.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SplashStartedEvent>((event, emit) async {
      emit(SplashLoadingState());
      await IsOnlineUseCase()().then((DataState<bool> dataState) {
        if (dataState is DataSuccess) {
          emit(SplashCompletedState());
        } else if (dataState is DataFailed) {
          emit(SplashErrorState(dataState.error ?? 'خطا'));
        } else {
          emit(SplashInitial());
        }
      });
    });
  }
}
