import 'package:flutter/material.dart';
import 'package:reppit/services/auth.dart';

class RegisterPageModel {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController =
      TextEditingController(); // doesn't need to be validated
  final TextEditingController passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    // Add more custom email validation rules if needed.
    return null; // Return null if the email is valid.
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // Add more custom password validation rules if needed.
    return null; // Return null if the password is valid.
  }

  void register() async {
    print(emailController.text);
    print(usernameController.text);
    print(passwordController.text);
    if (formKey.currentState!.validate()) {
      print('Registering...');
      await AuthService().registerEmailPassword(
          email: emailController.text,
          password: passwordController.text,
          username: usernameController.text);
    }
  }
}
