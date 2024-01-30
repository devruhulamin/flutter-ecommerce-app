import 'package:crafty_bay_ruhulaminjr/data/model/cart_item_payload.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _isloading = false;
  String _errorMessage = '';
  bool get isLoading => _isloading;
  String get getErrorMessage => _errorMessage;
  Future<bool> addToCart(CartItemPayload cartItem) async {
    _isloading = true;
    update();
    try {
      final response = await NetworkCaller().postRequiest(
        url: ApiUrl.addToCartUrl,
        body: cartItem,
      );
      if (response.isSuccess) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = 'error was $e';
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
