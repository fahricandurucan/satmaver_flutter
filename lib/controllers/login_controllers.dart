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

  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController = TextEditingController().obs;
  final Rx<TextEditingController> registerNameController = TextEditingController().obs;
  final Rx<TextEditingController> registerEmailController = TextEditingController().obs;
  final Rx<TextEditingController> registerPasswordController = TextEditingController().obs;

  void addLoginBox(User user) {
    loginBox.clear();
    loginBox.add(user);
    userBox.add(user);
  }

  void getUser() {
    for (final x in loginBox.values) {
      userName.value = x.name;
      userEmail.value = x.email;
      userPassword.value = x.password;
    }
  }

  bool isLogged(User user) {
    for (var x in loginBox.values) {
      if (x.email == user.email && x.password == user.password) {
        return true;
      }
    }
    return false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
    super.onInit();
  }
}
