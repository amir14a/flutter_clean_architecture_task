import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';

abstract class UserDetailsPageState {}

class UserDetailsInitialState extends UserDetailsPageState {}

class UserDetailsLoading extends UserDetailsPageState {}

class UserPhoneSubmitting extends UserDetailsPageState {}

class UserDetailsLoaded extends UserDetailsPageState {
  final UserDto userDto;

  UserDetailsLoaded(this.userDto);
}

class UserDetailsFailedToLoad extends UserDetailsPageState {
  final String? message;

  UserDetailsFailedToLoad({this.message});
}

class UserPhoneFailedToSubmit extends UserDetailsPageState {
  final String? message;
  final String phone;

  UserPhoneFailedToSubmit({this.message, required this.phone});
}

class UserPhoneSubmitted extends UserDetailsPageState {
  final String? message;
  final String phone;

  UserPhoneSubmitted({this.message, required this.phone});
}
