import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginControllers extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // final registerNameController = TextEditingController();
  // final registerEmailController = TextEditingController();
  // final registerPasswordController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    emailController.text = "";
    passwordController.text = "";
  }
}
