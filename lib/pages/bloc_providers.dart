import 'package:app_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in/bloc/signin_bloc.dart';

class AppBlocProviders {
  static get allBlocProvider => [
        BlocProvider<WelcomeBloc>(
          create: (_) => WelcomeBloc(),
        ),
        BlocProvider<SigninBloc>(
          create: (_) => SigninBloc(),
        )
      ];
}
