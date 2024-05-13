class SupportWorkerRegistrationResponse {
  SupportWorkerRegistrationResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  late final String message;
  late final int status;
  late final SWRegistrationResponseData data;

  SupportWorkerRegistrationResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = SWRegistrationResponseData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class  SWRegistrationResponseData {
  SWRegistrationResponseData({
    required this.supportWorker,
  });

  late final SupportWorker supportWorker;

  SWRegistrationResponseData.fromJson(Map<String, dynamic> json) {
    supportWorker = SupportWorker.fromJson(json['support_worker']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['support_worker'] = supportWorker.toJson();
    return _data;
  }
}

class SupportWorker {
  SupportWorker({
    required this.userId,
    required this.userCode,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.mobileNumber,
    required this.australianRegions,
    required this.userAddress,
    required this.userCity,
    required this.userCountry,
    required this.userState,
    required this.userZipCode,
    required this.userLatitude,
    required this.userLongitude,
    required this.userContactName,
    required this.userContactEmail,
    required this.userContactMobile,
    required this.password,
    required this.dateOfBirth,
    required this.profileImage,
    required this.coverImage,
    required this.profileIdProof,
    required this.paypalEmailId,
    required this.userFacebook,
    required this.userTwitter,
    required this.userYoutube,
    required this.userWebsite,
    required this.registerMode,
    required this.userType,
    required this.userPlan,
    required this.settingReview,
    required this.settingShare,
    required this.settingProfileShow,
    required this.settingGuaranteeShow,
    required this.settingUserStatus,
    required this.settingListingShow,
    required this.settingJobShow,
    required this.settingExpertShow,
    required this.settingProductShow,
    required this.settingBlogShow,
    required this.settingEventShow,
    required this.settingCouponShow,
    required this.userStatus,
    required this.paymentStatus,
    required this.userFollowers,
    required this.userSlug,
    required this.userPoints,
    required this.verificationCode,
    required this.verificationLink,
    required this.verificationStatus,
    required this.userClearNotificationCdt,
    required this.userCdt,
    required this.wNServices,
    required this.pAgeRange,
    required this.nPManaged,
    required this.serviceLocation,
    required this.participantCity,
    required this.participantState,
    required this.participantCountry,
    required this.participantZipCode,
    required this.participantLatitude,
    required this.participantLongitude,
    required this.serviceLatitude,
    required this.serviceLongitude,
    required this.relationWP,
    required this.pFirstName,
    required this.pLastName,
    required this.ageRange,
    required this.pContactMethod,
    required this.pIdentifyAs,
    required this.languageSpoken,
    required this.interpreterR,
    required this.ndisNumber,
    required this.typeOfSupportWork,
    required this.ABNNumber,
    required this.howDidYouHearAboutUs,
    required this.birthYear,
    required this.age,
    required this.location,
    required this.happyToTravel,
    required this.language,
    required this.aboutMe,
    required this.availabilityTime,
    required this.petFriendly,
    required this.gender,
    required this.position,
    required this.showering,
    required this.qualifications,
    required this.certificates,
    required this.skills,
    required this.companyName,
    required this.workFrom,
    required this.workTo,
    required this.expYearMonth,
    required this.supportPrefer,
    required this.ranking,
    required this.workAvail,
    required this.mobileVerificationCode,
    required this.accessMethods,
    required this.ageGroups,
    required this.serviceLocations,
    required this.scBusinessAddress,
    required this.scSlLatitude,
    required this.scSlLongitude,
    required this.scSlCity,
    required this.scSlState,
    required this.scSlCountry,
    required this.scSlZipCode,
    required this.scBusinessWebsite,
    required this.registrationNo,
    required this.accreditedProviderStamp,
    required this.providerTradingName,
    required this.registeredCompanysName,
    required this.businessContactNumber,
    required this.businessEmailAddress,
    required this.askQues,
    required this.listType,
    required this.registerType,
    required this.categoryId,
    required this.subCategoryId,
    required this.allLocation,
  });

  late final String userId;
  late final String userCode;
  late final String firstName;
  late final String lastName;
  late final String emailId;
  late final String mobileNumber;
  late final String australianRegions;
  late final String userAddress;
  late final String userCity;
  late final String userCountry;
  late final String userState;
  late final String userZipCode;
  late final String userLatitude;
  late final String userLongitude;
  late final String userContactName;
  late final String userContactEmail;
  late final String userContactMobile;
  late final String password;
  late final String dateOfBirth;
  late final String profileImage;
  late final String coverImage;
  late final String profileIdProof;
  late final String paypalEmailId;
  late final String userFacebook;
  late final String userTwitter;
  late final String userYoutube;
  late final String userWebsite;
  late final String registerMode;
  late final String userType;
  late final String userPlan;
  late final String settingReview;
  late final String settingShare;
  late final String settingProfileShow;
  late final String settingGuaranteeShow;
  late final String settingUserStatus;
  late final String settingListingShow;
  late final String settingJobShow;
  late final String settingExpertShow;
  late final String settingProductShow;
  late final String settingBlogShow;
  late final String settingEventShow;
  late final String settingCouponShow;
  late final String userStatus;
  late final String paymentStatus;
  late final String userFollowers;
  late final String userSlug;
  late final String userPoints;
  late final String verificationCode;
  late final String verificationLink;
  late final String verificationStatus;
  late final String userClearNotificationCdt;
  late final String userCdt;
  late final String wNServices;
  late final String pAgeRange;
  late final String nPManaged;
  late final String serviceLocation;
  late final String participantCity;
  late final String participantState;
  late final String participantCountry;
  late final String participantZipCode;
  late final String participantLatitude;
  late final String participantLongitude;
  late final String serviceLatitude;
  late final String serviceLongitude;
  late final String relationWP;
  late final String pFirstName;
  late final String pLastName;
  late final String ageRange;
  late final String pContactMethod;
  late final String pIdentifyAs;
  late final String languageSpoken;
  late final String interpreterR;
  late final String ndisNumber;
  late final String typeOfSupportWork;
  late final String ABNNumber;
  late final String howDidYouHearAboutUs;
  late final String birthYear;
  late final String age;
  late final String location;
  late final String happyToTravel;
  late final String language;
  late final String aboutMe;
  late final String availabilityTime;
  late final String petFriendly;
  late final String gender;
  late final String position;
  late final String showering;
  late final String qualifications;
  late final String certificates;
  late final String skills;
  late final String companyName;
  late final String workFrom;
  late final String workTo;
  late final String expYearMonth;
  late final String supportPrefer;
  late final String ranking;
  late final String workAvail;
  late final String mobileVerificationCode;
  late final String accessMethods;
  late final String ageGroups;
  late final String serviceLocations;
  late final String scBusinessAddress;
  late final String scSlLatitude;
  late final String scSlLongitude;
  late final String scSlCity;
  late final String scSlState;
  late final String scSlCountry;
  late final String scSlZipCode;
  late final String scBusinessWebsite;
  late final String registrationNo;
  late final String accreditedProviderStamp;
  late final String providerTradingName;
  late final String registeredCompanysName;
  late final String businessContactNumber;
  late final String businessEmailAddress;
  late final String askQues;
  late final String listType;
  late final String registerType;
  late final String categoryId;
  late final String subCategoryId;
  late final String allLocation;

  SupportWorker.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? "";
    userCode = json['user_code'] ?? "";
    firstName = json['first_name'] ?? "";
    lastName = json['last_name'] ?? "";
    emailId = json['email_id'] ?? "";
    mobileNumber = json['mobile_number'] ?? "";
    australianRegions = json['australian_regions'] ?? "";
    userAddress = json['user_address'] ?? "";
    userCity = json['user_city'] ?? "";
    userCountry = json['user_country'] ?? "";
    userState = json['user_state'] ?? "";
    userZipCode = json['user_zip_code'] ?? "";
    userLatitude = json['user_latitude'] ?? "";
    userLongitude = json['user_longitude'] ?? "";
    userContactName = json['user_contact_name'] ?? "";
    userContactEmail = json['user_contact_email'] ?? "";
    userContactMobile = json['user_contact_mobile'] ?? "";
    password = json['password'] ?? "";
    dateOfBirth = json['date_of_birth'] ?? "";
    profileImage = json['profile_image'] ?? "";
    coverImage = json['cover_image'] ?? "";
    profileIdProof = json['profile_id_proof'] ?? "";
    paypalEmailId = json['paypal_email_id'] ?? "";
    userFacebook = json['user_facebook'] ?? "";
    userTwitter = json['user_twitter'] ?? "";
    userYoutube = json['user_youtube'] ?? "";
    userWebsite = json['user_website'] ?? "";
    registerMode = json['register_mode'] ?? "";
    userType = json['user_type'] ?? "";
    userPlan = json['user_plan'] ?? "";
    settingReview = json['setting_review'] ?? "";
    settingShare = json['setting_share'] ?? "";
    settingProfileShow = json['setting_profile_show'] ?? "";
    settingGuaranteeShow = json['setting_guarantee_show'] ?? "";
    settingUserStatus = json['setting_user_status'] ?? "";
    settingListingShow = json['setting_listing_show'] ?? "";
    settingJobShow = json['setting_job_show'] ?? "";
    settingExpertShow = json['setting_expert_show'] ?? "";
    settingProductShow = json['setting_product_show'] ?? "";
    settingBlogShow = json['setting_blog_show'] ?? "";
    settingEventShow = json['setting_event_show'] ?? "";
    settingCouponShow = json['setting_coupon_show'] ?? "";
    userStatus = json['user_status'] ?? "";
    paymentStatus = json['payment_status'] ?? "";
    userFollowers = json['user_followers'] ?? "";
    userSlug = json['user_slug'] ?? "";
    userPoints = json['user_points'] ?? "";
    verificationCode = json['verification_code'] ?? "";
    verificationLink = json['verification_link'] ?? "";
    verificationStatus = json['verification_status'] ?? "";
    userClearNotificationCdt = json['user_clear_notification_cdt'] ?? "";
    userCdt = json['user_cdt'] ?? "";
    wNServices = json['w_n_services'] ?? "";
    pAgeRange = json['p_age_range'] ?? "";
    nPManaged = json['n_p_managed'] ?? "";
    serviceLocation = json['service_location'] ?? "";
    participantCity = json['participant_city'] ?? "";
    participantState = json['participant_state'] ?? "";
    participantCountry = json['participant_country'] ?? "";
    participantZipCode = json['participant_zip_code'] ?? "";
    participantLatitude = json['participant_latitude'] ?? "";
    participantLongitude = json['participant_longitude'] ?? "";
    serviceLatitude = json['service_latitude'] ?? "";
    serviceLongitude = json['service_longitude'] ?? "";
    relationWP = json['relation_w_p'] ?? "";
    pFirstName = json['p_first_name'] ?? "";
    pLastName = json['p_last_name'] ?? "";
    ageRange = json['age_range'] ?? "";
    pContactMethod = json['p_contact_method'] ?? "";
    pIdentifyAs = json['p_identify_as'] ?? "";
    languageSpoken = json['language_spoken'] ?? "";
    interpreterR = json['interpreter_r'] ?? "";
    ndisNumber = json['ndis_number'] ?? "";
    typeOfSupportWork = json['type_of_support_work'] ?? "";
    ABNNumber = json['ABN_number'] ?? "";
    howDidYouHearAboutUs = json['how_did_you_hear_about_us'] ?? "";
    birthYear = json['birth_year'] ?? "";
    age = json['age'] ?? "";
    location = json['location'] ?? "";
    happyToTravel = json['happy_to_travel'] ?? "";
    language = json['language'] ?? "";
    aboutMe = json['about_me'] ?? "";
    availabilityTime = json['availability_time'] ?? "";
    petFriendly = json['pet_friendly'] ?? "";
    gender = json['gender'] ?? "";
    position = json['position'] ?? "";
    showering = json['showering'] ?? "";
    qualifications = json['qualifications'] ?? "";
    certificates = json['certificates'] ?? "";
    skills = json['skills'] ?? "";
    companyName = json['company_name'] ?? "";
    workFrom = json['work_from'] ?? "";
    workTo = json['work_to'] ?? "";
    expYearMonth = json['exp_year_month'] ?? "";
    supportPrefer = json['support_prefer'] ?? "";
    ranking = json['ranking'] ?? "";
    workAvail = json['work_avail'] ?? "";
    mobileVerificationCode = json['mobile_verification_code'] ?? "";
    accessMethods = json['access_methods'] ?? "";
    ageGroups = json['age_groups'] ?? "";
    serviceLocations = json['service_locations'] ?? "";
    scBusinessAddress = json['sc_business_address'] ?? "";
    scSlLatitude = json['sc_sl_latitude'] ?? "";
    scSlLongitude = json['sc_sl_longitude'] ?? "";
    scSlCity = json['sc_sl_city'] ?? "";
    scSlState = json['sc_sl_state'] ?? "";
    scSlCountry = json['sc_sl_country'] ?? "";
    scSlZipCode = json['sc_sl_zip_code'] ?? "";
    scBusinessWebsite = json['sc_business_website'] ?? "";
    registrationNo = json['registration_no'] ?? "";
    accreditedProviderStamp = json['accredited_provider_stamp'] ?? "";
    providerTradingName = json['provider_trading_name'] ?? "";
    registeredCompanysName = json['registered_companys_name'] ?? "";
    businessContactNumber = json['business_contact_number'] ?? "";
    businessEmailAddress = json['business_email_address'] ?? "";
    askQues = json['ask_ques'] ?? "";
    listType = json['list_type'] ?? "";
    registerType = json['register_type'] ?? "";
    categoryId = json['category_id'] ?? "";
    subCategoryId = json['sub_category_id'] ?? "";

    allLocation = json['all_location'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['user_code'] = userCode;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email_id'] = emailId;
    _data['mobile_number'] = mobileNumber;
    _data['australian_regions'] = australianRegions;
    _data['user_address'] = userAddress;
    _data['user_city'] = userCity;
    _data['user_country'] = userCountry;
    _data['user_state'] = userState;
    _data['user_zip_code'] = userZipCode;
    _data['user_latitude'] = userLatitude;
    _data['user_longitude'] = userLongitude;
    _data['user_contact_name'] = userContactName;
    _data['user_contact_email'] = userContactEmail;
    _data['user_contact_mobile'] = userContactMobile;
    _data['password'] = password;
    _data['date_of_birth'] = dateOfBirth;
    _data['profile_image'] = profileImage;
    _data['cover_image'] = coverImage;
    _data['profile_id_proof'] = profileIdProof;
    _data['paypal_email_id'] = paypalEmailId;
    _data['user_facebook'] = userFacebook;
    _data['user_twitter'] = userTwitter;
    _data['user_youtube'] = userYoutube;
    _data['user_website'] = userWebsite;
    _data['register_mode'] = registerMode;
    _data['user_type'] = userType;
    _data['user_plan'] = userPlan;
    _data['setting_review'] = settingReview;
    _data['setting_share'] = settingShare;
    _data['setting_profile_show'] = settingProfileShow;
    _data['setting_guarantee_show'] = settingGuaranteeShow;
    _data['setting_user_status'] = settingUserStatus;
    _data['setting_listing_show'] = settingListingShow;
    _data['setting_job_show'] = settingJobShow;
    _data['setting_expert_show'] = settingExpertShow;
    _data['setting_product_show'] = settingProductShow;
    _data['setting_blog_show'] = settingBlogShow;
    _data['setting_event_show'] = settingEventShow;
    _data['setting_coupon_show'] = settingCouponShow;
    _data['user_status'] = userStatus;
    _data['payment_status'] = paymentStatus;
    _data['user_followers'] = userFollowers;
    _data['user_slug'] = userSlug;
    _data['user_points'] = userPoints;
    _data['verification_code'] = verificationCode;
    _data['verification_link'] = verificationLink;
    _data['verification_status'] = verificationStatus;
    _data['user_clear_notification_cdt'] = userClearNotificationCdt;
    _data['user_cdt'] = userCdt;
    _data['w_n_services'] = wNServices;
    _data['p_age_range'] = pAgeRange;
    _data['n_p_managed'] = nPManaged;
    _data['service_location'] = serviceLocation;
    _data['participant_city'] = participantCity;
    _data['participant_state'] = participantState;
    _data['participant_country'] = participantCountry;
    _data['participant_zip_code'] = participantZipCode;
    _data['participant_latitude'] = participantLatitude;
    _data['participant_longitude'] = participantLongitude;
    _data['service_latitude'] = serviceLatitude;
    _data['service_longitude'] = serviceLongitude;
    _data['relation_w_p'] = relationWP;
    _data['p_first_name'] = pFirstName;
    _data['p_last_name'] = pLastName;
    _data['age_range'] = ageRange;
    _data['p_contact_method'] = pContactMethod;
    _data['p_identify_as'] = pIdentifyAs;
    _data['language_spoken'] = languageSpoken;
    _data['interpreter_r'] = interpreterR;
    _data['ndis_number'] = ndisNumber;
    _data['type_of_support_work'] = typeOfSupportWork;
    _data['ABN_number'] = ABNNumber;
    _data['how_did_you_hear_about_us'] = howDidYouHearAboutUs;
    _data['birth_year'] = birthYear;
    _data['age'] = age;
    _data['location'] = location;
    _data['happy_to_travel'] = happyToTravel;
    _data['language'] = language;
    _data['about_me'] = aboutMe;
    _data['availability_time'] = availabilityTime;
    _data['pet_friendly'] = petFriendly;
    _data['gender'] = gender;
    _data['position'] = position;
    _data['showering'] = showering;
    _data['qualifications'] = qualifications;
    _data['certificates'] = certificates;
    _data['skills'] = skills;
    _data['company_name'] = companyName;
    _data['work_from'] = workFrom;
    _data['work_to'] = workTo;
    _data['exp_year_month'] = expYearMonth;
    _data['support_prefer'] = supportPrefer;
    _data['ranking'] = ranking;
    _data['work_avail'] = workAvail;
    _data['mobile_verification_code'] = mobileVerificationCode;
    _data['access_methods'] = accessMethods;
    _data['age_groups'] = ageGroups;
    _data['service_locations'] = serviceLocations;
    _data['sc_business_address'] = scBusinessAddress;
    _data['sc_sl_latitude'] = scSlLatitude;
    _data['sc_sl_longitude'] = scSlLongitude;
    _data['sc_sl_city'] = scSlCity;
    _data['sc_sl_state'] = scSlState;
    _data['sc_sl_country'] = scSlCountry;
    _data['sc_sl_zip_code'] = scSlZipCode;
    _data['sc_business_website'] = scBusinessWebsite;
    _data['registration_no'] = registrationNo;
    _data['accredited_provider_stamp'] = accreditedProviderStamp;
    _data['provider_trading_name'] = providerTradingName;
    _data['registered_companys_name'] = registeredCompanysName;
    _data['business_contact_number'] = businessContactNumber;
    _data['business_email_address'] = businessEmailAddress;
    _data['ask_ques'] = askQues;
    _data['list_type'] = listType;
    _data['register_type'] = registerType;
    _data['category_id'] = categoryId;
    _data['sub_category_id'] = subCategoryId;
    _data['all_location'] = allLocation;
    return _data;
  }
}
