import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/home_page_controllers.dart';
import 'package:satmaver_flutter/widgets/product_card_widget.dart';
import 'package:satmaver_flutter/widgets/search_bar_widget.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(HomePageControllers());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  'HomePage',
                  textStyle: const TextStyle(color: Colors.black),
                  speed: const Duration(milliseconds: 70),
                  cursor: "",
                ),
              ],
              totalRepeatCount: 1,
            ),
          ),
        ),
        body: Obx(
          () => ListView(
            children: [
              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchBarWidget(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/star.png",
                      width: 50,
                    ),
                    const SizedBox(width: 30),
                    const Text(
                      "Sana en yakın ürünler",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true, // Important to allow the GridView to be placed inside a ListView
                physics: const NeverScrollableScrollPhysics(), // Disable GridView's scroll
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 3, // Spacing between columns
                  mainAxisSpacing: 8, // Spacing between rows
                ),
                itemCount: controllers.filteredList.isEmpty
                    ? controllers.list.length
                    : controllers.filteredList.length,
                itemBuilder: (context, index) {
                  var product = controllers.filteredList.isEmpty
                      ? controllers.list[index]
                      : controllers.filteredList[index];

                  return ProductCardWidget(
                    product: product,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
