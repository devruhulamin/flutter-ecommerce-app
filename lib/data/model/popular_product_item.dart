import 'package:crafty_bay_ruhulaminjr/data/model/brand_model.dart';
import 'package:crafty_bay_ruhulaminjr/data/model/category_model.dart';

class ProductItem {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  int? discount;
  String? discountPrice;
  String? image;
  int? stock;
  double? star;
  String? remark;
  int? categoryId;
  int? brandId;
  String? createdAt;
  String? updatedAt;
  BrandModel? brand;
  CategoryModel? category;

  ProductItem({
    this.id,
    this.title,
    this.shortDes,
    this.price,
    this.discount,
    this.discountPrice,
    this.image,
    this.stock,
    this.star,
    this.remark,
    this.categoryId,
    this.brandId,
    this.createdAt,
    this.updatedAt,
    this.brand,
    this.category,
  });

  ProductItem fromJson(Map<String, dynamic> json) => ProductItem(
        id: json['id'],
        title: json['title'],
        shortDes: json['short_des'],
        price: json['price'],
        discount: json['discount'],
        discountPrice: json['discount_price'],
        image: json['image'],
        stock: json['stock'],
        star: json['star'],
        remark: json['remark'],
        categoryId: json['category_id'],
        brandId: json['brand_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        brand:
            json['brand'] != null ? BrandModel.fromJson(json['brand']) : null,
        category: json['category'] != null
            ? CategoryModel.fromJson(json['category'])
            : null,
      );
}
