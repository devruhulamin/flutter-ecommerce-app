import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterYourEmailScreen extends StatelessWidget {
  const EnterYourEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const AppLogo(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Please Enter Your Email address ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email Address:'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(const CompleteProfileScreen());
                    },
                    child: const Text('Next')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
