import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class NearbyController extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  @override
  void onClose() {
    advancedDrawerController.dispose();
    super.onClose();
  }
}
