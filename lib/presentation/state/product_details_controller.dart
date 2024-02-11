import 'package:crafty_bay_ruhulaminjr/data/model/product_details_model.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _isloading = false;
  bool get isloading => _isloading;
  bool _isEmtpy = false;
  bool get isEmpty => _isEmtpy;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();
  ProductDetailsModel get getProductDetails => _productDetailsModel;

  Future<bool> loadProduct(int id) async {
    _isloading = true;
    _isEmtpy = false;
    update();
    try {
      final response = await NetworkCaller()
          .getRequiest(url: ApiUrl.productDetailsUrl(id.toString()));
      if (response.isSuccess) {
        if (response.responseData['data'].isEmpty) {
          _isEmtpy = true;
          update();
          return true;
        }
        _productDetailsModel =
            ProductDetailsModel.fromJson(response.responseData['data'][0]);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = 'Error Was $e';
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
