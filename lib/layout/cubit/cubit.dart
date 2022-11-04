import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/state.dart';
import 'package:newsapp/modules/buisness/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sport/sport_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    const BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business")
  ];

  List<Widget> Screens = [BuisnessScreen(), SportScreen(), ScienceScreen()];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }
}
