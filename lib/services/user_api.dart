import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class UserApi {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore store = FirebaseFirestore.instance;

  static Future<UserModel?> getUser(String uid) async {
    final userDoc = await store.collection('users').doc(uid).get();
    final user = userDoc.data();
    return UserModel.fromMap(user!);
  }

  // static Future<bool> isUserExist(String? userId) async {
  //   try {
  //     final user = await store.collection('users').doc(userId).get();

  //     print("${user.exists}");

  //     return user.exists;
  //   } catch (e) {
  //     debugPrint("User Detecting Error: $e");
  //   }

  //   return false;
  // }

  // static Future<bool> deleteUser(String userId) async {
  //   try {
  //     await store.collection('users').doc(userId).delete();

  //     return true;
  //   } catch (err) {
  //     debugPrint("Firebase Delete User Error: $err");
  //   }

  //   return false;
  // }
}
