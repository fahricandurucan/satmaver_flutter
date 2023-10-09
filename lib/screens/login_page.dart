import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/auth_controllers.dart';
import 'package:satmaver_flutter/controllers/login_controllers.dart';
import 'package:satmaver_flutter/screens/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(LoginControllers());
    final authController = Get.find<AuthControllers>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade100, Colors.red.shade700],
              begin: Alignment.centerLeft,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
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
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 231, 155, 180),
                                    blurRadius: 10,
                                  ),
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width / 1.2,
                                      margin: const EdgeInsets.only(top: 30),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(255, 255, 48, 117)),
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                        child: TextField(
                                          controller: controllers.emailController,
                                          decoration: const InputDecoration(
                                              icon: Icon(Icons.email_outlined),
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
                                        border: Border.all(
                                            color: const Color.fromARGB(255, 255, 48, 117)),
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                        child: TextField(
                                          controller: controllers.passwordController,
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
                                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      child: Text(
                                        "Log in",
                                        style: TextStyle(color: Colors.pink.shade400),
                                      ),
                                      onPressed: () {
                                        authController.signInWithEmail(
                                            controllers.emailController.text,
                                            controllers.passwordController.text);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const RegisterPage());
                                },
                                child: Text(
                                  "Create account!",
                                  style: TextStyle(color: Colors.pink.shade400),
                                ),
                              ),
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
