import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class SendEmailOtpController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> sendOtp({required String email}) async {
    _isLoading = true;
    update();
    final response =
        await NetworkCaller().getRequiest(url: ApiUrl.otpSendUrl(email: email));
    if (response.isSuccess) {
      _isLoading = false;
      update();
      return true;
    } else {
      _isLoading = false;
      update();
      _errorMessage = response.errorMessage ?? 'Error happens';
      return true;
    }
  }
}
