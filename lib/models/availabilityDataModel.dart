class HealthcareSchedule {
  final String slotName;
  final String serviceUnit;
  final List<AvailableSlot> availSlot;
  final int allowOverlap;
  final int serviceUnitCapacity;
  final int teleConf;

  HealthcareSchedule({
    required this.slotName,
    required this.serviceUnit,
    required this.availSlot,
    required this.allowOverlap,
    required this.serviceUnitCapacity,
    required this.teleConf,
  });

  factory HealthcareSchedule.fromJson(Map<String, dynamic> json) {
    var availSlotList = (json['avail_slot'] as List)
        .map((i) => AvailableSlot.fromJson(i))
        .toList();

    return HealthcareSchedule(
      slotName: json['slot_name'] ?? '',
      serviceUnit: json['service_unit'] ?? '',
      availSlot: availSlotList,
      allowOverlap: json['allow_overlap'] ?? 0,
      serviceUnitCapacity: json['service_unit_capacity'] ?? 0,
      teleConf: json['tele_conf'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slot_name': slotName,
      'service_unit': serviceUnit,
      'avail_slot': availSlot.map((slot) => slot.toJson()).toList(),
      'allow_overlap': allowOverlap,
      'service_unit_capacity': serviceUnitCapacity,
      'tele_conf': teleConf,
    };
  }
}

class AvailableSlot {
  final String name;
  final String owner;
  final String creation;
  final String modified;
  final String modifiedBy;
  final String day;
  final String fromTime;
  final String toTime;

  AvailableSlot({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.day,
    required this.fromTime,
    required this.toTime,
  });

  String getFormattedTimeSlot() {
    return '$fromTime-$toTime';
  }

  factory AvailableSlot.fromJson(Map<String, dynamic> json) {
    return AvailableSlot(
      name: json['name'] ?? '',
      owner: json['owner'] ?? '',
      creation: json['creation'] ?? '',
      modified: json['modified'] ?? '',
      modifiedBy: json['modified_by'] ?? '',
      day: json['day'] ?? '',
      fromTime: json['from_time'] ?? '',
      toTime: json['to_time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'owner': owner,
      'creation': creation,
      'modified': modified,
      'modified_by': modifiedBy,
      'day': day,
      'from_time': fromTime,
      'to_time': toTime,
    };
  }
}
