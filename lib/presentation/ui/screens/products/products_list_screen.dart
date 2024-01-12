import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  //TODO this screen should depend on List<Product>
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (1 / 1.6),
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return const ProductCard();
        },
      ),
    );
  }
}
