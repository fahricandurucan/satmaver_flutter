import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:satmaver_flutter/models/user.dart';
import 'package:satmaver_flutter/screens/splash_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>("myBox");

  EasyLoading.instance
    ..indicatorColor = Colors.white
    ..indicatorSize = 80
    ..errorWidget = const Icon(Icons.warning)
    ..indicatorType = EasyLoadingIndicatorType.circle;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      builder: EasyLoading.init(),
    );
  }
}
