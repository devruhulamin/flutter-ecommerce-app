import 'package:crafty_bay_ruhulaminjr/data/model/local_storage.dart';
import 'package:crafty_bay_ruhulaminjr/data/model/profile.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  String? token;
  Profile? userProfile;
  final _localStorage = AuthLocalStorage();

  Future<bool> isLoggedIn() async {
    await initilize();
    return token != null;
  }

  Future<void> saveToken(String authtoken) async {
    await _localStorage.saveToken(authtoken);
    token = authtoken;
  }

  Future<void> saveProfle(Profile profile) async {
    await _localStorage.saveProfileData(profile);
    userProfile = profile;
  }

  Future<void> initilize() async {
    userProfile = await _localStorage.getProfileData();
    token = await _localStorage.getToken();
  }

  Future<String?> getToken() async {
    return await _localStorage.getToken();
  }

  Future<bool> logOut() async {
    return _localStorage.clearAuthData();
  }
}
