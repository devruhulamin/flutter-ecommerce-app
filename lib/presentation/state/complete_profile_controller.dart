import 'package:crafty_bay_ruhulaminjr/data/model/profile.dart';
import 'package:crafty_bay_ruhulaminjr/data/model/profile_payload.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/auth_controller.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool _isloading = false;
  bool get isloading => _isloading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  Profile _profile = Profile();

  Profile get profile => _profile;

  Future<bool> completeProfile(
      {required String token, required ProfilePayload profile}) async {
    _isloading = true;
    update();
    try {
      final response = await NetworkCaller().postRequiest(
          url: ApiUrl.createProfileUrl, token: token, body: profile);
      if (response.isSuccess) {
        _profile = Profile.fromJson(response.responseData['data']);
        Get.find<AuthController>().saveToken(token);
        Get.find<AuthController>().saveProfle(_profile);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = 'erroe is $e';
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
