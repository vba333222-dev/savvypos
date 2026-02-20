import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/entities/waste_record.dart';

abstract class IInventoryRepository {
  // Supplier
  Future<List<Supplier>> getSuppliers();
  Future<void> saveSupplier(Supplier supplier);
  
  // Purchase Order
  Future<List<PurchaseOrder>> getPurchaseOrders({PoStatus? status});
  Future<PurchaseOrder?> getPurchaseOrder(String uuid);
  Future<void> savePurchaseOrder(PurchaseOrder po);
  Future<void> receivePurchaseOrder(String poUuid, Map<String, double> receivedQuantities);
  
  // Stock Logic
  Future<void> updateStock(String productUuid, double quantityChange, String reason, {String? referenceId});
  Future<double> getStockQuantity(String productUuid);
  
  // Stock Count
  Future<void> startStockCount(StockCount count);
  Future<void> submitStockCount(StockCount count); // Finalizes and adjusts stock
  
  // Stock Transfer
  Future<void> transferStock(StockTransfer transfer);
  
  // Receiving
  Future<void> receiveGoods(String poUuid, Map<String, double> quantities);
  
  // Waste Reports
  Future<List<WasteRecord>> getWasteReports({DateTime? from, DateTime? to});
}
