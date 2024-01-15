import 'package:flutter/material.dart';

class ProductColorSelector extends StatelessWidget {
  ProductColorSelector({super.key});
  final isSelected = ValueNotifier<Color>(Colors.red);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          [Colors.red, Colors.green, Colors.yellow, Colors.blue, Colors.black87]
              .map((e) => InkWell(
                    onTap: () {
                      isSelected.value = e;
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ValueListenableBuilder(
                          valueListenable: isSelected,
                          builder: (context, value, child) {
                            return CircleAvatar(
                              radius: 15,
                              backgroundColor: e,
                              child: value == e
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : null,
                            );
                          },
                        )),
                  ))
              .toList(),
    );
  }
}
