class Item {
  String? value;
  String? key;

  Item({
    this.key,
    this.value,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        value: json['value'] as String?,
        key: json['key'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'key': key,
      };

  @override
  String toString() {
    return 'Item{value: $value, key: $key}';
  }
}
