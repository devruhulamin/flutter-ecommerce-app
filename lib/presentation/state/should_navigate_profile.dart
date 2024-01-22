import 'package:crafty_bay_ruhulaminjr/presentation/state/profile_data_controller.dart';
import 'package:get/get.dart';

class ShouldNavigateCompleteProfileController extends GetxController {
  bool _isloading = false;
  bool get isLoading => _isloading;
  String _errorMessage = '';
  String get getErrorMessage => _errorMessage;
  bool _shouldNavigate = false;
  bool get shouldNavigate => _shouldNavigate;

  Future<bool> shouldNavigateCompleteProfile(String token) async {
    _isloading = true;
    update();
    try {
      final result =
          await Get.find<ProfileDataController>().readProfileData(token);
      if (result) {
        final isCompleted =
            Get.find<ProfileDataController>().isProfileCompleted;
        if (isCompleted) {
          _shouldNavigate = true;
        } else {
          _shouldNavigate = false;
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = 'error is $e';
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
