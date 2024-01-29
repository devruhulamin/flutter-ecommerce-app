import 'package:crafty_bay_ruhulaminjr/data/model/category_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/category/category_products_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  final CategoryItemModel item;
  const CategoryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CategoryProductScreen(
              item: item,
            ));
      },
      child: Column(
        children: [
          Card(
              elevation: 0,
              color: const Color.fromARGB(255, 222, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                    width: 40,
                    child: Image.network(
                      item.categoryImg ?? '',
                    )),
              )),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${item.categoryName}',
            style: const TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
