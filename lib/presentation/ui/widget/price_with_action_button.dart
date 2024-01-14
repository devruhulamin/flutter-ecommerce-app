import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/primary_color_text.dart';
import 'package:flutter/material.dart';

class PriceWithActionButton extends StatelessWidget {
  const PriceWithActionButton({super.key});

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
          const Column(
            children: [
              Text(
                'Total Price',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              PrimaryColorText(
                text: '\$10000',
                size: 20,
              ),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Checkout'))
        ],
      ),
    );
  }
}
