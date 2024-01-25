import 'package:crafty_bay_ruhulaminjr/presentation/state/banner_list_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/category_item_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/new_product_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/popular_product_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/special_product_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/app_bar.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/banner_carousel.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/category_section.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/product_section.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/search_field.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/section_title.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/new/new_product_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/popular/popular_product_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/special/special_product_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/center_loading.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchFieldHome(),
              const SizedBox(height: 8),
              SizedBox(
                  height: 220,
                  child:
                      GetBuilder<BannerListController>(builder: (controller) {
                    return Visibility(
                        visible: controller.isLoading == false,
                        replacement: const CenterLoading(),
                        child: BannerCarousel(
                          products: controller.getBannerListProduct,
                        ));
                  })),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'All Categories',
                onTap: () {
                  Get.find<BottomNavBarController>().changeIndex(1);
                },
              ),
              SizedBox(
                height: 120,
                child:
                    GetBuilder<CategoryItemController>(builder: (controller) {
                  return Visibility(
                      visible: controller.isLoading == false,
                      replacement: const CenterLoading(),
                      child: CategorySection(
                        items: controller.getCategoryItem,
                      ));
                }),
              ),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'Popular',
                onTap: () {
                  Get.to(() => const PopularProductScreen());
                },
              ),
              const SizedBox(height: 8),
              GetBuilder<PopularProductsController>(builder: (controller) {
                return SizedBox(
                  height: 200,
                  child: Visibility(
                      visible: controller.isloading == false,
                      replacement: const CenterLoading(),
                      child: ProductsSection(
                        items: controller.getProducts,
                      )),
                );
              }),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'Special',
                onTap: () {
                  Get.to(() => const SpecialProductScreen());
                },
              ),
              const SizedBox(height: 8),
              GetBuilder<SpecialProductController>(builder: (controller) {
                return SizedBox(
                  height: 200,
                  child: Visibility(
                      visible: controller.isloading == false,
                      replacement: const CenterLoading(),
                      child: ProductsSection(
                        items: controller.getProducts,
                      )),
                );
              }),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'New',
                onTap: () {
                  Get.to(() => const NewProductScreen());
                },
              ),
              const SizedBox(height: 8),
              GetBuilder<NewProductsController>(builder: (controller) {
                return SizedBox(
                  height: 200,
                  child: Visibility(
                      visible: controller.isloading == false,
                      replacement: const CenterLoading(),
                      child: ProductsSection(
                        items: controller.getProducts,
                      )),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
