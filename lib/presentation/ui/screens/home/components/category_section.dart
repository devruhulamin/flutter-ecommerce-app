import 'package:crafty_bay_ruhulaminjr/data/model/category_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/category/components/category_item.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final List<CategoryItemModel> items;
  const CategorySection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return CategoryItem(
            item: items[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 12,
            ),
        itemCount: items.length);
  }
}
