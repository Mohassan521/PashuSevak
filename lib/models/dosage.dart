class DosageList {

  final String name;

  DosageList({required this.name});

  factory DosageList.fromJson(Map<String, dynamic> json) {
    return DosageList(
      name: json['name'],
    );
  }

}