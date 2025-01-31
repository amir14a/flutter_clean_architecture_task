import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/mapper/user_mapper.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/entity/user_entity.dart';
import 'package:test/test.dart';

main() {
  group('UserMapper tests:', () {
    test('UserDto should correctly map to UserEntity when "toUserEntity" is called', () {
      final userDto = UserDto(name: 'Amir', email: 'a@a.com', phone: '989300000000');
      final userEntity = UserEntity(name: 'Amir', email: 'a@a.com', phone: '989300000000');
      expect(userDto.toUserEntity(), userEntity);
    });
    test('UserEntity should correctly map to UserDto when "toUserDto" is called', () {
      final userDto = UserDto(name: 'Amir', email: 'a@a.com', phone: '989300000000');
      final userEntity = UserEntity(name: 'Amir', email: 'a@a.com', phone: '989300000000');
      expect(userEntity.toUserDto(), userDto);
    });
  });
}
