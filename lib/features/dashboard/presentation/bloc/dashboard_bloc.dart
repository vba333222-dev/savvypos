import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/dashboard/domain/repositories/i_dashboard_repository.dart';

part 'dashboard_bloc.freezed.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.loadData() = _LoadData;
}

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default([]) List<DailySalesData> recentSales,
    @Default([]) List<TopSellingItem> topProducts,
    @Default(0.0) double todaySales,
    @Default(0) int pendingSyncCount,
    @Default(true) bool isLoading,
    String? error,
  }) = _DashboardState;
}

@Injectable(env: ['mobile', 'web'])
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final IDashboardRepository _repository;

  DashboardBloc(this._repository) : super(const DashboardState()) {
    on<_LoadData>(_onLoadData);
  }

  Future<void> _onLoadData(_LoadData event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final recent = await _repository.getSalesLast7Days();
      final today = await _repository.getTodaySales();
      final pending = await _repository.getPendingSyncCount();
      final top = await _repository.getTopSellingProducts();
      
      emit(state.copyWith(
        recentSales: recent,
        topProducts: top,
        todaySales: today,
        pendingSyncCount: pending,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
