import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;

  User({required this.name, required this.email, required this.password});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(name: map["name"], email: map["email"], password: map["password"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$name - $email - $password";
  }
}
