import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tproject/app.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/private.dart';
import 'package:tproject/util/helpers/device.dart';
import 'package:tproject/util/helpers/network/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Only vertical device orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // StatusBar and navigationBar colors
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: TDevice.isIOS() ? Brightness.light : Brightness.dark,
      statusBarIconBrightness: TDevice.isIOS() ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: TColors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  Gemini.init(apiKey: TPrivates.geminiKey);

  // Local storage
  await GetStorage.init();

  // runApp
  runApp(const App());

  // Network checker
  NetworkBinding.init();
}
