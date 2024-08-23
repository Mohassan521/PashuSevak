class PeriodList {

  final String name;

  PeriodList({required this.name});

  factory PeriodList.fromJson(Map<String, dynamic> json) {
    return PeriodList(
      name: json['name'],
    );
  }

}