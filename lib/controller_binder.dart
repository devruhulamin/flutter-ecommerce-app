import 'package:crafty_bay_ruhulaminjr/presentation/state/auth_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/banner_list_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/category_item_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/category_products_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/complete_profile_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/new_product_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/popular_product_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/profile_data_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/send_email_otp_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/special_product_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/verify_otp_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOtpController());
    Get.put(AuthController());
    Get.put(ProfileDataController());
    Get.put(CompleteProfileController());
    Get.put(BannerListController());
    Get.put(CategoryItemController());
    Get.put(PopularProductsController());
    Get.put(SpecialProductController());
    Get.put(NewProductsController());
    Get.put(CategoryProductsController());
  }
}
