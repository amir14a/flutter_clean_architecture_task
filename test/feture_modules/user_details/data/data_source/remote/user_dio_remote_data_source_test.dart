import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_task/common/config/app_configs.dart';
import 'package:flutter_clean_architecture_task/common/exception/network_exceptions.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/data_source/remote/user_dio_remote_data_source.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'mock_dio.dart';

void main() {
  late MockDio mockDio;
  late UserDioRemoteDataSource userDioRemoteDataSource;
  setUp(() {
    mockDio = MockDio();
    userDioRemoteDataSource = UserDioRemoteDataSource(mockDio);
  });
  group('UserDioRemoteDataSource tests:', () {
    const testEndpoint = 'testEndpoint';
    final testUserDto = UserDto(name: "amir", email: "a@a.com", phone: "9893000000000");
    test('Data source should return correct user dto when status code is 200', () async {
      // Mock success api call:
      when(() => mockDio.get('$APP_BASE_URL/$testEndpoint')).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions(), statusCode: 200, data: testUserDto.toMap()));

      final result = await userDioRemoteDataSource.fetchUserDetails(endpoint: testEndpoint);
      expect(result, testUserDto);
    });
    test('Data source should throw AppNetworkException when status code!=200 and fetchUserDetails called',
        () async {
      // Mock failed api call:
      when(() => mockDio.get('$APP_BASE_URL/$testEndpoint'))
          .thenAnswer((_) async => Response(requestOptions: RequestOptions(), statusCode: 400));

      expect(
          userDioRemoteDataSource.fetchUserDetails(endpoint: testEndpoint), throwsA(isA<AppNetworkException>()));
    });
    test('Data source should throw AppNetworkException when status code!=200 and saveUserDetails called',
        () async {
      // Mock failed api call:
      when(() => mockDio.post('$APP_BASE_URL/$testEndpoint', data: jsonEncode(testUserDto.toMap())))
          .thenAnswer((_) async => Response(requestOptions: RequestOptions(), statusCode: 400));

      expect(() => userDioRemoteDataSource.saveUserDetails(endpoint: testEndpoint, userDto: testUserDto),
          throwsA(isA<AppNetworkException>()));
    });
  });
}
