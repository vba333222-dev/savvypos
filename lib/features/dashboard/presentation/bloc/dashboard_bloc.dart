import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:savvy_pos/features/dashboard/domain/repositories/i_dashboard_repository.dart';

part 'dashboard_bloc.freezed.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.loadData([DateTime? date]) = _LoadData;
  const factory DashboardEvent.refresh() = _Refresh;
}

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.loaded({
    required DashboardStats stats,
    required List<HourlySalesData> hourlySales,
    required List<TopProductData> topProducts,
    required DateTime selectedDate,
  }) = _Loaded;
  const factory DashboardState.error(String message) = _Error;
}

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final IDashboardRepository _repository;

  DashboardBloc(this._repository) : super(const DashboardState.initial()) {
    on<_LoadData>(_onLoadData);
    on<_Refresh>(_onRefresh);
  }

  Future<void> _onLoadData(_LoadData event, Emitter<DashboardState> emit) async {
    emit(const DashboardState.loading());
    try {
      final date = event.date ?? DateTime.now();
      
      // Define Start/End of Day
      final start = DateTime(date.year, date.month, date.day);
      final end = start.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));
      
      final stats = await _repository.getStatsForPeriod(start, end);
      final hourly = await _repository.getHourlySales(start);
      final top = await _repository.getTopProducts(start, end);

      emit(DashboardState.loaded(
        stats: stats,
        hourlySales: hourly,
        topProducts: top,
        selectedDate: date,
      ));
    } catch (e) {
      emit(DashboardState.error(e.toString()));
    }
  }

  Future<void> _onRefresh(_Refresh event, Emitter<DashboardState> emit) async {
    final currentState = state;
    if (currentState is _Loaded) {
      add(DashboardEvent.loadData(currentState.selectedDate));
    } else {
      add(const DashboardEvent.loadData());
    }
  }
}
