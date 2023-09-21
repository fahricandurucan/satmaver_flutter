import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthControllers extends GetxController {
  final auth = FirebaseAuth.instance;
  final userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> signUpWithEmail(
      {required String name, required String email, required String password}) async {
    try {
      final userCredential =
          await auth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        registerUser(name: name, email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> registerUser(
      {required String name, required String email, required String password}) async {
    await userCollection.doc().set({
      "email": email,
      "name": name,
      "password": password,
    });
  }
}
