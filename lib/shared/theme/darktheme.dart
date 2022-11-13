import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../presentation/color_manager.dart';
import '../presentation/font_manager.dart';
import '../presentation/styles_manager.dart';
import '../presentation/values_manager.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    //main Colors
    primarySwatch: Colors.orange,

    scaffoldBackgroundColor: HexColor("333739"),
    // backgroundColor: ColorManager.darkGrey1,

    //appBarTheme
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor("333739"),
            statusBarBrightness: Brightness.light),
        backgroundColor: HexColor("333739"),
        elevation: 0,
        // ignore: prefer_const_constructors
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    iconTheme: const IconThemeData(color: Colors.white),

    //BottomNavigationBartheme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.white,
        elevation: 20.0,
        backgroundColor: HexColor("333739"),
        unselectedItemColor: Colors.grey),

    //Text Theme
    textTheme: TextTheme(
        // ignore: prefer_const_constructors
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.fs16),
        headlineMedium: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.fs14),
        titleMedium: getMediumStyle(
            color: ColorManager.primary, fontSize: FontSize.fs16),
        displayLarge: getRegularStyle(color: ColorManager.lightGrey),
        bodySmall: getRegularStyle(color: ColorManager.grey)),
  );
}
