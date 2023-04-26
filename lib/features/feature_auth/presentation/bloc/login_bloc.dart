import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/features/feature_auth/domain/usecases/check_email_use_case.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/user_entity.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      await Future.delayed(const Duration(seconds: 3));
      DataState<UserEntity> dataState = await CheckEmailUseCase()(event.email);
      if (dataState is DataSuccess && dataState.data != null) {
        emit(LoginCompletedState());
      } else if (dataState is DataFailed && dataState.error != null) {
        emit(LoginErrorState(dataState.error!));
      } else {
        emit(LoginInitial());
      }
    });
  }
}
