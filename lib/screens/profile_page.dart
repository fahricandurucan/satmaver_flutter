import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/login_controllers.dart';
import 'package:satmaver_flutter/screens/login_page.dart';

class ProfilePage extends GetView<LoginControllers> {
  const ProfilePage({super.key});

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
                'Merhaba ${controller.userName}',
                textStyle: const TextStyle(color: Colors.black),
                speed: const Duration(milliseconds: 70),
                cursor: "",
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            margin: const EdgeInsets.all(4),
            alignment: Alignment.center,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.pink.shade100.withOpacity(.7),
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            child: const Icon(
              Icons.person,
              color: Colors.red,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const Divider(),
          const SizedBox(
            height: 100,
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.pink[300],
              size: 40,
            ),
            title: const Text("Favoriler"),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.sell_outlined,
              color: Colors.pink[300],
              size: 40,
            ),
            title: const Text("Sattıklarım"),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.gif_box_outlined,
              color: Colors.pink[300],
              size: 40,
            ),
            title: const Text("Aldıklarım"),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: Colors.pink[300],
              size: 40,
            ),
            title: const Text("Konum"),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              EasyLoading.show(maskType: EasyLoadingMaskType.clear, status: "Çıkış Yapılıyor...");
              Future.delayed(const Duration(seconds: 3), () {
                Get.off(const LoginPage(), transition: Transition.upToDown);
                controller.deleteAccount(controller.userName.value);
                EasyLoading.dismiss();
              });
            },
            child: ListTile(
              leading: Icon(
                Icons.account_box,
                color: Colors.pink[300],
                size: 40,
              ),
              title: const Text("Oturumu Sonlandır"),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
