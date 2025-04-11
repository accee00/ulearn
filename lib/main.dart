import 'package:app_bloc/common/routes/routes.dart';
import 'package:app_bloc/global.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
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
            onGenerateRoute: (settings) =>
                AppPages.generateRouteSetting(settings),
            initialRoute: AppRoutes.application,
          );
        },
      ),
    );
  }
}
