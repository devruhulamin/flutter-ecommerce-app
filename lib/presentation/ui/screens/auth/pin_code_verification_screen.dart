import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerifyScreen extends StatelessWidget {
  const PinCodeVerifyScreen({super.key});

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
                'Enter Otp Code',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'A 4 Digit code has been sent',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              // pin code field
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeColor: Colors.transparent,
                  inactiveFillColor: AppColors.primaryColor,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: false,
                onCompleted: (v) {
                  // print("Completed");
                },
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
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      text: 'This code will expire in ',
                      children: const [
                    TextSpan(
                        text: '120s',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold))
                  ])),
              const SizedBox(
                height: 10,
              ),
              TextButton(onPressed: () {}, child: const Text('Resend Code'))
            ],
          ),
        ),
      ),
    );
  }
}
