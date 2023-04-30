import 'package:flutter_test_project/core/resources/data_state.dart';
import 'package:flutter_test_project/features/feature_auth/data/sources/local/DbProvider.dart';
import 'package:flutter_test_project/features/feature_auth/domain/entities/user_entity.dart';
import 'package:flutter_test_project/features/feature_auth/domain/repositories/user_repository.dart';


/// The repository decides that to load users data from the local database or from the server.
class UserRepositoryImpl extends UserRepository {
  @override
  Future<DataState<List<UserEntity>>> fetchUsersData({required String path}) async {
    /// In this example, we load data from a json file, which we consider as a local database
    return DbProvider().fetchUsersData(path: path);
  }
}