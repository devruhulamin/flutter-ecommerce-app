import 'package:crafty_bay_ruhulaminjr/data/model/cart_item_payload.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/add_to_cart_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/product_details_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/constants/assets_constant.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/auth/enter_email_scree.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/components/colors_selector.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/components/hero_carousel.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/product_details/components/product_size_selector.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/component/product_fav_button.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/component/product_rating.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/reviews/review_screen.dart';
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
    Get.find<ProductDetailsController>().loadProduct(1);
  }

  String? color;
  String? size;
  int? qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Details")),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        final productData = controller.getProductDetails;
        return controller.isEmpty
            ? const Center(
                child: Text("Opps Products Details is Empty"),
              )
            : Visibility(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        '${productData.product?.title}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    QuantitySelector(
                                      productId: productData.productId ?? 1,
                                      qty: 1,
                                      price: double.parse(
                                          productData.product?.price ?? '0.0'),
                                      onQuntityChange: (quantity, pdId) {
                                        qty = quantity;
                                        controller.updateQuantity(quantity);
                                      },
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ProductRating(
                                      rating: productData.product?.star,
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                        onTap: () {
                                          Get.to(() => const ReviewScreen());
                                        },
                                        child: const PrimaryColorText(
                                            text: 'Reviews')),
                                    const SizedBox(width: 8),
                                    ProductFavoriteButton(
                                      id: '${productData.productId}',
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Color:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                ProductColorSelector(
                                  colors: productData.color ?? '',
                                  onSelected: (String selectedColor) {
                                    color = selectedColor;
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Size:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                ProductSizeSelector(
                                  sizes: productData.size
                                          ?.getArraySliceByComma() ??
                                      [],
                                  onSelected: (String selectedSize) {
                                    size = selectedSize;
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Description:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
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
                        child: Obx(() {
                          final totalPrice =
                              Get.find<ProductDetailsController>().totalPrice;
                          return PriceWithActionButton(
                            ontap: () async {
                              if (color != null && size != null) {
                                final result =
                                    await Get.find<AddToCartController>()
                                        .addToCart(CartItemPayload(
                                  productId: productData.id,
                                  color: productData.color,
                                  size: productData.size,
                                  qty: qty,
                                ));
                                if (result) {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: 'Add to cart succed',
                                    message: 'product has been added to cart',
                                    duration: Duration(seconds: 1),
                                  ));
                                } else {
                                  Get.offAll(() => EnterYourEmailScreen());
                                }
                              } else {
                                Get.showSnackbar(const GetSnackBar(
                                  title: 'Could not add',
                                  message: 'select color and size',
                                  duration: Duration(seconds: 1),
                                ));
                              }
                            },
                            actionText: 'Add to cart',
                            price: totalPrice.value.toString(),
                          );
                        })),
                  ],
                ),
              );
      }),
    );
  }
}
