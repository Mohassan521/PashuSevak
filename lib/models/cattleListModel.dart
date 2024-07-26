import 'dart:convert';
import 'dart:io';

class CattleListModel {
  final String sellingProductCategory;
  final String typeOfCattle;
  final String cattleBreed;
  final double age;
  final int noOfHeat;
  final String isOnHeat;
  final String heatPeriod;
  final String isOnPregnant;
  final String pregnantPeriod;
  final double nowMilkPerDay;
  final double milkCapacityPerDay;
  final List<File?> classifiedAttachments;

  CattleListModel({
    required this.sellingProductCategory,
    required this.typeOfCattle,
    required this.cattleBreed,
    required this.age,
    required this.noOfHeat,
    required this.isOnHeat,
    required this.heatPeriod,
    required this.isOnPregnant,
    required this.pregnantPeriod,
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
      'classifed_attachments': classifiedAttachments.map((file) {
        return base64Encode(file!.readAsBytesSync());
      }).toList(),
    };
  }
}
