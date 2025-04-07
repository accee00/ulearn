import 'package:app_bloc/common/routes/names.dart';
import 'package:app_bloc/pages/register/bloc/register_bloc.dart';
import 'package:app_bloc/pages/register/register.dart';
import 'package:app_bloc/pages/sign_in/bloc/signin_bloc.dart';
import 'package:app_bloc/pages/sign_in/sign_in.dart';
import 'package:app_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:app_bloc/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      // initial or welcome
      PageEntity(
        route: AppRoutes.initial,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.signIn,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SigninBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.register,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
    ];
  }

  // return all bloc provider.
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];
    for (var bloc in routes()) {
      blocProvider.add(bloc.bloc);
    }
    return blocProvider;
  }
}

class PageEntity {
  final String route;
  final Widget page;
  final dynamic bloc;
  PageEntity({
    required this.route,
    required this.page,
    required this.bloc,
  });
}
