import 'package:crafty_bay_ruhulaminjr/data/model/popular_product_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  final List<ProductItem> items;
  const ProductListScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            product: items[index],
            isWishListed: false,
          );
        },
      ),
    );
  }
}
