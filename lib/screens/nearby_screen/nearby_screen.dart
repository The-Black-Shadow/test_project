import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/nearby_screen/controller/nearby_controller.dart';
import 'package:test_project/widgets/app_drawer_scaffold.dart';

class NearbyScreen extends StatelessWidget {
  const NearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NearbyController());

    return AppDrawerScaffold(
      drawerController: controller.advancedDrawerController,
      title: 'Nearby',
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.near_me, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Nearby Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
