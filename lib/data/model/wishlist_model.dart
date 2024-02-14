import 'package:crafty_bay_ruhulaminjr/data/model/popular_product_item.dart';

class WishListItem {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductItem? product;

  WishListItem(
      {this.id,
      this.productId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.product});

  WishListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null
        ? ProductItem().fromJson(json['product'])
        : null;
  }
}
