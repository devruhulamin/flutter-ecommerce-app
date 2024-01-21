import 'package:crafty_bay_ruhulaminjr/data/model/profile.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:crafty_bay_ruhulaminjr/data/model/local_storage.dart';
import 'package:get/get.dart';

typedef IsProfileCompleted = bool;

class GetProfileController extends GetxController {
  bool _isloading = false;
  bool get isLoading => _isloading;

  Future<IsProfileCompleted> getProfileData() async {
    _isloading = true;
    update();
    try {
      final localStorage = AuthLocalStorage();
      final token = await localStorage.getToken();
      final response =
          await NetworkCaller().getRequiest(url: ApiUrl.baseUrl, token: token);
      if (response.isSuccess) {
        final profiledata = response.responseData['data'];
        if (profiledata == null) {
          return false;
        } else {
          final profile = Profile.fromJson(profiledata[0]);
          await localStorage.saveProfileData(profile);
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
