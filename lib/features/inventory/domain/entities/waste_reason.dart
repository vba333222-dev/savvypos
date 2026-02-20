enum WasteReason {
  expired,
  damaged,
  spoilage,
  theft,
  mistake,
  other;

  String get label {
    switch (this) {
      case WasteReason.expired:
        return 'Expired';
      case WasteReason.damaged:
        return 'Damaged';
      case WasteReason.spoilage:
        return 'Spoilage';
      case WasteReason.theft:
        return 'Theft';
      case WasteReason.mistake:
        return 'Kitchen Mistake';
      case WasteReason.other:
        return 'Other';
    }
  }
}
