import 'package:crafty_bay_ruhulaminjr/data/model/popular_product_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/constants/assets_constant.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/product_details.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/component/product_fav_button.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/component/product_rating.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/primary_color_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final ProductItem product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Get.to(() => ProductDetails(
              id: product.id ?? 0,
            ));
      },
      child: SizedBox(
        height: 140,
        width: 170,
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                clipBehavior: Clip.hardEdge,
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Color.fromARGB(255, 222, 255, 255),
                ),
                child: Image.asset(
                  AssetPath.shoePng,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      '${product.title}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PrimaryColorText(
                          text: '\$${product.price}',
                        ),
                        ProductRating(
                          rating: product.star,
                        ),
                        const ProductFavoriteButton(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
