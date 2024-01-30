import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/extensions/colors_string_to_array.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/extensions/str_to_list.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/voide_call_back_str.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ProductColorSelector extends StatelessWidget {
  final VoidCallbackString onSelected;
  final String colors;
  ProductColorSelector(
      {super.key, required this.colors, required this.onSelected});
  final isSelected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final colorsList = colors.getColorsList();
    final hexColorList = colors.getArraySliceByComma();
    String seletedColor = hexColorList[isSelected.value];
    onSelected(seletedColor);
    return Row(
      children: colorsList
          .mapIndexed((e, color) => InkWell(
                onTap: () {
                  isSelected.value = e;
                  seletedColor = hexColorList[e];
                  onSelected(seletedColor);
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
