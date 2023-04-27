import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/core/usecases/is_online_usecase.dart';
import 'package:flutter_test_project/locator.dart';
import 'package:dio/dio.dart';

void main() {
  group(
    'isOnline test',
    () {
      getIt.registerSingleton<Dio>(Dio());

      // ensure that device is connect to internet
      test(
        'should be return `DataSuccess`',
        () async {
          DataState result = await IsOnlineUseCase()();

          expect(result.runtimeType, DataSuccess<bool>);
        },
      );
    },
  );
}