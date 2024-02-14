import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/primary_color_text.dart';
import 'package:flutter/material.dart';

class PriceWithActionButton extends StatelessWidget {
  final VoidCallback? ontap;
  final String actionText;
  final String price;
  const PriceWithActionButton(
      {super.key,
      required this.price,
      required this.actionText,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text(
                'Total Price',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              PrimaryColorText(
                text: '\$$price',
                size: 20,
              ),
            ],
          ),
          ElevatedButton(onPressed: ontap, child: Text(actionText))
        ],
      ),
    );
  }
}
