import 'package:flutter/foundation.dart';
import 'package:portafolio_flutter/dio/dio.dart';

Future<bool> postEmail({
  required String name,
  required String email,
  required String description,
}) async {
  try {
    dio.post(
      '/email',
      data: {"name": name, "email": email, "description": description},
    );
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
