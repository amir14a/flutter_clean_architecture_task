import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/endpoint/user_endpoints.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/mapper/user_mapper.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/repository_impl/user_repository_impl.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/entity/user_entity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../data_source/local/mock_user_local_data_source.dart';
import '../data_source/remote/mock_user_remote_data_source.dart';

void main() {
  late MockUserLocalDataSource mockLocalDataSource;
  late MockUserRemoteDataSource mockRemoteDataSource;
  late UserEntity testUserEntity;
  setUp(() {
    mockLocalDataSource = MockUserLocalDataSource();
    mockRemoteDataSource = MockUserRemoteDataSource();
    testUserEntity = UserEntity(name: 'Amir', email: 'a@a.com', phone: '989300000000');
  });
  group('UserRepositoryImplementation tests:', () {
    test('UserRepositoryImpl fetchUserInfo should use local data source when isRemote is false', () async {
      final userRepositoryImpl = UserRepositoryImpl(
          remoteDataSource: mockRemoteDataSource, localDataSource: mockLocalDataSource, useRemote: false);
      //Mock local user return
      when(() => mockLocalDataSource.fetchUserDto()).thenAnswer((_) async => testUserEntity.toUserDto());
      final result = await userRepositoryImpl.getUserInfo();
      expect(result, testUserEntity);
      verify(() => mockLocalDataSource.fetchUserDto()).called(1);
      verifyNever(() => mockRemoteDataSource.fetchUserDetails(endpoint: FETCH_USER_DETAILS_ENDPOINT));
    });
    test(
        'UserRepositoryImpl fetchUserInfo should use remote data source and save to local data source when isRemote is true',
        () async {
      final userRepositoryImpl = UserRepositoryImpl(
          remoteDataSource: mockRemoteDataSource, localDataSource: mockLocalDataSource, useRemote: true);
      //Mock remote api call
      when(() => mockRemoteDataSource.fetchUserDetails(endpoint: FETCH_USER_DETAILS_ENDPOINT))
          .thenAnswer((_) async => testUserEntity.toUserDto());

      //Mock saving to local storage
      when(() => mockLocalDataSource.saveUserDto(userDto: testUserEntity.toUserDto()))
          .thenAnswer((_) async => true);

      final result = await userRepositoryImpl.getUserInfo();
      expect(result, testUserEntity);
      verify(() => mockRemoteDataSource.fetchUserDetails(endpoint: FETCH_USER_DETAILS_ENDPOINT)).called(1);
      verify(() => mockLocalDataSource.saveUserDto(userDto: testUserEntity.toUserDto())).called(1);
    });
    test(
        'UserRepositoryImpl submitUserPhone should fetch user from local data source and save it with new phone number to local if useRemote=false',
        () async {
      final newTestPhone = '989300000001';
      final newTestUserDto = testUserEntity.toUserDto().copyWith(phone: newTestPhone);
      final userRepositoryImpl = UserRepositoryImpl(
          remoteDataSource: mockRemoteDataSource, localDataSource: mockLocalDataSource, useRemote: false);

      //Mock local user return
      when(() => mockLocalDataSource.fetchUserDto()).thenAnswer((_) async => testUserEntity.toUserDto());
      //Mock saving to local storage
      when(() => mockLocalDataSource.saveUserDto(userDto: newTestUserDto)).thenAnswer((_) async => true);

      final result = await userRepositoryImpl.submitUserPhone(userPhone: newTestPhone);
      expect(result, true);
      verify(() => mockLocalDataSource.fetchUserDto()).called(1);
      verify(() => mockLocalDataSource.saveUserDto(userDto: newTestUserDto)).called(1);
      verifyNever(() => mockRemoteDataSource.saveUserDetails(
            endpoint: SAVE_USER_DETAILS_ENDPOINT,
            userDto: newTestUserDto,
          ));
    });
    test(
        'UserRepositoryImpl submitUserPhone should fetch user from local data source and send it with new phone number to remote if useRemote=true',
        () async {
      final newTestPhone = '989300000001';
      final newTestUserDto = testUserEntity.toUserDto().copyWith(phone: newTestPhone);
      final userRepositoryImpl = UserRepositoryImpl(
          remoteDataSource: mockRemoteDataSource, localDataSource: mockLocalDataSource, useRemote: true);

      //Mock local user return
      when(() => mockLocalDataSource.fetchUserDto()).thenAnswer((_) async => testUserEntity.toUserDto());

      //Mock remote api call
      when(() =>
              mockRemoteDataSource.saveUserDetails(endpoint: SAVE_USER_DETAILS_ENDPOINT, userDto: newTestUserDto))
          .thenAnswer((_) async => true);

      final result = await userRepositoryImpl.submitUserPhone(userPhone: '989300000001');
      expect(result, true);
      verify(() => mockLocalDataSource.fetchUserDto()).called(1);
      verify(() => mockRemoteDataSource.saveUserDetails(
            endpoint: SAVE_USER_DETAILS_ENDPOINT,
            userDto: newTestUserDto,
          )).called(1);
      verifyNever(() => mockLocalDataSource.saveUserDto(userDto: newTestUserDto));
    });
  });
}
