import 'package:crafty_bay_ruhulaminjr/data/model/popular_product_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductsSection extends StatelessWidget {
  final List<ProductItem> items;
  const ProductsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(
            product: items[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
        itemCount: items.length);
  }
}
