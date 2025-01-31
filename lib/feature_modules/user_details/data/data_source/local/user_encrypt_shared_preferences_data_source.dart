import 'dart:convert';

import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter_clean_architecture_task/common/consts/app_consts.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/data_source/local/user_local_data_source.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';

class UserEncryptSharedPreferencesDataSource implements UserLocalDataSource {
  late final EncryptedSharedPreferencesAsync _sharedPreferences;

  UserEncryptSharedPreferencesDataSource(this._sharedPreferences);

  @override
  Future<UserDto> fetchUserDto() async {
    String? userDtoJson = await _sharedPreferences.getString(SHARED_PREFERENCES_USER_DTO_KEY);
    if (userDtoJson != null) {
      return UserDto.fromMap(jsonDecode(userDtoJson));
    } else {
      const defaultUserDto = UserDto(name: DEFAULT_USER_NAME, email: DEFAULT_USER_EMAIL);
      return defaultUserDto;
    }
  }

  @override
  Future<bool> saveUserDto({required UserDto userDto}) {
    String userDtoJson = jsonEncode(userDto.toMap());
    return _sharedPreferences.setString(SHARED_PREFERENCES_USER_DTO_KEY, userDtoJson);
  }
}
