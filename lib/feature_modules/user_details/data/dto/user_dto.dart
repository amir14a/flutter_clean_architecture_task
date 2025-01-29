import 'package:equatable/equatable.dart';

class UserDto extends Equatable {
  final String name;
  final String email;
  final String? phone;

  const UserDto({
    required this.name,
    required this.email,
    this.phone,
  });

  factory UserDto.fromMap(dynamic map) {
    return UserDto(
      name: map["name"],
      email: map['email'],
      phone: map['phone'],
    );
  }

  Map toMap() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

  @override
  List<Object?> get props => [name, email, phone];
}
