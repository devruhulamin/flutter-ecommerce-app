import 'package:flutter/foundation.dart' show immutable;

@immutable
class ApiUrl {
  static const baseUrl = 'https://craftybay.teamrabbil.com/api';
  static String otpSendUrl({required String email}) =>
      '$baseUrl/UserLogin/$email';
  static String otpVerifyUrl({required String email, required String otp}) =>
      '$baseUrl/VerifyLogin/$email/$otp';
  static const String readProfileUrl = '$baseUrl/ReadProfile';
  static const String createProfileUrl = '$baseUrl/CreateProfile';
  static const String listProductSliderUrl = '$baseUrl/ListProductSlider';
  static const String categoryListUrl = '$baseUrl/CategoryList';
}
