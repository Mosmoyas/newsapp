// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/shared/presentation/strings_manager.dart';
import '../../../modules/sport/sport_screen.dart';

import '../../../layout/news_app.dart';
import '../../../modules/buisness/business_screen.dart';

class Routes {
  static const String newsLayout = "/";
  static const String buisnessRoute = "/business";
  static const String sportgRoute = "/sport";
  static const String scienceRoute = "/science";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.newsLayout:
        return MaterialPageRoute(builder: (_) => const NewsLayout());
      case Routes.buisnessRoute:
        return MaterialPageRoute(builder: (_) => const BuisnessScreen());
      case Routes.sportgRoute:
        return MaterialPageRoute(builder: (_) => const SportScreen());
      case Routes.scienceRoute:
        return MaterialPageRoute(builder: (_) => const ScienceScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppString.noRountFound),
              ),
              body: const Text(AppString.noRountFound),
            ));
  }
}
