import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintTextt;
  final bool? obscureText;

  const TextFieldWidget(
      {super.key, required this.controller, required this.hintTextt, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextField(
              controller: controller,
              obscureText: obscureText ?? false,
              decoration: InputDecoration(
                  icon: const Icon(Icons.lock),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: hintTextt),
            ),
          ),
        ),
      ],
    );
  }
}
