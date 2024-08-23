class LoggedUserModel {
  final String? name;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final String? owner;
  final int? docstatus;
  final int? idx;
  final String? amendedFrom;
  final String? userTags;
  final String? comments;
  final String? assign;
  final String? likedBy;
  final String? farmerName;
  final String? fathersName;
  final String? dateOfBirth;
  final String? mobile;
  final String? email;
  final String? panchayat;
  final String? block;
  final String? state;
  final int? areYouADairyFarmer;
  final int? howManyCattle;
  final String? breedOfCattle;
  final String? categaryOfBreed;
  final String? vaccination;
  final String? dailyMilkProduction;
  final String? currentDairyLocation;
  final String? farmerId;
  final double? longitude;
  final double? latitude;
  final String? location;
  final String? gender;
  final String? district;
  final String? address;
  final String? lastName;
  final String? pinCode;
  final String? accountCategory;
  final String? proofOfIdentity;
  final String? anyLoan;
  final String? anyLoanRequired;
  final String? isYourFarmInsured;
  final String? doctorName;
  final String? fatherName;
  final String? course;
  final String? registrationOfCertificate;
  final String? anyExperiance;
  final String? prefferdJobLocation;
  final String? jobType;
  final String? doctorId;
  final String? preferredJobLocationState;
  final double? visitFees;
  final double? ownClinicVisitFees;
  final String? userId;
  final String? serviceType;
  final String? haveBike;
  final String? aadharCard;
  final String? drivingLicence;
  final String? passportSize;
  final String? signature;
  final String? areYou;
  final double? areaOfServiceUnder;
  final String? syncedTime;
  final double? longitudeLive;
  final double? latitudeLive;

  LoggedUserModel({
    this.name,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.owner,
    this.docstatus,
    this.idx,
    this.amendedFrom,
    this.userTags,
    this.comments,
    this.assign,
    this.likedBy,
    this.farmerName,
    this.fathersName,
    this.dateOfBirth,
    this.mobile,
    this.email,
    this.panchayat,
    this.block,
    this.state,
    this.areYouADairyFarmer,
    this.howManyCattle,
    this.breedOfCattle,
    this.categaryOfBreed,
    this.vaccination,
    this.dailyMilkProduction,
    this.currentDairyLocation,
    this.farmerId,
    this.longitude,
    this.latitude,
    this.location,
    this.gender,
    this.district,
    this.address,
    this.lastName,
    this.pinCode,
    this.accountCategory,
    this.proofOfIdentity,
    this.anyLoan,
    this.anyLoanRequired,
    this.isYourFarmInsured,
    this.doctorName,
    this.fatherName,
    this.course,
    this.registrationOfCertificate,
    this.anyExperiance,
    this.prefferdJobLocation,
    this.jobType,
    this.doctorId,
    this.preferredJobLocationState,
    this.visitFees,
    this.ownClinicVisitFees,
    this.userId,
    this.serviceType,
    this.haveBike,
    this.aadharCard,
    this.drivingLicence,
    this.passportSize,
    this.signature,
    this.areYou,
    this.areaOfServiceUnder,
    this.syncedTime,
    this.longitudeLive,
    this.latitudeLive,
  });

  factory LoggedUserModel.fromJson(Map<String, dynamic> json) {
    return LoggedUserModel(
      name: json['name'] as String?,
      creation: json['creation'] as String?,
      modified: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      owner: json['owner'] as String?,
      docstatus: json['docstatus'] as int?,
      idx: json['idx'] as int?,
      amendedFrom: json['amended_from'] as String?,
      userTags: json['_user_tags'] as String?,
      comments: json['_comments'] as String?,
      assign: json['_assign'] as String?,
      likedBy: json['_liked_by'] as String?,
      farmerName: json['farmer_name'] as String?,
      fathersName: json['fathers_name'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      panchayat: json['panchayat'] as String?,
      block: json['block'] as String?,
      state: json['state'] as String?,
      areYouADairyFarmer: json['are_you_a_dairy_farmer'] as int?,
      howManyCattle: json['how_many_cattle'] as int?,
      breedOfCattle: json['breed_of_cattle'] as String?,
      categaryOfBreed: json['categary_of_breed'] as String?,
      vaccination: json['vaccination'] as String?,
      dailyMilkProduction: json['daily_milk_production'] as String?,
      currentDairyLocation: json['current_dairy_location'] as String?,
      farmerId: json['farmer_id'] as String?,
      longitude: json['longitude'] as double?,
      latitude: json['latitude'] as double?,
      location: json['location'] as String?,
      gender: json['gender'] as String?,
      district: json['district'] as String?,
      address: json['address'] as String?,
      lastName: json['last_name'] as String?,
      pinCode: json['pin_code'] as String?,
      accountCategory: json['account_category'] as String?,
      proofOfIdentity: json['proof_of_identity'] as String?,
      anyLoan: json['any_loan'] as String?,
      anyLoanRequired: json['any_loan_required'] as String?,
      isYourFarmInsured: json['is_your_farm_insured'] as String?,
      doctorName: json['doctor_name'] as String?,
      fatherName: json['father_name'] as String?,
      course: json['course'] as String?,
      registrationOfCertificate: json['registration_of_certificate'] as String?,
      anyExperiance: json['any_experiance'] as String?,
      prefferdJobLocation: json['prefferd_job_location'] as String?,
      jobType: json['job_type'] as String?,
      doctorId: json['doctor_id'] as String?,
      preferredJobLocationState: json['preferred_job_location_state'] as String?,
      visitFees: json['visit_fees'] as double?,
      ownClinicVisitFees: json['own_clinic_visit_fees'] as double?,
      userId: json['user_id'] as String?,
      serviceType: json['service_type'] as String?,
      haveBike: json['have_bike'] as String?,
      aadharCard: json['aadhar_card'] as String?,
      drivingLicence: json['driving_licence'] as String?,
      passportSize: json['passport_size'] as String?,
      signature: json['signature'] as String?,
      areYou: json['are_you'] as String?,
      areaOfServiceUnder: json['area_of_service_under'] as double?,
      syncedTime: json['synced_time'] as String?,
      longitudeLive: json['longitude_live'] as double?,
      latitudeLive: json['latitude_live'] as double?,
    );
  }

}
