import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/sales/domain/repositories/i_sales_repository.dart';

@injectable
class GetModifiersUseCase {
  final ISalesRepository _repository;
  GetModifiersUseCase(this._repository);

  Future<List<ModifierGroupWithItems>> call(String productUuid) async {
    final groups = await _repository.getModifierGroups(productUuid);
    final List<ModifierGroupWithItems> result = [];
    
    for (final group in groups) {
      final items = await _repository.getModifierItems(group.uuid);
      result.add(ModifierGroupWithItems(group: group, items: items));
    }
    
    return result;
  }
}

class ModifierGroupWithItems extends Equatable {
  final ModifierGroupTableData group;
  final List<ModifierItemTableData> items;

  const ModifierGroupWithItems({required this.group, required this.items});

  @override
  List<Object?> get props => [group, items];
}
