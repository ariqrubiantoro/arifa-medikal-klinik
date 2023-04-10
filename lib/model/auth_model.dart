enum RoleType {
  admin,
  pic,
  dokter,
}

extension RoleTypeEnumExtension on RoleType {
  String get value {
    switch (this) {
      case RoleType.admin:
        return 'Admin';
      case RoleType.pic:
        return 'Pic';
      case RoleType.dokter:
        return 'Dokter';
      default:
        return '';
    }
  }
}
