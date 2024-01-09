import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/category/components/category_item.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 12,
            ),
        itemCount: 10);
  }
}
