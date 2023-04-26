
import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/features/feature_auth/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> fetchUsersData({required String path});
}