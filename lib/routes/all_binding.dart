import 'package:get/get.dart';
import 'package:quick_start/screens/splash_screen/controller/splash_controller.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    //splash
    Get.lazyPut<SplashController>(() => SplashController());
   
  
    // Get.lazyPut<SignInController>(() => SignInController());
    // Get.lazyPut<SignUpController>(() => SignUpController());
    
  }
}
