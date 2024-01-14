import 'package:crafty_bay_ruhulaminjr/presentation/state/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/cart/component/cart_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/price_with_action_button.dart';
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
          const PriceWithActionButton()
        ],
      ),
    );
  }
}
