import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/home_page_controllers.dart';
import 'package:satmaver_flutter/models/product.dart';
import 'package:satmaver_flutter/screens/product_detail_page.dart';

class FavoritePage extends GetView<HomePageControllers> {
  const FavoritePage({super.key});

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
                'Favorite Page',
                textStyle: const TextStyle(color: Colors.black),
                speed: const Duration(milliseconds: 70),
                cursor: "",
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
      ),
      body: controller.favoriteList.isEmpty
          ? const Center(
              child: Text("You haven't added any favorite product yet"),
            )
          : Obx(
              () => ListView(
                children: [
                  const Divider(),
                  for (var product in controller.favoriteList) favoriteCardWidget(product),
                ],
              ),
            ),
    );
  }

  Widget favoriteCardWidget(Product product) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Row(children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  product.image,
                  width: 150,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(product.name),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(ProductDetailPage(product: product));
                    },
                    child: const Text("Button"),
                  ),
                ],
              ),
            ]),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
