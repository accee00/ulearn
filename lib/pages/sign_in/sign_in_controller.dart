import 'package:app_bloc/common/routes/names.dart';
import 'package:app_bloc/common/widget/flutter_toast.dart';
import 'package:app_bloc/pages/sign_in/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  const SignInController({
    required this.context,
  });
  final BuildContext context;

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SigninBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          toastInfo(msg: "You need to fill email address.");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password .");
          return;
        }

        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (credential.user == null) {
            toastInfo(msg: "You don't exist.");
            return;
          }

          // Send req to user to verify mail.
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
            return;
          }
          final user = credential.user;
          print(user.toString());
          if (user != null) {
            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.application, (_) => false);
            }
          } else {
            toastInfo(msg: "Currently you are not a user of this app.");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for this email.");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for entered user.");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email address  format is wrong.");
          }
        }
      }
    } catch (e) {}
  }
}
