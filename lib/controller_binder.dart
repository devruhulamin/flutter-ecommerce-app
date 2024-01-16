import 'package:crafty_bay_ruhulaminjr/presentation/state/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/send_email_otp_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/verify_otp_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOtpController());
  }
}
