import 'package:crafty_bay_ruhulaminjr/presentation/state/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/wish_list_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/center_loading.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<WishListController>().loadItems();
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
              'Wish List',
              style: Theme.of(context).textTheme.titleMedium,
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<WishListController>(builder: (controller) {
            final items = controller.getItems;
            return Visibility(
              visible: controller.isloading == false,
              replacement: const CenterLoading(),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: items[index].product!,
                  );
                },
              ),
            );
          }),
        ));
  }
}
