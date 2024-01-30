import 'dart:collection';

class CartItem extends MapView<String, dynamic> {
  int? productId;
  String? color;
  String? size;

  CartItem({this.productId, this.color, this.size})
      : super({"product_id": productId, "color": color, "size": size});
}
