import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/form/controller/form_controlller.dart';
import 'package:getx_state_management/todo/view/home.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    FormController formController = Get.put(FormController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Create Account,',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Sign up to get started!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 80.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Obx(
                  () => TextField(
                    controller: formController.emailController,
                    onChanged: (value) => formController.validateEmail(value),
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      filled: true,
                      fillColor: Colors.white,
                      errorText: formController.emailError.value == ''
                          ? null
                          : formController.emailError.value,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Obx(
                  () => TextField(
                    controller: formController.passwordController,
                    onChanged: (value) =>
                        formController.validatePassword(value),
                    obscureText: true,
                    decoration: InputDecoration(
                      errorText: formController.passwordError.value == ''
                          ? null
                          : formController.passwordError.value,
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60.0),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(TodoHomeScreen());
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 400,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [Color(0xffFA578E), Color(0xffFDA88E)])),
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 60,
                  width: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffdae1ef)),
                  child: Text(
                    "Connect with Facebook",
                    style: TextStyle(color: Color(0xff385898), fontSize: 17),
                  ),
                ),
                SizedBox(height: 110.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I'm already a member,",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.pinkAccent),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
