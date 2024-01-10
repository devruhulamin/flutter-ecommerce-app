import 'package:crafty_bay_ruhulaminjr/presentation/state/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/category/components/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.find<BottomNavBarController>().changeIndex(0);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.find<BottomNavBarController>().changeIndex(0);
            },
          ),
          title: Text(
            "Categories",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return const FittedBox(child: CategoryItem());
          },
        ),
      ),
    );
  }
}
