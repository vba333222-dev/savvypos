enum UserRole {
  owner,
  manager,
  cashier,
  kitchenDisplay,
  unknown;

  static UserRole fromString(String role) {
    try {
      return UserRole.values.firstWhere((e) => e.name == role);
    } catch (_) {
      return UserRole.unknown;
    }
  }
}

class RolePermissions {
  static bool canManageInventory(UserRole role) {
    return role == UserRole.owner || role == UserRole.manager;
  }

  static bool canViewReports(UserRole role) {
    return role == UserRole.owner || role == UserRole.manager;
  }

  static bool canManageSettings(UserRole role) {
    return role == UserRole.owner;
  }

  static bool canPerformManagerOverride(UserRole role) {
    return role == UserRole.owner || role == UserRole.manager;
  }
  
  static bool canApprovePO(UserRole role) {
    return role == UserRole.owner || role == UserRole.manager;
  }
}
