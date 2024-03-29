import 'package:crafty_bay_ruhulaminjr/data/model/review_payload.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/auth_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/review_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/auth/enter_email_scree.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/center_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class AddReview extends StatefulWidget {
  final String id;
  const AddReview({super.key, required this.id});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  // final firstNameController = TextEditingController();
  // final lastNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // firstNameController.dispose();
    // lastNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add new review")),
      body: GetBuilder<ReviewController>(builder: (controller) {
        return Visibility(
          visible: controller.isLoading == false,
          replacement: const CenterLoading(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    // TextFormField(
                    //   controller: firstNameController,
                    //   decoration: const InputDecoration(labelText: 'First Name: '),
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return 'Invalid input';
                    //     }
                    //     if (value.trim().isEmpty) {
                    //       return 'Value can not be empty';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // const SizedBox(
                    //   height: 14,
                    // ),
                    // TextFormField(
                    //   controller: lastNameController,
                    //   decoration: const InputDecoration(labelText: 'Last Name: '),
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return 'Invalid input';
                    //     }
                    //     if (value.trim().isEmpty) {
                    //       return 'Value can not be empty';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(hintText: 'Description:'),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null) {
                          return 'Invalid input';
                        }
                        if (value.trim().isEmpty) {
                          return 'Value can not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rat) {
                        rating = rat;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            formKey.currentState?.validate();
                            final reviewdata = ReviewPayload(
                              description: descriptionController.text,
                              productId: int.parse(widget.id),
                              rating: rating,
                            );
                            final result =
                                await controller.addReview(reviewdata);
                            if (result == false) {
                              Get.find<AuthController>().logOut();
                              Get.offAll(() => EnterYourEmailScreen());
                            } else {
                              Get.close(1);
                            }
                          },
                          child: const Text("Add Review")),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
