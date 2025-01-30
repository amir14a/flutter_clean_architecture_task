import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/repository/user_repository.dart';

class SubmitUserPhoneUseCase {
  final UserRepository userRepository;

  SubmitUserPhoneUseCase(this.userRepository);

  Future<bool> execute({required String userPhone}) async {
    return await userRepository.submitUserPhone(userPhone: userPhone);
  }
}
