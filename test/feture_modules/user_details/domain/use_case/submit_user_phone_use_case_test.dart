import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/exception/invalid_iranian_phone_exception.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/repository/user_repository.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/use_case/submit_user_phone_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../repository/mock_user_repository.dart';

void main() {
  late UserRepository mockUserRepository;
  late SubmitUserPhoneUseCase submitUserPhoneUseCase;
  setUp(() {
    mockUserRepository = MockUserRepository();
    submitUserPhoneUseCase = SubmitUserPhoneUseCase(mockUserRepository);
  });
  group('SubmitUserPhoneUseCase tests:', () {
    test('Use case execute should return true when we passed an Iranian number', () async {
      const userPhone = '09300000000';

      // Prepare mock response using mocktail
      when(() => mockUserRepository.submitUserPhone(userPhone: userPhone)).thenAnswer((_) async => true);

      final result = await submitUserPhoneUseCase.execute(userPhone: userPhone);
      expect(result, true);
    });
    test('Use case execute should throw InvalidIranianPhoneException when we passed invalid number', () async {
      const invalidNumber1 = '129300000000';
      const invalidNumber2 = '9893000000';
      const invalidNumber3 = '981300000000';
      expect(() => submitUserPhoneUseCase.execute(userPhone: invalidNumber1),
          throwsA(isA<InvalidIranianPhoneException>()));
      expect(() => submitUserPhoneUseCase.execute(userPhone: invalidNumber2),
          throwsA(isA<InvalidIranianPhoneException>()));
      expect(() => submitUserPhoneUseCase.execute(userPhone: invalidNumber3),
          throwsA(isA<InvalidIranianPhoneException>()));
    });
  });
}
