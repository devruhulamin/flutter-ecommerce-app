enum RemarksType { popular, special, newproduct }

extension RemarksTypeName on RemarksType {
  String get getName {
    switch (this) {
      case RemarksType.popular:
        return 'popular';
      case RemarksType.special:
        return 'special';
      case RemarksType.newproduct:
        return 'new';
    }
  }
}
