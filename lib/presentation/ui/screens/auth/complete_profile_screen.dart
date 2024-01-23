import 'package:crafty_bay_ruhulaminjr/data/model/profile_payload.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/complete_profile_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/home_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_logo.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/center_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  final String token;
  const CompleteProfileScreen({super.key, required this.token});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Complete Profile',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 30,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Get Started With Us With Your Details',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: firstNameController,
                  validator: (value) {
                    if (value == null) {
                      return 'invalid input';
                    }
                    if (value.trim().isEmpty) {
                      return 'first name cannot be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'First Name:'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: lastNameController,
                  validator: (value) {
                    if (value == null) {
                      return 'invalid input';
                    }
                    if (value.trim().isEmpty) {
                      return 'last name cannot be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Last Name:'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value == null) {
                      return 'invalid input';
                    }
                    if (value.trim().isEmpty) {
                      return 'phone number cannot be empty';
                    }
                    if (value.trim().length != 11) {
                      return 'phone number should be 11 digit';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(hintText: 'Phone:'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: cityController,
                  validator: (value) {
                    if (value == null) {
                      return 'invalid input';
                    }
                    if (value.trim().isEmpty) {
                      return 'city cannot be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'City:'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addressController,
                  validator: (value) {
                    if (value == null) {
                      return 'invalid input';
                    }
                    if (value.trim().isEmpty) {
                      return 'shipping name cannot be empty';
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(hintText: 'Shipping Address:'),
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CompleteProfileController>(
                      builder: (controller) {
                    return Visibility(
                      visible: controller.isloading == false,
                      replacement: const CenterLoading(),
                      child: ElevatedButton(
                          onPressed: () async {
                            _formKey.currentState?.validate();
                            final profileData = ProfilePayload(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                phoneNumber: phoneController.text,
                                city: cityController.text,
                                shippingAddress: addressController.text);
                            final result = await controller.completeProfile(
                                token: widget.token, profile: profileData);
                            if (result) {
                              Get.offAll(const HomeScreen());
                            } else {
                              Get.snackbar(
                                  'Error occur', controller.errorMessage);
                            }
                          },
                          child: const Text('Complete')),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
