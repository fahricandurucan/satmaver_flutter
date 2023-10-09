import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/models/user_model.dart';
import 'package:satmaver_flutter/screens/login_page.dart';
import 'package:satmaver_flutter/screens/root_wrapper.dart';
import 'package:satmaver_flutter/services/user_api.dart';

class AuthControllers extends GetxController {
  static AuthControllers get to => Get.find();

  final auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;
  final userCollection = FirebaseFirestore.instance.collection("users");

  final user = Rxn<User>();
  final currentUser = Rxn<UserModel>();

  final loginLoading = true.obs;
  final bottomNavIdx = 0.obs;

  Future<void> signUpWithEmail(
      {required String name, required String email, required String password}) async {
    try {
      final userCredential =
          await auth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        registerUser(id: userCredential.user!.uid, name: name, email: email, password: password);
      }
      Get.showSnackbar(
        const GetSnackBar(
          title: "Successful!",
          message: "Your account has successfully created. You can log in.",
          backgroundColor: Colors.green,
          duration: Duration(seconds: 4),
        ),
      );
      Get.offAll(const LoginPage());
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> registerUser(
      {required String id,
      required String name,
      required String email,
      required String password}) async {
    await userCollection.doc(id).set({
      "id": id,
      "email": email,
      "name": name,
      "password": password,
    });
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        print("GİRİŞ BAŞARILI");
        Get.offAll(const RootWrapper());
      }
    } on FirebaseAuthException catch (e) {
      print("CANCANCANCANCNCANCANDNDSNDNDNA");
      print(e.toString());
      String errorMessage = '';
      if (email.isEmpty || !email.contains('@')) {
        errorMessage = "Geçerli bir e-posta adresi girin.";
      } else if (password.isEmpty) {
        errorMessage = "Şifre alanı boş olamaz.";
      } else if (e.code == 'user-not-found') {
        errorMessage = 'Kullanıcı bulunamadı. Lütfen kayıt olun.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Yanlış şifre girdiniz. Tekrar deneyin.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Geçersiz e-posta adresi. Lütfen düzeltin.';
      } else {
        errorMessage = 'Bir hata oluştu. Lütfen daha sonra tekrar deneyin.';
      }
      Get.snackbar("Error", errorMessage);
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      Get.offAll(const RootWrapper());
      bottomNavIdx.value = 0;
    } catch (err) {
      debugPrint("Sign Out Error: $err");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user.bindStream(auth.authStateChanges());

    ever(user, (User? userState) async {
      if (user.value == null) {
        print("İF İN İÇİ");
        currentUser.value = null;
        loginLoading.value = false;
        return;
      } else {
        print("ELSE İÇİ");
        currentUser.value = await UserApi.getUser(user.value!.uid);
      }

      print("dışşşşşşşşşşşşşş");

      bottomNavIdx.value = 0;

      loginLoading.value = false;
    });
  }
}
