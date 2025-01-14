import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffDBE285);
const Color secundaryColor = Color(0xff61A375);

final ThemeData theme = ThemeData(
  colorScheme: ColorScheme(
    primary: primaryColor,
    secondary: secundaryColor,
    brightness: Brightness.light,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.black,
  ),
  typography: Typography.material2021(),
  useMaterial3: true,
);
