import 'dart:async';

import 'package:crafty_bay_ruhulaminjr/presentation/state/verify_otp_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_logo.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/bottom_navigation_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerifyScreen extends StatefulWidget {
  final String email;
  const PinCodeVerifyScreen({super.key, required this.email});

  @override
  State<PinCodeVerifyScreen> createState() => _PinCodeVerifyScreenState();
}

class _PinCodeVerifyScreenState extends State<PinCodeVerifyScreen> {
  Timer? _timer;
  final _secondRemaing = ValueNotifier<int>(120);
  void _startTimer() {
    const second = Duration(seconds: 1);

    _timer = Timer.periodic(second, (timer) {
      if (_secondRemaing.value <= 0) {
        _cancelTimer();
      } else {
        _secondRemaing.value--;
      }
    });
  }

  void _cancelTimer() {
    if (_timer != null && (_timer?.isActive ?? false)) {
      _timer?.cancel();
    }
  }

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  bool _isPinInputted = false;
  String _pinValue = '';
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
                length: 6,
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
                  _pinValue = v;
                  _isPinInputted = true;
                  setState(() {});
                },
              ),

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: GetBuilder<VerifyOtpController>(builder: (controller) {
                  return ElevatedButton(
                      onPressed: _isPinInputted
                          ? () async {
                              final isSucces = await controller.verifyOtp(
                                  email: widget.email, otp: _pinValue);

                              if (isSucces) {
                                if (controller.isProfileCompleted) {
                                  Get.offAll(() => const BottomNavBarHome());
                                } else {
                                  Get.offAll(() => CompleteProfileScreen(
                                      token: controller.getToken));
                                }
                              } else {
                                Get.snackbar(
                                    'Error Occur', controller.errorMessage);
                              }
                            }
                          : null,
                      child: controller.isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Verify'));
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder<int>(
                valueListenable: _secondRemaing,
                builder: (context, value, child) {
                  return RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          text: 'This code will expire in ',
                          children: [
                        TextSpan(
                            text: '${value}s',
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold))
                      ]));
                },
              ),

              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: _secondRemaing.value == 0 ? () {} : null,
                  child: const Text('Resend Code'))
            ],
          ),
        ),
      ),
    );
  }
}
