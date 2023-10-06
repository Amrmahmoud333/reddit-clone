import 'package:flutter/material.dart';

class ThemeOfProject {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.blue.shade300,
    cardColor: const Color.fromRGBO(26, 39, 45, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
    ),
    primaryColor: Colors.red.shade500,
  );
}
