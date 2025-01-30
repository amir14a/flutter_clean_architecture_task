import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/entity/user_entity.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/repository/user_repository.dart';

class GetUserInfoUseCase {
  final UserRepository userRepository;

  GetUserInfoUseCase(this.userRepository);

  Future<UserEntity> execute() async {
    return await userRepository.getUserInfo();
  }
}
