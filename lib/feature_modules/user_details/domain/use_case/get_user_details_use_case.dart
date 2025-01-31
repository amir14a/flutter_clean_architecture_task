import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/entity/user_entity.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/repository/user_repository.dart';

class GetUserDetailsUseCase {
  final UserRepository userRepository;

  GetUserDetailsUseCase(this.userRepository);

  Future<UserEntity> execute() async {
    return await userRepository.getUserDetails();
  }
}
