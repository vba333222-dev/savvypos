import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/history/domain/repositories/i_order_repository.dart';

part 'history_bloc.freezed.dart';

@freezed
class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.loadHistory() = _LoadHistory;
  const factory HistoryEvent.loadOrderItems(String orderUuid) = _LoadOrderItems;
  const factory HistoryEvent.exportHistoryToCsv(DateTime start, DateTime end) = _ExportHistoryToCsv;
}

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default([]) List<OrderTableData> orders,
    @Default({}) Map<String, List<OrderItemTableData>> orderItems, // Cache items by Order UUID
    @Default(true) bool isLoading,
    String? error,
  }) = _HistoryState;
}

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final IOrderRepository _repository;

  HistoryBloc(this._repository) : super(const HistoryState()) {
    on<_LoadHistory>(_onLoadHistory);
    on<_LoadOrderItems>(_onLoadOrderItems);
    on<_ExportHistoryToCsv>(_onExportHistory);
  }

  Future<void> _onLoadHistory(_LoadHistory event, Emitter<HistoryState> emit) async {
    emit(state.copyWith(isLoading: true));
    await emit.forEach(
      _repository.getOrders(),
      onData: (orders) => state.copyWith(orders: orders, isLoading: false),
      onError: (e, s) => state.copyWith(error: e.toString(), isLoading: false),
    );
  }

  Future<void> _onLoadOrderItems(_LoadOrderItems event, Emitter<HistoryState> emit) async {
    // If already loaded, skip
    if (state.orderItems.containsKey(event.orderUuid)) return;

    try {
      final items = await _repository.getOrderItems(event.orderUuid);
      final newMap = Map<String, List<OrderItemTableData>>.from(state.orderItems);
      newMap[event.orderUuid] = items;
      emit(state.copyWith(orderItems: newMap));
    } catch (e) {
      // Handle silently or show error
    }
  }

  Future<void> _onExportHistory(_ExportHistoryToCsv event, Emitter<HistoryState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final orders = await _repository.getOrdersByDateRange(event.start, event.end);
      
      // Header
      final csvBuffer = StringBuffer();
      csvBuffer.writeln('Date,Order ID,Subtotal,Discount,Tax,Total,Payment Method,Tendered,Change,Status');

      // Rows
      for (final order in orders) {
        csvBuffer.writeln(
          '${order.transactionDate},${order.orderNumber},${order.subtotal},${order.discountTotal},'
          '${order.taxTotal},${order.grandTotal},${order.paymentMethod},'
          '${order.tenderedAmount ?? ""},${order.changeAmount ?? ""},${order.status}'
        );
      }

      // Save & Share
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/sales_report_${DateTime.now().millisecondsSinceEpoch}.csv';
      final file = File(path);
      await file.writeAsString(csvBuffer.toString());
      
      await SharePlus.instance.share(ShareParams(files: [XFile(path)], text: 'Sales Report'));
      
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Export failed: $e'));
    }
  }
}
