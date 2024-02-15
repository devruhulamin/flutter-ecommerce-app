import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.person_2_outlined),
      title: Text(
        "Ruhul Amin",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(
        'very good product i recomment to every one to try this one its a great product to buy. i am really happy to try this one product.every one should try this product',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
