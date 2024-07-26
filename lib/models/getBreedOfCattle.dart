class GetBreedOfCattle {
  final String value;
  final String label;

  GetBreedOfCattle({required this.value, required this.label});

  factory GetBreedOfCattle.fromJson(Map<String, dynamic> json) {
    return GetBreedOfCattle(
      value: json['value'],
      label: json['label'],
    );
  }
}
