import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tproject/util/exports.dart';
import 'package:tproject/util/helpers/external.dart';

class GeminiController extends GetxController {
  static GeminiController get instance => Get.find();

  // # --------------- Variables --------------- #

  final RxBool isLoading = false.obs;
  final chatController = InMemoryChatController();
  final Rxn<dynamic> image = Rxn();

  // # --------------- Methods --------------- #

  // sendMessage ---------------
  Future<void> sendMessage(String text) async {
    // Add user message
    chatController.insertMessage(
      TextMessage(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        authorId: 'user',
        createdAt: DateTime.now().toUtc(),
        text: text,
      ),
    );

    // Answer
    String answerId = 'model_${DateTime.now().millisecondsSinceEpoch}';
    String answerMessage = '';
    final answer = TextMessage(
      id: answerId,
      authorId: 'model',
      createdAt: DateTime.now().toUtc(),
      text: answerMessage,
    );
    // Add answer
    chatController.insertMessage(answer);



    // Gemini get answer
    Gemini.instance.promptStream(parts: [
      Part.text(text),
    ]).listen((value) {
      chatController.updateMessage(
        answer,
        answer.copyWith(text: answerMessage += value!.output!),
      );
    });
  }

  // attachImage ---------------
  Future<void> attachImage() async {
    final file = await TExternal.pickImageFromGallery();
    image.value = file;
  }
}
