import 'package:flutter/material.dart';

// Starter colours for the app
class AppColors {
  static Color primaryColor = const Color.fromARGB(255, 64, 162, 19);
  static Color primaryAccent = const Color.fromARGB(255, 15, 178, 24);
  static Color secondaryColor = const Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = const Color.fromRGBO(35, 35, 35, 1);
  static Color titleColor = const Color.fromRGBO(200, 200, 200, 1);
  static Color textColor = const Color.fromRGBO(150, 150, 150, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 1);
}

ThemeData primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    // scaffoldBackgroundColor: Colors.grey[200],
  ),
  scaffoldBackgroundColor: AppColors.secondaryAccent,
  useMaterial3: true,
  
  //app bar theme colors

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),
  textTheme: const TextTheme().copyWith(
      bodyMedium: TextStyle(
        color: AppColors.textColor,
        fontSize: 16,
        letterSpacing: 1,
      ),
      headlineMedium: TextStyle(
        color: AppColors.titleColor,
        fontSize: 16,
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(color: AppColors.textColor, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.bold)),

// card theme

  cardTheme: CardTheme(
    color: AppColors.secondaryColor.withOpacity(0.5),
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
    margin: const EdgeInsets.only(bottom: 16),
  ),


);
