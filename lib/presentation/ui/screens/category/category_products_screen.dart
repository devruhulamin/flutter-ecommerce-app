import 'package:crafty_bay_ruhulaminjr/data/model/category_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/category_products_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/products_list_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/center_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductScreen extends StatefulWidget {
  final CategoryItemModel item;

  const CategoryProductScreen({super.key, required this.item});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  @override
  void initState() {
    Get.find<CategoryProductsController>()
        .loadCategoryProducts(id: widget.item.id ?? 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.item.categoryName ?? 'Unknown',
        style: Theme.of(context).textTheme.titleMedium,
      )),
      body: GetBuilder<CategoryProductsController>(builder: (controller) {
        return Visibility(
          visible: controller.isLoading == false,
          replacement: const CenterLoading(),
          child: ProductListScreen(
            items: controller.productList,
          ),
        );
      }),
    );
  }
}
