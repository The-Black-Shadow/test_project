import 'package:get/get.dart';
import 'package:quick_start/routes/all_binding.dart';
import 'package:quick_start/routes/app_routes.dart';
import 'package:quick_start/screens/splash_screen/splash_screen.dart';

List<GetPage> appRootRoutesFile = <GetPage>[
  GetPage(
    name: AppRoutes.instance.initial,
    binding: AllBinding(),
    page: () => const SplashScreen(),
  ),
  // GetPage(
  //   name: AppRoutes.instance.onBoarding,
  //   //binding: OnBoardingBinding(),
  //   page: () => OnboardingScreen(),
  // ),
  
  // GetPage(
  //   name: AppRoutes.instance.signinScreen,
  //   binding: AllBinding(),
  //   page: () => CustomerSigninScreen(),
  // ),
  // GetPage(
  //   name: AppRoutes.instance.signupScreen,
  //   binding: AllBinding(),
  //   page: () => const CustomerSignupScreen(),
  // ),
  
];
