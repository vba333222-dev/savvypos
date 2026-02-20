class InsufficientStockException implements Exception {
  final String productUuid;
  final String message;

  InsufficientStockException(this.productUuid, [this.message = 'Insufficient stock available.']);

  @override
  String toString() => message;
}
