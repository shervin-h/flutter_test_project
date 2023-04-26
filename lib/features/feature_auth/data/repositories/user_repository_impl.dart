import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/core/utils/read_json_file_helper.dart';
import 'package:flutter_test_project/features/feature_auth/data/models/user.dart';
import 'package:flutter_test_project/features/feature_auth/domain/entities/user_entity.dart';
import 'package:flutter_test_project/features/feature_auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<DataState<List<UserEntity>>> fetchUsersData({required String path}) async {
    try {
      final usersData = await readJson(path: path);
      if (usersData != null && usersData is List) {
        List<UserEntity> users = [];
        for (var user in usersData) {
          users.add(User.fromJson(user));
        }
        return DataSuccess(users);
      } else {
        return const DataFailed('خطا!');
      }
    } catch (e) {
      debugPrint(e.toString());
      return const DataFailed('خطا!');
    }
  }

}