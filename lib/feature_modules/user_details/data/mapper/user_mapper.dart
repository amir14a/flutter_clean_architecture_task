import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/entity/user_entity.dart';

extension UserEntityMappers on UserEntity {
  UserDto toUserDto() {
    return UserDto(
      name: name,
      email: email,
      phone: phone,
    );
  }
}

extension UserDtoMappers on UserDto {
  UserEntity toUserEntity() {
    return UserEntity(
      name: name,
      email: email,
      phone: phone,
    );
  }
}
