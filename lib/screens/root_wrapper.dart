import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/auth_controllers.dart';
import 'package:satmaver_flutter/screens/home_page.dart';
import 'package:satmaver_flutter/screens/login_page.dart';

class RootWrapper extends StatelessWidget {
  const RootWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthControllers());
    return Obx(
      () => authController.loginLoading.value
          ? const Center(child: CircularProgressIndicator())
          : authController.user.value == null
              ? const LoginPage()
              : const HomePage(),
    );
  }
}
