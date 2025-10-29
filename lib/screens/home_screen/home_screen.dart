import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/home_screen/controller/home_controller.dart';
import 'package:test_project/widgets/app_drawer_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return AppDrawerScaffold(
      drawerController: controller.advancedDrawerController,
      title: 'Home',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
