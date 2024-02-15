import 'package:flutter/foundation.dart' show immutable;

@immutable
class ApiUrl {
  static const baseUrl = 'http://ecom-api.teamrabbil.com/api';
  static String otpSendUrl({required String email}) =>
      '$baseUrl/UserLogin/$email';
  static String otpVerifyUrl({required String email, required String otp}) =>
      '$baseUrl/VerifyLogin/$email/$otp';
  static const String readProfileUrl = '$baseUrl/ReadProfile';
  static const String createProfileUrl = '$baseUrl/CreateProfile';
  static const String listProductSliderUrl = '$baseUrl/ListProductSlider';
  static const String categoryListUrl = '$baseUrl/CategoryList';
  static String productByRemarks(String remarks) =>
      '$baseUrl/ListProductByRemark/$remarks';
  static String productsByCategoryUrl(String id) =>
      '$baseUrl/ListProductByCategory/$id';
  static String productDetailsUrl(String id) =>
      '$baseUrl/ProductDetailsById/$id';
  static String addToCartUrl = '$baseUrl/CreateCartList';
  static String getCartItemUrl = '$baseUrl/CartList';
  static String deleteCartItem(String id) => '$baseUrl/DeleteCartList/$id';
  static const String createInvoice = '$baseUrl/InvoiceCreate';
  static String createWishList(String id) => '$baseUrl/CreateWishList/$id';
  static const getWishList = '$baseUrl/ProductWishList';
  static String removeWishList(String id) => '$baseUrl/RemoveWishList/$id';
  static String getReviewUrl(String id) => '$baseUrl/ListReviewByProduct/$id';
  static const createReviewUrl = '$baseUrl/CreateProductReview';
}
