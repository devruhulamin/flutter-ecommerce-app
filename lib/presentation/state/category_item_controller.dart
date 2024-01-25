import 'package:crafty_bay_ruhulaminjr/data/model/category_item.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class CategoryItemController extends GetxController {
  bool _isloading = false;
  bool get isLoading => _isloading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  final List<CategoryItemModel> _items = [];
  List<CategoryItemModel> get getCategoryItem => _items;
  Future<bool> loadCategoryItem() async {
    _isloading = true;
    update();
    try {
      final response =
          await NetworkCaller().getRequiest(url: ApiUrl.categoryListUrl);
      if (response.isSuccess) {
        for (final item in response.responseData['data']) {
          _items.add(CategoryItemModel.fromJson(item));
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = 'Error is $e';
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
