import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flyer_chat_image_message/flyer_chat_image_message.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/gemini/controllers/gemini.dart';

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
              builders: Builders(
                // Image message
                imageMessageBuilder: (
                  context,
                  message,
                  index, {
                  required bool isSentByMe,
                  MessageGroupStatus? groupStatus,
                }) {
                  return Container(
                    decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FlyerChatImageMessage(message: message, index: index),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0, left: 8.0, right: 8.0),
                          child: UIText(message.text!, size: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
