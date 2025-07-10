import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/gemini/controllers/gemini.dart';
import 'package:tproject/util/extensions/media.dart';

class GeminiScreen extends StatelessWidget {
  const GeminiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(GeminiController());

    return MainLayout(
      label: 'Gemini',
      hasArrow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeight - 175,
            child: Chat(
              chatController: c.chatController,
              currentUserId: 'user',
              onMessageSend: (text) => c.sendMessage(text),
              onAttachmentTap: () => c.attachImage(),
              resolveUser: (UserID id) async {
                return User(id: id, name: 'User');
              },
            ),
          ),
        ],
      ),
    );
  }
}
