import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var emailError = ''.obs;
  var passwordError = ''.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateEmail(String value) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@gmail\.com$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      emailError.value = 'Invalid email address. Must be a Gmail address.';
      return emailError.value;
    } else {
      emailError.value = '';
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length >= 6) {
      passwordError.value = '';
      return null;
    } else {
      passwordError.value = 'Password must be at least 6 characters';
      return passwordError.value;
    }
  }
}
