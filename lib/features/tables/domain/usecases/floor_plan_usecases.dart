import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/domain/entities/zone.dart';
import 'package:savvy_pos/features/tables/domain/repositories/i_table_repository.dart';

@injectable
class WatchZonesUseCase {
  final ITableRepository _repository;
  WatchZonesUseCase(this._repository);

  Stream<List<Zone>> call() => _repository.watchZones();
}

@injectable
class WatchTablesUseCase {
  final ITableRepository _repository;
  WatchTablesUseCase(this._repository);

  Stream<List<SavvyTable>> call() => _repository.watchTables();
}

@injectable
class SaveZoneUseCase {
  final ITableRepository _repository;
  SaveZoneUseCase(this._repository);

  Future<void> call(Zone zone) => _repository.saveZone(zone);
}

@injectable
class DeleteZoneUseCase {
  final ITableRepository _repository;
  DeleteZoneUseCase(this._repository);

  Future<void> call(String uuid) => _repository.deleteZone(uuid);
}

@injectable
class SaveTableUseCase {
  final ITableRepository _repository;
  SaveTableUseCase(this._repository);

  Future<void> call(SavvyTable table) => _repository.saveTable(table);
}

@injectable
class DeleteTableUseCase {
  final ITableRepository _repository;
  DeleteTableUseCase(this._repository);

  Future<void> call(String uuid) => _repository.deleteTable(uuid);
}
