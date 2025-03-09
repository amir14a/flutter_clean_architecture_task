import 'package:flutter_clean_architecture_task/common/strings/app_strings_en.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/entity/user_entity.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/cubit/user_details_page_cubit.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/cubit/user_details_page_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../domain/use_case/mock_get_user_details_use_case.dart';
import '../../domain/use_case/mock_submit_user_phone_use_case.dart';

void main() {
  late MockGetUserDetailsUseCase mockGetUserDetailsUseCase;
  late MockSubmitUserPhoneUseCase mockSubmitUserPhoneUseCase;
  late UserDetailsPageCubit userDetailsPageCubit;
  late UserEntity testUserEntity;
  setUp(() {
    mockGetUserDetailsUseCase = MockGetUserDetailsUseCase();
    mockSubmitUserPhoneUseCase = MockSubmitUserPhoneUseCase();
    userDetailsPageCubit = UserDetailsPageCubit(
      getUserDetailsUseCase: mockGetUserDetailsUseCase,
      submitUserPhoneUseCase: mockSubmitUserPhoneUseCase,
    );
    testUserEntity = UserEntity(name: 'Amir', email: 'a@a.com', phone: '989300000000');
  });
  group('UserDetailsPageCubit tests:', () {
    test('Initial state should be UserDetailsInitialState', () {
      expect(userDetailsPageCubit.state, isA<UserDetailsInitialState>());
    });

    test('Should emit Loaded state when loading is success', () async {
      //Mock use case
      when(() => mockGetUserDetailsUseCase.execute()).thenAnswer((_) async => testUserEntity);

      await userDetailsPageCubit.fetchUserDetails();
      expect(
        userDetailsPageCubit.state,
        UserDetailsLoaded(testUserEntity),
      );
    });

    test('Should emit Failed state when sending empty or white space', () async {
      when(() => mockGetUserDetailsUseCase.execute()).thenAnswer((_) async => testUserEntity);
      //Move to Loaded state
      await userDetailsPageCubit.fetchUserDetails();

      //Act
      userDetailsPageCubit.phoneTextController.text='  ';
      await userDetailsPageCubit.submitUserPhone();
      expect(
        userDetailsPageCubit.state,
        UserPhoneFailedToSubmit(testUserEntity, message: USER_INPUT_IS_EMPTY, phone: '  '),
      );
    });
  });
}
