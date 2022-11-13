// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import 'package:newsapp/network/remote/dio_helper.dart';
import 'package:newsapp/shared/blocobserver/bloc_observer.dart';
import 'package:newsapp/shared/presentation/routes_manager.dart';
import 'package:newsapp/shared/presentation/theme_manager.dart';
import 'package:newsapp/shared/theme/darktheme.dart';
import 'package:newsapp/shared/theme/lighttheme.dart';

import 'layout/cubit/cubit.dart';
import 'layout/cubit/state.dart';
import 'layout/news_app.dart';
// import 'package:newsapp/presentation/resources/theme_manager.dart';
// import 'presentation/resources/routes_manager.dart';

void main() async {
  //to ensure taht the Future Methods will be run
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDarked = CacheHelper.getBoolean(key: "isDark");
  runApp(MyApp(
    isDark: isDarked,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({
    super.key,
    required this.isDark,
  }); //required this.isDark

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          NewsCubit()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          print(NewsCubit.get(context).isDark);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App ',
            theme: getTheme(),
            darkTheme: getDarkTheme(),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,

            // onGenerateRoute: RouteGenerator.getRoute,
            // initialRoute: Routes.newsLayout,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
