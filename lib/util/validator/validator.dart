class TValidator {
  TValidator._();

  static String? validate(String? value, List<Function(String?)?>? rules) {
    if (rules == null || rules.isEmpty) {
      return null;
    }

    for (var rule in rules) {
      final result = rule!(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

}
