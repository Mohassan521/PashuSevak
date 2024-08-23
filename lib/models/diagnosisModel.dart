class DiagnosisModel {

  final String name;

  DiagnosisModel({required this.name});

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisModel(
      name: json['name'],
    );
  }

}