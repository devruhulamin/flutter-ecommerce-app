import 'package:flutter/material.dart';

class CircularAppBarIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  const CircularAppBarIcon(
      {super.key, required this.onTap, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        child: Icon(
          iconData,
          color: Colors.grey,
        ),
      ),
    );
  }
}
