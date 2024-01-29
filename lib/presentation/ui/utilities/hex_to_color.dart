import 'package:flutter/material.dart';

Color hexToColor(String hexColor) {
  // Remove the '#' character from the beginning of the hexColor
  hexColor = hexColor.replaceAll("#", "");

  // Check if the hexColor is in the valid format
  if (hexColor.length != 6) {
    // If not in the valid format, return a default color (you can choose a different default if needed)
    return Colors.black;
  }

  // Parse the hexColor to integer
  int parsedColor = int.parse(hexColor, radix: 16);

  // Create and return the Color object
  return Color(parsedColor | 0xFF000000);
}
