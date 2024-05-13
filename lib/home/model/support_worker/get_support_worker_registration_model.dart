class GetSupportWorkerRegistrationModel {
  GetSupportWorkerRegistrationModel({
     this.message,
     this.status,
     this.getSupportWorkerData,
  });
  String? message;
  int? status;
  GetSupportWorkerData? getSupportWorkerData;

  GetSupportWorkerRegistrationModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    getSupportWorkerData = GetSupportWorkerData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['message'] = message;
    _GetSupportWorkerData['status'] = status;
    _GetSupportWorkerData['data'] = getSupportWorkerData?.toJson();
    return _GetSupportWorkerData;
  }
}

class GetSupportWorkerData {
  GetSupportWorkerData({
    required this.userType,
    required this.supportOffer,
    required this.qualifications,
    required this.swTravelDistance,
    required this.swAboutUs,
    required this.supportPreference,
    required this.suppWorkerType,
    required this.petFriendly,
    required this.availabilityTime,
  });
  late final List<UserType> userType;
  late final List<SupportOffer> supportOffer;
  late final List<Qualifications> qualifications;
  late final List<SwTravelDistance> swTravelDistance;
  late final List<SwAboutUs> swAboutUs;
  late final List<SupportPreference> supportPreference;
  late final List<SuppWorkerType> suppWorkerType;
  late final List<PetFriendly> petFriendly;
  late final List<AvailabilityTime> availabilityTime;

  GetSupportWorkerData.fromJson(Map<String, dynamic> json){
    userType = List.from(json['user_type']).map((e)=>UserType.fromJson(e)).toList();
    supportOffer = List.from(json['support_offer']).map((e)=>SupportOffer.fromJson(e)).toList();
    qualifications = List.from(json['qualifications']).map((e)=>Qualifications.fromJson(e)).toList();
    swTravelDistance = List.from(json['sw_travel_distance']).map((e)=>SwTravelDistance.fromJson(e)).toList();
    swAboutUs = List.from(json['sw_about_us']).map((e)=>SwAboutUs.fromJson(e)).toList();
    supportPreference = List.from(json['support_preference']).map((e)=>SupportPreference.fromJson(e)).toList();
    suppWorkerType = List.from(json['supp_worker_type']).map((e)=>SuppWorkerType.fromJson(e)).toList();
    petFriendly = List.from(json['pet_friendly']).map((e)=>PetFriendly.fromJson(e)).toList();
    availabilityTime = List.from(json['availability_time']).map((e)=>AvailabilityTime.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['user_type'] = userType.map((e)=>e.toJson()).toList();
    _GetSupportWorkerData['support_offer'] = supportOffer.map((e)=>e.toJson()).toList();
    _GetSupportWorkerData['qualifications'] = qualifications.map((e)=>e.toJson()).toList();
    _GetSupportWorkerData['sw_travel_distance'] = swTravelDistance.map((e)=>e.toJson()).toList();
    _GetSupportWorkerData['sw_about_us'] = swAboutUs.map((e)=>e.toJson()).toList();
    _GetSupportWorkerData['support_preference'] = supportPreference.map((e)=>e.toJson()).toList();
    _GetSupportWorkerData['supp_worker_type'] = suppWorkerType.map((e)=>e.toJson()).toList();
    _GetSupportWorkerData['pet_friendly'] = petFriendly.map((e)=>e.toJson()).toList();
    _GetSupportWorkerData['availability_time'] = availabilityTime.map((e)=>e.toJson()).toList();
    return _GetSupportWorkerData;
  }
}

class UserType {
  UserType({
    required this.id,
    required this.type,
    required this.label,
    required this.status,
    required this.createdAt,
  });
  late final String id;
  late final String type;
  late final String label;
  late final String status;
  late final String createdAt;

  UserType.fromJson(Map<String, dynamic> json){
    id = json['id'];
    type = json['type'];
    label = json['label'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['id'] = id;
    _GetSupportWorkerData['type'] = type;
    _GetSupportWorkerData['label'] = label;
    _GetSupportWorkerData['status'] = status;
    _GetSupportWorkerData['created_at'] = createdAt;
    return _GetSupportWorkerData;
  }
}

class SupportOffer {
  SupportOffer({
    required this.suppOfferId,
    required this.offerTitle,
    required this.offerName,
    required this.offerUdt,
    required this.offerCdt,
    required this.suppOfferImage,
  });
  late final String suppOfferId;
  late final String offerTitle;
  late final String offerName;
  late final String offerUdt;
  late final String offerCdt;
  late final String suppOfferImage;

  SupportOffer.fromJson(Map<String, dynamic> json){
    suppOfferId = json['supp_offer_id'];
    offerTitle = json['offer_title'];
    offerName = json['offer_name'];
    offerUdt = json['offer_udt'];
    offerCdt = json['offer_cdt'];
    suppOfferImage = json['supp_offer_image'];
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['supp_offer_id'] = suppOfferId;
    _GetSupportWorkerData['offer_title'] = offerTitle;
    _GetSupportWorkerData['offer_name'] = offerName;
    _GetSupportWorkerData['offer_udt'] = offerUdt;
    _GetSupportWorkerData['offer_cdt'] = offerCdt;
    _GetSupportWorkerData['supp_offer_image'] = suppOfferImage;
    return _GetSupportWorkerData;
  }
}

class Qualifications {
  late final String qualificationsId;
  late final String type;
  late final String qualificationsName;
  late final String status;
  late final String createdAt;
  late final String updatedAt;

  Qualifications({
    required this.qualificationsId,
    required this.type,
    required this.qualificationsName,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });


  Qualifications.fromJson(Map<String, dynamic> json){
    qualificationsId = json['qualifications_id'];
    type = json['type'];
    qualificationsName = json['qualifications_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['qualifications_id'] = qualificationsId;
    _GetSupportWorkerData['type'] = type;
    _GetSupportWorkerData['qualifications_name'] = qualificationsName;
    _GetSupportWorkerData['status'] = status;
    _GetSupportWorkerData['created_at'] = createdAt;
    _GetSupportWorkerData['updated_at'] = updatedAt;
    return _GetSupportWorkerData;
  }
}

class SwTravelDistance {
  SwTravelDistance({
    required this.swTravelDistanceId,
    required this.swTravelDistance,
    required this.swTravelDistanceCdt,
    required this.swTravelDistanceUdt,
  });
  late final String swTravelDistanceId;
  late final String swTravelDistance;
  late final String swTravelDistanceCdt;
  late final String swTravelDistanceUdt;

  SwTravelDistance.fromJson(Map<String, dynamic> json){
    swTravelDistanceId = json['sw_travel_distance_id'];
    swTravelDistance = json['sw_travel_distance'];
    swTravelDistanceCdt = json['sw_travel_distance_cdt'];
    swTravelDistanceUdt = json['sw_travel_distance_udt'];
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['sw_travel_distance_id'] = swTravelDistanceId;
    _GetSupportWorkerData['sw_travel_distance'] = swTravelDistance;
    _GetSupportWorkerData['sw_travel_distance_cdt'] = swTravelDistanceCdt;
    _GetSupportWorkerData['sw_travel_distance_udt'] = swTravelDistanceUdt;
    return _GetSupportWorkerData;
  }
}

class SwAboutUs {
  SwAboutUs({
    required this.swAboutUsId,
    required this.swAboutUsName,
    required this.swAboutUsCdt,
    required this.swAboutUsUdt,
  });
  late final String swAboutUsId;
  late final String swAboutUsName;
  late final String swAboutUsCdt;
  late final String swAboutUsUdt;

  SwAboutUs.fromJson(Map<String, dynamic> json){
    swAboutUsId = json['sw_about_us_id'];
    swAboutUsName = json['sw_about_us_name'];
    swAboutUsCdt = json['sw_about_us_cdt'];
    swAboutUsUdt = json['sw_about_us_udt'];
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['sw_about_us_id'] = swAboutUsId;
    _GetSupportWorkerData['sw_about_us_name'] = swAboutUsName;
    _GetSupportWorkerData['sw_about_us_cdt'] = swAboutUsCdt;
    _GetSupportWorkerData['sw_about_us_udt'] = swAboutUsUdt;
    return _GetSupportWorkerData;
  }
}

class SupportPreference {
  SupportPreference({
    required this.suppPreId,
    required this.supportPreferName,
    required this.supportPreferCdt,
    required this.supportPreferUdt,
  });
  late final String suppPreId;
  late final String supportPreferName;
  late final String supportPreferCdt;
  late final String supportPreferUdt;

  SupportPreference.fromJson(Map<String, dynamic> json){
    suppPreId = json['supp_pre_id'];
    supportPreferName = json['support_prefer_name'];
    supportPreferCdt = json['support_prefer_cdt'];
    supportPreferUdt = json['support_prefer_udt'];
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['supp_pre_id'] = suppPreId;
    _GetSupportWorkerData['support_prefer_name'] = supportPreferName;
    _GetSupportWorkerData['support_prefer_cdt'] = supportPreferCdt;
    _GetSupportWorkerData['support_prefer_udt'] = supportPreferUdt;
    return _GetSupportWorkerData;
  }
}

class SuppWorkerType {
  SuppWorkerType({
    required this.suppWorkerTypeId,
    required this.typeName,
    required this.typeCdt,
    required this.typeUdt,
  });
  late final String suppWorkerTypeId;
  late final String typeName;
  late final String typeCdt;
  late final String typeUdt;

  SuppWorkerType.fromJson(Map<String, dynamic> json){
    suppWorkerTypeId = json['supp_worker_type_id'];
    typeName = json['type_name'];
    typeCdt = json['type_cdt'];
    typeUdt = json['type_udt'];
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['supp_worker_type_id'] = suppWorkerTypeId;
    _GetSupportWorkerData['type_name'] = typeName;
    _GetSupportWorkerData['type_cdt'] = typeCdt;
    _GetSupportWorkerData['type_udt'] = typeUdt;
    return _GetSupportWorkerData;
  }
}

class PetFriendly {
  PetFriendly({
    required this.petFriId,
    required this.petFriName,
    required this.petFriCdt,
    required this.petFriUdt,
  });
  late final String petFriId;
  late final String petFriName;
  late final String petFriCdt;
  late final String petFriUdt;

  PetFriendly.fromJson(Map<String, dynamic> json){
    petFriId = json['pet_fri_id'];
    petFriName = json['pet_fri_name'];
    petFriCdt = json['pet_fri_cdt'];
    petFriUdt = json['pet_fri_udt'];
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['pet_fri_id'] = petFriId;
    _GetSupportWorkerData['pet_fri_name'] = petFriName;
    _GetSupportWorkerData['pet_fri_cdt'] = petFriCdt;
    _GetSupportWorkerData['pet_fri_udt'] = petFriUdt;
    return _GetSupportWorkerData;
  }
}

class AvailabilityTime {
  AvailabilityTime({
    required this.availTimeId,
    required this.availTimeName,
    required this.availTimeCdt,
    required this.availTimeUdt,
  });
  late final String availTimeId;
  late final String availTimeName;
  late final String availTimeCdt;
  late final String availTimeUdt;

  AvailabilityTime.fromJson(Map<String, dynamic> json){
    availTimeId = json['avail_time_id'];
    availTimeName = json['avail_time_name'];
    availTimeCdt = json['avail_time_cdt'];
    availTimeUdt = json['avail_time_udt'];
  }

  Map<String, dynamic> toJson() {
    final _GetSupportWorkerData = <String, dynamic>{};
    _GetSupportWorkerData['avail_time_id'] = availTimeId;
    _GetSupportWorkerData['avail_time_name'] = availTimeName;
    _GetSupportWorkerData['avail_time_cdt'] = availTimeCdt;
    _GetSupportWorkerData['avail_time_udt'] = availTimeUdt;
    return _GetSupportWorkerData;
  }
}