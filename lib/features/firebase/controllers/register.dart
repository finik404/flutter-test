import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tproject/features/firebase/controllers/home.dart';
import 'package:tproject/util/exports.dart';

class FirebaseRegisterController extends GetxController {
  static FirebaseRegisterController get instance => Get.find();

  // # --------------- Variables --------------- #

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  // # --------------- Methods --------------- #

  // register ---------------
  Future<void> register() async {
    // Validate form
    if (!formKey.currentState!.validate()) return;

    try {
      // Register
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailInput.text, password: passwordInput.text);

      if (user.user != null) {
        // Update name
        await user.user!.updateDisplayName(nameInput.text);

        Navigator.pop(Get.context!);
        FirebaseHomeController.instance.getUser();
      }
    } catch (e) {
      print('Ошибка: $e');
    }
  }
}
