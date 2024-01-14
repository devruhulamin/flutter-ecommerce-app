import 'package:crafty_bay_ruhulaminjr/presentation/ui/constants/assets_constant.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  CartItem({super.key});

  final itemQuantity = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: Colors.white,
      child: Row(
        children: [
          // cart item image
          Image.asset(AssetPath.shoePng),
          // cart title sized and price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text('New year special shoe',style: Theme.of(context).textTheme.titleMedium,),
                ListTile(
                  title: Text(
                    'New year special shoe',
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text('Color: red, Size: XL'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$100',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 100,
                        child: ValueListenableBuilder<int>(
                          valueListenable: itemQuantity,
                          builder: (context, value, _) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0)),
                                      onPressed: value <= 1
                                          ? null
                                          : () {
                                              updateQuantity('-');
                                            },
                                      child: const Icon(
                                        Icons.remove,
                                        size: 14,
                                      )),
                                ),
                                Text(
                                  '0$value',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0)),
                                      onPressed: value >= 9
                                          ? null
                                          : () {
                                              updateQuantity('+');
                                            },
                                      child: const Icon(
                                        Icons.add,
                                        size: 14,
                                      )),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateQuantity(String op) {
    if (op == '-') {
      if (itemQuantity.value > 1) {
        itemQuantity.value = itemQuantity.value - 1;
      }
    } else if (op == '+') {
      if (itemQuantity.value < 9) {
        itemQuantity.value = itemQuantity.value + 1;
      }
    }
  }
}
