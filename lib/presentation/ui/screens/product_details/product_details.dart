import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/components/colors_selector.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/components/hero_carousel.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/components/product_size_selector.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/component/product_fav_button.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/component/product_rating.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/price_with_action_button.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/primary_color_text.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/quantity_selector.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Details")),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const HeroCarousel(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProductRating(
                            rating: 4.5,
                          ),
                          SizedBox(width: 8),
                          PrimaryColorText(text: 'Reviews'),
                          SizedBox(width: 8),
                          ProductFavoriteButton()
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Color:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      ProductColorSelector(),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Size:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      ProductSizeSelector(),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Description:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "The phrase nice shoes is often used as a lighthearted or playful way to start a conversation or give a compliment. It's a casual way to break the ice and show interest in the other person without being too direct. It's a simple, non-threatening compliment that can lead to further conversation",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const SizedBox(height: 80, child: PriceWithActionButton()),
        ],
      ),
    );
  }
}
