import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:satmaver_flutter/controllers/login_controllers.dart';

class HomePage extends GetView<LoginControllers> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = [
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x",
      "x"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: ListView(
        children: [
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
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true, // Important to allow the GridView to be placed inside a ListView
            physics: const NeverScrollableScrollPhysics(), // Disable GridView's scroll
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 8, // Spacing between columns
              mainAxisSpacing: 8, // Spacing between rows
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Card(
                child: Center(
                  child: Text(
                    list[index],
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            tabBackgroundColor: Colors.pink.shade100.withOpacity(.7),
            onTabChange: (index) {
              controller.bottomNavBarIdx.value = index;
              print(controller.bottomNavBarIdx.value.toString());
            },
            selectedIndex: controller.bottomNavBarIdx.value,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Anasayfa",
                iconColor: Colors.grey,
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: "Ürünler",
                iconColor: Colors.grey,
              ),
              GButton(
                icon: Icons.favorite_border,
                text: "Favoriler",
                iconColor: Colors.grey,
              ),
              GButton(
                icon: Icons.person,
                text: "Profil",
                iconColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
