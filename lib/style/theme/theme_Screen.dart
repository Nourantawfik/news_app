import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constant.dart';

ThemeData darkTheme = ThemeData(

  primarySwatch:defaultColor ,

  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
  //  color: Colors.black,

    titleSpacing: 20.0,
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: HexColor('333739'),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: defaultColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333739'),
    selectedItemColor: Colors.red[900],
    unselectedItemColor: Colors.red.withOpacity(0.5),
    elevation: 0.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),

    subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: 1.3),
  ),
);


ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  //scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
   // color: Colors.red[900],
    titleSpacing: 20.0,
    backgroundColor: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: HexColor('333739'),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle:
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: defaultColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.red[900],
    unselectedItemColor: Colors.red.withOpacity(0.5),
    elevation: 0.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),

    subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 1.3),
  ),
);
