class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;

  UserModel({required this.id, required this.name, required this.email, required this.password});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map["id"], name: map["name"], email: map["email"], password: map["password"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id $name - $email - $password";
  }
}
