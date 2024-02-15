import 'package:crafty_bay_ruhulaminjr/data/model/review_model.dart';
import 'package:crafty_bay_ruhulaminjr/data/model/review_payload.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  bool _loading = false;
  String _errorMessage = '';
  List<ReviewModel> _items = [];
  List<ReviewModel> get items => _items;
  bool get isLoading => _loading;
  String get errorMessage => _errorMessage;

  Future<bool> loadItems(String id) async {
    _loading = true;
    update();
    try {
      final response =
          await NetworkCaller().getRequiest(url: ApiUrl.getReviewUrl(id));
      if (response.isSuccess) {
        List<ReviewModel> reviews = [];
        for (final data in response.responseData['data']) {
          reviews.add(ReviewModel.fromJson(data));
        }
        _items = reviews;
        return true;
      }
      _errorMessage = response.errorMessage ?? 'something went wrong';
      return false;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _loading = false;
      update();
    }
  }

  Future<bool> addReview(ReviewPayload review) async {
    _loading = true;
    update();
    try {
      final response = await NetworkCaller()
          .postRequiest(url: ApiUrl.createReviewUrl, body: review.toJson());

      if (response.isSuccess) {
        return true;
      }
      _errorMessage = response.errorMessage ?? 'something went wrong';
      return false;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _loading = false;
      update();
    }
  }
}
