import 'package:crafty_bay_ruhulaminjr/data/model/profile.dart';

class ProfileDataWithToken {
  final String token;
  final Profile? profileData;
  final bool isProfileEmpty;

  ProfileDataWithToken(
      {required this.token, this.profileData, required this.isProfileEmpty});
}
