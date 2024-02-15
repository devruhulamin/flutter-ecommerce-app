import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/reviews/review_action.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/reviews/review_item.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const ReviewItem();
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: 5)),
          const ReviewAction(id: '1'),
        ],
      ),
    );
  }
}
