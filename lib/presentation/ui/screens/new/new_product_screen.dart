import 'package:crafty_bay_ruhulaminjr/presentation/state/new_product_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/products_list_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/center_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductScreen extends StatelessWidget {
  const NewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'New',
        style: Theme.of(context).textTheme.titleMedium,
      )),
      body: GetBuilder<NewProductsController>(builder: (controller) {
        return Visibility(
          visible: controller.isloading == false,
          replacement: const CenterLoading(),
          child: ProductListScreen(
            items: controller.getProducts,
          ),
        );
      }),
    );
  }
}
