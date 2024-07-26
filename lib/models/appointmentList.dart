import 'dart:convert';

class AppointmentListModel {
  final String name;
  final String creation;
  final String modified;
  final String modifiedBy;
  final String owner;
  final int docstatus;
  final int idx;
  final String namingSeries;
  final String title;
  final String status;
  final String appointmentType;
  final String appointmentFor;
  final String company;
  final String practitioner;
  final String practitionerName;
  final String department;
  final String serviceUnit;
  final String appointmentDate;
  final String patient;
  final String patientName;
  final String? inpatientRecord;
  final String patientSex;
  final dynamic patientAge;
  final int duration;
  final dynamic serviceRequest;
  final dynamic procedureTemplate;
  final dynamic procedurePrescription;
  final dynamic therapyPlan;
  final dynamic therapyType;
  final String appointmentTime;
  final String appointmentDatetime;
  final int addVideoConferencing;
  final String event;
  final dynamic googleMeetLink;
  final dynamic modeOfPayment;
  final dynamic billingItem;
  final int invoiced;
  final double paidAmount;
  final dynamic refSalesInvoice;
  final dynamic referringPractitioner;
  final int positionInQueue;
  final int appointmentBasedOnCheckIn;
  final int reminded;
  final dynamic notes;
  final dynamic userTags;
  final dynamic comments;
  final dynamic assign;
  final dynamic likedBy;
  final dynamic seen;

  AppointmentListModel({
    required this.name,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.owner,
    required this.docstatus,
    required this.idx,
    required this.namingSeries,
    required this.title,
    required this.status,
    required this.appointmentType,
    required this.appointmentFor,
    required this.company,
    required this.practitioner,
    required this.practitionerName,
    required this.department,
    required this.serviceUnit,
    required this.appointmentDate,
    required this.patient,
    required this.patientName,
    this.inpatientRecord,
    required this.patientSex,
    this.patientAge,
    required this.duration,
    this.serviceRequest,
    this.procedureTemplate,
    this.procedurePrescription,
    this.therapyPlan,
    this.therapyType,
    required this.appointmentTime,
    required this.appointmentDatetime,
    required this.addVideoConferencing,
    required this.event,
    this.googleMeetLink,
    this.modeOfPayment,
    this.billingItem,
    required this.invoiced,
    required this.paidAmount,
    this.refSalesInvoice,
    this.referringPractitioner,
    required this.positionInQueue,
    required this.appointmentBasedOnCheckIn,
    required this.reminded,
    this.notes,
    this.userTags,
    this.comments,
    this.assign,
    this.likedBy,
    this.seen,
  });

  factory AppointmentListModel.fromJson(Map<String, dynamic> json) {
    return AppointmentListModel(
      name: json['name'],
      creation: json['creation'],
      modified: json['modified'],
      modifiedBy: json['modified_by'],
      owner: json['owner'],
      docstatus: json['docstatus'],
      idx: json['idx'],
      namingSeries: json['naming_series'],
      title: json['title'],
      status: json['status'],
      appointmentType: json['appointment_type'],
      appointmentFor: json['appointment_for'],
      company: json['company'],
      practitioner: json['practitioner'],
      practitionerName: json['practitioner_name'],
      department: json['department'],
      serviceUnit: json['service_unit'],
      appointmentDate: json['appointment_date'],
      patient: json['patient'],
      patientName: json['patient_name'],
      inpatientRecord: json['inpatient_record'],
      patientSex: json['patient_sex'],
      patientAge: json['patient_age'],
      duration: json['duration'],
      serviceRequest: json['service_request'],
      procedureTemplate: json['procedure_template'],
      procedurePrescription: json['procedure_prescription'],
      therapyPlan: json['therapy_plan'],
      therapyType: json['therapy_type'],
      appointmentTime: json['appointment_time'],
      appointmentDatetime: json['appointment_datetime'],
      addVideoConferencing: json['add_video_conferencing'],
      event: json['event'],
      googleMeetLink: json['google_meet_link'],
      modeOfPayment: json['mode_of_payment'],
      billingItem: json['billing_item'],
      invoiced: json['invoiced'],
      paidAmount: json['paid_amount'].toDouble(),
      refSalesInvoice: json['ref_sales_invoice'],
      referringPractitioner: json['referring_practitioner'],
      positionInQueue: json['position_in_queue'],
      appointmentBasedOnCheckIn: json['appointment_based_on_check_in'],
      reminded: json['reminded'],
      notes: json['notes'],
      userTags: json['_user_tags'],
      comments: json['_comments'],
      assign: json['_assign'],
      likedBy: json['_liked_by'],
      seen: json['_seen'],
    );
  }
}
