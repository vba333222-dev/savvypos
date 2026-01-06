import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;
  final Logger _logger = Logger();

  // Use 10.0.2.2 for Android Emulator, localhost for Web/iOS Simulator
  static String get baseUrl {
    if (kIsWeb) return 'http://localhost:8080/v1';
    return 'http://10.0.2.2:8080/v1';
  }

  ApiClient() : _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {
      'Content-Type': 'application/json',
    },
  )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // TODO: Get token from SharedPreferences or SecureStorage
        // For now, assuming a global or static token holder if available,
        // or purely relying on login flow to inject later.
        // ideally: final token = await _prefs.getString('auth_token');
        // options.headers['Authorization'] = 'Bearer $token';
        
        // Mock token for dev if not set
        // options.headers['Authorization'] = 'Bearer <mock-token>';
        return handler.next(options);
      },
    ));
  }

  Future<bool> pushItem(Map<String, dynamic> payload) async {
    try {
      // Requirement: Handle timeout (10-15s) and return true only if 200.
      // Headers: Authorization: Bearer <token>, X-Tenant-ID
      
      const token = "mock-token-123"; 
      const tenantId = "default-tenant";

      final response = await _dio.post(
        '/sync/push',
        data: {
          'actionType': payload['action'],
          'payloadJson': payload['payload'], 
          'idempotencyKey': payload['idempotency_key']
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Tenant-ID': tenantId,
          },
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          validateStatus: (status) => status != null && status < 500, // Let us handle status check manually
        ),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      _logger.e('Push Failed', error: e);
      return false;
    }
  }
  


  Future<Map<String, dynamic>?> pullSyncData(String lastSyncedAt) async {
    try {
      const token = "mock-token-123"; 
      const tenantId = "default-tenant";

      final response = await _dio.get(
        '/sync/pull',
        queryParameters: {
          'last_synced_at': lastSyncedAt,
        },
        options: Options(
          headers: {
             'Authorization': 'Bearer $token',
             'X-Tenant-ID': tenantId,
          },
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
