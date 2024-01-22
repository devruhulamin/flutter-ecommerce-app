import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String? _token;
  String? get getToken => _token;
  String get errorMessage => _errorMessage;

  Future<bool> verifyOtp({required String email, required String otp}) async {
    _isLoading = true;
    update();
    try {
      final response = await NetworkCaller()
          .getRequiest(url: ApiUrl.otpVerifyUrl(email: email, otp: otp));
      if (response.isSuccess) {
        _token = response.responseData['data'];
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
