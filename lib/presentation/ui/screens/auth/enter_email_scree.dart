import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_logo.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/extensions/email_validaor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterYourEmailScreen extends StatelessWidget {
  EnterYourEmailScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: 'Email Address:'),
                  validator: (value) {
                    if (value == null) {
                      return 'Enter Your Email';
                    }
                    if (value.trim().isEmpty) {
                      return 'Enter Your Email';
                    }
                    if (!value.isValidEmail()) {
                      return 'Enter A Valid Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text('Next')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
