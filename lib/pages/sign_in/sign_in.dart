import 'package:app_bloc/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                    child: reusableText('Or use your email account to login.'),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 55.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Email'),
                        SizedBox(height: 5.h),
                        buildTextField("Enter email address", 'email', 'user'),
                        reusableText('Password'),
                        SizedBox(height: 5.h),
                        buildTextField(
                            'Enter your password', 'password', 'lock'),
                        forgotPassword(),
                        buildLogInButtons('Log In', 'login'),
                        buildLogInButtons('Register', 'register'),
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
