import 'package:tproject/features/home/screens/home.dart';
import 'package:tproject/util/exports.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  // # --------------- Variables --------------- #

  // # --------------- onReady --------------- #

  @override
  void onReady() {
    super.onReady();
    toOff(const HomeScreen());
  }
}
