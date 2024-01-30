import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class ProductSizeSelector extends StatelessWidget {
  final List<String> sizes;
  ProductSizeSelector({super.key, required this.sizes});
  final isSelected = ValueNotifier<String>('M');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: sizes
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
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(30)),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: value == e
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            child: Text(e),
                          ),
                        );
                      },
                    )),
              ))
          .toList(),
    );
  }
}
