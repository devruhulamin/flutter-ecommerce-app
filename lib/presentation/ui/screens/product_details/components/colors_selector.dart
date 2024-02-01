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
    final colorStreList = colors.getArraySliceByComma();
    String seletedColor = colorStreList[isSelected.value];
    onSelected(seletedColor);
    return Row(
      children: colorStreList
          .mapIndexed((e, color) => InkWell(
                onTap: () {
                  isSelected.value = e;
                  seletedColor = colorStreList[e];
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
                          backgroundColor: textToColor(color),
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

Color textToColor(String text) {
  switch (text) {
    case 'Red':
      return Colors.red;
    case 'Green':
      return Colors.green;
    case 'White':
      return Colors.grey;
    default:
      return Colors.black;
  }
}
