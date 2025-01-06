
import 'dart:io';

class CattleListModel {
  // final int? primaryKey;
  final String sellingProductCategory;
  final String typeOfCattle;
  final String cattleBreed;
  final double age;
  final int noOfHeat;
  final String isOnHeat;
  final String heatPeriod;
  final String isOnPregnant;
  final String? pregnantPeriod;
  final double nowMilkPerDay;
  final double milkCapacityPerDay;
  final List<String>? classifiedAttachments;

  CattleListModel({
    // this.primaryKey,
    required this.sellingProductCategory,
    required this.typeOfCattle,
    required this.cattleBreed,
    required this.age,
    required this.noOfHeat,
    required this.isOnHeat,
    required this.heatPeriod,
    required this.isOnPregnant,
    this.pregnantPeriod,
    required this.nowMilkPerDay,
    required this.milkCapacityPerDay,
    required this.classifiedAttachments,
  });

  Map<String, dynamic> toJson() {
    return {
      'selling_product_category': sellingProductCategory,
      'type_of_cattel': typeOfCattle,
      'cattel_breed': cattleBreed,
      'age': age,
      'no_of_heat': noOfHeat,
      'is_on_heat': isOnHeat,
      'heat_period': heatPeriod,
      'is_on_pregnant': isOnPregnant,
      'pregnant_period': pregnantPeriod,
      'now_milk_per_day': nowMilkPerDay,
      'milk_capacity_per_day': milkCapacityPerDay,
      'classifed_attachments': classifiedAttachments,
    };
  }

  factory CattleListModel.fromJson(Map<String, dynamic> json) {
  return CattleListModel(
    // primaryKey: json['primarykey'],
    sellingProductCategory: json['selling_product_category'],
    typeOfCattle: json['type_of_cattel'],
    cattleBreed: json['cattel_breed'],
    age: json['age'],
    noOfHeat: json['no_of_heat'],
    isOnHeat: json['is_on_heat'],
    heatPeriod: json['heat_period'],
    isOnPregnant: json['is_on_pregnant'],
    nowMilkPerDay: json['now_milk_per_day'],
    milkCapacityPerDay: json['milk_capacity_per_day'],
    classifiedAttachments: json['classifed_attachments'] != null
        ? List<String>.from(json['classifed_attachments'].map((item) => item['pic_or_video'].toString()))
        : [],
  );
}

}
