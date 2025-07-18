import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tproject/features/firebase/controllers/home.dart';
import 'package:tproject/util/exports.dart';

class FirebaseLoginController extends GetxController {
  static FirebaseLoginController get instance => Get.find();

  // # --------------- Variables --------------- #

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  // # --------------- Methods --------------- #

  // register ---------------
  Future<void> login() async {
    // Validate form
    if (!formKey.currentState!.validate()) return;

    try {
      // Register
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailInput.text, password: passwordInput.text);

      if (user.user != null) {
        Navigator.pop(Get.context!);
        FirebaseHomeController.instance.getUser();
        FirebaseHomeController.instance.getPosts();
      }
    } catch (e) {
      print('Ошибка: $e');
    }
  }
}
