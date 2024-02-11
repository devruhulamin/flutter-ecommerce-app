import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/auth_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/profile_data_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String _token = '';
  String get getToken => _token;
  String get errorMessage => _errorMessage;
  bool __isCompleted = false;
  bool get isProfileCompleted => __isCompleted;

  Future<bool> verifyOtp({required String email, required String otp}) async {
    _isLoading = true;
    update();
    try {
      final verifyUrl = ApiUrl.otpVerifyUrl(email: email, otp: otp);
      final response = await NetworkCaller().getRequiest(url: verifyUrl);
      if (response.isSuccess) {
        _token = response.responseData['data'];
        await Future.delayed(const Duration(seconds: 3));
        final result =
            await Get.find<ProfileDataController>().readProfileData(_token);
        if (result) {
          __isCompleted = Get.find<ProfileDataController>().isProfileCompleted;
          update();
          // if the profile is complete
          if (__isCompleted) {
            final authContoller = Get.find<AuthController>();

            await authContoller.saveToken(_token);
            await authContoller
                .saveProfle(Get.find<ProfileDataController>().getProfileData);
          }
          return true;
        } else {
          return false;
        }
      } else {
        _errorMessage = response.errorMessage ?? 'Error happens';
        return false;
      }
    } catch (e) {
      _errorMessage = 'Error is $e';
      return false;
    } finally {
      _isLoading = false;
      update();
    }
  }
}
