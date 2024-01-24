import 'package:crafty_bay_ruhulaminjr/data/model/slider_product.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class BannerListController extends GetxController {
  bool _isloading = false;
  String _errorMessage = '';
  bool get isLoading => _isloading;
  String get getErrorMessage => _errorMessage;
  final List<BannerProduct> _bannerProduct = [];
  List<BannerProduct> get getBannerListProduct => _bannerProduct;

  Future<bool> getBannerList() async {
    _isloading = true;
    update();
    try {
      final response =
          await NetworkCaller().getRequiest(url: ApiUrl.listProductSliderUrl);
      if (response.isSuccess) {
        for (final pd in response.responseData['data']) {
          _bannerProduct.add(BannerProduct.fromJson(pd));
        }
        return true;
      } else {
        _errorMessage = response.errorMessage ?? 'An Error Occur';
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
