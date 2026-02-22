import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/cash/domain/entities/cash_drawer_entities.dart';
import 'package:savvy_pos/features/cash/domain/repositories/i_cash_drawer_repository.dart';
// Note: Assuming IShiftRepository exists or logic is handled here.
// For this vertical slice, we'll focus on CashDrawer repo which holds shift ID relation often.
// If IShiftRepository is separate, we'd inject it too.

@injectable
class StartShiftUseCase {
  final ICashDrawerRepository _cashRepository;

  StartShiftUseCase(this._cashRepository);

  Future<CashDrawer> call({
    required String shiftUuid,
    required String employeeUuid,
    required String employeeName,
    required double startingCash,
  }) async {
    // 1. In a real full app, we might create the ShiftSession here if not already created.
    // For now, we assume the UI calls "Clock In" (Shift Repo) then "Open Drawer" immediately,
    // or this UseCase handles both.
    // To match the "Professional" requested standard, let's assume we just open the drawer
    // for an EXISTING shift UUID (passed from Shift Context).

    // 2. Open Drawer
    return _cashRepository.openDrawer(
        shiftUuid, employeeUuid, employeeName, startingCash);
  }
}

@injectable
class CloseShiftUseCase {
  final ICashDrawerRepository _cashRepository;

  CloseShiftUseCase(this._cashRepository);

  Future<CashDrawer> call({
    required String drawerUuid,
    required double actualClosingBalance,
  }) async {
    // 1. Close Drawer (Blind Close Logic relies on UI not showing expected)
    // The Repository calculates variance.
    return _cashRepository.closeDrawer(drawerUuid, actualClosingBalance);
  }
}

@injectable
class CashDropUseCase {
  final ICashDrawerRepository _cashRepository;

  CashDropUseCase(this._cashRepository);

  Future<void> call({
    required String drawerUuid,
    required double amount,
    required String reason,
  }) async {
    if (amount <= 0) throw Exception("Drop amount must be positive");
    await _cashRepository.recordEvent(
        drawerUuid, CashEventType.cashDrop, amount, reason);
  }
}

@injectable
class GetShiftReportUseCase {
  final ICashDrawerRepository _cashRepository;

  GetShiftReportUseCase(this._cashRepository);

  Future<CashDrawerSummary> call(String drawerUuid) async {
    return _cashRepository.getDrawerSummary(drawerUuid);
  }
}
