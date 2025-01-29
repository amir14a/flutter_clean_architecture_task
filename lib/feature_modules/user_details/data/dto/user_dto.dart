class UserDto {
  String name;
  String email;
  String? phone;

  UserDto({
    required this.name,
    required this.email,
    this.phone,
  });

  factory UserDto.fromMap(dynamic json) {
    return UserDto(
      name: json["name"],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map toMap() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }
}
