import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/primary_color_text.dart';
import 'package:flutter/material.dart';

class ReviewAction extends StatelessWidget {
  final String id;
  final int reviewCount;
  const ReviewAction({super.key, required this.id, required this.reviewCount});

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
              PrimaryColorText(
                text: 'Reviews($reviewCount)',
                size: 20,
              ),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Icon(Icons.add))
        ],
      ),
    );
  }
}
