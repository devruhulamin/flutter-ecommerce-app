import 'package:flutter/material.dart';

typedef VoidFuncWithParams = Function(int quantity, int id);

class QuantitySelector extends StatelessWidget {
  final int productId;
  final int? qty;
  final double? price;
  final VoidFuncWithParams onQuntityChange;
  const QuantitySelector(
      {super.key,
      required this.productId,
      this.qty = 1,
      this.price,
      required this.onQuntityChange});

  @override
  Widget build(BuildContext context) {
    const stock = 9;
    final itemQuantity = ValueNotifier<int>(qty ?? 1);
    void updateQuantity(String op) {
      if (op == '-') {
        if (itemQuantity.value > 1) {
          itemQuantity.value = itemQuantity.value - 1;

          onQuntityChange(itemQuantity.value, productId);
        }
      } else if (op == '+') {
        if (itemQuantity.value < stock) {
          itemQuantity.value = itemQuantity.value + 1;
          onQuntityChange(itemQuantity.value, productId);
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
