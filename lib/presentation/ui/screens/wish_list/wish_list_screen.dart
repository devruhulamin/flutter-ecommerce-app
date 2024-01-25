import 'package:crafty_bay_ruhulaminjr/presentation/state/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/products/products_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.find<BottomNavBarController>().changeIndex(0);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Wish List',
            style: Theme.of(context).textTheme.titleMedium,
          )),
      body: const ProductListScreen(
        items: [],
      ),
    );
  }
}
