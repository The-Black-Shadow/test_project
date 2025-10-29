class AppRoutes {
  AppRoutes._privateConstructor();
  static final AppRoutes _instance = AppRoutes._privateConstructor();
  static AppRoutes get instance => _instance;
  /////////////  initial or splash screen
  final String initial = "/";
  final String onBoarding = "/onboarding";
  final String errorScreen = '/errorScreen';
  final String navigationScreen = '/navigationScreen';
  final String signinScreen = '/signinScreen';
  final String signupScreen = '/signupScreen';
  final String homeScreen = '/homeScreen';
  final String profileScreen = '/profileScreen';
  final String nearbyScreen = '/nearbyScreen';
}
