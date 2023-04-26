
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/features/feature_auth/data/repositories/user_repository_impl.dart';
import 'package:flutter_test_project/features/feature_auth/domain/entities/user_entity.dart';
import 'package:flutter_test_project/features/feature_auth/domain/repositories/user_repository.dart';
import 'package:flutter_test_project/features/feature_auth/domain/usecases/check_email_use_case.dart';
import 'package:flutter_test_project/features/feature_auth/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_bloc_test.mocks.dart';

@GenerateMocks([CheckEmailUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance;
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());

  group(
    'login button pressed event test',
    () {
      // when(MockCheckEmailUseCase().call(any)).thenAnswer((_) async {return Future.value(DataSuccess(UserEntity(userName: '', email: '', state: '')));});

      blocTest(
          'emit LoginLoadingState and LoginCompletedState',
          build: () => LoginBloc(),
          act: (loginBloc) {
            loginBloc.add(LoginButtonPressedEvent('milad@gmail.com', 'Fdf@45djdosi'));
          },
          expect: () => <LoginState>[
            LoginLoadingState(),
            LoginCompletedState(),
          ]
      );

      blocTest(
          'emit LoginLoadingState and LoginErrorState',
          build: () => LoginBloc(),
          act: (loginBloc) {
            loginBloc.add(LoginButtonPressedEvent('shervin.hz07@gmail.com', '12345678'));
          },
          expect: () => <LoginState>[
            LoginLoadingState(),
            LoginErrorState('خطا'),
          ]
      );

      blocTest(
          'emit LoginLoadingState and LoginErrorState',
          build: () => LoginBloc(),
          act: (loginBloc) {
            loginBloc.add(LoginButtonPressedEvent('sara@gmail.com', 'jkkU#12hfj'));
          },
          expect: () => <LoginState>[
            LoginLoadingState(),
            LoginErrorState('کاربر اجازه ورود ندارد'),
          ]
      );
    },
  );
}