import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar('Sign Up'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: reusableText(
                        'Enter your details below and free sign up'),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 40.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('User name'),
                        buildTextField("Enter your user name", 'email', 'user',
                            (value) {}),
                        reusableText('Email'),
                        buildTextField(
                            "Enter email address", 'email', 'user', (value) {}),
                        reusableText('Password'),
                        buildTextField('Enter your password', 'password',
                            'lock', (value) {}),
                        reusableText('Confirm Password'),
                        buildTextField('Re-enter your password', 'password',
                            'lock', (value) {}),
                        buildLogInButtons(
                          'Sign Up',
                          'login',
                          () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
