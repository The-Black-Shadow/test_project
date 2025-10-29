import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/profile_screen/controller/profile_controller.dart';
import 'package:test_project/widgets/app_drawer_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return AppDrawerScaffold(
      drawerController: controller.advancedDrawerController,
      title: 'Profile',
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Profile Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
