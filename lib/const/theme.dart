import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.grey),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      accentColor: Colors.blueGrey,
    ),
    brightness: Brightness.dark,
  );
}

ThemeData ligthTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(color: Colors.red[300]),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: Colors.red[900],
    ),
    brightness: Brightness.light,
  );
}
