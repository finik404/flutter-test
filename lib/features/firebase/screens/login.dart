import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/firebase/controllers/login.dart';

class FirebaseLoginScreen extends StatelessWidget {
  const FirebaseLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseLoginController());

    return MainLayout(
      label: 'Авторизация',
      hasArrow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: c.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIInput(
                  'Email',
                  c.emailInput,
                  validate: [VRules.required(), VRules.email()],
                ),
                const SizedBox(height: 15),
                UIInput(
                  'Пароль',
                  c.passwordInput,
                  validate: [VRules.required()],
                ),
                const SizedBox(height: 30),
                UIButton('Авторизация', () => c.login()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
