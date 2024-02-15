import 'package:crafty_bay_ruhulaminjr/data/model/popular_product_item.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/typedefs/remarks_type.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class NewProductsController extends GetxController {
  bool _isloading = false;
  bool get isloading => _isloading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  final List<ProductItem> _products = [];
  List<ProductItem> get getProducts => _products;

  Future<bool> loadProduct() async {
    _isloading = true;
    update();
    try {
      final remarksUrl =
          ApiUrl.productByRemarks(RemarksType.newproduct.getName);
      final response = await NetworkCaller().getRequiest(url: remarksUrl);
      for (final data in response.responseData['data']) {
        _products.add(ProductItem().fromJson(data));
      }
      return true;
    } catch (e) {
      _errorMessage = 'Error Was $e';
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
