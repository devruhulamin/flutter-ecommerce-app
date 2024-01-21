import 'package:crafty_bay_ruhulaminjr/data/model/profile.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class ProfileDataController extends GetxController {
  bool _isloading = false;
  Profile? _profile;
  bool _isCompleted = false;
  bool get isLoading => _isloading;
  Profile? get getProfileData => _profile;
  bool get isProfileCompleted => _isCompleted;
  Future<bool> readProfileData(String token) async {
    _isloading = true;
    update();
    try {
      final response =
          await NetworkCaller().getRequiest(url: ApiUrl.baseUrl, token: token);
      if (response.isSuccess) {
        final profiledata = response.responseData['data'];
        if (profiledata.isEmpty) {
          _isCompleted = false;
        } else {
          _profile = Profile.fromJson(profiledata);
          _isCompleted = true;
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
