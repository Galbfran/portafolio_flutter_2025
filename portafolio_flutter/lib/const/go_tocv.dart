// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portafolio_flutter/const/laucher_url.dart';
import 'package:portafolio_flutter/widgets/snack_bar.dart';

void goToCv({required BuildContext context}) async {
  try {
    final uri = dotenv.env['URL_CV'] ?? '';
    await launchURL(uri, context);
    snackBarShow(text: "CV descargado con exito.", context: context);
  } catch (e) {
    debugPrint(e.toString());
    snackBarShow(text: "Error al descargar el CV.", context: context);
  }
}
