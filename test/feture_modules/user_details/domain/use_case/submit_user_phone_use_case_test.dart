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
    test('Use case execute should return true when passed an Iranian number', () async {
      const userPhone = '989300000000';

      // Prepare mock response using mocktail
      when(() => mockUserRepository.submitUserPhone(userPhone: userPhone)).thenAnswer((_) async => true);

      final result = await submitUserPhoneUseCase.execute(userPhone: userPhone);
      expect(result, true);
    });
  });
}
