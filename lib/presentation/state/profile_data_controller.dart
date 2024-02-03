import 'package:crafty_bay_ruhulaminjr/data/model/profile.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:crafty_bay_ruhulaminjr/main.dart';
import 'package:get/get.dart';

class ProfileDataController extends GetxController {
  bool _isloading = false;
  Profile _profile = Profile();
  bool _isCompleted = false;
  bool get isLoading => _isloading;
  Profile get getProfileData => _profile;
  bool get isProfileCompleted => _isCompleted;
  Future<bool> readProfileData(String token) async {
    _isloading = true;
    update();
    try {
      final response = await NetworkCaller()
          .getRequiest(url: ApiUrl.readProfileUrl, token: token);
      if (response.isSuccess) {
        final profiledata = response.responseData['data'];
        if (profiledata == null) {
          _isCompleted = false;
          update();
        } else {
          _profile = Profile.fromJson(profiledata[0]);
          _isCompleted = true;
          update();
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      e.log();
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
