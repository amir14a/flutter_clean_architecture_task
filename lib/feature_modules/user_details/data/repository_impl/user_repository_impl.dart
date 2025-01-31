import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/data_source/local/user_local_data_source.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/data_source/remote/user_remote_data_source.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/endpoint/user_endpoints.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/mapper/user_mapper.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/entity/user_entity.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _localDataSource;
  final UserRemoteDataSource _remoteDataSource;

  //repository implementation should itself decide to use local or remote data sources where needed,
  //but in this app for avoiding network exceptions we disable it manually via configs
  final bool _useRemote;

  UserRepositoryImpl({
    required UserRemoteDataSource remoteDataSource,
    required UserLocalDataSource localDataSource,
    required bool useRemote,
  })  : _useRemote = useRemote,
        _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<UserEntity> getUserDetails() async {
    late UserDto userDto;
    if (!_useRemote) {
      userDto = await _localDataSource.fetchUserDto();
    } else {
      userDto = await _remoteDataSource.fetchUserDetails(endpoint: FETCH_USER_DETAILS_ENDPOINT);
      //Saving last server changes to keep local data up to date
      await _localDataSource.saveUserDto(userDto: userDto);
    }
    return userDto.toUserEntity();
  }

  @override
  Future<bool> submitUserPhone({required String userPhone}) async {
    /*
    Sometimes, the logic in the domain layer is simpler than the logic in data sources
    and the backend may be more complex (or the opposite).
    This complexity can be handled in the data layer within the repository implementation.
     */
    final localUserDto = await _localDataSource.fetchUserDto();
    var newUserDto = localUserDto.copyWith(phone: userPhone);
    if (_useRemote) {
      var result =
          await _remoteDataSource.saveUserDetails(endpoint: SAVE_USER_DETAILS_ENDPOINT, userDto: newUserDto);
      return result;
    } else {
      var result = await _localDataSource.saveUserDto(userDto: newUserDto);
      return result;
    }
  }
}
