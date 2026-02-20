enum UserRole {
  owner,
  manager,
  cashier,
  kitchen,
  unknown;

  static UserRole fromString(String role) {
    try {
      return UserRole.values.firstWhere((e) => e.name.toLowerCase() == role.toLowerCase());
    } catch (_) {
      return UserRole.unknown;
    }
  }
}

class RoleGuard {
  static bool canManageInventory(UserRole role) {
    return role == UserRole.owner || role == UserRole.manager;
  }

  static bool canViewReports(UserRole role) {
    return role == UserRole.owner || role == UserRole.manager;
  }

  static bool canManageSettings(UserRole role) {
    return role == UserRole.owner;
  }

  static bool canPerformRefund(UserRole role) {
    return role == UserRole.owner || role == UserRole.manager;
  }
  
  static bool canPerformManagerOverride(UserRole role) {
    return role == UserRole.owner || role == UserRole.manager;
  }
  
  static bool canAccessAdminPanel(UserRole role) {
    return role == UserRole.owner || role == UserRole.manager;
  }
}
