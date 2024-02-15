import 'package:crafty_bay_ruhulaminjr/presentation/state/review_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/reviews/review_action.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/reviews/review_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/center_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  final String id;
  const ReviewScreen({super.key, required this.id});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<ReviewController>().loadItems(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: GetBuilder<ReviewController>(builder: (controller) {
        return Visibility(
          visible: controller.isLoading == false,
          replacement: const CenterLoading(),
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ReviewItem(
                          review: controller.items[index],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: controller.items.length)),
              ReviewAction(
                id: '1',
                reviewCount: controller.items.length,
              ),
            ],
          ),
        );
      }),
    );
  }
}
