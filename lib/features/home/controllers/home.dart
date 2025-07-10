import 'package:tproject/features/canvas/screens/canvas.dart';
import 'package:tproject/features/gemini/screens/gemini.dart';
import 'package:tproject/util/exports.dart';
import 'package:tproject/util/models/base.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // # --------------- Variables --------------- #

  final items = [
    ItemModel('Canvas', const CanvasScreen()),
    ItemModel('Gemini', const GeminiScreen()),
  ];
}
