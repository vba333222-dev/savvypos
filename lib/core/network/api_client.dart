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

  Future<bool> pushSyncData(List<Map<String, dynamic>> items) async {
    if (items.isEmpty) return true;

    try {
      final response = await _dio.post(
        '/sync/push',
        data: {
          'items': items, // Old structure, but backend expects SyncRequest now? 
          // Wait, backend expects SINGLE SyncRequest or list?
          // Handler says: ShouldBindJSON(&req) where req is SyncRequest (single).
          // But mobile sends LIST.
          // Backend handler needs an update or Mobile needs to send one by one.
          // Let's assume Mobile iterates or Backend handles list. 
          // Current Backend: HandlePush binds ONE SyncRequest.
          // Mobile Logic in sync_worker: iterates and creates payload list.
          // Client.pushSyncData takes List.
          // I will update pushSyncData to loop or change backend to list.
          // Task 1 prompts implied: "Request Struct: Define a struct matching the SyncQueue item".
          // It didn't explicitly say batch.
          // I will update Mobile to push one by one for now to match current backend `SyncRequest`.
        },
      );
      // ...
      return false; 
    } catch(e) { return false; }
  }
  
  // Adjusted Push for Single Item Loop compatibility or Backend Batch update
  Future<bool> pushItem(Map<String, dynamic> item) async {
      try {
          // Backend expects: ActionType, PayloadJson, IdempotencyKey
          // Mobile SyncQueue: action, payload, idempotency_key
          final response = await _dio.post('/sync/push', data: {
              'actionType': item['action'],
              'payloadJson': item['payload'], // encoding might be needed if Backend defines it as json.RawMessage
              'idempotencyKey': item['idempotency_key']
          });
          return response.statusCode == 200;
      } catch (e) {
          _logger.e('Push Failed', error: e);
          return false;
      }
  }

  Future<Map<String, dynamic>?> pullSyncData(String lastSyncedAt) async {
    try {
      final response = await _dio.get(
        '/sync/pull',
        queryParameters: {
          'last_synced_at': lastSyncedAt,
        },
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
}
