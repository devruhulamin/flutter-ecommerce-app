import 'package:crafty_bay_ruhulaminjr/data/model/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._internal();

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }

  Future<void> saveProfileData(Profile profileData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final profile = profileData.toJson().toString();
    prefs.setString('profile', profile);
  }
}
