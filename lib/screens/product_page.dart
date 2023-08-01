import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            fontFamily: 'Agne',
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Product Page',
                textStyle: const TextStyle(color: Colors.black),
                speed: const Duration(milliseconds: 70),
                cursor: "",
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
      ),
      body: const Center(child: Text("Product Page")),
    );
  }
}
