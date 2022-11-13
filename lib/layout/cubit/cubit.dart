// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/state.dart';
import 'package:newsapp/modules/buisness/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sport/sport_screen.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import 'package:newsapp/network/remote/dio_helper.dart';

import '../../modules/settings/settings_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
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

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    //if the fromshared is not null i.e has a value then save this value in isDark otherwise flip the value of isDark
    if (fromShared != null) {
      isDark = fromShared;
      // emit(NewsAppModeChange());
    } else {
      isDark = !isDark;

      // we are saving the value of the bool variable isDark in CacheHelper
      CacheHelper.setBoolean(key: "isDark", value: isDark).then((value) {
        emit(NewsAppModeChange());
      });
      // emit(NewsAppModeChange());
    }
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "business",
        "apiKey": "8502239270684ddca484b06762eb748a"
      }).then((value) {
        business = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetBusinessErrorState(toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sport = [];
  void getSports() {
    emit(NewsGetSportLoadingState());
    if (sport.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "sport",
        "apiKey": "8502239270684ddca484b06762eb748a"
      }).then((value) {
        sport = value.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSportsErrorState(toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getscience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "science",
        "apiKey": "8502239270684ddca484b06762eb748a"
      }).then((value) {
        science = value.data['articles'];
        emit(NewsGetSciencesSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSciencesErrorState(toString()));
      });
    } else {
      emit(NewsGetSciencesSuccessState());
    }
  }
}
