import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;
  final Logger _logger = Logger();

  // Use 10.0.2.2 for Android Emulator to access host localhost
  static const String baseUrl = 'http://10.0.2.2:8080/v1';

  ApiClient() : _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Future<bool> pushSyncData(List<Map<String, dynamic>> items) async {
    if (items.isEmpty) return true;

    try {
      final response = await _dio.post(
        '/sync/push',
        data: {
          'items': items,
        },
      );

      return response.statusCode == 200;
    } on DioException catch (e) {
      _logger.e('Sync Push Failed: ${e.message}', error: e);
      return false;
    } catch (e) {
      _logger.e('Sync Push Error', error: e);
      return false;
    }
  }
}
