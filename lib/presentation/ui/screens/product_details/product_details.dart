import 'package:crafty_bay_ruhulaminjr/presentation/state/product_details_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/constants/assets_constant.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/components/colors_selector.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/components/hero_carousel.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/components/product_size_selector.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/component/product_fav_button.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/component/product_rating.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/extensions/colors_string_to_array.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/extensions/str_to_list.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/center_loading.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/price_with_action_button.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/primary_color_text.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  final int id;
  const ProductDetails({super.key, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().loadProduct(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Details")),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        final productData = controller.getProductDetails;
        return Visibility(
          visible: controller.isloading == false,
          replacement: const CenterLoading(),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    HeroCarousel(
                      urls: [
                        productData.img1 ?? AssetPath.placeHolderUrl,
                        productData.img2 ?? AssetPath.placeHolderUrl,
                        productData.img2 ?? AssetPath.placeHolderUrl,
                        productData.img2 ?? AssetPath.placeHolderUrl,
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Text(
                                  '${productData.productItem?.title}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ProductRating(
                                rating: productData.productItem?.star,
                              ),
                              const SizedBox(width: 8),
                              const PrimaryColorText(text: 'Reviews'),
                              const SizedBox(width: 8),
                              const ProductFavoriteButton()
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
                          ProductColorSelector(
                            colors: productData.color?.getColorsList() ?? [],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Size:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          ProductSizeSelector(
                            sizes:
                                productData.size?.getArraySliceByComma() ?? [],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Description:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${productData.des}",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                  height: 80,
                  child: PriceWithActionButton(
                    price: productData.productItem?.price ?? '00',
                  )),
            ],
          ),
        );
      }),
    );
  }
}
