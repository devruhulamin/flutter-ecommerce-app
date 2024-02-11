import 'package:crafty_bay_ruhulaminjr/data/model/cart_item_mode.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/cart_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantitySelector extends StatelessWidget {
  final CartItemModel cartItem;
  const QuantitySelector({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final qty = int.parse(cartItem.qty ?? '1');
    const stock = 9; //cartItem.product?.stock ?? 1;
    final itemQuantity = ValueNotifier<int>(qty);
    void updateQuantity(String op) {
      if (op == '-') {
        if (itemQuantity.value > 1) {
          itemQuantity.value = itemQuantity.value - 1;
          cartItem.qty = itemQuantity.value.toString();
          Get.find<CartItemController>()
              .updatequantity(cartItem.id!, itemQuantity.value);
        }
      } else if (op == '+') {
        if (itemQuantity.value < stock) {
          itemQuantity.value = itemQuantity.value + 1;
          cartItem.qty = itemQuantity.value.toString();
          Get.find<CartItemController>()
              .updatequantity(cartItem.id!, itemQuantity.value);
        }
      }
    }

    return ValueListenableBuilder<int>(
      valueListenable: itemQuantity,
      builder: (context, value, _) {
        return SizedBox(
          width: 100,
          child: Row(
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
                '0${itemQuantity.value}',
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
          ),
        );
      },
    );
  }
}
