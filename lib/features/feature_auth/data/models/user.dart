import 'package:flutter_test_project/features/feature_auth/domain/entities/user_entity.dart';

class User extends UserEntity {
  User({
    required String username,
    required String email,
    required String state,
  }) : super(
          userName: username,
          email: email,
          state: state,
        );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(username: json['username'], email: json['email'], state: json['state']);
  }
}
