import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/entity/user_entity.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/repository/user_repository.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/use_case/get_user_info_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../repository/mock_user_repository.dart';

void main() {
  late UserRepository mockUserRepository;
  late GetUserInfoUseCase getUserInfoUseCase;
  setUp(() {
    mockUserRepository = MockUserRepository();
    getUserInfoUseCase = GetUserInfoUseCase(mockUserRepository);
  });
  group('GetUserInfoUseCase tests:', () {
    test('Use case execute should return correct user entity', () async {
      final userEntity = UserEntity(name: 'Amir', email: 'a@a.com', phone: '989300000000');

      // Prepare mock response using mocktail
      when(() => mockUserRepository.getUserInfo()).thenAnswer((_) async => userEntity);

      final result = await getUserInfoUseCase.execute();
      expect(result, userEntity);
    });
  });
}
