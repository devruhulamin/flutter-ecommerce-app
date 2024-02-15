class ReviewPayload {
  String? description;
  int? productId;
  double? rating;

  ReviewPayload({this.description, this.productId, this.rating});

  ReviewPayload.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    productId = json['product_id'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['product_id'] = productId;
    data['rating'] = rating;
    return data;
  }
}
