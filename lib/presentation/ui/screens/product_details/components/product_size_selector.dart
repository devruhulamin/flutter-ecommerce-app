import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/voide_call_back_str.dart';
import 'package:flutter/material.dart';

class ProductSizeSelector extends StatelessWidget {
  final VoidCallbackString onSelected;

  final List<String> sizes;
  const ProductSizeSelector(
      {super.key, required this.sizes, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final isSelected = ValueNotifier<String>(sizes[0]);
    onSelected(isSelected.value);
    return Row(
      children: sizes
          .map((e) => InkWell(
                onTap: () {
                  isSelected.value = e;
                  onSelected(isSelected.value);
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
