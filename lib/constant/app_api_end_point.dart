import 'package:flutter/foundation.dart';
import 'package:quick_start/widgets/app_log/error_log.dart';

class AppApiEndPoint {
  AppApiEndPoint._privateConstructor();
  static final AppApiEndPoint _instance = AppApiEndPoint._privateConstructor();
  static AppApiEndPoint get instance => _instance;

  //app use base
  static final String domain = _getDomain();
  final String baseUrl = "$domain/api/v1";
  final String imageUrl = domain;

  //auth
  final String login = "/auth/login";
  final String signup = "/user";
  final String verifyEmail = "/auth/verify-email";
  final String resendOtp = "/auth/resend-otp";
  final String forgotPassword = "/auth/forgot-password";
  final String resetPassword = "/auth/reset-password";
  //profile
  final String profile = "/user/profile";
  final String serviceInfoUpdate = "/services";
  final String changePassword = "/auth/change-password";
  final String contactUs = "/admin/contact";
  final String disclaimers = "/disclaimers";
  //dashboard
  final String categories = "/categories";

  //my services
  final String bookings = "/bookings/customer";
  final String createBooking = "/bookings"; // POST endpoint for creating booking
  //customer booking details
  String bookingDetails({required String bookingId}) => "/bookings/$bookingId";
  //service details
  String  service ({required String serviceId}) => "$baseUrl/services/$serviceId";
  String  rivewservice ({required String serviceId}) => "/services/$serviceId/reviews";
  String  getMessage ({required String chatId}) => "$baseUrl/messages/$chatId";
  String sendMessage({required String chatId}) => "$baseUrl/messages/$chatId/send";
 
  final String bookmarks = "/bookmarks";
  String toggleBookmark({required String serviceId}) => "/bookmarks/$serviceId";
  final String recentServices = "/recent-services";
  final String services = "/services"; // Get services by category
  final String chatList = "/chats";
  final String sentMessages = "/messages";
  final String notifications = "/notifications";
  final String notificationRead = "/notifications/read";
  final String reviews = "/reviews";

  final String serviceDetails = "/bookings/";
  static String providerUpcomingService(var page) =>
      "/bookings/provider/upcoming?page=$page";
  static String providerAllService(var page) => "/bookings/provider?page=$page";
  static String providerComplateService(var page) =>
      "/bookings/provider/completed?page=$page";
}

// Move this function outside the class
String _getDomain() {
  String liveServer = "http://10.10.7.51:5000";
  String localServer = "http://10.10.7.51:5000";

  // Alternative for Android Emulator (uncomment if using emulator):
  // String localServer = "http://10.0.2.2:5000";

  try {
    if (kDebugMode) {
      return localServer;
    }
    return liveServer;
  } catch (e) {
    errorLog("_getDomain", e);
    return liveServer;
  }
  // return liveServer;
}




