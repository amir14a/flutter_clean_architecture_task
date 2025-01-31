import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/dto/user_dto.dart';
import 'package:test/test.dart';

main() {
  group('UserDto tests:', () {
    test('Properties should be correct when they passed in constructor', () {
      final instance = UserDto(name: 'Amir', email: 'a@a.com', phone: '989300000000');
      expect(instance.name, 'Amir');
      expect(instance.email, 'a@a.com');
      expect(instance.phone, '989300000000');
    });
    test('Optional properties should be null if they not passed in constructor', () {
      final instance = UserDto(name: 'Amir', email: 'a@a.com');
      expect(instance.phone, null);
    });
    test('Instances should be equal if they have same properties', () {
      final instance1 = UserDto(name: 'Amir', email: 'a@a.com', phone: '989300000000');
      final instance2 = UserDto(name: 'Amir', email: 'a@a.com', phone: '989300000000');
      expect(instance1, instance2);
    });
    test('Instances shouldn\'t be equal if they have\'t same properties', () {
      final instance1 = UserDto(name: 'Abbas', email: 'a@a.com', phone: '989300000000');
      final instance2 = UserDto(name: 'Amir', email: 'a@a.com', phone: '989300000000');
      expect(instance1, isNot(instance2));
    });
    test('Instances should be created correctly with "fromMap" method', () {
      final instance1 = UserDto(name: 'Amir', email: 'a@a.com', phone: '989300000000');
      final instance2 = UserDto.fromMap({'name': 'Amir', 'email': 'a@a.com', 'phone': '989300000000'});
      expect(instance1, instance2);
    });
    test('Instances should return the correct map when the "toMap" method is called', () {
      final instance = UserDto(name: 'Amir', email: 'a@a.com', phone: '989300000000');
      expect(instance.toMap(), {'name': 'Amir', 'email': 'a@a.com', 'phone': '989300000000'});
    });
  });
}
