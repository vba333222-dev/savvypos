import 'package:isar/isar.dart';

part 'isar_schema.g.dart';

// ==============================================================================
// 1. TENANT & CONFIGURATION (Monetization Gate)
// ==============================================================================
@collection
class TenantConfig {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String tenantId;       // UUID dari Backend/RevenueCat

  late String outletName;
  late String address;
  late String currencySymbol; // "Rp", "$"

  // --- MONETIZATION LOGIC ---
  @Enumerated(EnumType.ordinal)
  late SubscriptionTier tier; // 0: Free, 1: Pro, 2: Enterprise

  late DateTime? subscriptionExpiry;
  
  // Flag "Kill Switch" untuk Iklan
  // Logic: if (tier == Free) isAdsEnabled = true;
  late bool isAdsEnabled;

  // --- SECURITY ---
  // Hash PIN Manager untuk offline override (Void/Refund tanpa internet)
  late String? managerPinHash; 

  late DateTime updatedAt;
}

enum SubscriptionTier {
  free,       // Limit 1 Outlet, No Cloud Sync, Ads ON
  pro,        // Cloud Sync, Dashboard, Ads OFF
  enterprise  // Custom Integrations
}

// ==============================================================================
// 2. PRODUCT CATALOG (Read-Heavy)
// ==============================================================================
@collection
class Product {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String uuid;           // Global ID dari Server

  @Index(type: IndexType.value, caseSensitive: false)
  late String name;

  @Index()
  late String? sku;
  
  late String? barcode;
  late double price;
  late double? costPrice;     // COGS (Hanya visible untuk Manager)
  
  late String categoryId;     // Relasi manual ke Category
  late bool trackStock;       // false untuk Jasa/Service
  late bool isService;        // True jika ini "Jasa Potong Rambut" dsb

  // --- ANTIGRAVITY UI PROPERTIES ---
  // Menyimpan warna dominan untuk animasi Card yang fluid
  late String? colorHex;      
  // URL gambar (di-cache oleh cached_network_image)
  late String? imageUrl;      

  // --- SYNC METADATA ---
  late DateTime updatedAt;
  @Index()
  late bool isSynced;         // false = ada perubahan lokal yang belum naik
  late bool isDeleted;        // Soft Delete
}

// ==============================================================================
// 3. ORDER & TRANSACTION (Write-Heavy)
// ==============================================================================
@collection
class Order {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String uuid;           // Generate UUID v4 di local saat create

  @Index()
  late String orderNumber;    // Format: "TRX-{YYYYMMDD}-{SEQ}"

  @Index()
  late String? shiftUuid;     // Link ke ShiftSession yang sedang aktif
  
  late DateTime transactionDate;

  // Cart Items (Disimpan sebagai JSON Embedded agar performa query cepat)
  late List<OrderItem> items;

  // Financials
  late double subtotal;
  late double discountTotal;
  late double taxTotal;
  late double grandTotal;

  // Payment
  @Enumerated(EnumType.string)
  late PaymentMethod paymentMethod;
  
  late double amountTendered;
  late double changeAmount;

  // --- SYNC METADATA ---
  @Index()
  late bool isSynced;         // Filter utama untuk Background Job (Workmanager)
  late int syncAttempts;      // Retry counter (Exponential backoff)
}

@embedded
class OrderItem {
  late String productUuid;
  late String name;
  late double price;
  late double quantity;
  late String? note;          // "Jangan pedas", "Less sugar"
  late double total;          // price * quantity - discount
}

enum PaymentMethod {
  cash,
  qris,
  card,
  transfer,
  other
}

// ==============================================================================
// 4. INVENTORY LEDGER (Delta Sync Logic)
// ==============================================================================
// PENTING: Kita tidak menyimpan "Stok Saat Ini" sebagai single value.
// Kita menyimpan "Perubahan Stok". Server akan menjumlahkannya.
@collection
class InventoryLedger {
  Id id = Isar.autoIncrement;

  @Index()
  late String productUuid;

  // Nilai perubahan. 
  // Contoh: -1 (Penjualan), +10 (Restock), -5 (Barang Rusak/Scrap)
  late double quantityChange; 

  late String referenceId;    // UUID Order atau UUID PO Restock
  
  @Enumerated(EnumType.string)
  late StockMovementType type; 
  
  late DateTime timestamp;

  // --- SYNC METADATA ---
  @Index()
  late bool isSynced;
}

enum StockMovementType {
  sale,         // Penjualan Kasir (-1)
  restock,      // Barang Masuk (+10)
  adjustment,   // Stock Opname/Koreksi (+/-)
  scrap,        // Barang Rusak/Buang (-1)
  transferOut,  // Pindah ke Gudang B (-5)
  transferIn    // Terima dari Gudang A (+5)
}

@collection
class InventoryCache {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String productUuid; // Link ke Product

  late double serverQuantity; // Stok absolut (misal: 100)
  
  late DateTime lastSyncedAt;
}

// ==============================================================================
// 5. SHIFT & CASH MANAGEMENT (Essential for POS)
// ==============================================================================
@collection
class ShiftSession {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String uuid;           // UUID Shift

  late String staffId;        // Siapa yang buka shift
  late String staffName;
  
  late DateTime startShift;
  late DateTime? endShift;    // Null jika shift masih aktif

  late double startCash;      // Modal Awal (Float)
  late double expectedCash;   // Dihitung otomatis: Start + Cash Sales - Refunds
  late double actualCash;     // Diinput user saat closing (Blind Count)
  late double difference;     // Selisih (Variance)

  late bool isClosed;
  late bool isSynced;
}