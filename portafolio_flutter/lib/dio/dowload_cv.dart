import 'package:flutter/foundation.dart';
import 'package:portafolio_flutter/dio/dio.dart';

Future<bool> postEmail({
  required String name,
  required String email,
  required String description,
}) async {
  try {
    await dio.get('/pdf/download');
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
