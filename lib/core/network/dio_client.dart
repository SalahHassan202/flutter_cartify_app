import 'package:dio/dio.dart';
import 'api_endpoints.dart';

class DioClient {
  DioClient._();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}
