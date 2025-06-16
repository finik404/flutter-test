class ItemModel {
  final String label;
  final dynamic value;

  ItemModel(this.label, this.value);
}

class FilterModel {
  final String label;
  final String value;
  final bool active;

  FilterModel(
      this.label,
      this.value,
      this.active,
      );

  FilterModel copyWith({String? label, String? value, bool? active}) {
    return FilterModel(
      label ?? this.label,
      value ?? this.value,
      active ?? this.active,
    );
  }
}

extension FilterModelListExtension on List<FilterModel> {
  FilterModel findActive() {
    return firstWhere((filter) => filter.active, orElse: () => FilterModel('Default', 'Default', false));
  }
}
