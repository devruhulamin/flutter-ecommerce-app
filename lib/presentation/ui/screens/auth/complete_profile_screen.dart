import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/auth/pin_code_verification_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                decoration: const InputDecoration(hintText: 'First Name:'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Last Name:'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(hintText: 'Phone:'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'City:'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Shipping Address:'),
                maxLines: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(const PinCodeVerifyScreen());
                    },
                    child: const Text('Complete')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
