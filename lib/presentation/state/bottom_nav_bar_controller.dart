import 'package:crafty_bay_ruhulaminjr/presentation/state/auth_controller.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  int _index = 0;

  void changeIndex(int idx) async {
    if (idx >= 2 && idx <= 3) {
      if (await Get.find<AuthController>().isLoggedIn()) {
        _index = idx;
        update();
        return;
      }
      return;
    }
    _index = idx;
    update();
  }

  int get getIndex => _index;
}
