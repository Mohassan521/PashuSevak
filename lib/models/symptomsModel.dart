class SymptomsModel {

  final String name;

  SymptomsModel({required this.name});

  factory SymptomsModel.fromJson(Map<String, dynamic> json) {
    return SymptomsModel(
      name: json['name'],
    );
  }

}