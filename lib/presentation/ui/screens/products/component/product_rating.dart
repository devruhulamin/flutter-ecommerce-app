import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        SizedBox(width: 2),
        Text(
          '4.8',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
