import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/network/remote/dio_helper.dart';
import 'package:newsapp/shared/presentation/routes_manager.dart';
import 'package:newsapp/shared/presentation/theme_manager.dart';

import 'layout/cubit/cubit.dart';
import 'layout/cubit/state.dart';
// import 'package:newsapp/presentation/resources/theme_manager.dart';
// import 'presentation/resources/routes_manager.dart';

void main() {
  Bloc.observer;
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          print(NewsCubit.get(context).isDark);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App ',
            theme: getApplicationTheme(),
            darkTheme: getApplicationDarkTheme(),
            themeMode: NewsCubit.get(context).isDark ==true
                ? ThemeMode.dark
                : ThemeMode.light,

            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.newsLayout,
            // home: Text(Routes.newsLayout),
          );
        },
      ),
    );
  }
}
