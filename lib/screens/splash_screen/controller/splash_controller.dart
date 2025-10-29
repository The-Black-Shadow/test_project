import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_start/routes/app_routes.dart';
import 'package:quick_start/services/storage_services/get_storage_services.dart';
import 'package:quick_start/widgets/app_log/app_print.dart';
import 'package:quick_start/widgets/app_log/error_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  Future<void> onInitialDataLoadScreen() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storage = GetStorageServices.instance;
      final bool onboardingComplete =
          prefs.getBool('onboardingComplete') ?? false;
      //check token
      final token = storage.getToken();
      final userData = storage.getUserData();
      AppPrint.appLog("Token from storage: $token");
      AppPrint.appLog("User Data from storage: $userData");
      // if (token.isNotEmpty && userData != null) {
      //   if (userData.role == Role.CUSTOMER.name) {
      //     Future.delayed(Duration(seconds: 3), () {
      //       Get.offAllNamed(AppRoutes.instance.customerDashboardScreen);
      //     });
      //   } else if (userData.role == Role.PROVIDER.name) {
      //     Future.delayed(Duration(seconds: 3), () {
      //       Get.offAllNamed(AppRoutes.instance.serviceDashboardScreen);
      //     });
      //   } else {
      //     Future.delayed(Duration(seconds: 3), () {
      //       Get.offAllNamed(AppRoutes.instance.onBoarding);
      //     });
      //   }
      // } else {
      Future.delayed(Duration(seconds: 3), () {
        if (onboardingComplete) {
          Get.offAllNamed(AppRoutes.instance.navigationScreen);
        } else {
          Get.offAllNamed(AppRoutes.instance.onBoarding);
        }
      });
      //}
    } catch (e) {
      errorLog("onInitialDataLoadScreen", e);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAllNamed(AppRoutes.instance.errorScreen);
      });
    }
  }

  @override
  void onInit() {
    onInitialDataLoadScreen();
    super.onInit();
  }
}
