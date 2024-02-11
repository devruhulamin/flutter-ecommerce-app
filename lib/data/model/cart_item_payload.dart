import 'dart:collection';

class CartItemPayload extends MapView<String, dynamic> {
  final int? productId;
  final String? color;
  final String? size;
  final int? qty;

  CartItemPayload(
      {required this.productId,
      required this.color,
      required this.size,
      this.qty = 1})
      : super({
          "product_id": productId,
          "color": color,
          "size": size,
          "qty": qty,
        });
}
