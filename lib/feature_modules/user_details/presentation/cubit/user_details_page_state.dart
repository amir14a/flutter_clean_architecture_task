import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';

abstract class UserDetailsPageState {}

class UserDetailsInitialState extends UserDetailsPageState {}

class UserDetailsLoading extends UserDetailsPageState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class UserPhoneSubmitting extends UserDetailsPageState {}

class UserDetailsLoaded extends UserDetailsPageState with EquatableMixin {
  final UserDto userDto;

  UserDetailsLoaded(this.userDto);

  @override
  List<Object?> get props => [userDto];
}

class UserDetailsFailedToLoad extends UserDetailsPageState with EquatableMixin {
  final String? message;

  UserDetailsFailedToLoad({this.message});

  @override
  List<Object?> get props => [message];
}

class UserPhoneFailedToSubmit extends UserDetailsPageState with EquatableMixin {
  final String? message;
  final String phone;

  UserPhoneFailedToSubmit({this.message, required this.phone});

  @override
  List<Object?> get props => [message, phone];
}

class UserPhoneSubmitted extends UserDetailsPageState with EquatableMixin {
  final String? message;
  final String phone;

  UserPhoneSubmitted({this.message, required this.phone});

  @override
  List<Object?> get props => [message, phone];
}
