import 'package:crafty_bay_ruhulaminjr/presentation/state/auth_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/constants/assets_constant.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/auth/enter_email_scree.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget homeAppBar() {
  return AppBar(
    title: Image.asset(AssetPath.logoNav),
    actions: [
      CircularAppBarIcon(
          onTap: () async {
            final result = await Get.find<AuthController>().logOut();
            if (result) {
              Get.offAll(() => EnterYourEmailScreen());
            }
          },
          iconData: Icons.person_2_outlined),
      const SizedBox(width: 5),
      CircularAppBarIcon(onTap: () {}, iconData: Icons.phone),
      const SizedBox(width: 5),
      const SizedBox(width: 5),
      CircularAppBarIcon(
          onTap: () {}, iconData: Icons.notification_important_outlined),
    ],
  );
}
