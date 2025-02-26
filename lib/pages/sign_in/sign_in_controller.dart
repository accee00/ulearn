import 'package:app_bloc/pages/sign_in/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  const SignInController({
    required this.context,
  });
  final BuildContext context;

  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SigninBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {}
        if (password.isEmpty) {}

        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
        } catch (e) {}
      }
    } catch (e) {}
  }
}
