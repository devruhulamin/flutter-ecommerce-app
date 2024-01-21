import 'dart:convert';

import 'package:crafty_bay_ruhulaminjr/data/model/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
  static final AuthLocalStorage _instance = AuthLocalStorage._internal();

  factory AuthLocalStorage() {
    return _instance;
  }

  AuthLocalStorage._internal();

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
    final profile = jsonEncode(profileData);
    prefs.setString('profile', profile);
  }

  Future<Profile?> getProfileData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final profileString = prefs.getString('profile');
    if (profileString == null) {
      return null;
    }
    final profile = Profile.fromJson(jsonDecode(profileString));
    return profile;
  }

  Future<bool> clearAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}
