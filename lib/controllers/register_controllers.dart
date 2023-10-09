import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterControllers extends GetxController {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    name.text = "";
    email.text = "";
    password.text = "";
  }
}
