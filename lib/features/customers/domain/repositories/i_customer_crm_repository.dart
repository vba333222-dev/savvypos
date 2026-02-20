import 'package:savvy_pos/features/customers/domain/entities/customer_profile.dart';

abstract class ICustomerCrmRepository {
  /// Get customer profile by UUID
  Future<CustomerProfile?> getCustomer(String uuid);

  /// Get customer by phone number (for lookup at POS)
  Future<CustomerProfile?> getCustomerByPhone(String phoneNumber);

  /// Get all customers with optional filters
  Future<List<CustomerProfile>> getAllCustomers({CustomerSegment? segment, String? searchQuery});

  /// Get purchase history for a customer
  Future<List<OrderHistoryItem>> getOrderHistory(String customerUuid, {int limit = 50});

  /// Add a note to customer profile
  Future<void> addNote(String customerUuid, String content, String createdBy, {bool isCritical = false});

  /// Delete a note
  Future<void> deleteNote(String customerUuid, String noteId);

  /// Add tag to customer
  Future<void> addTag(String customerUuid, String tag);

  /// Remove tag from customer
  Future<void> removeTag(String customerUuid, String tag);

  /// Get customer insights (segment counts, avg spend)
  Future<CustomerInsights> getInsights();

  /// Update customer segment (recalculate based on behavior)
  Future<CustomerProfile> recalculateSegment(String customerUuid);

  /// Get critical notes for popup display
  Future<List<CustomerNote>> getCriticalNotes(String customerUuid);

  /// Create a new customer
  Future<CustomerProfile> createCustomer(String name, String phone, String email);
}
