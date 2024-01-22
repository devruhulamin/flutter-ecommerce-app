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
  bool _shouldNavigate = false;
  bool get shouldNavigateCompleteProfile => _shouldNavigate;

  Future<bool> verifyOtp({required String email, required String otp}) async {
    _isLoading = true;
    update();
    try {
      final response = await NetworkCaller()
          .getRequiest(url: ApiUrl.otpVerifyUrl(email: email, otp: otp));
      if (response.isSuccess) {
        _token = response.responseData['data'];
        final result =
            await Get.find<ProfileDataController>().readProfileData(_token);
        if (result) {
          _shouldNavigate =
              Get.find<ProfileDataController>().isProfileCompleted;
          // if the profile is complete
          if (_shouldNavigate) {
            final authContoller = Get.find<AuthController>();

            authContoller.saveToken(_token);
            authContoller
                .saveProfle(Get.find<ProfileDataController>().getProfileData);
          }
        }
        return true;
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
