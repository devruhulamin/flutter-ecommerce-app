import 'package:crafty_bay_ruhulaminjr/presentation/state/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/cart_item_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/cart/component/cart_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/invoice/invoice_checkout_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/center_loading.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/price_with_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CartItemController>().loadItems();
    });
  }

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
            child: GetBuilder<CartItemController>(builder: (controller) {
              return Visibility(
                visible: controller.isLoading == false,
                replacement: const CenterLoading(),
                child: ListView.separated(
                  itemCount: controller.getItems.length,
                  itemBuilder: (context, index) {
                    return CartItem(
                      cartitem: controller.getItems[index],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 2,
                  ),
                ),
              );
            }),
          )),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            final price = Get.find<CartItemController>().totalCardItemPrice;
            final itemLength = Get.find<CartItemController>().getItems.length;
            return PriceWithActionButton(
              ontap: itemLength > 0
                  ? () {
                      Get.to(() => const InvoiceCheckOutScreen());
                    }
                  : null,
              actionText: 'Check out',
              price: price.obs.value.toString(),
            );
          })
        ],
      ),
    );
  }
}
