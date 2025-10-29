import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/routes/app_routes.dart';
import 'package:test_project/routes/app_routes_file.dart';

class MyApp extends StatelessWidget {
  final bool? onboardingComplete;
  const MyApp({super.key, this.onboardingComplete});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Quick Start',
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 200),
          getPages: appRootRoutesFile,
          initialRoute: AppRoutes.instance.initial,
        );
      },
    );
  }
}
