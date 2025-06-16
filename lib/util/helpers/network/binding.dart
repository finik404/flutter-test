import 'package:get/get.dart';
import 'package:tproject/util/helpers/network/controller.dart';

class NetworkBinding {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
