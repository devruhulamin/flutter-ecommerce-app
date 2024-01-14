import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/components/hero_carousel.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/quantity_selector.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Details")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroCarousel(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 250,
                        child: Text(
                          'Happy new year special deal save 30%',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      QuantitySelector(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
