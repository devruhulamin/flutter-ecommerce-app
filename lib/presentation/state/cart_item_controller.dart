import 'package:crafty_bay_ruhulaminjr/data/model/cart_item_mode.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController {
  bool _isloading = false;
  String _errorMessage = '';
  bool get isLoading => _isloading;
  String get getErrorMessage => _errorMessage;
  List<CartItemModel> _items = [];
  List<CartItemModel> get getItems => _items;

  Future<bool> loadItems() async {
    _isloading = true;
    update();
    try {
      final response =
          await NetworkCaller().getRequiest(url: ApiUrl.getCartItemUrl);
      if (response.isSuccess) {
        List<CartItemModel> items = [];
        for (final item in response.responseData['data']) {
          items.add(CartItemModel.fromJson(item));
        }
        _items = items;
        return true;
      }
      return false;
    } catch (e) {
      _errorMessage = "Erroe was $e";
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
