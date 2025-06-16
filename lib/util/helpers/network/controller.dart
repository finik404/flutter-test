import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/languages/L.dart';
import 'package:tproject/util/helpers/dialog.dart';

class NetworkController extends GetxController {
  static NetworkController get instance => Get.find();

  // Variables ----------------
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  // onInit ----------------
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Methods ----------------
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus.value = result.isNotEmpty ? result.first : ConnectivityResult.none;
  }

  Future<bool> isConnected() async {
    try {
      final List<ConnectivityResult> result = await _connectivity.checkConnectivity();
      if (result.isEmpty || result.first == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  Future<bool> checkNetwork() async {
    bool hasConnect = await isConnected();
    if (!hasConnect) {
      TDialog.showSnackBar(L.of(Get.context!).errors_network_text, title: L.of(Get.context!).errors_network);
      return false;
    } else {
      return true;
    }
  }

  // onClose ----------------
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
