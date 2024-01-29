import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/hex_to_color.dart';
import 'package:flutter/material.dart';

extension ColorsStrToListOfColor on String {
  List<Color> getColorsList() {
    final colorStr = split(',').toList();
    return colorStr.map((e) => hexToColor(e)).toList();
  }
}
