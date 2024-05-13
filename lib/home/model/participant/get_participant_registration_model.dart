class GetParticipantRegistrationModel {
  GetParticipantRegistrationModel({
    required this.message,
    required this.status,
    required this.data,
  });
  late final String message;
  late final int status;
  late final ParticipantRegistrationData data;

  GetParticipantRegistrationModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    data = ParticipantRegistrationData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class ParticipantRegistrationData {
  ParticipantRegistrationData({
    required this.userType,
    required this.wNServices,
    required this.planManaged,
    required this.parAgeRange,
    required this.contactMethod,
    required this.paIdentifyAs,
    required this.relationWiPar,
  });
  late final List<ParticipantUserType> userType;
  late final List<WNServices> wNServices;
  late final List<PlanManaged> planManaged;
  late final List<ParAgeRange> parAgeRange;
  late final List<ContactMethod> contactMethod;
  late final List<PaIdentifyAs> paIdentifyAs;
  late final List<RelationWiPar> relationWiPar;

  ParticipantRegistrationData.fromJson(Map<String, dynamic> json){
    userType = List.from(json['user_type']).map((e)=>ParticipantUserType.fromJson(e)).toList();
    wNServices = List.from(json['w_n_services']).map((e)=>WNServices.fromJson(e)).toList();
    planManaged = List.from(json['plan_managed']).map((e)=>PlanManaged.fromJson(e)).toList();
    parAgeRange = List.from(json['par_age_range']).map((e)=>ParAgeRange.fromJson(e)).toList();
    contactMethod = List.from(json['contact_method']).map((e)=>ContactMethod.fromJson(e)).toList();
    paIdentifyAs = List.from(json['pa_identify_as']).map((e)=>PaIdentifyAs.fromJson(e)).toList();
    relationWiPar = List.from(json['relation_wi_par']).map((e)=>RelationWiPar.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_type'] = userType.map((e)=>e.toJson()).toList();
    _data['w_n_services'] = wNServices.map((e)=>e.toJson()).toList();
    _data['plan_managed'] = planManaged.map((e)=>e.toJson()).toList();
    _data['par_age_range'] = parAgeRange.map((e)=>e.toJson()).toList();
    _data['contact_method'] = contactMethod.map((e)=>e.toJson()).toList();
    _data['pa_identify_as'] = paIdentifyAs.map((e)=>e.toJson()).toList();
    _data['relation_wi_par'] = relationWiPar.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ParticipantUserType {
  ParticipantUserType({
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

  ParticipantUserType.fromJson(Map<String, dynamic> json){
    id = json['id'];
    type = json['type'];
    label = json['label'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['label'] = label;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    return _data;
  }
}

class WNServices {
  WNServices({
    required this.wNServicesId,
    required this.wNServicesName,
    required this.wNServicesCdt,
    required this.wNServicesUdt,
  });
  late final String wNServicesId;
  late final String wNServicesName;
  late final String wNServicesCdt;
  late final String wNServicesUdt;

  WNServices.fromJson(Map<String, dynamic> json){
    wNServicesId = json['w_n_services_id'];
    wNServicesName = json['w_n_services_name'];
    wNServicesCdt = json['w_n_services_cdt'];
    wNServicesUdt = json['w_n_services_udt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['w_n_services_id'] = wNServicesId;
    _data['w_n_services_name'] = wNServicesName;
    _data['w_n_services_cdt'] = wNServicesCdt;
    _data['w_n_services_udt'] = wNServicesUdt;
    return _data;
  }
}

class PlanManaged {
  PlanManaged({
    required this.planManagedId,
    required this.planManName,
    required this.planManUdt,
    required this.planManCdt,
  });
  late final String planManagedId;
  late final String planManName;
  late final String planManUdt;
  late final String planManCdt;

  PlanManaged.fromJson(Map<String, dynamic> json){
    planManagedId = json['plan_managed_id'];
    planManName = json['plan_man_name'];
    planManUdt = json['plan_man_udt'];
    planManCdt = json['plan_man_cdt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['plan_managed_id'] = planManagedId;
    _data['plan_man_name'] = planManName;
    _data['plan_man_udt'] = planManUdt;
    _data['plan_man_cdt'] = planManCdt;
    return _data;
  }
}

class ParAgeRange {
  ParAgeRange({
    required this.ageRangeId,
    required this.ageRangeName,
    required this.rangeMax,
    required this.rangeMin,
    required this.rangeCdt,
    required this.rangeUdt,
  });
  late final String ageRangeId;
  late final String ageRangeName;
  late final String rangeMax;
  late final String rangeMin;
  late final String rangeCdt;
  late final String rangeUdt;

  ParAgeRange.fromJson(Map<String, dynamic> json){
    ageRangeId = json['age_range_id'];
    ageRangeName = json['age_range_name'];
    rangeMax = json['range_max'];
    rangeMin = json['range_min'];
    rangeCdt = json['range_cdt'];
    rangeUdt = json['range_udt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['age_range_id'] = ageRangeId;
    _data['age_range_name'] = ageRangeName;
    _data['range_max'] = rangeMax;
    _data['range_min'] = rangeMin;
    _data['range_cdt'] = rangeCdt;
    _data['range_udt'] = rangeUdt;
    return _data;
  }
}

class ContactMethod {
  ContactMethod({
    required this.contactMethodId,
    required this.contactMethodName,
    required this.contactMethodCdt,
    required this.contactMethodUdt,
  });
  late final String contactMethodId;
  late final String contactMethodName;
  late final String contactMethodCdt;
  late final String contactMethodUdt;

  ContactMethod.fromJson(Map<String, dynamic> json){
    contactMethodId = json['contact_method_id'];
    contactMethodName = json['contact_method_name'];
    contactMethodCdt = json['contact_method_cdt'];
    contactMethodUdt = json['contact_method_udt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['contact_method_id'] = contactMethodId;
    _data['contact_method_name'] = contactMethodName;
    _data['contact_method_cdt'] = contactMethodCdt;
    _data['contact_method_udt'] = contactMethodUdt;
    return _data;
  }
}

class PaIdentifyAs {
  PaIdentifyAs({
    required this.paIdentifyAsId,
    required this.paIdentifyAsName,
    required this.paIdentifyAsCdt,
    required this.paIdentifyAsUdt,
  });
  late final String paIdentifyAsId;
  late final String paIdentifyAsName;
  late final String paIdentifyAsCdt;
  late final String paIdentifyAsUdt;

  PaIdentifyAs.fromJson(Map<String, dynamic> json){
    paIdentifyAsId = json['pa_identify_as_id'];
    paIdentifyAsName = json['pa_identify_as_name'];
    paIdentifyAsCdt = json['pa_identify_as_cdt'];
    paIdentifyAsUdt = json['pa_identify_as_udt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pa_identify_as_id'] = paIdentifyAsId;
    _data['pa_identify_as_name'] = paIdentifyAsName;
    _data['pa_identify_as_cdt'] = paIdentifyAsCdt;
    _data['pa_identify_as_udt'] = paIdentifyAsUdt;
    return _data;
  }
}

class RelationWiPar {
  RelationWiPar({
    required this.relationWiParId,
    required this.relationWiParName,
    required this.relationWiParCdt,
    required this.relationWiParUdt,
  });
  late final String relationWiParId;
  late final String relationWiParName;
  late final String relationWiParCdt;
  late final String relationWiParUdt;

  RelationWiPar.fromJson(Map<String, dynamic> json){
    relationWiParId = json['relation_wi_par_id'];
    relationWiParName = json['relation_wi_par_name'];
    relationWiParCdt = json['relation_wi_par_cdt'];
    relationWiParUdt = json['relation_wi_par_udt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['relation_wi_par_id'] = relationWiParId;
    _data['relation_wi_par_name'] = relationWiParName;
    _data['relation_wi_par_cdt'] = relationWiParCdt;
    _data['relation_wi_par_udt'] = relationWiParUdt;
    return _data;
  }
}