import 'package:crafty_bay_ruhulaminjr/presentation/state/banner_list_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/category_item_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/cart/cart_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/category/category_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/home_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/wish_list/wish_list_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarHome extends StatefulWidget {
  const BottomNavBarHome({super.key});

  @override
  State<BottomNavBarHome> createState() => _BottomNavBarHomeState();
}

class _BottomNavBarHomeState extends State<BottomNavBarHome> {
  @override
  void initState() {
    super.initState();
    Get.find<BannerListController>().getBannerList();
    Get.find<CategoryItemController>().loadCategoryItem();
  }

  @override
  Widget build(BuildContext context) {
    final screen = [
      const HomeScreen(),
      const CategoriesScreen(),
      const CartScreen(),
      const WishListScreen()
    ];

    return GetBuilder<BottomNavBarController>(builder: (controller) {
      return Scaffold(
        body: screen[controller.getIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.getIndex,
            onTap: (value) {
              controller.changeIndex(value);
            },
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard), label: 'Wish'),
            ]),
      );
    });
  }
}
