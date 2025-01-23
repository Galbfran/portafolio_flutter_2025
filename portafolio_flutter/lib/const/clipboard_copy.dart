import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portafolio_flutter/widgets/snack_bar.dart';

void clipBoardCopy({required String text, required BuildContext context}) {
  Clipboard.setData(ClipboardData(text: text));
  snackBarShow(text: "Copiado: $text", context: context);
}
