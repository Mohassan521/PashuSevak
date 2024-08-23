class DosageFormModel {

  final String name;

  DosageFormModel({required this.name});

  factory DosageFormModel.fromJson(Map<String, dynamic> json) {
    return DosageFormModel(
      name: json['name'],
    );
  }

}