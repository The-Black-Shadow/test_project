import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  NetworkService._internal();

  static NetworkService get instance => _instance;

  /// Check if device has internet connectivity
  Future<bool> hasInternetConnection() async {
    try {
      // Try to lookup a reliable server to verify internet access
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Show no internet dialog
  void showNoInternetDialog() {
    if (Get.isDialogOpen == true) {
      Get.back(); // Close any existing dialog
    }

    Get.dialog(
      // ignore: deprecated_member_use
      WillPopScope(
        onWillPop: () async => false, // Prevent closing by back button
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(
                Icons.wifi_off,
                color: Colors.red,
                size: 28,
              ),
              const SizedBox(width: 10),
              const Text(
                'No Internet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'No Internet Connection!',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please turn on your Wi-Fi or Mobile Data.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Get.back();
                // Check again after user clicks retry
                final hasInternet = await hasInternetConnection();
                if (!hasInternet) {
                  // Still no internet, show dialog again
                  Future.delayed(const Duration(milliseconds: 300), () {
                    showNoInternetDialog();
                  });
                }
              },
              child: const Text(
                'Retry',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Check internet and show dialog if not available
  Future<bool> checkAndShowDialog() async {
    final hasInternet = await hasInternetConnection();
    
    if (!hasInternet) {
      showNoInternetDialog();
      return false;
    }
    
    return true;
  }
}
