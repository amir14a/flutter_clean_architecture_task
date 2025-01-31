import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUserDetails();

  Future<bool> submitUserPhone({required String userPhone});
}
