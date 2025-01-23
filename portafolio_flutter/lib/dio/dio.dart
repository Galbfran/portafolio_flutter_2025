import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final url = dotenv.env['URL_API_PROD'] ?? '';

final dio = Dio(BaseOptions(
  baseUrl: url,
  contentType: 'application/json',
));
