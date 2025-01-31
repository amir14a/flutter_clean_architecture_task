import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';

abstract class UserDetailsPageState {}

class UserDetailsInitialState extends UserDetailsPageState {}

class UserDetailsLoading extends UserDetailsPageState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class UserPhoneSubmitting extends UserDetailsLoaded {
  UserPhoneSubmitting(super.userDto);

  @override
  bool get baseClass => false;
}

class UserDetailsLoaded extends UserDetailsPageState with EquatableMixin {
  final UserDto userDto;
  final baseClass = true;

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

class UserPhoneFailedToSubmit extends UserDetailsLoaded with EquatableMixin {
  final String? message;
  final String phone;

  UserPhoneFailedToSubmit(super.userDto, {this.message, required this.phone});

  @override
  bool get baseClass => false;

  @override
  List<Object?> get props => [message, phone];
}

class UserPhoneSubmitted extends UserDetailsLoaded with EquatableMixin {
  final String? message;
  final String phone;

  UserPhoneSubmitted(super.userDto, {this.message, required this.phone});

  @override
  bool get baseClass => false;

  @override
  List<Object?> get props => [message, phone, userDto];
}
