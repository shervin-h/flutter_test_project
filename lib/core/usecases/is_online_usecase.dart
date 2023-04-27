import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/core/usecases/use_case.dart';
import 'package:flutter_test_project/locator.dart';
import 'package:dio/dio.dart';


class IsOnlineUseCase extends NoParamUseCase<bool> {
  final dio = getIt.get<Dio>();
  @override
  Future<DataState<bool>> call() async {
    try {
      Response response = await dio.head('https://www.google.com/');
      if (response.statusCode == 200) {
        return const DataSuccess(true);
      } else {
        return const DataFailed('لطفاً اتصال اینترنت را بررسی کنید');
      }
    } catch (e) {
      debugPrint(e.toString());
      return const DataFailed('خطا! لطفاً اتصال اینترنت را بررسی کنید');
    }
  }
}