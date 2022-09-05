import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData lightTheme;

  LightTheme() {
    lightTheme = ThemeData(
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.green),
        colorScheme: const ColorScheme.light(),
        buttonTheme: const ButtonThemeData(
          colorScheme: ColorScheme.light(onPrimary: Colors.purple),
        ),
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(subtitle1: const TextStyle(fontSize: 20, color: Colors.black)));
  }
}

class _LightColor {
  final Color _textColor = Colors.redAccent;
}
