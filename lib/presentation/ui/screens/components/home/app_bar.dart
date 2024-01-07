import 'package:crafty_bay_ruhulaminjr/presentation/ui/constants/assets_constant.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/components/home/circular_icon.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget homeAppBar() {
  return AppBar(
    title: Image.asset(AssetPath.logoNav),
    actions: [
      CircularAppBarIcon(onTap: () {}, iconData: Icons.person_2_outlined),
      const SizedBox(width: 5),
      CircularAppBarIcon(onTap: () {}, iconData: Icons.phone),
      const SizedBox(width: 5),
      const SizedBox(width: 5),
      CircularAppBarIcon(
          onTap: () {}, iconData: Icons.notification_important_outlined),
    ],
  );
}
