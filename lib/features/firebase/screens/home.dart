import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/firebase/controllers/home.dart';
import 'package:tproject/features/firebase/screens/add.dart';
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

              if (user == null) return const SizedBox.shrink();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (user.photoURL != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: GFAvatar(),
                    ),
                  UIText('Имя: ${user.displayName!}'),
                  const SizedBox(height: 15),
                  UIText('Email: ${user.email!}'),
                  const SizedBox(height: 25),
                ],
              );
            },
          ),

          // Buttons
          GFButton(
            onPressed: () => to(const FirebaseRegisterScreen()),
            fullWidthButton: true,
            text: 'Регистрация',
            color: Colors.blue,
          ),
          const SizedBox(height: 10),
          GFButton(
            onPressed: () => to(const FirebaseLoginScreen()),
            fullWidthButton: true,
            text: 'Авторизация',
            color: Colors.blueGrey,
          ),
          const SizedBox(height: 10),
          GFButton(
            onPressed: () => c.loginWithGoogle(),
            fullWidthButton: true,
            text: 'Авторизация с помощью Google',
            color: Colors.green,
          ),
          const SizedBox(height: 50),

          // Post models
          const UIText('Post models:'),
          GFButton(
            onPressed: () => to(const FirebaseAddPostScreen()),
            fullWidthButton: true,
            text: 'Добавить пост',
            color: Colors.blue,
          ),
          const SizedBox(height: 10),
          Obx(
            () => UIList(
              length: c.posts.length,
              padding: EdgeInsets.zero,
              separator: const UIDivider(),
              child: (index) {
                final post = c.posts[index];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIText(post.name),
                    Row(
                      children: [
                        UIIconButton(TIcons.edit, () => to(FirebaseAddPostScreen(post: post))),
                        UIIconButton(TIcons.remove, () => c.removePost(post.id)),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
