import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:satmaver_flutter/models/user.dart';

class LoginControllers extends GetxController {
  final Box<User> loginBox = Hive.box<User>("myBox");

  final userName = "".obs;
  final userEmail = "".obs;
  final userPassword = "".obs;

  final bottomNavBarIdx = 0.obs;

  final userBox = <User>[].obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();

  void addLoginBox(User user) {
    loginBox.add(user);
    getUser(user);
    userBox.add(user);
  }

  void deleteAccount(String name) {
    print("ilk${loginBox.length}");

    for (final key in loginBox.keys) {
      if (name == loginBox.get(key)!.name) {
        loginBox.delete(key);
        print("son${loginBox.length}");
      }
    }
  }

  void getUser(User user) {
    userName.value = user.name;
    userEmail.value = user.email;
    userPassword.value = user.password;
  }

  bool isLogged(User user) {
    for (var x in loginBox.values) {
      if (x.email == user.email && x.password == user.password) {
        getUser(x);
        return true;
      }
    }
    return false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
