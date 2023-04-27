import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/core/usecases/use_case.dart';
import 'package:flutter_test_project/features/feature_auth/domain/entities/user_entity.dart';
import 'package:flutter_test_project/features/feature_auth/domain/repositories/user_repository.dart';
import 'package:flutter_test_project/locator.dart';

class CheckEmailUseCase extends OneParamUseCase<UserEntity, String> {

  final userRepository = getIt.get<UserRepository>();

  @override
  Future<DataState<UserEntity>> call(String param) async {  // param is email
    DataState<List<UserEntity>> dataState = await userRepository.fetchUsersData(path: 'assets/users.json');
    if (dataState is DataSuccess && dataState.data != null && dataState.data!.isNotEmpty) {
      for (UserEntity user in dataState.data!) {
        if (user.email == param && user.state == 'enable') {
          return DataSuccess(user);
        }
        if (user.email == param && user.state == 'disable') {
          return const DataFailed('کاربر اجازه ورود ندارد');
        }
      }
      return const DataFailed('کاربر ثبت نشده است');
    } else {
      return const DataFailed('خطا');
    }
  }

}