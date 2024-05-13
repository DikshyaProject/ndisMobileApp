class SupWorkProDropModel {
  String? message;
  int? status;
  SupWProDropData? data;

  SupWorkProDropModel({this.message, this.status, this.data});

  SupWorkProDropModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new SupWProDropData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SupWProDropData {
  List<Regions>? regions;
  List<TraDis>? traDis;
  List<PetFri>? petFri;
  List<TypeSuppWorker>? typeSuppWorker;
  List<AboutUs>? aboutUs;
  List<SuppPre>? suppPre;
  List<Lang>? lang;

  SupWProDropData(
      {this.regions,
        this.traDis,
        this.petFri,
        this.typeSuppWorker,
        this.aboutUs,
        this.suppPre,
        this.lang});

  SupWProDropData.fromJson(Map<String, dynamic> json) {
    if (json['regions'] != null) {
      regions = <Regions>[];
      json['regions'].forEach((v) {
        regions!.add(new Regions.fromJson(v));
      });
    }
    if (json['tra_dis'] != null) {
      traDis = <TraDis>[];
      json['tra_dis'].forEach((v) {
        traDis!.add(new TraDis.fromJson(v));
      });
    }
    if (json['pet_fri'] != null) {
      petFri = <PetFri>[];
      json['pet_fri'].forEach((v) {
        petFri!.add(new PetFri.fromJson(v));
      });
    }
    if (json['type_supp_worker'] != null) {
      typeSuppWorker = <TypeSuppWorker>[];
      json['type_supp_worker'].forEach((v) {
        typeSuppWorker!.add(new TypeSuppWorker.fromJson(v));
      });
    }
    if (json['about_us'] != null) {
      aboutUs = <AboutUs>[];
      json['about_us'].forEach((v) {
        aboutUs!.add(new AboutUs.fromJson(v));
      });
    }
    if (json['supp_pre'] != null) {
      suppPre = <SuppPre>[];
      json['supp_pre'].forEach((v) {
        suppPre!.add(new SuppPre.fromJson(v));
      });
    }
    if (json['lang'] != null) {
      lang = <Lang>[];
      json['lang'].forEach((v) {
        lang!.add(new Lang.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.regions != null) {
      data['regions'] = this.regions!.map((v) => v.toJson()).toList();
    }
    if (this.traDis != null) {
      data['tra_dis'] = this.traDis!.map((v) => v.toJson()).toList();
    }
    if (this.petFri != null) {
      data['pet_fri'] = this.petFri!.map((v) => v.toJson()).toList();
    }
    if (this.typeSuppWorker != null) {
      data['type_supp_worker'] =
          this.typeSuppWorker!.map((v) => v.toJson()).toList();
    }
    if (this.aboutUs != null) {
      data['about_us'] = this.aboutUs!.map((v) => v.toJson()).toList();
    }
    if (this.suppPre != null) {
      data['supp_pre'] = this.suppPre!.map((v) => v.toJson()).toList();
    }
    if (this.lang != null) {
      data['lang'] = this.lang!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Regions {
  String? id;
  String? regionName;
  String? regionCdt;
  String? regionUdt;

  Regions({this.id, this.regionName, this.regionCdt, this.regionUdt});

  Regions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regionName = json['region_name'];
    regionCdt = json['region_cdt'];
    regionUdt = json['region_udt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['region_name'] = this.regionName;
    data['region_cdt'] = this.regionCdt;
    data['region_udt'] = this.regionUdt;
    return data;
  }
}

class TraDis {
  String? swTravelDistanceId;
  String? swTravelDistance;
  String? swTravelDistanceCdt;
  String? swTravelDistanceUdt;

  TraDis(
      {this.swTravelDistanceId,
        this.swTravelDistance,
        this.swTravelDistanceCdt,
        this.swTravelDistanceUdt});

  TraDis.fromJson(Map<String, dynamic> json) {
    swTravelDistanceId = json['sw_travel_distance_id'];
    swTravelDistance = json['sw_travel_distance'];
    swTravelDistanceCdt = json['sw_travel_distance_cdt'];
    swTravelDistanceUdt = json['sw_travel_distance_udt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sw_travel_distance_id'] = this.swTravelDistanceId;
    data['sw_travel_distance'] = this.swTravelDistance;
    data['sw_travel_distance_cdt'] = this.swTravelDistanceCdt;
    data['sw_travel_distance_udt'] = this.swTravelDistanceUdt;
    return data;
  }
}

class PetFri {
  String? petFriId;
  String? petFriName;
  String? petFriCdt;
  String? petFriUdt;

  PetFri({this.petFriId, this.petFriName, this.petFriCdt, this.petFriUdt});

  PetFri.fromJson(Map<String, dynamic> json) {
    petFriId = json['pet_fri_id'];
    petFriName = json['pet_fri_name'];
    petFriCdt = json['pet_fri_cdt'];
    petFriUdt = json['pet_fri_udt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pet_fri_id'] = this.petFriId;
    data['pet_fri_name'] = this.petFriName;
    data['pet_fri_cdt'] = this.petFriCdt;
    data['pet_fri_udt'] = this.petFriUdt;
    return data;
  }
}

class TypeSuppWorker {
  String? suppWorkerTypeId;
  String? typeName;
  String? typeCdt;
  String? typeUdt;

  TypeSuppWorker(
      {this.suppWorkerTypeId, this.typeName, this.typeCdt, this.typeUdt});

  TypeSuppWorker.fromJson(Map<String, dynamic> json) {
    suppWorkerTypeId = json['supp_worker_type_id'];
    typeName = json['type_name'];
    typeCdt = json['type_cdt'];
    typeUdt = json['type_udt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supp_worker_type_id'] = this.suppWorkerTypeId;
    data['type_name'] = this.typeName;
    data['type_cdt'] = this.typeCdt;
    data['type_udt'] = this.typeUdt;
    return data;
  }
}

class AboutUs {
  String? swAboutUsId;
  String? swAboutUsName;
  String? swAboutUsCdt;
  String? swAboutUsUdt;

  AboutUs(
      {this.swAboutUsId,
        this.swAboutUsName,
        this.swAboutUsCdt,
        this.swAboutUsUdt});

  AboutUs.fromJson(Map<String, dynamic> json) {
    swAboutUsId = json['sw_about_us_id'];
    swAboutUsName = json['sw_about_us_name'];
    swAboutUsCdt = json['sw_about_us_cdt'];
    swAboutUsUdt = json['sw_about_us_udt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sw_about_us_id'] = this.swAboutUsId;
    data['sw_about_us_name'] = this.swAboutUsName;
    data['sw_about_us_cdt'] = this.swAboutUsCdt;
    data['sw_about_us_udt'] = this.swAboutUsUdt;
    return data;
  }
}

class SuppPre {
  String? suppPreId;
  String? supportPreferName;
  String? supportPreferCdt;
  String? supportPreferUdt;

  SuppPre(
      {this.suppPreId,
        this.supportPreferName,
        this.supportPreferCdt,
        this.supportPreferUdt});

  SuppPre.fromJson(Map<String, dynamic> json) {
    suppPreId = json['supp_pre_id'];
    supportPreferName = json['support_prefer_name'];
    supportPreferCdt = json['support_prefer_cdt'];
    supportPreferUdt = json['support_prefer_udt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supp_pre_id'] = this.suppPreId;
    data['support_prefer_name'] = this.supportPreferName;
    data['support_prefer_cdt'] = this.supportPreferCdt;
    data['support_prefer_udt'] = this.supportPreferUdt;
    return data;
  }
}

class Lang {
  String? id;
  String? languageCode;
  String? languageName;
  Null? languageCdt;
  Null? languageUdt;

  Lang(
      {this.id,
        this.languageCode,
        this.languageName,
        this.languageCdt,
        this.languageUdt});

  Lang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageCode = json['language_code'];
    languageName = json['language_name'];
    languageCdt = json['language_cdt'];
    languageUdt = json['language_udt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language_code'] = this.languageCode;
    data['language_name'] = this.languageName;
    data['language_cdt'] = this.languageCdt;
    data['language_udt'] = this.languageUdt;
    return data;
  }
}
