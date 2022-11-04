// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/state.dart';
import 'package:newsapp/modules/buisness/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sport/sport_screen.dart';
import 'package:newsapp/network/remote/dio_helper.dart';

import '../../modules/settings/settings_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
  ];

  List<Widget> Screens = const [
    BuisnessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  void getBusiness() {
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apiKey": "65f7f556ec76449fa7dc7c0069f040ca"
    }).then((value) {
      print(value.data['articles'][0]['title']);
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
