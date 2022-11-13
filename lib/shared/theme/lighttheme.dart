// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../presentation/color_manager.dart';
import '../presentation/font_manager.dart';
import '../presentation/styles_manager.dart';
import '../presentation/values_manager.dart';

ThemeData getTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    //icon Theme
    iconTheme: const IconThemeData(color: Colors.black),

    //appBarTheme
    appBarTheme: const AppBarTheme(
        backwardsCompatibility: false,
        // ignore: prefer_const_constructors
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black, statusBarBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        // centerTitle: true,
        elevation: 0,
        // shadowColor: ColorManager.lightPrimary,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
        //  getRegularStyle(
        //     color: ColorManager.white, fontSize: FontSize.fs16)

        ),

    //BottomNavigationBartheme
    // ignore: prefer_const_constructors
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      backgroundColor: Colors.white,
    ),
    //Text Theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.fs16),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.fs16),
        headlineMedium: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.fs14),
        titleMedium: getMediumStyle(
            color: ColorManager.primary, fontSize: FontSize.fs16),
        bodyLarge: const TextStyle(
            fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),
        bodySmall: getRegularStyle(color: ColorManager.grey)),
  );
}
