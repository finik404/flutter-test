import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/firebase/controllers/register.dart';

class FirebaseRegisterScreen extends StatelessWidget {
  const FirebaseRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseRegisterController());

    return MainLayout(
      label: 'Регистрация',
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
                  'Имя',
                  c.nameInput,
                  validate: [VRules.required()],
                ),
                const SizedBox(height: 15),
                UIInput(
                  'Email',
                  c.emailInput,
                  validate: [VRules.required(), VRules.email()],
                ),
                const SizedBox(height: 15),
                UIInput(
                  'Пароль',
                  c.passwordInput,
                  validate: [VRules.required(), VRules.min(6)],
                ),
                const SizedBox(height: 30),
                UIButton('Регистрация', () => c.register()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
