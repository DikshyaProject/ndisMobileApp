class AdvocacySupportModel {
  String? message;
  AdvocacySupportData? data;
  int? status;

  AdvocacySupportModel({this.message, this.data, this.status});

  AdvocacySupportModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new AdvocacySupportData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class AdvocacySupportData {
  List<DataList>? dataList;

  AdvocacySupportData({this.dataList});

  AdvocacySupportData.fromJson(Map<String, dynamic> json) {
    if (json['data_list '] != null) {
      dataList = <DataList>[];
      json['data_list '].forEach((v) {
        dataList!.add(new DataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataList != null) {
      data['data_list '] = this.dataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataList {
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
  String? galleryImage;
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
  String? apprMerhod;
  String? language;
  String? servSpecilisation;
  String? petFrie;
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
  String? serDeliMethod;
  String? ageGroup;
  String? regStampCheck;
  String? workHourCheck;
  String? listingType;
  String? listingWhatup;
  String? businessTagline;
  String? listingApprove;
  String? propertyType;
  String? propertyId;
  String? dateAvailToMove;
  String? contactPerson;
  String? addRecEmail;
  String? propertyMode;
  String? proBuyRent;
  String? proPrice;
  String? rentChanged;
  String? accomLength;
  String? commnRentAss;
  String? termAccomFun;
  String? wholeHoOrBr;
  String? rentCoPerWeek;
  String? numOfBedr;
  String? numOfBathr;
  String? numOfToil;
  String? currNunOfVac;
  String? numOfStanSiCar;
  String? numOfWheelAcc;
  String? liveHere;
  String? broucherImage;
  String? docImage;
  String? appUrl;
  String? appForm;
  String? floorplanImage;
  String? sdaProvName;
  String? sdaProvAbn;
  String? sdaBuilType;
  String? sdaDesCat;
  String? numOfSdaRes;
  String? miniSdFun;
  String? sdaLocation;
  String? sdaIncPerPart;
  String? potTotalIncPerYr;
  String? propSizeM2;
  String? landAreaM2;
  String? rentalYield;
  String? proFeatType;
  String? proFeat;
  String? outFeat;
  String? addFeat;
  String? eneEffRating;
  String? nearTrainStat;
  String? nearTramStop;
  String? nearBusStop;
  String? nearFerryStat;
  String? nearShopCent;
  String? nearHospt;
  String? nearPark;
  String? nearMediPrac;
  String? plannedSupp;
  String? typeOfSuppoPro;
  String? suppProName;
  String? suppProWeb;
  String? suppProLogo;
  String? bedroomCarer;
  String? onShareSupp;
  String? appAndReviewed;
  String? overnightSupp;
  String? roomSpec;
  String? stars;
  String? boardBasis;
  String? holidayType;
  String? accommodation;
  String? listingIsDelete;
  String? listingDeleteCdt;
  String? listingCdt;
  String? userPlan;
  List<String>? subCategoryName;

  DataList(
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
        this.apprMerhod,
        this.language,
        this.servSpecilisation,
        this.petFrie,
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
        this.serDeliMethod,
        this.ageGroup,
        this.regStampCheck,
        this.workHourCheck,
        this.listingType,
        this.listingWhatup,
        this.businessTagline,
        this.listingApprove,
        this.propertyType,
        this.propertyId,
        this.dateAvailToMove,
        this.contactPerson,
        this.addRecEmail,
        this.propertyMode,
        this.proBuyRent,
        this.proPrice,
        this.rentChanged,
        this.accomLength,
        this.commnRentAss,
        this.termAccomFun,
        this.wholeHoOrBr,
        this.rentCoPerWeek,
        this.numOfBedr,
        this.numOfBathr,
        this.numOfToil,
        this.currNunOfVac,
        this.numOfStanSiCar,
        this.numOfWheelAcc,
        this.liveHere,
        this.broucherImage,
        this.docImage,
        this.appUrl,
        this.appForm,
        this.floorplanImage,
        this.sdaProvName,
        this.sdaProvAbn,
        this.sdaBuilType,
        this.sdaDesCat,
        this.numOfSdaRes,
        this.miniSdFun,
        this.sdaLocation,
        this.sdaIncPerPart,
        this.potTotalIncPerYr,
        this.propSizeM2,
        this.landAreaM2,
        this.rentalYield,
        this.proFeatType,
        this.proFeat,
        this.outFeat,
        this.addFeat,
        this.eneEffRating,
        this.nearTrainStat,
        this.nearTramStop,
        this.nearBusStop,
        this.nearFerryStat,
        this.nearShopCent,
        this.nearHospt,
        this.nearPark,
        this.nearMediPrac,
        this.plannedSupp,
        this.typeOfSuppoPro,
        this.suppProName,
        this.suppProWeb,
        this.suppProLogo,
        this.bedroomCarer,
        this.onShareSupp,
        this.appAndReviewed,
        this.overnightSupp,
        this.roomSpec,
        this.stars,
        this.boardBasis,
        this.holidayType,
        this.accommodation,
        this.listingIsDelete,
        this.listingDeleteCdt,
        this.listingCdt,
        this.userPlan,
        this.subCategoryName});

  DataList.fromJson(Map<String, dynamic> json) {
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
    galleryImage = json['gallery_image'];
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
    apprMerhod = json['appr_merhod'];
    language = json['language'];
    servSpecilisation = json['serv_specilisation'];
    petFrie = json['pet_frie'];
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
    serDeliMethod = json['ser_deli_method'];
    ageGroup = json['age_group'];
    regStampCheck = json['reg_stamp_check'];
    workHourCheck = json['work_hour_check'];
    listingType = json['listing_type'];
    listingWhatup = json['listing_whatup'];
    businessTagline = json['business_tagline'];
    listingApprove = json['listing_approve'];
    propertyType = json['property_type'];
    propertyId = json['property_id'];
    dateAvailToMove = json['date_avail_to_move'];
    contactPerson = json['contact_person'];
    addRecEmail = json['add_rec_email'];
    propertyMode = json['property_mode'];
    proBuyRent = json['pro_buy_rent'];
    proPrice = json['pro_price'];
    rentChanged = json['rent_changed'];
    accomLength = json['accom_length'];
    commnRentAss = json['commn_rent_ass'];
    termAccomFun = json['term_accom_fun'];
    wholeHoOrBr = json['whole_ho_or_br'];
    rentCoPerWeek = json['rent_co_per_week'];
    numOfBedr = json['num_of_bedr'];
    numOfBathr = json['num_of_bathr'];
    numOfToil = json['num_of_toil'];
    currNunOfVac = json['curr_nun_of_vac'];
    numOfStanSiCar = json['num_of_stan_si_car'];
    numOfWheelAcc = json['num_of_wheel_acc'];
    liveHere = json['live_here'];
    broucherImage = json['broucher_image'];
    docImage = json['doc_image'];
    appUrl = json['app_url'];
    appForm = json['app_form'];
    floorplanImage = json['floorplan_image'];
    sdaProvName = json['sda_prov_name'];
    sdaProvAbn = json['sda_prov_abn'];
    sdaBuilType = json['sda_buil_type'];
    sdaDesCat = json['sda_des_cat'];
    numOfSdaRes = json['num_of_sda_res'];
    miniSdFun = json['mini_sd_fun'];
    sdaLocation = json['sda_location'];
    sdaIncPerPart = json['sda_inc_per_part'];
    potTotalIncPerYr = json['pot_total_inc_per_yr'];
    propSizeM2 = json['prop_size_m2'];
    landAreaM2 = json['land_area_m2'];
    rentalYield = json['rental_yield'];
    proFeatType = json['pro_feat_type'];
    proFeat = json['pro_feat'];
    outFeat = json['out_feat'];
    addFeat = json['add_feat'];
    eneEffRating = json['ene_eff_rating'];
    nearTrainStat = json['near_train_stat'];
    nearTramStop = json['near_tram_stop'];
    nearBusStop = json['near_bus_stop'];
    nearFerryStat = json['near_ferry_stat'];
    nearShopCent = json['near_shop_cent'];
    nearHospt = json['near_hospt'];
    nearPark = json['near_park'];
    nearMediPrac = json['near_medi_prac'];
    plannedSupp = json['planned_supp'];
    typeOfSuppoPro = json['type_of_suppo_pro'];
    suppProName = json['supp_pro_name'];
    suppProWeb = json['supp_pro_web'];
    suppProLogo = json['supp_pro_logo'];
    bedroomCarer = json['bedroom_carer'];
    onShareSupp = json['on_share_supp'];
    appAndReviewed = json['app_and_reviewed'];
    overnightSupp = json['overnight_supp'];
    roomSpec = json['room_spec'];
    stars = json['stars'];
    boardBasis = json['board_basis'];
    holidayType = json['holiday_type'];
    accommodation = json['accommodation'];
    listingIsDelete = json['listing_is_delete'];
    listingDeleteCdt = json['listing_delete_cdt'];
    listingCdt = json['listing_cdt'];
    userPlan = json['user_plan'];
    subCategoryName = json['sub_category_name'].cast<String>();
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
    data['appr_merhod'] = this.apprMerhod;
    data['language'] = this.language;
    data['serv_specilisation'] = this.servSpecilisation;
    data['pet_frie'] = this.petFrie;
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
    data['ser_deli_method'] = this.serDeliMethod;
    data['age_group'] = this.ageGroup;
    data['reg_stamp_check'] = this.regStampCheck;
    data['work_hour_check'] = this.workHourCheck;
    data['listing_type'] = this.listingType;
    data['listing_whatup'] = this.listingWhatup;
    data['business_tagline'] = this.businessTagline;
    data['listing_approve'] = this.listingApprove;
    data['property_type'] = this.propertyType;
    data['property_id'] = this.propertyId;
    data['date_avail_to_move'] = this.dateAvailToMove;
    data['contact_person'] = this.contactPerson;
    data['add_rec_email'] = this.addRecEmail;
    data['property_mode'] = this.propertyMode;
    data['pro_buy_rent'] = this.proBuyRent;
    data['pro_price'] = this.proPrice;
    data['rent_changed'] = this.rentChanged;
    data['accom_length'] = this.accomLength;
    data['commn_rent_ass'] = this.commnRentAss;
    data['term_accom_fun'] = this.termAccomFun;
    data['whole_ho_or_br'] = this.wholeHoOrBr;
    data['rent_co_per_week'] = this.rentCoPerWeek;
    data['num_of_bedr'] = this.numOfBedr;
    data['num_of_bathr'] = this.numOfBathr;
    data['num_of_toil'] = this.numOfToil;
    data['curr_nun_of_vac'] = this.currNunOfVac;
    data['num_of_stan_si_car'] = this.numOfStanSiCar;
    data['num_of_wheel_acc'] = this.numOfWheelAcc;
    data['live_here'] = this.liveHere;
    data['broucher_image'] = this.broucherImage;
    data['doc_image'] = this.docImage;
    data['app_url'] = this.appUrl;
    data['app_form'] = this.appForm;
    data['floorplan_image'] = this.floorplanImage;
    data['sda_prov_name'] = this.sdaProvName;
    data['sda_prov_abn'] = this.sdaProvAbn;
    data['sda_buil_type'] = this.sdaBuilType;
    data['sda_des_cat'] = this.sdaDesCat;
    data['num_of_sda_res'] = this.numOfSdaRes;
    data['mini_sd_fun'] = this.miniSdFun;
    data['sda_location'] = this.sdaLocation;
    data['sda_inc_per_part'] = this.sdaIncPerPart;
    data['pot_total_inc_per_yr'] = this.potTotalIncPerYr;
    data['prop_size_m2'] = this.propSizeM2;
    data['land_area_m2'] = this.landAreaM2;
    data['rental_yield'] = this.rentalYield;
    data['pro_feat_type'] = this.proFeatType;
    data['pro_feat'] = this.proFeat;
    data['out_feat'] = this.outFeat;
    data['add_feat'] = this.addFeat;
    data['ene_eff_rating'] = this.eneEffRating;
    data['near_train_stat'] = this.nearTrainStat;
    data['near_tram_stop'] = this.nearTramStop;
    data['near_bus_stop'] = this.nearBusStop;
    data['near_ferry_stat'] = this.nearFerryStat;
    data['near_shop_cent'] = this.nearShopCent;
    data['near_hospt'] = this.nearHospt;
    data['near_park'] = this.nearPark;
    data['near_medi_prac'] = this.nearMediPrac;
    data['planned_supp'] = this.plannedSupp;
    data['type_of_suppo_pro'] = this.typeOfSuppoPro;
    data['supp_pro_name'] = this.suppProName;
    data['supp_pro_web'] = this.suppProWeb;
    data['supp_pro_logo'] = this.suppProLogo;
    data['bedroom_carer'] = this.bedroomCarer;
    data['on_share_supp'] = this.onShareSupp;
    data['app_and_reviewed'] = this.appAndReviewed;
    data['overnight_supp'] = this.overnightSupp;
    data['room_spec'] = this.roomSpec;
    data['stars'] = this.stars;
    data['board_basis'] = this.boardBasis;
    data['holiday_type'] = this.holidayType;
    data['accommodation'] = this.accommodation;
    data['listing_is_delete'] = this.listingIsDelete;
    data['listing_delete_cdt'] = this.listingDeleteCdt;
    data['listing_cdt'] = this.listingCdt;
    data['user_plan'] = this.userPlan;
    data['sub_category_name'] = this.subCategoryName;
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
