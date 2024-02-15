import 'package:crafty_bay_ruhulaminjr/data/model/review_model.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel review;
  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person_2_outlined),
      title: Text(
        "${review.profile?.cusName}",
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(
        '${review.description}',
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
