import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/auth_controllers.dart';
import 'package:satmaver_flutter/controllers/register_controllers.dart';
import 'package:satmaver_flutter/widgets/textfield_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterControllers());
    final authController = Get.put(AuthControllers());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                              TextFieldWidget(
                                  controller: registerController.name, hintTextt: "Name"),
                              TextFieldWidget(
                                  controller: registerController.email, hintTextt: "Email"),
                              TextFieldWidget(
                                controller: registerController.password,
                                hintTextt: "Password",
                                obscureText: true,
                              ),
                              TextFieldWidget(
                                controller: registerController.passwordConfirm,
                                hintTextt: "Password Confirm",
                                obscureText: true,
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
                                      if (registerController.password.text ==
                                          registerController.passwordConfirm.text) {
                                        authController.signUpWithEmail(
                                            name: registerController.name.text,
                                            email: registerController.email.text,
                                            password: registerController.password.text);
                                      } else {
                                        Get.snackbar("Error", "The password do not match!");
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
      ),
    );
  }
}
