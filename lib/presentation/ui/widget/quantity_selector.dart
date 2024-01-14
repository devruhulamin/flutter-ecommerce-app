import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  QuantitySelector({super.key});

  final itemQuantity = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
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
          ),
        );
      },
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
