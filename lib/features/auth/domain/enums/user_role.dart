enum UserRole {
  OWNER,
  MANAGER,
  CASHIER,
  KITCHEN_DISPLAY,
  UNKNOWN;

  static UserRole fromString(String role) {
    try {
      return UserRole.values.firstWhere((e) => e.name == role);
    } catch (_) {
      return UserRole.UNKNOWN;
    }
  }
}

class RolePermissions {
  static bool canManageInventory(UserRole role) {
    return role == UserRole.OWNER || role == UserRole.MANAGER;
  }

  static bool canViewReports(UserRole role) {
    return role == UserRole.OWNER || role == UserRole.MANAGER;
  }

  static bool canManageSettings(UserRole role) {
    return role == UserRole.OWNER;
  }

  static bool canPerformManagerOverride(UserRole role) {
    return role == UserRole.OWNER || role == UserRole.MANAGER;
  }
  
  static bool canApprovePO(UserRole role) {
    return role == UserRole.OWNER || role == UserRole.MANAGER;
  }
}
