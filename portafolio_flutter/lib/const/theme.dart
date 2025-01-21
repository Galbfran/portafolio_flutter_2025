import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffDBE285);
const Color secundaryColor = Color(0xff61A375);
const Color buttonColor = Color.fromARGB(255, 173, 180, 107);
const Color fourColor = Color(0xff61A375);

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.amber[600],
  colorScheme: ColorScheme(
    primary: secundaryColor,
    secondary: secundaryColor,
    brightness: Brightness.light,
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.red,
  ),
  fontFamily: 'Franklin',
  typography: Typography.material2021(),
  useMaterial3: true,
);
