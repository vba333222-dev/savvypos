import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/network/auth_interceptor.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;
  final Logger _logger = Logger();

  // Use 10.0.2.2 for Android Emulator, localhost for Web/iOS Simulator
  static String get baseUrl {
    if (kIsWeb) return 'http://localhost:8080/v1';
    return 'http://10.0.2.2:8080/v1';
  }

  ApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          headers: {
            'Content-Type': 'application/json',
          },
        )) {
    _dio.interceptors.add(AuthInterceptor(_dio));
  }

  Future<Response?> pushItem(Map<String, dynamic> payload) async {
    try {
      final response = await _dio.post(
        '/sync/push',
        data: {
          // Backend expects: action, payload, idempotency_key (matching json tags)
          'action': payload['action'],
          'payload': payload['payload'],
          'idempotency_key': payload['idempotency_key']
        },
        options: Options(
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          // We want to handle 409 manually, so let's allow it.
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      return response;
    } catch (e) {
      _logger.e('Push Failed', error: e);
      // Rethrow so Worker knows it's a network/system failure?
      // Or return null? SyncWorker needs to differentiate Network Error vs Server Error.
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> pullSyncData(String lastSyncedAt) async {
    try {
      final response = await _dio.get(
        '/sync/pull',
        queryParameters: {
          'last_synced_at': lastSyncedAt,
        },
        options: Options(
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      _logger.e('Pull Failed', error: e);
      return null;
    }
  }

  // Analytics API
  Future<Map<String, dynamic>?> getAnalyticsSummary() async {
    try {
      final response = await _dio.get('/analytics/summary');
      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      _logger.e('Analytics Summary Failed', error: e);
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getSalesChart() async {
    try {
      final response = await _dio.get('/analytics/sales_chart');
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data);
      }
      return [];
    } catch (e) {
      _logger.e('Sales Chart Failed', error: e);
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getTopProducts() async {
    try {
      final response = await _dio.get('/analytics/top_products');
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data);
      }
      return [];
    } catch (e) {
      _logger.e('Top Products Failed', error: e);
      return [];
    }
  }
}
