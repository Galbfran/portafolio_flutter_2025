import 'package:flutter/material.dart';
import 'package:portafolio_flutter/const/theme.dart';

void snackBarShow({required String text, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: primaryColor,
      content: Text(text, style: const TextStyle(color: Colors.black)),
      duration: const Duration(seconds: 2),
    ),
  );
}
