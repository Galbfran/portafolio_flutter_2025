import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portafolio_flutter/const/theme.dart';

void clipBoardCopy({required String text, required BuildContext context}) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: primaryColor,
      content:
          Text('Copiado: $text', style: const TextStyle(color: Colors.black)),
      duration: const Duration(seconds: 2),
    ),
  );
}
