import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/login_controllers.dart';

class ProfilePage extends GetView<LoginControllers> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Merhaba ${controller.userName}"),
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
              Icons.location_city,
              color: Colors.pink[300],
              size: 40,
            ),
            title: const Text("Konum"),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.account_box,
              color: Colors.pink[300],
              size: 40,
            ),
            title: const Text("Çıkış"),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
