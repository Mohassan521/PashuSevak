class MedicationList {

  final String name;

  MedicationList({required this.name});

  factory MedicationList.fromJson(Map<String, dynamic> json) {
    return MedicationList(
      name: json['name'],
    );
  }

}