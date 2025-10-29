import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:quick_start/routes/app_routes.dart';
import 'package:quick_start/services/api/api.dart';
import 'package:quick_start/services/api/non_auth_api.dart';
import 'package:quick_start/services/storage_services/get_storage_services.dart';
import 'package:quick_start/widgets/app_log/error_log.dart';

class ApiServices {
  ///////////////
  ApiServices._privateConstructor();
  static final ApiServices _instance = ApiServices._privateConstructor();
  static ApiServices get instance => _instance;
  //////////  object
  final api = NonAuthApi();
  final apiAuth = AppApi.instance;
  var storageServices = GetStorageServices.instance;
  Future<dynamic> apiPutServices({
    required String url,
    dynamic body,
    int statusCode = 200,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await apiAuth.sendRequest.put(
        url,
        data: body,
        queryParameters: query,
      );
      if (response.statusCode == statusCode) {
        return response.data;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      Get.snackbar(
        "error",
        "Check Your Internet Connection",
        duration: const Duration(milliseconds: 800),
      );
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response.runtimeType != Null) {
        Get.snackbar(
          "error",
          "Dio Acception Throw",
          duration: const Duration(milliseconds: 800),
        );
        // if (e.response?.statusCode == 401) {
        //   await storageServices.storageClear();
        //   Get.offAllNamed(AppRoutes.signIn);
        // }

        // if (e.response?.data["message"].runtimeType != Null) {
        //   AppSnackBar.error("${e.response?.data["message"]}");
        // }

        // return null;
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  Future<dynamic> apiPostServices({
    required String url,
    dynamic body,
    int statusCodeStart = 200,
    int statusCodeEnd = 299,
    Map<String, dynamic>? query,
    String? customAuthToken,
  }) async {
    try {
      // final dynamic response = await api.sendRequest.post(url, data: body);
      final dynamic response = await apiAuth.sendRequest.post(
        url,
        data: body,
        queryParameters: query,
        options: customAuthToken != null
            ? Options(headers: {"Authorization": customAuthToken})
            : null,
      );
      if (response.statusCode >= statusCodeStart &&
          response.statusCode <= statusCodeEnd) {
        return response.data;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      Get.snackbar(
        "error",
        "Check Your Internet Connection",
        duration: const Duration(milliseconds: 800),
      );
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response.runtimeType != Null) {
        if (e.response?.statusCode == 401) {
          await storageServices.storageClear();
          Get.offAllNamed(AppRoutes.instance.signinScreen);
        }

        if (e.response?.data["message"].runtimeType != Null) {
          Get.snackbar(
            "error",
            "${e.response?.data["message"]}",
            duration: const Duration(milliseconds: 800),
          );
        }

        return null;
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  Future<dynamic> apiGetServices(
    String url, {
    int statusCode = 200,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    try {
      final response = await AppApi.instance.sendRequest.get(
        url,
        queryParameters: queryParameters,
        data: body,
      );

      if (response.statusCode == statusCode) {
        // এখানে চেক করছি যে, response.data ম্যাপ কি লিস্ট
        if (response.data is Map<String, dynamic>) {
          return response.data; // ম্যাপ থাকলে ম্যাপ রিটার্ন
        } else if (response.data is List) {
          return response.data; // লিস্ট থাকলে লিস্ট রিটার্ন
        } else {
          return response
              .data; // যদি কিছু অন্য ধরনের ডেটা আসে, তাহলে সোজা সেই ডেটা রিটার্ন
        }
      } else {
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      Get.snackbar("error", "Check Your Internet Connection");
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 401) {
          await storageServices.storageClear();
          Get.offAllNamed(AppRoutes.instance.signinScreen);
        }

        if (e.response?.data["message"] != null) {
          Get.snackbar(
            "error",
            "${e.response?.data["message"]}",
            duration: const Duration(milliseconds: 800),
          );
        }
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  Future<dynamic> apiPatchServices({
    required String url,
    Object? body,
    int statusCode = 200,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      final response = await apiAuth.sendRequest.patch(
        url,
        data: body,
        queryParameters: query,
        options: options,
      );

      if (response.statusCode == statusCode) {
        return response.data;
      } else {
        Get.snackbar(
          "error",
          "Unexpected response: ${response.statusCode} ${response.statusMessage}"
              "Unexpected response: ${response.statusCode} ${response.statusMessage}",
          duration: const Duration(milliseconds: 800),
        );
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      Get.snackbar(
        "error",
        "Check Your Internet Connection",
        duration: const Duration(milliseconds: 800),
      );
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response.runtimeType != Null) {
        if (e.response?.statusCode == 401) {
          await storageServices.storageClear();
          Get.offAllNamed(AppRoutes.instance.signinScreen);
        }

        if (e.response?.data["message"].runtimeType != Null) {
          Get.snackbar(
            "error",
            "${e.response?.data["message"]}",
            duration: const Duration(milliseconds: 800),
          );
        }

        return null;
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  Future<dynamic> apiDeleteServices({
    required String url,
    Object? body,
    int statusCode = 200,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      final response = await apiAuth.sendRequest.delete(
        url,
        data: body,
        queryParameters: query,
        options: options,
      );

      if (response.statusCode == statusCode) {
        return response.data;
      } else {
        Get.snackbar(
          "error",
          "Unexpected response: ${response.statusCode} ${response.statusMessage}",
          duration: const Duration(milliseconds: 800),
        );
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      Get.snackbar(
        "error",
        "Check Your Internet Connection",
        duration: const Duration(milliseconds: 800),
      );
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response.runtimeType != Null) {
        if (e.response?.statusCode == 401) {
          await storageServices.storageClear();
          Get.offAllNamed(AppRoutes.instance.signinScreen);
        }

        if (e.response?.data["message"].runtimeType != Null) {
          Get.snackbar(
            "error",
            "${e.response?.data["message"]}",
            duration: const Duration(milliseconds: 800),
          );
        }

        return null;
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  Future<dynamic> apiPatchMultipartServices({
    required String url,
    Map<String, String> fields = const {},
    Map<String, String> files = const {},
    int statusCode = 200,
  }) async {
    try {
      // Create FormData to hold both fields and files
      final Map<String, dynamic> formDataMap = {};
      formDataMap.addAll(fields);

      // Convert file paths to MultipartFile objects
      for (var entry in files.entries) {
        if (entry.value.isNotEmpty) {
          final file = File(entry.value);
          if (await file.exists()) {
            formDataMap[entry.key] = await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            );
          }
        }
      }
      final formData = FormData.fromMap(formDataMap);

      // Send the request
      final response = await apiAuth.sendRequest.patch(
        url,
        data: formData, // The data is now FormData, not a JSON object
      );

      // Handle the response
      if (response.statusCode == statusCode) {
        return response.data;
      } else {
        Get.snackbar(
          "Error",
          "Unexpected response: ${response.statusCode} ${response.statusMessage}",
        );
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      Get.snackbar("Error", "Check Your Internet Connection");
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 401) {
          await storageServices.storageClear();
          Get.offAllNamed(AppRoutes.instance.signinScreen);
        }
        if (e.response?.data["message"] != null) {
          Get.snackbar("Error", "${e.response?.data["message"]}");
        }
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  /// Upload multiple images as files
  Future<dynamic> apiPostMultipleImagesServices({
    required String url,
    required List<File> images,
    Map<String, dynamic> additionalFields = const {},
    String fileFieldName = 'images',
    int statusCodeStart = 200,
    int statusCodeEnd = 299,
  }) async {
    try {
      // Create FormData
      final formData = FormData();

      // Add additional fields if any
      additionalFields.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });

      // Add multiple image files
      for (int i = 0; i < images.length; i++) {
        String fileName = images[i].path.split('/').last;
        formData.files.add(
          MapEntry(
            fileFieldName, // Use the same field name for multiple files
            await MultipartFile.fromFile(
              images[i].path,
              filename: fileName,
            ),
          ),
        );
      }

      // Send the request
      final response = await apiAuth.sendRequest.post(
        url,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      // Handle the response
      if (response.statusCode != null &&
          response.statusCode! >= statusCodeStart &&
          response.statusCode! <= statusCodeEnd) {
        return response.data;
      } else {
        Get.snackbar(
          "Error",
          "Unexpected response: ${response.statusCode} ${response.statusMessage}",
          duration: const Duration(milliseconds: 800),
        );
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      Get.snackbar(
        "Error",
        "Check Your Internet Connection",
        duration: const Duration(milliseconds: 800),
      );
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      Get.snackbar(
        "Error",
        "Request timed out. Please try again.",
        duration: const Duration(milliseconds: 800),
      );
      return null;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 401) {
          await storageServices.storageClear();
          Get.offAllNamed(AppRoutes.instance.signinScreen);
        }
        if (e.response?.data != null && e.response?.data["message"] != null) {
          Get.snackbar(
            "Error",
            "${e.response?.data["message"]}",
            duration: const Duration(milliseconds: 800),
          );
        }
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      Get.snackbar(
        "Error",
        "Failed to upload images",
        duration: const Duration(milliseconds: 800),
      );
      return null;
    }
  }
}
