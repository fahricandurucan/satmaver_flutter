import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
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
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    child: TextField(
                                      decoration: InputDecoration(
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
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    child: TextField(
                                      decoration: InputDecoration(
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
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    child: TextField(
                                      decoration: InputDecoration(
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
                                  onPressed: () {},
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
