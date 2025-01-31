import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';

abstract class UserLocalDataSource {
  Future<bool> saveUserDto({required UserDto userDto});

  Future<UserDto> fetchUserDto();
}
