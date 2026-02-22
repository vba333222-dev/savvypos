import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/shifts/domain/usecases/calculate_eod_financials.dart';

@injectable
class SyncEodToAccountingUseCase {
  final Dio _dio;

  SyncEodToAccountingUseCase() : _dio = Dio() {
    _dio.options.baseUrl = 'https://api.savvypos.com'; // Mock Go Backend URL
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);

    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        logPrint: print,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
      ),
    );
  }

  Future<bool> call(
      String shiftId, FinancialAggregationResult financials) async {
    try {
      final payload = {
        'shift_id': shiftId,
        'timestamp': DateTime.now().toIso8601String(),
        'metrics': {
          'gross_sales': financials.grossSales,
          'net_sales': financials.netSales,
          'total_tax': financials.totalTax,
          'total_service_charge': financials.totalServiceCharge,
          'total_discounts': financials.totalDiscounts,
          'estimated_cogs': financials.estimatedCogs,
        },
        'status': 'CLOSED'
      };

      // Mocking the POST. In real environment this hits the Go backend endpoint.
      // final response = await _dio.post('/api/v1/accounting/eod-sync', data: payload);
      print('Mock Dispatch EOD Payload: $payload');
      // Simulate network latency for Lottie loader test
      await Future.delayed(const Duration(seconds: 3));

      return true; // Simulate 200 OK
    } catch (e) {
      throw Exception('Failed to sync EOD ledger: $e');
    }
  }
}
