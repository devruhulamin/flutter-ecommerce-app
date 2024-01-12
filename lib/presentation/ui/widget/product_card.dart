import 'package:crafty_bay_ruhulaminjr/presentation/ui/constants/assets_constant.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 160,
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              clipBehavior: Clip.hardEdge,
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Color.fromARGB(255, 222, 255, 255),
              ),
              child: Image.asset(
                AssetPath.shoePng,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    'New year special shoe 30',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$100',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14,
                          ),
                          Text(
                            '4.8',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Card(
                          shape: Border(
                            top: BorderSide.none,
                            left: BorderSide.none,
                            bottom: BorderSide.none,
                            right: BorderSide.none,
                          ),
                          color: AppColors.primaryColor,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white54,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
