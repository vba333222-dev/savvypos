import 'package:flutter_test/flutter_test.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';

void main() {
  group('SavvyTable', () {
    const table = SavvyTable(
      id: '1',
      name: 'Table 1',
      zoneId: 'zone-1',
      x: 10,
      y: 20,
    );

    test('supports value equality', () {
      expect(
        table,
        equals(
          const SavvyTable(
            id: '1',
            name: 'Table 1',
            zoneId: 'zone-1',
            x: 10,
            y: 20,
          ),
        ),
      );
    });

    test('copyWith updates fields correctly', () {
      final updated = table.copyWith(
        name: 'Updated Table',
        x: 50,
        isOccupied: true,
      );

      expect(updated.name, 'Updated Table');
      expect(updated.x, 50);
      expect(updated.y, 20); // Unchanged
      expect(updated.isOccupied, true);
    });
    
    test('props includes all fields', () {
       expect(table.props, [
          table.id, table.name, table.zoneId, table.x, table.y, table.width, table.height, table.rotation, table.shape, table.capacity, table.isOccupied, table.currentOrderUuid, table.currentSessionToken, table.qrCodeUrl, table.sessionStatus, table.updatedAt, table.version
       ]);
    });
  });
}
