import 'package:app_bloc/common/widget/flutter_toast.dart';
import 'package:app_bloc/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state as RegisterUserState;
    String userName = state.name;
    String email = state.email;
    String password = state.password;
    String repassword = state.rePassword;
    if (userName.isEmpty) {
      toastInfo(msg: 'User name required');
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: 'Email is required.');
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: 'Set your password first.');
      return;
    }
    if (repassword.isEmpty) {
      toastInfo(msg: 'Enter confirm password.');
      return;
    }
    if (password != repassword) {
      toastInfo(msg: 'Current password is different from re-entered password');
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
          msg:
              'A email has been sent to your registered email. To active it please check your email and click on link.',
        );
        if (context.mounted) {
          Navigator.pop(context);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The email is already in use.');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'Invalid email address.');
      }
    }
  }
}
