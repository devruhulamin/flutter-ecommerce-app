import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/local_storage.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> verifyOtp({required String email, required String otp}) async {
    _isLoading = true;
    update();
    final response = await NetworkCaller()
        .getRequiest(url: ApiUrl.otpVerifyUrl(email: email, otp: otp));
    if (response.isSuccess) {
      _isLoading = false;

      final token = response.responseData['data'];
      LocalStorage().saveToken(token);
      update();
      return true;
    } else {
      _isLoading = false;
      update();
      _errorMessage = response.errorMessage ?? 'Error happens';
      return false;
    }
  }
}
