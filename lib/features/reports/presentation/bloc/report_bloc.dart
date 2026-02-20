import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/reports/domain/entities/sales_report_item.dart';
import 'package:savvy_pos/features/reports/domain/entities/stock_ledger_item.dart';
import 'package:savvy_pos/features/reports/domain/repositories/i_report_repository.dart';

part 'report_bloc.freezed.dart';

@freezed
class ReportEvent with _$ReportEvent {
  const factory ReportEvent.loadSalesReport(DateTime start, DateTime end) = _LoadSalesReport;
  const factory ReportEvent.loadStockLedger(String productUuid) = _LoadStockLedger;
}

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = _Initial;
  const factory ReportState.loading() = _Loading;
  const factory ReportState.salesLoaded(List<SalesReportItem> report) = _SalesLoaded;
  const factory ReportState.stockLoaded(List<StockLedgerItem> ledger) = _StockLoaded;
  const factory ReportState.error(String message) = _Error;
}

@injectable
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final IReportRepository _repository;

  ReportBloc(this._repository) : super(const ReportState.initial()) {
    on<_LoadSalesReport>(_onLoadSalesReport);
    on<_LoadStockLedger>(_onLoadStockLedger);
  }

  Future<void> _onLoadSalesReport(_LoadSalesReport event, Emitter<ReportState> emit) async {
    emit(const ReportState.loading());
    try {
      final report = await _repository.getSalesReport(event.start, event.end);
      emit(ReportState.salesLoaded(report));
    } catch (e) {
      emit(ReportState.error(e.toString()));
    }
  }

  Future<void> _onLoadStockLedger(_LoadStockLedger event, Emitter<ReportState> emit) async {
    emit(const ReportState.loading());
    try {
      final ledger = await _repository.getStockLedger(event.productUuid);
      emit(ReportState.stockLoaded(ledger));
    } catch (e) {
      emit(ReportState.error(e.toString()));
    }
  }
}
