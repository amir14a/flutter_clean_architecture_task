import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_task/common/config/app_configs.dart';
import 'package:flutter_clean_architecture_task/common/exception/network_exceptions.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/data_source/remote/user_remote_data_source.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';

class UserDioRemoteDataSource implements UserRemoteDataSource {
  final Dio _dio;

  UserDioRemoteDataSource(this._dio);

  @override
  Future<UserDto> fetchUserDetails({required String endpoint}) async {
    var response = await _dio.get('$APP_BASE_URL/$endpoint');
    _checkResponse(response);
    return UserDto.fromMap(response.data);
  }

  @override
  Future<bool> saveUserDetails({required String endpoint, required UserDto userDto}) async {
    var response = await _dio.post('$APP_BASE_URL/$endpoint', data: jsonEncode(userDto.toMap()));
    _checkResponse(response);
    return response.data;
  }

  _checkResponse(Response dioResponse) {
    if (dioResponse.statusCode == 200) {
      return;
    } else if (dioResponse.statusCode == 400) {
      throw InvalidRequest();
    } else if (dioResponse.statusCode == 401) {
      throw UnauthenticatedUser();
    } else if (dioResponse.statusCode == 403) {
      throw ForbiddenEndpoint();
    } else if (dioResponse.statusCode != null && dioResponse.statusCode! >= 500) {
      throw ServerError();
    }
  }
}
