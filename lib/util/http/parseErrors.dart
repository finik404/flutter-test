import 'package:get/get.dart';
import 'package:tproject/languages/L.dart';

String? parseErrors(dynamic errors) {
  String? error;

  // Special errors
  if (errors?['messages']?['credentials_incorrect']?[0] == 'The provided credentials are incorrect.') {
    return error = L.of(Get.context!).errors_auth;
  }
  if (errors?['messages']?['email']?[0] == 'The email has already been taken.') {
    return error = L.of(Get.context!).errors_email_unique;
  }
  if (errors?['messages']?['reset_code_invalid']?[0] == 'Введен неверный код для восстановления пароля') {
    return error = L.of(Get.context!).errors_auth_code;
  }

  // Another errors
  String extractErrors(dynamic obj) {
    StringBuffer buffer = StringBuffer();

    if (obj is Map) {
      obj.forEach((key, value) {
        buffer.write(extractErrors(value));
      });
    } else if (obj is List) {
      for (var item in obj) {
        buffer.write(extractErrors(item));
      }
    } else if (obj is String) {
      buffer.writeln(obj);
    }
    return buffer.toString();
  }
  error = extractErrors(errors);

  return error.isNotEmpty == true ? error : null;
}