import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tproject/util/constants/private.dart';
import 'package:tproject/util/helpers/dialog.dart';
import 'package:tproject/util/http/parseErrors.dart';

class THttp {
  static final Dio dio = Dio();

  // Fetch ----------------
  static Future<ResponseModel> fetch(
      String url, {
        Map<String, dynamic>? query,
        Map<String, dynamic>? body,
        Map<String, String>? form,
        HttpMethods method = HttpMethods.get,
        bool hasWarning = true,
        bool hasData = true,
      }) async {
    // Base url
    String baseUrl = TPrivates.apiUrl;

    // Headers
    Options options = Options(
      headers: {
        'Accept': 'application/json',
      },
    );

    // Take token
    final storage = GetStorage();
    String? token = storage.read('auth_token');

    // Add token to headers
    if (token != null) {
      options.headers?['Authorization'] = 'Bearer $token';
    }

    // Create full url with query parameters
    Uri fullUrl = Uri.parse('$baseUrl$url').replace(
      queryParameters: query?.map((key, value) {
        return MapEntry(key, value.toString());
      }),
    );

    try {
      Response response;

      // POST method with formData
      if (method == HttpMethods.post && form != null && form.isNotEmpty) {
        FormData formData = FormData();

        // Add files to formData
        for (var entry in form.entries) {
          formData.files.add(
            MapEntry(
              entry.key,
              await MultipartFile.fromFile(entry.value),
            ),
          );
        }

        // Body
        if (body != null) {
          formData.fields.addAll(body.entries.map((entry) => MapEntry(entry.key, entry.value.toString())));
        }

        response = await dio.post(fullUrl.toString(), data: formData, options: options);
      }

      // Requests
      else if (method == HttpMethods.post) {
        response = await dio.post(fullUrl.toString(), data: body != null ? jsonEncode(body) : null, options: options);
      } else if (method == HttpMethods.patch) {
        response = await dio.patch(fullUrl.toString(), data: body != null ? jsonEncode(body) : null, options: options);
      } else if (method == HttpMethods.delete) {
        response = await dio.delete(fullUrl.toString(), data: body != null ? jsonEncode(body) : null, options: options);
      }

      // GET request
      else {
        response = await dio.get(fullUrl.toString(), options: options);
      }

      return ResponseModel(
        status: response.statusCode!,
        data: hasData ? response.data['data'] : response.data,
        isError: false,
      );
    }

    // Parse errors
    on DioException catch (e) {
      if (e.response != null) {
        String? errors = parseErrors(e.response?.data);
        if (hasWarning && errors != null) TDialog.showSnackBar(errors);

        return ResponseModel(
          status: e.response!.statusCode!,
          errors: e.response?.data,
          message: e.response?.data?['message'],
          isError: e.response!.statusCode != 200 || e.response!.statusCode != 201,
        );
      } else {
        rethrow;
      }
    }
  }
}

// Types
enum HttpMethods { get, post, patch, delete }

class ResponseModel {
  int status;
  dynamic data;
  dynamic errors;
  String? message;
  bool isError;

  ResponseModel({
    required this.status,
    this.data,
    this.errors,
    this.message,
    required this.isError,
  });
}
