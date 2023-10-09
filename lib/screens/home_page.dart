import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:satmaver_flutter/controllers/auth_controllers.dart';
import 'package:satmaver_flutter/screens/favorite_page.dart';
import 'package:satmaver_flutter/screens/home_page2.dart';
import 'package:satmaver_flutter/screens/product_page.dart';
import 'package:satmaver_flutter/screens/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthControllers>();
    return Scaffold(
      body: Obx(
        () => controller.bottomNavIdx.value == 0
            ? const HomePage2()
            : controller.bottomNavIdx.value == 1
                ? const ProductPage()
                : controller.bottomNavIdx.value == 2
                    ? const FavoritePage()
                    : const ProfilePage(),
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
              controller.bottomNavIdx.value = index;
              print(controller.bottomNavIdx.value.toString());
            },
            selectedIndex: controller.bottomNavIdx.value,
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
                icon: Icons.favorite,
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
