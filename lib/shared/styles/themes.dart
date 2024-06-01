import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme=ThemeData(
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor("333739"),
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: HexColor("333739"),
    titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor("333739"),
      statusBarBrightness: Brightness.light,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  useMaterial3: true,
  scaffoldBackgroundColor: HexColor("333739"),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);
ThemeData lightTheme=ThemeData(
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor("333739"),
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: HexColor("333739"),
    titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor("333739"),
      statusBarBrightness: Brightness.light,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  useMaterial3: true,
  scaffoldBackgroundColor: HexColor("333739"),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);