import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/login_controllers.dart';
import 'package:satmaver_flutter/models/user.dart';
import 'package:satmaver_flutter/screens/home_page.dart';

class RegisterPage extends GetView<LoginControllers> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.pink.shade100],
            begin: Alignment.centerLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                text: const TextSpan(
                    text: "Create",
                    style:
                        TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "\nAccount",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 1.2,
                                  margin: const EdgeInsets.only(top: 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    child: TextField(
                                      controller: controller.registerNameController,
                                      decoration: const InputDecoration(
                                          icon: Icon(Icons.person),
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                          hintText: "Name"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 1.2,
                                  margin: const EdgeInsets.only(top: 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    child: TextField(
                                      controller: controller.registerEmailController,
                                      decoration: const InputDecoration(
                                          icon: Icon(Icons.lock),
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                          hintText: "Email"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 1.2,
                                  margin: const EdgeInsets.only(top: 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    child: TextField(
                                      controller: controller.registerPasswordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          icon: Icon(Icons.lock),
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                          hintText: "Password"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    if (controller.registerNameController.value.text.isEmpty ||
                                        controller.registerEmailController.value.text.isEmpty ||
                                        controller.registerPasswordController.value.text.isEmpty) {
                                      Get.snackbar("Hata", "Tüm boşlukları doldurun");
                                    } else {
                                      User user = User(
                                          name: controller.registerNameController.value.text,
                                          email: controller.registerEmailController.value.text,
                                          password:
                                              controller.registerPasswordController.value.text);
                                      print(user.toString());
                                      controller.addLoginBox(user);
                                      controller.registerNameController.text = "";
                                      controller.registerEmailController.text = "";
                                      controller.registerPasswordController.text = "";
                                      Get.off(const HomePage());
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
