import 'package:crafty_bay_ruhulaminjr/data/model/cart_item_mode.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/quantity_selector.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartitem;
  const CartItem({super.key, required this.cartitem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: Colors.white,
      child: Row(
        children: [
          // cart item image
          Image.network(cartitem.product?.image ?? ''),
          // cart title sized and price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text('New year special shoe',style: Theme.of(context).textTheme.titleMedium,),
                ListTile(
                  title: Text(
                    '${cartitem.product?.title}',
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle:
                      Text('Color: ${cartitem.color}, Size: ${cartitem.size}'),
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
                      Text(
                        '\$${cartitem.price}',
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 100,
                        child: QuantitySelector(
                          cartItem: cartitem,
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
}
