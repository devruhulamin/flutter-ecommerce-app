import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  final int? rating;
  const ProductRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        const SizedBox(width: 2),
        Text(
          '${rating?.toStringAsFixed(1)}',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
