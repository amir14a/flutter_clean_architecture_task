import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter_clean_architecture_task/common/consts/app_consts.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/data_source/local/user_encrypt_shared_preferences_data_source.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'mock_encrypted_shared_preferences.dart';

void main() {
  late EncryptedSharedPreferencesAsync mockSharedPreferences;
  late UserEncryptSharedPreferencesDataSource userEncryptSharedPreferencesDataSource;
  setUp(() {
    mockSharedPreferences = MockEncryptedSharedPreferencesAsync();
    userEncryptSharedPreferencesDataSource = UserEncryptSharedPreferencesDataSource(mockSharedPreferences);
  });
  group('UserEncryptSharedPreferencesDataSource tests:', () {
    test('Data source should return default userDto when local source is empty', () async {
      final defaultUserDto = UserDto(name: DEFAULT_USER_NAME, email: DEFAULT_USER_EMAIL);
      // Mock return null value:
      when(() => mockSharedPreferences.getString(SHARED_PREFERENCES_USER_DTO_KEY)).thenAnswer((_) async => null);

      final result = await userEncryptSharedPreferencesDataSource.fetchUserDto();
      expect(result, defaultUserDto);
    });
    test('Data source should correctly convert userDto raw json to a userDto instance and return it', () async {
      final testUserDtoRawJson = '{"name":"amir", "email": "a@a.com", "phone":"9893000000000"}';
      final testUserDto = UserDto(name: "amir", email: "a@a.com", phone: "9893000000000");

      // Mock return raw json:
      when(() => mockSharedPreferences.getString(SHARED_PREFERENCES_USER_DTO_KEY))
          .thenAnswer((_) async => testUserDtoRawJson);

      final result = await userEncryptSharedPreferencesDataSource.fetchUserDto();
      expect(result, testUserDto);
    });
  });
}
