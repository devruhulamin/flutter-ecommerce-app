import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class ProductFavoriteButton extends StatelessWidget {
  const ProductFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Colors.transparent,
            )),
        color: AppColors.primaryColor,
        child: Icon(
          Icons.favorite_border,
          color: Colors.white54,
        ),
      ),
    );
  }
}
