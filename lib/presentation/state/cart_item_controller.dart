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
  final RxDouble _totalCardItemPrice = 0.0.obs;
  RxDouble get totalCardItemPrice => _totalCardItemPrice;

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

        calculateTotal();
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

  Future<void> deleteItem(int? id) async {
    _isloading = true;
    update();
    try {
      final response = await NetworkCaller()
          .getRequiest(url: ApiUrl.deleteCartItem(id.toString()));
      // print(response.isSuccess);
      if (response.isSuccess) {
        await loadItems();
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isloading = false;
      update();
    }
  }

  void updatequantity(int id, int qty) {
    _items.firstWhere((element) => element.productId == id).qty =
        qty.toString();
    calculateTotal();
  }

  void calculateTotal() {
    double totalprice = 0.0;
    for (var item in _items) {
      final price = double.parse(item.product?.price ?? "0.0");
      final qty = int.parse(item.qty ?? '1');
      totalprice += (price * qty);
    }
    totalCardItemPrice.value = totalprice;
  }
}
