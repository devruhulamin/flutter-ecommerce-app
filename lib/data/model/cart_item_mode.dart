import 'package:crafty_bay_ruhulaminjr/data/model/popular_product_item.dart';

class CartItemModel {
  int? id;
  String? email;
  int? productId;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  ProductItem? product;

  CartItemModel(
      {this.id,
      this.email,
      this.productId,
      this.color,
      this.size,
      this.createdAt,
      this.updatedAt,
      this.product});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null
        ? ProductItem().fromJson(json['product'])
        : null;
  }
}
