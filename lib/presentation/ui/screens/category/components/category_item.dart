import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Card(
          elevation: 0,
          color: Color.fromARGB(255, 222, 255, 255),
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.tv,
                color: AppColors.primaryColor,
                size: 40,
              )),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          'Electronics',
          style: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
