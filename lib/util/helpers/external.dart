import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tproject/languages/L.dart';
import 'package:tproject/util/helpers/dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class TExternal {
  static void launchMail(String mail, {String? subject, String? body}) async {
    final subjectEncoded = subject != null ? Uri.encodeComponent(subject) : null;
    final bodyEncoded = body != null ? Uri.encodeComponent(body) : null;

    final query = [
      if (subjectEncoded != null) 'subject=$subjectEncoded',
      if (bodyEncoded != null) 'body=$bodyEncoded',
    ].join('&');

    final uri = Uri.parse('mailto:$mail?$query');

    if (!await launchUrl(uri)) {
      throw Exception('Could not move to $mail');
    }
  }

  static void launchPhone(String phoneNumber) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(uri)) {
      throw Exception('Could not call to $phoneNumber');
    }
  }

  static void launchWebUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  static void share(String url) {
    Share.shareUri(Uri.parse(url));
  }

  static Future<bool> getPermission(Permission permission, {Widget? permissionPopup}) async {
    PermissionStatus status = await permission.request();
    print('status ${status}');

    if (status.isGranted) {
      return true;
    } else {
      if (permissionPopup != null) TDialog.showActionMenu(content: permissionPopup);
      return false;
    }
  }

  static Future<XFile?> pickImageFromGallery({int maxSize = 20, Widget? permissionPopup}) async {
    XFile? file = await pickFile(type: ImageSource.gallery, permission: Permission.mediaLibrary, maxSize: maxSize, permissionPopup: permissionPopup);
    return file;
  }

  static Future<XFile?> pickPhoto({int maxSize = 20, Widget? permissionPopup}) async {
    XFile? file = await pickFile(type: ImageSource.camera, permission: Permission.camera, maxSize: maxSize, permissionPopup: permissionPopup);
    return file;
  }
}

// Pick file
Future<XFile?> pickFile({required ImageSource type, required Permission permission, required int maxSize, Widget? permissionPopup}) async {
  bool hasPermission = kDebugMode ?? await TExternal.getPermission(permission, permissionPopup: permissionPopup);
  print('hasPermission ${hasPermission}');

  if (hasPermission) {
    // Picker
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: type, imageQuality: 75);

    if (image != null) {
      // Check type file
      final allowedExtensions = ['png', 'jpeg', 'jpg'];
      final fileExtension = image.path.split('.').last.toLowerCase();

      if (!allowedExtensions.contains(fileExtension)) {
        TDialog.showSnackBar(L.of(Get.context!).errors_image_type, isError: true);
        return null;
      }

      // Check size file
      final fileSize = await image.length();
      int maxSizeBytes = maxSize * 1024 * 1024;

      if (fileSize > maxSizeBytes) {
        TDialog.showSnackBar(L.of(Get.context!).errors_image_size(maxSize), isError: true);
        return null;
      } else {
        return image;
      }
    }
  }
}
