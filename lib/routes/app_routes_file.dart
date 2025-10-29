import 'package:get/get.dart';
import 'package:test_project/routes/all_binding.dart';
import 'package:test_project/routes/app_routes.dart';
import 'package:test_project/screens/nearby_screen/nearby_screen.dart';
import 'package:test_project/screens/home_screen/home_screen.dart';
import 'package:test_project/screens/profile_screen/profile_screen.dart';

List<GetPage> appRootRoutesFile = <GetPage>[
  GetPage(
    name: AppRoutes.instance.initial,
    binding: AllBinding(),
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.homeScreen,
    binding: AllBinding(),
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.profileScreen,
    binding: AllBinding(),
    page: () => const ProfileScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.nearbyScreen,
    binding: AllBinding(),
    page: () => const NearbyScreen(),
  ),
  // GetPage(
  //   name: AppRoutes.instance.settingsScreen,
  //   binding: AllBinding(),
  //   page: () => const SettingsScreen(),
  // ),

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
