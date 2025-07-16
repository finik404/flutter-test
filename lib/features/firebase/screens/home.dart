import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/firebase/controllers/home.dart';
import 'package:tproject/features/firebase/screens/login.dart';
import 'package:tproject/features/firebase/screens/register.dart';

class FirebaseHomeScreen extends StatelessWidget {
  const FirebaseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FirebaseHomeController());

    return MainLayout(
      label: 'Firebase Backend',
      hasArrow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current user
          Obx(
            () {
              final user = c.user.value;

              if(user == null) return const SizedBox.shrink();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText('Имя: ${user.displayName!}'),
                  const SizedBox(height: 15),
                  UIText('Email: ${user.email!}'),
                  const SizedBox(height: 25),
                ],
              );
            },
          ),

          // Buttons
          UIButton('Регистрация', () => to(const FirebaseRegisterScreen())),
          const SizedBox(height: 10),
          UISecondaryButton('Авторизация', () => to(const FirebaseLoginScreen())),
        ],
      ),
    );
  }
}
