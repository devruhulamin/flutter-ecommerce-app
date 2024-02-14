import 'package:crafty_bay_ruhulaminjr/data/model/wishlist_model.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _isloading = false;
  String _errorMessage = '';
  List<WishListItem> _items = [];
  bool get isloading => _isloading;
  String get errorMessage => _errorMessage;
  List<WishListItem> get getItems => _items;

  Future<bool> loadItems() async {
    try {
      _isloading = true;
      update();
      final response =
          await NetworkCaller().getRequiest(url: ApiUrl.getWishList);
      if (response.isSuccess) {
        final List<WishListItem> itm = [];
        for (final data in response.responseData['data']) {
          itm.add(WishListItem.fromJson(data));
        }
        _items = itm;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }

  Future<bool> createWishList(String id) async {
    try {
      _isloading = true;
      update();
      final response =
          await NetworkCaller().getRequiest(url: ApiUrl.createWishList(id));
      if (response.isSuccess) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }

  Future<bool> removeWishList(String id) async {
    try {
      _isloading = true;
      update();
      final response =
          await NetworkCaller().getRequiest(url: ApiUrl.removeWishList(id));
      if (response.isSuccess) {
        loadItems();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
