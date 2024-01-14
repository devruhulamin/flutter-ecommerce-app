import 'package:crafty_bay_ruhulaminjr/presentation/state/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/cart/component/cart_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
            "Cart",
            style: Theme.of(context).textTheme.titleMedium,
          )),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CartItem();
              },
              separatorBuilder: (context, index) => const Divider(
                height: 2,
              ),
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Text(
                      '\$10000',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Checkout'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
