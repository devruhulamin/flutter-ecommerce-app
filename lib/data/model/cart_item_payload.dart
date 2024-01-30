import 'dart:collection';

class CartItemPayload extends MapView<String, dynamic> {
  int? productId;
  String? color;
  String? size;

  CartItemPayload({this.productId, this.color, this.size})
      : super({"product_id": productId, "color": color, "size": size});
}
