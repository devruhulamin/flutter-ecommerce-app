import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ProductCard();
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
        itemCount: 10);
  }
}
