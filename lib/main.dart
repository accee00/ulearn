import 'package:app_bloc/firebase_options.dart';
import 'package:app_bloc/pages/bloc_providers.dart';
import 'package:app_bloc/pages/home/my_home_page.dart';
import 'package:app_bloc/pages/register/register.dart';
import 'package:app_bloc/pages/sign_in/sign_in.dart';
import 'package:app_bloc/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProvider,
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const Welcome(),
            routes: {
              '/myHomePage': (context) => const MyHomePage(),
              '/signIn': (context) => const SignIn(),
              'register': (context) => const Register(),
            },
          );
        },
      ),
    );
  }
}
