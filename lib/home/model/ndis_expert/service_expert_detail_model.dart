class ExpertDetailModel {
  String? message;
  int? status;
  ExpertDetailData? data;

  ExpertDetailModel({this.message, this.status, this.data});

  ExpertDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new ExpertDetailData.fromJson(json['data']) : null;
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

class ExpertDetailData {
  ListDetail? listDetail;

  ExpertDetailData({this.listDetail});

  ExpertDetailData.fromJson(Map<String, dynamic> json) {
    listDetail = json['list_detail'] != null
        ? new ListDetail.fromJson(json['list_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listDetail != null) {
      data['list_detail'] = this.listDetail!.toJson();
    }
    return data;
  }
}

class ListDetail {
  String? listingId;
  String? listingCode;
  String? userId;
  String? categoryId;
  String? subCategoryId;
  String? serviceId;
  String? serviceImage;
  String? listingTypeId;
  String? listingName;
  String? listingDescription;
  String? listingAddress;
  List<ServiceLocations>? serviceLocations;
  String? listingMobile;
  String? listingWhatsapp;
  String? listingEmail;
  String? listingWebsite;
  String? countryId;
  String? stateId;
  String? cityId;
  String? regionId;
  String? profileImage;
  String? coverImage;
  List<String>? galleryImage;
  String? openingDays;
  String? openingTime;
  String? closingTime;
  String? fbLink;
  String? twitterLink;
  String? instaUrl;
  String? linkdUrl;
  String? gplusLink;
  String? googleMap;
  String? s360View;
  String? listingVideo;
  String? listingOpen;
  String? service1Name;
  String? service1Price;
  String? service1Detail;
  String? service1Image;
  String? service1ViewMore;
  String? service2Name;
  String? service2Price;
  String? service2Image;
  String? service3Name;
  String? service3Price;
  String? service3Image;
  String? service4Name;
  String? service4Price;
  String? service4Image;
  String? service5Name;
  String? service5Price;
  String? service5Image;
  String? service6Name;
  String? service6Price;
  String? service6Image;
  String? listingInfoQuestion;
  String? listingInfoAnswer;
  String? seoTitle;
  String? seoDescription;
  String? seoKeywords;
  String? listingLat;
  String? listingLng;
  String? listingStatus;
  String? paymentStatus;
  String? displayPosition;
  String? startDate;
  String? endDate;
  String? payment;
  String? listingSlug;
  String? abnNumber;
  String? organiType;
  String? ndisRegs;
  String? ndisEarlyChild;
  String? regNumber;
  String? regStamp;
  String? comLandNumber;
  String? comPhone1;
  String? comPhone2;
  String? comEmail;
  String? comWebsite;
  String? regGroup;
  String? workHours;
  String? yearsOfExperience;
  String? educationalQualification;
  String? skillSet;
  String? experience1;
  String? experience2;
  String? experience3;
  String? experience4;
  String? education1;
  String? education2;
  String? education3;
  String? education4;
  String? additionalInfo1;
  String? additionalInfo2;
  String? additionalInfo3;
  String? additionalInfo4;
  String? monIsOpen;
  String? monOpenTime;
  String? monCloseTime;
  String? monCheck;
  String? tueIsOpen;
  String? tueOpenTime;
  String? tueCloseTime;
  String? tueCheck;
  String? wedIsOpen;
  String? wedOpenTime;
  String? wedCloseTime;
  String? wedCheck;
  String? thuIsOpen;
  String? thuOpenTime;
  String? thuCloseTime;
  String? thuCheck;
  String? friIsOpen;
  String? friOpenTime;
  String? friCloseTime;
  String? friCheck;
  String? satIsOpen;
  String? satOpenTime;
  String? satCloseTime;
  String? satCheck;
  String? sunIsOpen;
  String? sunOpenTime;
  String? sunCloseTime;
  String? sunCheck;
  String? regStampCheck;
  String? workHourCheck;
  String? listingType;
  String? listingWhatup;
  String? businessTagline;
  String? listingApprove;
  String? propertyType;
  String? propertyId;
  String? listingIsDelete;
  String? listingDeleteCdt;
  String? listingCdt;
  String? language;
  String? servSpecilisation;
  String? petFrie;
  String? serDeliMethod;
  String? apprMerhod;

  ListDetail(
      {this.listingId,
        this.listingCode,
        this.userId,
        this.categoryId,
        this.subCategoryId,
        this.serviceId,
        this.serviceImage,
        this.listingTypeId,
        this.listingName,
        this.listingDescription,
        this.listingAddress,
        this.serviceLocations,
        this.listingMobile,
        this.listingWhatsapp,
        this.listingEmail,
        this.listingWebsite,
        this.countryId,
        this.stateId,
        this.cityId,
        this.regionId,
        this.profileImage,
        this.coverImage,
        this.galleryImage,
        this.openingDays,
        this.openingTime,
        this.closingTime,
        this.fbLink,
        this.twitterLink,
        this.instaUrl,
        this.linkdUrl,
        this.gplusLink,
        this.googleMap,
        this.s360View,
        this.listingVideo,
        this.listingOpen,
        this.service1Name,
        this.service1Price,
        this.service1Detail,
        this.service1Image,
        this.service1ViewMore,
        this.service2Name,
        this.service2Price,
        this.service2Image,
        this.service3Name,
        this.service3Price,
        this.service3Image,
        this.service4Name,
        this.service4Price,
        this.service4Image,
        this.service5Name,
        this.service5Price,
        this.service5Image,
        this.service6Name,
        this.service6Price,
        this.service6Image,
        this.listingInfoQuestion,
        this.listingInfoAnswer,
        this.seoTitle,
        this.seoDescription,
        this.seoKeywords,
        this.listingLat,
        this.listingLng,
        this.listingStatus,
        this.paymentStatus,
        this.displayPosition,
        this.startDate,
        this.endDate,
        this.payment,
        this.listingSlug,
        this.abnNumber,
        this.organiType,
        this.ndisRegs,
        this.ndisEarlyChild,
        this.regNumber,
        this.regStamp,
        this.comLandNumber,
        this.comPhone1,
        this.comPhone2,
        this.comEmail,
        this.comWebsite,
        this.regGroup,
        this.workHours,
        this.yearsOfExperience,
        this.educationalQualification,
        this.skillSet,
        this.experience1,
        this.experience2,
        this.experience3,
        this.experience4,
        this.education1,
        this.education2,
        this.education3,
        this.education4,
        this.additionalInfo1,
        this.additionalInfo2,
        this.additionalInfo3,
        this.additionalInfo4,
        this.monIsOpen,
        this.monOpenTime,
        this.monCloseTime,
        this.monCheck,
        this.tueIsOpen,
        this.tueOpenTime,
        this.tueCloseTime,
        this.tueCheck,
        this.wedIsOpen,
        this.wedOpenTime,
        this.wedCloseTime,
        this.wedCheck,
        this.thuIsOpen,
        this.thuOpenTime,
        this.thuCloseTime,
        this.thuCheck,
        this.friIsOpen,
        this.friOpenTime,
        this.friCloseTime,
        this.friCheck,
        this.satIsOpen,
        this.satOpenTime,
        this.satCloseTime,
        this.satCheck,
        this.sunIsOpen,
        this.sunOpenTime,
        this.sunCloseTime,
        this.sunCheck,
        this.regStampCheck,
        this.workHourCheck,
        this.listingType,
        this.listingWhatup,
        this.businessTagline,
        this.listingApprove,
        this.propertyType,
        this.propertyId,
        this.listingIsDelete,
        this.listingDeleteCdt,
        this.listingCdt,
        this.language,
        this.servSpecilisation,
        this.petFrie,
        this.serDeliMethod,
        this.apprMerhod});

  ListDetail.fromJson(Map<String, dynamic> json) {
    listingId = json['listing_id'];
    listingCode = json['listing_code'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    serviceId = json['service_id'];
    serviceImage = json['service_image'];
    listingTypeId = json['listing_type_id'];
    listingName = json['listing_name'];
    listingDescription = json['listing_description'];
    listingAddress = json['listing_address'];
    if (json['service_locations'] != null) {
      serviceLocations = <ServiceLocations>[];
      json['service_locations'].forEach((v) {
        serviceLocations!.add(new ServiceLocations.fromJson(v));
      });
    }
    listingMobile = json['listing_mobile'];
    listingWhatsapp = json['listing_whatsapp'];
    listingEmail = json['listing_email'];
    listingWebsite = json['listing_website'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    regionId = json['region_id'];
    profileImage = json['profile_image'];
    coverImage = json['cover_image'];
    galleryImage = json['gallery_image'].cast<String>();
    openingDays = json['opening_days'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    fbLink = json['fb_link'];
    twitterLink = json['twitter_link'];
    instaUrl = json['insta_url'];
    linkdUrl = json['linkd_url'];
    gplusLink = json['gplus_link'];
    googleMap = json['google_map'];
    s360View = json['360_view'];
    listingVideo = json['listing_video'];
    listingOpen = json['listing_open'];
    service1Name = json['service_1_name'];
    service1Price = json['service_1_price'];
    service1Detail = json['service_1_detail'];
    service1Image = json['service_1_image'];
    service1ViewMore = json['service_1_view_more'];
    service2Name = json['service_2_name'];
    service2Price = json['service_2_price'];
    service2Image = json['service_2_image'];
    service3Name = json['service_3_name'];
    service3Price = json['service_3_price'];
    service3Image = json['service_3_image'];
    service4Name = json['service_4_name'];
    service4Price = json['service_4_price'];
    service4Image = json['service_4_image'];
    service5Name = json['service_5_name'];
    service5Price = json['service_5_price'];
    service5Image = json['service_5_image'];
    service6Name = json['service_6_name'];
    service6Price = json['service_6_price'];
    service6Image = json['service_6_image'];
    listingInfoQuestion = json['listing_info_question'];
    listingInfoAnswer = json['listing_info_answer'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeywords = json['seo_keywords'];
    listingLat = json['listing_lat'];
    listingLng = json['listing_lng'];
    listingStatus = json['listing_status'];
    paymentStatus = json['payment_status'];
    displayPosition = json['display_position'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    payment = json['payment'];
    listingSlug = json['listing_slug'];
    abnNumber = json['abn_number'];
    organiType = json['organi_type'];
    ndisRegs = json['ndis_regs'];
    ndisEarlyChild = json['ndis_early_child'];
    regNumber = json['reg_number'];
    regStamp = json['reg_stamp'];
    comLandNumber = json['com_land_number'];
    comPhone1 = json['com_phone_1'];
    comPhone2 = json['com_phone_2'];
    comEmail = json['com_email'];
    comWebsite = json['com_website'];
    regGroup = json['reg_group'];
    workHours = json['work_hours'];
    yearsOfExperience = json['years_of_experience'];
    educationalQualification = json['educational_qualification'];
    skillSet = json['skill_set'];
    experience1 = json['experience_1'];
    experience2 = json['experience_2'];
    experience3 = json['experience_3'];
    experience4 = json['experience_4'];
    education1 = json['education_1'];
    education2 = json['education_2'];
    education3 = json['education_3'];
    education4 = json['education_4'];
    additionalInfo1 = json['additional_info_1'];
    additionalInfo2 = json['additional_info_2'];
    additionalInfo3 = json['additional_info_3'];
    additionalInfo4 = json['additional_info_4'];
    monIsOpen = json['mon_is_open'];
    monOpenTime = json['mon_open_time'];
    monCloseTime = json['mon_close_time'];
    monCheck = json['mon_check'];
    tueIsOpen = json['tue_is_open'];
    tueOpenTime = json['tue_open_time'];
    tueCloseTime = json['tue_close_time'];
    tueCheck = json['tue_check'];
    wedIsOpen = json['wed_is_open'];
    wedOpenTime = json['wed_open_time'];
    wedCloseTime = json['wed_close_time'];
    wedCheck = json['wed_check'];
    thuIsOpen = json['thu_is_open'];
    thuOpenTime = json['thu_open_time'];
    thuCloseTime = json['thu_close_time'];
    thuCheck = json['thu_check'];
    friIsOpen = json['fri_is_open'];
    friOpenTime = json['fri_open_time'];
    friCloseTime = json['fri_close_time'];
    friCheck = json['fri_check'];
    satIsOpen = json['sat_is_open'];
    satOpenTime = json['sat_open_time'];
    satCloseTime = json['sat_close_time'];
    satCheck = json['sat_check'];
    sunIsOpen = json['sun_is_open'];
    sunOpenTime = json['sun_open_time'];
    sunCloseTime = json['sun_close_time'];
    sunCheck = json['sun_check'];
    regStampCheck = json['reg_stamp_check'];
    workHourCheck = json['work_hour_check'];
    listingType = json['listing_type'];
    listingWhatup = json['listing_whatup'];
    businessTagline = json['business_tagline'];
    listingApprove = json['listing_approve'];
    propertyType = json['property_type'];
    propertyId = json['property_id'];
    listingIsDelete = json['listing_is_delete'];
    listingDeleteCdt = json['listing_delete_cdt'];
    listingCdt = json['listing_cdt'];
    language = json['language'];
    servSpecilisation = json['serv_specilisation'];
    petFrie = json['pet_frie'];
    serDeliMethod = json['ser_deli_method'];
    apprMerhod = json['appr_merhod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listing_id'] = this.listingId;
    data['listing_code'] = this.listingCode;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['service_id'] = this.serviceId;
    data['service_image'] = this.serviceImage;
    data['listing_type_id'] = this.listingTypeId;
    data['listing_name'] = this.listingName;
    data['listing_description'] = this.listingDescription;
    data['listing_address'] = this.listingAddress;
    if (this.serviceLocations != null) {
      data['service_locations'] =
          this.serviceLocations!.map((v) => v.toJson()).toList();
    }
    data['listing_mobile'] = this.listingMobile;
    data['listing_whatsapp'] = this.listingWhatsapp;
    data['listing_email'] = this.listingEmail;
    data['listing_website'] = this.listingWebsite;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['region_id'] = this.regionId;
    data['profile_image'] = this.profileImage;
    data['cover_image'] = this.coverImage;
    data['gallery_image'] = this.galleryImage;
    data['opening_days'] = this.openingDays;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['fb_link'] = this.fbLink;
    data['twitter_link'] = this.twitterLink;
    data['insta_url'] = this.instaUrl;
    data['linkd_url'] = this.linkdUrl;
    data['gplus_link'] = this.gplusLink;
    data['google_map'] = this.googleMap;
    data['360_view'] = this.s360View;
    data['listing_video'] = this.listingVideo;
    data['listing_open'] = this.listingOpen;
    data['service_1_name'] = this.service1Name;
    data['service_1_price'] = this.service1Price;
    data['service_1_detail'] = this.service1Detail;
    data['service_1_image'] = this.service1Image;
    data['service_1_view_more'] = this.service1ViewMore;
    data['service_2_name'] = this.service2Name;
    data['service_2_price'] = this.service2Price;
    data['service_2_image'] = this.service2Image;
    data['service_3_name'] = this.service3Name;
    data['service_3_price'] = this.service3Price;
    data['service_3_image'] = this.service3Image;
    data['service_4_name'] = this.service4Name;
    data['service_4_price'] = this.service4Price;
    data['service_4_image'] = this.service4Image;
    data['service_5_name'] = this.service5Name;
    data['service_5_price'] = this.service5Price;
    data['service_5_image'] = this.service5Image;
    data['service_6_name'] = this.service6Name;
    data['service_6_price'] = this.service6Price;
    data['service_6_image'] = this.service6Image;
    data['listing_info_question'] = this.listingInfoQuestion;
    data['listing_info_answer'] = this.listingInfoAnswer;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['listing_lat'] = this.listingLat;
    data['listing_lng'] = this.listingLng;
    data['listing_status'] = this.listingStatus;
    data['payment_status'] = this.paymentStatus;
    data['display_position'] = this.displayPosition;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['payment'] = this.payment;
    data['listing_slug'] = this.listingSlug;
    data['abn_number'] = this.abnNumber;
    data['organi_type'] = this.organiType;
    data['ndis_regs'] = this.ndisRegs;
    data['ndis_early_child'] = this.ndisEarlyChild;
    data['reg_number'] = this.regNumber;
    data['reg_stamp'] = this.regStamp;
    data['com_land_number'] = this.comLandNumber;
    data['com_phone_1'] = this.comPhone1;
    data['com_phone_2'] = this.comPhone2;
    data['com_email'] = this.comEmail;
    data['com_website'] = this.comWebsite;
    data['reg_group'] = this.regGroup;
    data['work_hours'] = this.workHours;
    data['years_of_experience'] = this.yearsOfExperience;
    data['educational_qualification'] = this.educationalQualification;
    data['skill_set'] = this.skillSet;
    data['experience_1'] = this.experience1;
    data['experience_2'] = this.experience2;
    data['experience_3'] = this.experience3;
    data['experience_4'] = this.experience4;
    data['education_1'] = this.education1;
    data['education_2'] = this.education2;
    data['education_3'] = this.education3;
    data['education_4'] = this.education4;
    data['additional_info_1'] = this.additionalInfo1;
    data['additional_info_2'] = this.additionalInfo2;
    data['additional_info_3'] = this.additionalInfo3;
    data['additional_info_4'] = this.additionalInfo4;
    data['mon_is_open'] = this.monIsOpen;
    data['mon_open_time'] = this.monOpenTime;
    data['mon_close_time'] = this.monCloseTime;
    data['mon_check'] = this.monCheck;
    data['tue_is_open'] = this.tueIsOpen;
    data['tue_open_time'] = this.tueOpenTime;
    data['tue_close_time'] = this.tueCloseTime;
    data['tue_check'] = this.tueCheck;
    data['wed_is_open'] = this.wedIsOpen;
    data['wed_open_time'] = this.wedOpenTime;
    data['wed_close_time'] = this.wedCloseTime;
    data['wed_check'] = this.wedCheck;
    data['thu_is_open'] = this.thuIsOpen;
    data['thu_open_time'] = this.thuOpenTime;
    data['thu_close_time'] = this.thuCloseTime;
    data['thu_check'] = this.thuCheck;
    data['fri_is_open'] = this.friIsOpen;
    data['fri_open_time'] = this.friOpenTime;
    data['fri_close_time'] = this.friCloseTime;
    data['fri_check'] = this.friCheck;
    data['sat_is_open'] = this.satIsOpen;
    data['sat_open_time'] = this.satOpenTime;
    data['sat_close_time'] = this.satCloseTime;
    data['sat_check'] = this.satCheck;
    data['sun_is_open'] = this.sunIsOpen;
    data['sun_open_time'] = this.sunOpenTime;
    data['sun_close_time'] = this.sunCloseTime;
    data['sun_check'] = this.sunCheck;
    data['reg_stamp_check'] = this.regStampCheck;
    data['work_hour_check'] = this.workHourCheck;
    data['listing_type'] = this.listingType;
    data['listing_whatup'] = this.listingWhatup;
    data['business_tagline'] = this.businessTagline;
    data['listing_approve'] = this.listingApprove;
    data['property_type'] = this.propertyType;
    data['property_id'] = this.propertyId;
    data['listing_is_delete'] = this.listingIsDelete;
    data['listing_delete_cdt'] = this.listingDeleteCdt;
    data['listing_cdt'] = this.listingCdt;
    data['language'] = this.language;
    data['serv_specilisation'] = this.servSpecilisation;
    data['pet_frie'] = this.petFrie;
    data['ser_deli_method'] = this.serDeliMethod;
    data['appr_merhod'] = this.apprMerhod;
    return data;
  }
}

class ServiceLocations {
  String? location;
  String? locationCity;
  String? locationState;
  String? locationCountry;
  String? locationZipCode;
  String? locationLatitude;
  String? locationLongitude;
  String? region;

  ServiceLocations(
      {this.location,
        this.locationCity,
        this.locationState,
        this.locationCountry,
        this.locationZipCode,
        this.locationLatitude,
        this.locationLongitude,
        this.region});

  ServiceLocations.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    locationCity = json['location_city'];
    locationState = json['location_state'];
    locationCountry = json['location_country'];
    locationZipCode = json['location_zip_code'];
    locationLatitude = json['location_latitude'];
    locationLongitude = json['location_longitude'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['location_city'] = this.locationCity;
    data['location_state'] = this.locationState;
    data['location_country'] = this.locationCountry;
    data['location_zip_code'] = this.locationZipCode;
    data['location_latitude'] = this.locationLatitude;
    data['location_longitude'] = this.locationLongitude;
    data['region'] = this.region;
    return data;
  }
}
