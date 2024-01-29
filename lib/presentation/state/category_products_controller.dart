import 'package:crafty_bay_ruhulaminjr/data/model/popular_product_item.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class CategoryProductsController extends GetxController {
  bool _isloading = false;
  bool get isLoading => _isloading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  String _categoryTitle = '';
  String get categoryTitle => _categoryTitle;
  List<ProductItem> _productItems = [];
  List<ProductItem> get productList => _productItems;
  Future<bool> loadCategoryProducts({required int id}) async {
    _isloading = true;
    update();
    try {
      final response = await NetworkCaller()
          .getRequiest(url: ApiUrl.productsByCategoryUrl(id.toString()));
      if (response.isSuccess) {
        _productItems = [];
        for (final item in response.responseData['data']) {
          _productItems.add(ProductItem().fromJson(item));
        }
        _categoryTitle = _productItems[0].category?.categoryName ?? 'Unknown';
        update();
        return true;
      }
      _errorMessage = response.errorMessage ?? 'something went wrong';
      return false;
    } catch (e) {
      _errorMessage = 'Error Wast $e';
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
