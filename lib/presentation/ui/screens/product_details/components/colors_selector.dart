import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ProductColorSelector extends StatelessWidget {
  final List<Color> colors;
  ProductColorSelector({super.key, required this.colors});
  final isSelected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors
          .mapIndexed((e, color) => InkWell(
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
                          backgroundColor: color,
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
