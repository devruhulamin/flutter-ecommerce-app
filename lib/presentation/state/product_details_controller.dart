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
  final _totalPrice = 0.0.obs;
  RxDouble get totalPrice => _totalPrice;
  double _pdPrice = 0.0;
  void updateQuantity(
    int quantiy,
  ) {
    _totalPrice.value = _pdPrice * quantiy;
  }

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
        _pdPrice = double.parse(_productDetailsModel.product?.price ?? '0.0');
        _totalPrice.value = _pdPrice;

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
