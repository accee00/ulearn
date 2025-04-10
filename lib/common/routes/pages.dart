import 'package:app_bloc/common/routes/names.dart';
import 'package:app_bloc/global.dart';
import 'package:app_bloc/pages/application/application_page.dart';
import 'package:app_bloc/pages/application/bloc/application_bloc.dart';
import 'package:app_bloc/pages/register/bloc/register_bloc.dart';
import 'package:app_bloc/pages/register/register.dart';
import 'package:app_bloc/pages/sign_in/bloc/signin_bloc.dart';
import 'package:app_bloc/pages/sign_in/sign_in.dart';
import 'package:app_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:app_bloc/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';

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
      // sign in page
      PageEntity(
        route: AppRoutes.signIn,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SigninBloc(),
        ),
      ),
      // sign up/register
      PageEntity(
        route: AppRoutes.register,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.application,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => ApplicationBloc(),
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

  static MaterialPageRoute generateRouteSetting(RouteSettings setting) {
    if (setting.name != null) {
      final result = routes().where((element) => element.route == setting.name);
      if (result.isNotEmpty) {
        if (setting.name == AppRoutes.initial) {
          print('object');
          bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
          if (deviceFirstOpen) {
            print('121');
            return MaterialPageRoute(
                builder: (_) => const SignIn(), settings: setting);
          }
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: setting,
        );
      }
    }
    print('invalid');
    return MaterialPageRoute(builder: (_) => SignIn(), settings: setting);
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
