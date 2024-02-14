import 'package:crafty_bay_ruhulaminjr/presentation/state/wish_list_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductFavoriteButton extends StatelessWidget {
  final String id;
  const ProductFavoriteButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await Get.find<WishListController>().createWishList(id);
        if (result) {
          Get.snackbar('Succed', 'Success fully product added to wish list',
              duration: const Duration(seconds: 3));
        } else {
          Get.snackbar('failed', 'failed to add wish list',
              duration: const Duration(seconds: 3));
        }
      },
      child: const Padding(
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
      ),
    );
  }
}
