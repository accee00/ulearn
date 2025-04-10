import 'package:app_bloc/pages/sign_in/sign_in_controller.dart';
import 'package:app_bloc/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/signin_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
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
                        child:
                            reusableText('Or use your email account to login.'),
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
                            buildTextField(
                                "Enter email address", 'email', 'user',
                                (value) {
                              context.read<SigninBloc>().add(EmailEvent(value));
                            }),
                            reusableText('Password'),
                            SizedBox(height: 5.h),
                            buildTextField(
                                'Enter your password', 'password', 'lock',
                                (value) {
                              context
                                  .read<SigninBloc>()
                                  .add(PasswordEvent(value));
                            }),
                            forgotPassword(),
                            buildLogInButtons(
                              'Log In',
                              'login',
                              () {
                                SignInController(context: context)
                                    .handleSignIn('email');
                              },
                            ),
                            buildLogInButtons(
                              'Register',
                              'register',
                              () {
                                Navigator.pushNamed(context, '/register');
                              },
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
      },
    );
  }
}
