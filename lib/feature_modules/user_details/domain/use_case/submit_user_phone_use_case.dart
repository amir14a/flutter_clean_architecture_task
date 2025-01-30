import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/exception/invalid_iranian_phone_exception.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/repository/user_repository.dart';

class SubmitUserPhoneUseCase {
  final UserRepository userRepository;

  SubmitUserPhoneUseCase(this.userRepository);

  Future<bool> execute({required String userPhone}) async {
    //Because "allowing just iranian numbers" is part of our business logic, I check it here in use case:
    if (!isValidIranianPhoneNumber(userPhone)) {
      throw InvalidIranianPhoneException();
    }
    return await userRepository.submitUserPhone(userPhone: userPhone);
  }

  bool isValidIranianPhoneNumber(String phoneNumber) {
    final regex = RegExp(r'^(\+989\d{9}|989\d{9}|09\d{9})$');
    return regex.hasMatch(phoneNumber);
  }
}
