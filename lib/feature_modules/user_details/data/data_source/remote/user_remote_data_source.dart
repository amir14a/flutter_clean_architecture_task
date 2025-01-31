import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';

abstract class UserRemoteDataSource {
  Future<bool> saveUserDetails({required String endpoint, required UserDto userDto});

  Future<UserDto> fetchUserDetails({required String endpoint});
}
