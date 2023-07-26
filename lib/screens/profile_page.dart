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
      ),
      body: ListView(
        children: [
          for (int i = 0; i < 4; i++) listTileWidget(),
        ],
      ),
    );
  }

  Widget listTileWidget() {
    return Container(
      child: ListTile(
        leading: Icon(
          Icons.favorite,
          color: Colors.pink[300],
        ),
        title: const Text("welfkjwkleşf"),
      ),
    );
  }
}
