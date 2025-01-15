import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url, BuildContext context) async {
  final urlUri = Uri.parse(url);
  try {
    await launchUrl(urlUri, mode: LaunchMode.externalApplication);
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("No se pudo abrir $url")));
  }
}
