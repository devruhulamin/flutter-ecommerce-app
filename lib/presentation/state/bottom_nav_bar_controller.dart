import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  int _index = 0;

  void changeIndex(int idx) {
    _index = idx;
    update();
  }

  int get getIndex => _index;
}
