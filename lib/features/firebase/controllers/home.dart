import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tproject/util/exports.dart';

class FirebaseHomeController extends GetxController {
  static FirebaseHomeController get instance => Get.find();

  // # --------------- Variables --------------- #

  final Rxn<User> user = Rxn();

  // # --------------- Methods --------------- #

  // # --------------- onReady --------------- #

  @override
  void onReady() {
    super.onReady();
    getUser();
  }

  // register ---------------
  Future<void> getUser() async {
    user.value = FirebaseAuth.instance.currentUser;
  }
}
