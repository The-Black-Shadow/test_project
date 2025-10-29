import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:test_project/routes/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  final AdvancedDrawerController drawerController;

  const CustomDrawer({super.key, required this.drawerController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 24.0),
            ListTile(
              onTap: () {
                drawerController.hideDrawer();
                Get.toNamed(AppRoutes.instance.homeScreen);
              },
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            ListTile(
              onTap: () {
                drawerController.hideDrawer();
                Get.toNamed(AppRoutes.instance.profileScreen);
              },
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text('Profile'),
            ),
            ListTile(
              onTap: () {
                drawerController.hideDrawer();
                Get.toNamed(AppRoutes.instance.nearbyScreen);
              },
              leading: const Icon(Icons.location_on),
              title: const Text('Nearby'),
            ),

            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(fontSize: 12, color: Colors.white54),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Text('Terms of Service | Privacy Policy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
