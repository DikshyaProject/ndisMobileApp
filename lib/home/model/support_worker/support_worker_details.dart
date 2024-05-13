//
// class SupportWorkerDetailsModel {
//   String? message;
//   int? status;
//   SupportWorkerDetailsData? data;
//
//   SupportWorkerDetailsModel({this.message, this.status, this.data});
//
//   SupportWorkerDetailsModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ? new SupportWorkerDetailsData.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class SupportWorkerDetailsData {
//   SwUserDetails? swUserDetails;
//
//   SupportWorkerDetailsData({this.swUserDetails});
//
//   SupportWorkerDetailsData.fromJson(Map<String, dynamic> json) {
//     swUserDetails = json['sw_user_details'] != null
//         ? new SwUserDetails.fromJson(json['sw_user_details'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.swUserDetails != null) {
//       data['sw_user_details'] = this.swUserDetails!.toJson();
//     }
//     return data;
//   }
// }
//
// class SwUserDetails {
//   String? userId;
//   String? userCode;
//   String? firstName;
//   String? lastName;
//   String? emailId;
//   String? mobileNumber;
//   String? australianRegions;
//   String? userAddress;
//   String? userCity;
//   String? userCountry;
//   String? userState;
//   String? userZipCode;
//   String? userLatitude;
//   String? userLongitude;
//   String? userContactName;
//   String? userContactEmail;
//   String? userContactMobile;
//   String? password;
//   String? dateOfBirth;
//   String? profileImage;
//   String? coverImage;
//   String? profileIdProof;
//   String? paypalEmailId;
//   String? userFacebook;
//   String? userTwitter;
//   String? userYoutube;
//   String? userWebsite;
//   String? registerMode;
//   String? userType;
//   String? userPlan;
//   String? settingReview;
//   String? settingShare;
//   String? settingProfileShow;
//   String? settingGuaranteeShow;
//   String? settingUserStatus;
//   String? settingListingShow;
//   String? settingJobShow;
//   String? settingExpertShow;
//   String? settingProductShow;
//   String? settingBlogShow;
//   String? settingEventShow;
//   String? settingCouponShow;
//   String? userStatus;
//   String? paymentStatus;
//   String? userFollowers;
//   String? userSlug;
//   String? userPoints;
//   String? verificationCode;
//   String? verificationLink;
//   String? verificationStatus;
//   String? userClearNotificationCdt;
//   String? userCdt;
//   String? wNServices;
//   String? pAgeRange;
//   String? nPManaged;
//   String? serviceLocation;
//   String? participantCity;
//   String? participantState;
//   String? participantCountry;
//   String? participantZipCode;
//   String? participantLatitude;
//   String? participantLongitude;
//   String? serviceLatitude;
//   String? serviceLongitude;
//   String? relationWP;
//   String? pFirstName;
//   String? pLastName;
//   String? ageRange;
//   String? pContactMethod;
//   String? pIdentifyAs;
//   String? languageSpoken;
//   String? interpreterR;
//   String? ndisNumber;
//   String? typeOfSupportWork;
//   String? aBNNumber;
//   String? howDidYouHearAboutUs;
//   String? birthYear;
//   String? age;
//   String? location;
//   String? happyToTravel;
//   String? language;
//   String? aboutMe;
//   AvailabilityTime? availabilityTime;
//   String? petFriendly;
//   String? gender;
//   List<Position>? position;
//   String? showering;
//   String? qualifications;
//   String? certificates;
//   String? skills;
//   String? companyName;
//   String? workFrom;
//   String? workTo;
//   String? expYearMonth;
//   String? supportPrefer;
//   String? ranking;
//   String? workAvail;
//   String? mobileVerificationCode;
//   String? accessMethods;
//   String? ageGroups;
//   String? serviceLocations;
//   String? scBusinessAddress;
//   String? scSlLatitude;
//   String? scSlLongitude;
//   String? scSlCity;
//   String? scSlState;
//   String? scSlCountry;
//   String? scSlZipCode;
//   String? scBusinessWebsite;
//   String? registrationNo;
//   String? accreditedProviderStamp;
//   String? providerTradingName;
//   String? registeredCompanysName;
//   String? businessContactNumber;
//   String? businessEmailAddress;
//   String? askQues;
//   String? listType;
//   String? registerType;
//   String? categoryId;
//   String? subCategoryId;
//   List<AllLocation>? allLocation;
//   QualificationData? qualificationData;
//   CertificateData? certificateData;
//   SkillData? skillData;
//   CategoryData? categoryData;
//   String? categoryName;
//
//   SwUserDetails(
//       {this.userId,
//         this.userCode,
//         this.firstName,
//         this.lastName,
//         this.emailId,
//         this.mobileNumber,
//         this.australianRegions,
//         this.userAddress,
//         this.userCity,
//         this.userCountry,
//         this.userState,
//         this.userZipCode,
//         this.userLatitude,
//         this.userLongitude,
//         this.userContactName,
//         this.userContactEmail,
//         this.userContactMobile,
//         this.password,
//         this.dateOfBirth,
//         this.profileImage,
//         this.coverImage,
//         this.profileIdProof,
//         this.paypalEmailId,
//         this.userFacebook,
//         this.userTwitter,
//         this.userYoutube,
//         this.userWebsite,
//         this.registerMode,
//         this.userType,
//         this.userPlan,
//         this.settingReview,
//         this.settingShare,
//         this.settingProfileShow,
//         this.settingGuaranteeShow,
//         this.settingUserStatus,
//         this.settingListingShow,
//         this.settingJobShow,
//         this.settingExpertShow,
//         this.settingProductShow,
//         this.settingBlogShow,
//         this.settingEventShow,
//         this.settingCouponShow,
//         this.userStatus,
//         this.paymentStatus,
//         this.userFollowers,
//         this.userSlug,
//         this.userPoints,
//         this.verificationCode,
//         this.verificationLink,
//         this.verificationStatus,
//         this.userClearNotificationCdt,
//         this.userCdt,
//         this.wNServices,
//         this.pAgeRange,
//         this.nPManaged,
//         this.serviceLocation,
//         this.participantCity,
//         this.participantState,
//         this.participantCountry,
//         this.participantZipCode,
//         this.participantLatitude,
//         this.participantLongitude,
//         this.serviceLatitude,
//         this.serviceLongitude,
//         this.relationWP,
//         this.pFirstName,
//         this.pLastName,
//         this.ageRange,
//         this.pContactMethod,
//         this.pIdentifyAs,
//         this.languageSpoken,
//         this.interpreterR,
//         this.ndisNumber,
//         this.typeOfSupportWork,
//         this.aBNNumber,
//         this.howDidYouHearAboutUs,
//         this.birthYear,
//         this.age,
//         this.location,
//         this.happyToTravel,
//         this.language,
//         this.aboutMe,
//         this.availabilityTime,
//         this.petFriendly,
//         this.gender,
//         this.position,
//         this.showering,
//         this.qualifications,
//         this.certificates,
//         this.skills,
//         this.companyName,
//         this.workFrom,
//         this.workTo,
//         this.expYearMonth,
//         this.supportPrefer,
//         this.ranking,
//         this.workAvail,
//         this.mobileVerificationCode,
//         this.accessMethods,
//         this.ageGroups,
//         this.serviceLocations,
//         this.scBusinessAddress,
//         this.scSlLatitude,
//         this.scSlLongitude,
//         this.scSlCity,
//         this.scSlState,
//         this.scSlCountry,
//         this.scSlZipCode,
//         this.scBusinessWebsite,
//         this.registrationNo,
//         this.accreditedProviderStamp,
//         this.providerTradingName,
//         this.registeredCompanysName,
//         this.businessContactNumber,
//         this.businessEmailAddress,
//         this.askQues,
//         this.listType,
//         this.registerType,
//         this.categoryId,
//         this.subCategoryId,
//         this.allLocation,
//         this.qualificationData,
//         this.certificateData,
//         this.skillData,
//         this.categoryData,
//         this.categoryName});
//
//   SwUserDetails.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     userCode = json['user_code'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     emailId = json['email_id'];
//     mobileNumber = json['mobile_number'];
//     australianRegions = json['australian_regions'];
//     userAddress = json['user_address'];
//     userCity = json['user_city'];
//     userCountry = json['user_country'];
//     userState = json['user_state'];
//     userZipCode = json['user_zip_code'];
//     userLatitude = json['user_latitude'];
//     userLongitude = json['user_longitude'];
//     userContactName = json['user_contact_name'];
//     userContactEmail = json['user_contact_email'];
//     userContactMobile = json['user_contact_mobile'];
//     password = json['password'];
//     dateOfBirth = json['date_of_birth'];
//     profileImage = json['profile_image'];
//     coverImage = json['cover_image'];
//     profileIdProof = json['profile_id_proof'];
//     paypalEmailId = json['paypal_email_id'];
//     userFacebook = json['user_facebook'];
//     userTwitter = json['user_twitter'];
//     userYoutube = json['user_youtube'];
//     userWebsite = json['user_website'];
//     registerMode = json['register_mode'];
//     userType = json['user_type'];
//     userPlan = json['user_plan'];
//     settingReview = json['setting_review'];
//     settingShare = json['setting_share'];
//     settingProfileShow = json['setting_profile_show'];
//     settingGuaranteeShow = json['setting_guarantee_show'];
//     settingUserStatus = json['setting_user_status'];
//     settingListingShow = json['setting_listing_show'];
//     settingJobShow = json['setting_job_show'];
//     settingExpertShow = json['setting_expert_show'];
//     settingProductShow = json['setting_product_show'];
//     settingBlogShow = json['setting_blog_show'];
//     settingEventShow = json['setting_event_show'];
//     settingCouponShow = json['setting_coupon_show'];
//     userStatus = json['user_status'];
//     paymentStatus = json['payment_status'];
//     userFollowers = json['user_followers'];
//     userSlug = json['user_slug'];
//     userPoints = json['user_points'];
//     verificationCode = json['verification_code'];
//     verificationLink = json['verification_link'];
//     verificationStatus = json['verification_status'];
//     userClearNotificationCdt = json['user_clear_notification_cdt'];
//     userCdt = json['user_cdt'];
//     wNServices = json['w_n_services'];
//     pAgeRange = json['p_age_range'];
//     nPManaged = json['n_p_managed'];
//     serviceLocation = json['service_location'];
//     participantCity = json['participant_city'];
//     participantState = json['participant_state'];
//     participantCountry = json['participant_country'];
//     participantZipCode = json['participant_zip_code'];
//     participantLatitude = json['participant_latitude'];
//     participantLongitude = json['participant_longitude'];
//     serviceLatitude = json['service_latitude'];
//     serviceLongitude = json['service_longitude'];
//     relationWP = json['relation_w_p'];
//     pFirstName = json['p_first_name'];
//     pLastName = json['p_last_name'];
//     ageRange = json['age_range'];
//     pContactMethod = json['p_contact_method'];
//     pIdentifyAs = json['p_identify_as'];
//     languageSpoken = json['language_spoken'];
//     interpreterR = json['interpreter_r'];
//     ndisNumber = json['ndis_number'];
//     typeOfSupportWork = json['type_of_support_work'];
//     aBNNumber = json['ABN_number'];
//     howDidYouHearAboutUs = json['how_did_you_hear_about_us'];
//     birthYear = json['birth_year'];
//     age = json['age'];
//     location = json['location'];
//     happyToTravel = json['happy_to_travel'];
//     language = json['language'];
//     aboutMe = json['about_me'];
//     availabilityTime = json['availability_time'] != null
//         ? new AvailabilityTime.fromJson(json['availability_time'])
//         : null;
//     petFriendly = json['pet_friendly'];
//     gender = json['gender'];
//     if (json['position'] != null) {
//       position = <Position>[];
//       json['position'].forEach((v) {
//         position!.add(new Position.fromJson(v));
//       });
//     }
//     showering = json['showering'];
//     qualifications = json['qualifications'];
//     certificates = json['certificates'];
//     skills = json['skills'];
//     companyName = json['company_name'];
//     workFrom = json['work_from'];
//     workTo = json['work_to'];
//     expYearMonth = json['exp_year_month'];
//     supportPrefer = json['support_prefer'];
//     ranking = json['ranking'];
//     workAvail = json['work_avail'];
//     mobileVerificationCode = json['mobile_verification_code'];
//     accessMethods = json['access_methods'];
//     ageGroups = json['age_groups'];
//     serviceLocations = json['service_locations'];
//     scBusinessAddress = json['sc_business_address'];
//     scSlLatitude = json['sc_sl_latitude'];
//     scSlLongitude = json['sc_sl_longitude'];
//     scSlCity = json['sc_sl_city'];
//     scSlState = json['sc_sl_state'];
//     scSlCountry = json['sc_sl_country'];
//     scSlZipCode = json['sc_sl_zip_code'];
//     scBusinessWebsite = json['sc_business_website'];
//     registrationNo = json['registration_no'];
//     accreditedProviderStamp = json['accredited_provider_stamp'];
//     providerTradingName = json['provider_trading_name'];
//     registeredCompanysName = json['registered_companys_name'];
//     businessContactNumber = json['business_contact_number'];
//     businessEmailAddress = json['business_email_address'];
//     askQues = json['ask_ques'];
//     listType = json['list_type'];
//     registerType = json['register_type'];
//     categoryId = json['category_id'];
//     subCategoryId = json['sub_category_id'];
//     if (json['all_location'] != null) {
//       allLocation = <AllLocation>[];
//       json['all_location'].forEach((v) {
//         allLocation!.add(new AllLocation.fromJson(v));
//       });
//     }
//     qualificationData = json['qualification_data'] != null
//         ? new QualificationData.fromJson(json['qualification_data'])
//         : null;
//     certificateData = json['certificate_data'] != null
//         ? new CertificateData.fromJson(json['certificate_data'])
//         : null;
//     skillData = json['skill_data'] != null
//         ? new SkillData.fromJson(json['skill_data'])
//         : null;
//     categoryData = json['category_data'] != null
//         ? new CategoryData.fromJson(json['category_data'])
//         : null;
//     categoryName = json['category_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['user_code'] = this.userCode;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['email_id'] = this.emailId;
//     data['mobile_number'] = this.mobileNumber;
//     data['australian_regions'] = this.australianRegions;
//     data['user_address'] = this.userAddress;
//     data['user_city'] = this.userCity;
//     data['user_country'] = this.userCountry;
//     data['user_state'] = this.userState;
//     data['user_zip_code'] = this.userZipCode;
//     data['user_latitude'] = this.userLatitude;
//     data['user_longitude'] = this.userLongitude;
//     data['user_contact_name'] = this.userContactName;
//     data['user_contact_email'] = this.userContactEmail;
//     data['user_contact_mobile'] = this.userContactMobile;
//     data['password'] = this.password;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['profile_image'] = this.profileImage;
//     data['cover_image'] = this.coverImage;
//     data['profile_id_proof'] = this.profileIdProof;
//     data['paypal_email_id'] = this.paypalEmailId;
//     data['user_facebook'] = this.userFacebook;
//     data['user_twitter'] = this.userTwitter;
//     data['user_youtube'] = this.userYoutube;
//     data['user_website'] = this.userWebsite;
//     data['register_mode'] = this.registerMode;
//     data['user_type'] = this.userType;
//     data['user_plan'] = this.userPlan;
//     data['setting_review'] = this.settingReview;
//     data['setting_share'] = this.settingShare;
//     data['setting_profile_show'] = this.settingProfileShow;
//     data['setting_guarantee_show'] = this.settingGuaranteeShow;
//     data['setting_user_status'] = this.settingUserStatus;
//     data['setting_listing_show'] = this.settingListingShow;
//     data['setting_job_show'] = this.settingJobShow;
//     data['setting_expert_show'] = this.settingExpertShow;
//     data['setting_product_show'] = this.settingProductShow;
//     data['setting_blog_show'] = this.settingBlogShow;
//     data['setting_event_show'] = this.settingEventShow;
//     data['setting_coupon_show'] = this.settingCouponShow;
//     data['user_status'] = this.userStatus;
//     data['payment_status'] = this.paymentStatus;
//     data['user_followers'] = this.userFollowers;
//     data['user_slug'] = this.userSlug;
//     data['user_points'] = this.userPoints;
//     data['verification_code'] = this.verificationCode;
//     data['verification_link'] = this.verificationLink;
//     data['verification_status'] = this.verificationStatus;
//     data['user_clear_notification_cdt'] = this.userClearNotificationCdt;
//     data['user_cdt'] = this.userCdt;
//     data['w_n_services'] = this.wNServices;
//     data['p_age_range'] = this.pAgeRange;
//     data['n_p_managed'] = this.nPManaged;
//     data['service_location'] = this.serviceLocation;
//     data['participant_city'] = this.participantCity;
//     data['participant_state'] = this.participantState;
//     data['participant_country'] = this.participantCountry;
//     data['participant_zip_code'] = this.participantZipCode;
//     data['participant_latitude'] = this.participantLatitude;
//     data['participant_longitude'] = this.participantLongitude;
//     data['service_latitude'] = this.serviceLatitude;
//     data['service_longitude'] = this.serviceLongitude;
//     data['relation_w_p'] = this.relationWP;
//     data['p_first_name'] = this.pFirstName;
//     data['p_last_name'] = this.pLastName;
//     data['age_range'] = this.ageRange;
//     data['p_contact_method'] = this.pContactMethod;
//     data['p_identify_as'] = this.pIdentifyAs;
//     data['language_spoken'] = this.languageSpoken;
//     data['interpreter_r'] = this.interpreterR;
//     data['ndis_number'] = this.ndisNumber;
//     data['type_of_support_work'] = this.typeOfSupportWork;
//     data['ABN_number'] = this.aBNNumber;
//     data['how_did_you_hear_about_us'] = this.howDidYouHearAboutUs;
//     data['birth_year'] = this.birthYear;
//     data['age'] = this.age;
//     data['location'] = this.location;
//     data['happy_to_travel'] = this.happyToTravel;
//     data['language'] = this.language;
//     data['about_me'] = this.aboutMe;
//     if (this.availabilityTime != null) {
//       data['availability_time'] = this.availabilityTime!.toJson();
//     }
//     data['pet_friendly'] = this.petFriendly;
//     data['gender'] = this.gender;
//     if (this.position != null) {
//       data['position'] = this.position!.map((v) => v.toJson()).toList();
//     }
//     data['showering'] = this.showering;
//     data['qualifications'] = this.qualifications;
//     data['certificates'] = this.certificates;
//     data['skills'] = this.skills;
//     data['company_name'] = this.companyName;
//     data['work_from'] = this.workFrom;
//     data['work_to'] = this.workTo;
//     data['exp_year_month'] = this.expYearMonth;
//     data['support_prefer'] = this.supportPrefer;
//     data['ranking'] = this.ranking;
//     data['work_avail'] = this.workAvail;
//     data['mobile_verification_code'] = this.mobileVerificationCode;
//     data['access_methods'] = this.accessMethods;
//     data['age_groups'] = this.ageGroups;
//     data['service_locations'] = this.serviceLocations;
//     data['sc_business_address'] = this.scBusinessAddress;
//     data['sc_sl_latitude'] = this.scSlLatitude;
//     data['sc_sl_longitude'] = this.scSlLongitude;
//     data['sc_sl_city'] = this.scSlCity;
//     data['sc_sl_state'] = this.scSlState;
//     data['sc_sl_country'] = this.scSlCountry;
//     data['sc_sl_zip_code'] = this.scSlZipCode;
//     data['sc_business_website'] = this.scBusinessWebsite;
//     data['registration_no'] = this.registrationNo;
//     data['accredited_provider_stamp'] = this.accreditedProviderStamp;
//     data['provider_trading_name'] = this.providerTradingName;
//     data['registered_companys_name'] = this.registeredCompanysName;
//     data['business_contact_number'] = this.businessContactNumber;
//     data['business_email_address'] = this.businessEmailAddress;
//     data['ask_ques'] = this.askQues;
//     data['list_type'] = this.listType;
//     data['register_type'] = this.registerType;
//     data['category_id'] = this.categoryId;
//     data['sub_category_id'] = this.subCategoryId;
//     if (this.allLocation != null) {
//       data['all_location'] = this.allLocation!.map((v) => v.toJson()).toList();
//     }
//     if (this.qualificationData != null) {
//       data['qualification_data'] = this.qualificationData!.toJson();
//     }
//     if (this.certificateData != null) {
//       data['certificate_data'] = this.certificateData!.toJson();
//     }
//     if (this.skillData != null) {
//       data['skill_data'] = this.skillData!.toJson();
//     }
//     if (this.categoryData != null) {
//       data['category_data'] = this.categoryData!.toJson();
//     }
//     data['category_name'] = this.categoryName;
//     return data;
//   }
// }
//
// class AvailabilityTime {
//   Monday? monday;
//
//   AvailabilityTime({this.monday});
//
//   AvailabilityTime.fromJson(Map<String, dynamic> json) {
//     monday =
//     json['Monday'] != null ? new Monday.fromJson(json['Monday']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.monday != null) {
//       data['Monday'] = this.monday!.toJson();
//     }
//     return data;
//   }
// }
//
// class Monday {
//   String? day;
//   List<TimeData>? timedata;
//
//   Monday({this.day, this.timedata});
//
//   Monday.fromJson(Map<String, dynamic> json) {
//     day = json['day'];
//     if (json['data'] != null) {
//       timedata = <TimeData>[];
//       json['data'].forEach((v) {
//         timedata!.add(new TimeData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['day'] = this.day;
//     if (this.timedata != null) {
//       data['data'] = this.timedata!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class TimeData {
//   String? from;
//   String? to;
//
//   TimeData({this.from, this.to});
//
//   TimeData.fromJson(Map<String, dynamic> json) {
//     from = json['from'];
//     to = json['to'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['from'] = this.from;
//     data['to'] = this.to;
//     return data;
//   }
// }
//
// class Position {
//   String? position;
//   String? companyName;
//   String? workFrom;
//   String? workTo;
//   String? expYearMonth;
//
//   Position(
//       {this.position,
//         this.companyName,
//         this.workFrom,
//         this.workTo,
//         this.expYearMonth});
//
//   Position.fromJson(Map<String, dynamic> json) {
//     position = json['position'];
//     companyName = json['company_name'];
//     workFrom = json['work_from'];
//     workTo = json['work_to'];
//     expYearMonth = json['exp_year_month'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['position'] = this.position;
//     data['company_name'] = this.companyName;
//     data['work_from'] = this.workFrom;
//     data['work_to'] = this.workTo;
//     data['exp_year_month'] = this.expYearMonth;
//     return data;
//   }
// }
//
// class AllLocation {
//   String? location;
//   String? locationCity;
//   String? locationState;
//   String? locationCountry;
//   String? locationZipCode;
//   String? locationLatitude;
//   String? locationLongitude;
//
//   AllLocation(
//       {this.location,
//         this.locationCity,
//         this.locationState,
//         this.locationCountry,
//         this.locationZipCode,
//         this.locationLatitude,
//         this.locationLongitude});
//
//   AllLocation.fromJson(Map<String, dynamic> json) {
//     location = json['location'];
//     locationCity = json['location_city'];
//     locationState = json['location_state'];
//     locationCountry = json['location_country'];
//     locationZipCode = json['location_zip_code'];
//     locationLatitude = json['location_latitude'];
//     locationLongitude = json['location_longitude'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['location'] = this.location;
//     data['location_city'] = this.locationCity;
//     data['location_state'] = this.locationState;
//     data['location_country'] = this.locationCountry;
//     data['location_zip_code'] = this.locationZipCode;
//     data['location_latitude'] = this.locationLatitude;
//     data['location_longitude'] = this.locationLongitude;
//     return data;
//   }
// }
//
// class QualificationData {
//   String? qualificationsId;
//   String? qualificationsName;
//
//   QualificationData({this.qualificationsId, this.qualificationsName});
//
//   QualificationData.fromJson(Map<String, dynamic> json) {
//     qualificationsId = json['qualifications_id'];
//     qualificationsName = json['qualifications_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['qualifications_id'] = this.qualificationsId;
//     data['qualifications_name'] = this.qualificationsName;
//     return data;
//   }
// }
//
// class CertificateData {
//   String? certificateId;
//   String? certificateName;
//
//   CertificateData({this.certificateId, this.certificateName});
//
//   CertificateData.fromJson(Map<String, dynamic> json) {
//     certificateId = json['certificate_id'];
//     certificateName = json['certificate_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['certificate_id'] = this.certificateId;
//     data['certificate_name'] = this.certificateName;
//     return data;
//   }
// }
//
// class SkillData {
//   String? skillId;
//   String? skillName;
//
//   SkillData({this.skillId, this.skillName});
//
//   SkillData.fromJson(Map<String, dynamic> json) {
//     skillId = json['skill_id'];
//     skillName = json['skill_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['skill_id'] = this.skillId;
//     data['skill_name'] = this.skillName;
//     return data;
//   }
// }
//
// class CategoryData {
//   String? suppOfferId;
//   String? offerTitle;
//   String? offerName;
//
//   CategoryData({this.suppOfferId, this.offerTitle, this.offerName});
//
//   CategoryData.fromJson(Map<String, dynamic> json) {
//     suppOfferId = json['supp_offer_id'];
//     offerTitle = json['offer_title'];
//     offerName = json['offer_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['supp_offer_id'] = this.suppOfferId;
//     data['offer_title'] = this.offerTitle;
//     data['offer_name'] = this.offerName;
//     return data;
//   }
// }
///---------------------------------------------
// class SupportWorkerDetailsModel {
//   String? message;
//   int? status;
//   SupportWorkerDetailsData? data;
//
//   SupportWorkerDetailsModel({this.message, this.status, this.data});
//
//   SupportWorkerDetailsModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ? new SupportWorkerDetailsData.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class SupportWorkerDetailsData {
//   SwUserDetails? swUserDetails;
//
//   SupportWorkerDetailsData({this.swUserDetails});
//
//   SupportWorkerDetailsData.fromJson(Map<String, dynamic> json) {
//     swUserDetails = json['sw_user_details'] != null
//         ? new SwUserDetails.fromJson(json['sw_user_details'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.swUserDetails != null) {
//       data['sw_user_details'] = this.swUserDetails!.toJson();
//     }
//     return data;
//   }
// }
//
// class SwUserDetails {
//   String? userId;
//   String? userCode;
//   String? firstName;
//   String? lastName;
//   String? emailId;
//   String? mobileNumber;
//   String? australianRegions;
//   String? userAddress;
//   String? userCity;
//   String? userCountry;
//   String? userState;
//   String? userZipCode;
//   String? userLatitude;
//   String? userLongitude;
//   String? userContactName;
//   String? userContactEmail;
//   String? userContactMobile;
//   String? password;
//   String? dateOfBirth;
//   String? profileImage;
//   String? coverImage;
//   String? profileIdProof;
//   String? paypalEmailId;
//   String? userFacebook;
//   String? userTwitter;
//   String? userYoutube;
//   String? userWebsite;
//   String? registerMode;
//   String? userType;
//   String? userPlan;
//   String? settingReview;
//   String? settingShare;
//   String? settingProfileShow;
//   String? settingGuaranteeShow;
//   String? settingUserStatus;
//   String? settingListingShow;
//   String? settingJobShow;
//   String? settingExpertShow;
//   String? settingProductShow;
//   String? settingBlogShow;
//   String? settingEventShow;
//   String? settingCouponShow;
//   String? userStatus;
//   String? paymentStatus;
//   String? userFollowers;
//   String? userSlug;
//   String? userPoints;
//   String? verificationCode;
//   String? verificationLink;
//   String? verificationStatus;
//   String? userClearNotificationCdt;
//   String? userCdt;
//   String? wNServices;
//   String? pAgeRange;
//   String? nPManaged;
//   String? serviceLocation;
//   String? participantCity;
//   String? participantState;
//   String? participantCountry;
//   String? participantZipCode;
//   String? participantLatitude;
//   String? participantLongitude;
//   String? serviceLatitude;
//   String? serviceLongitude;
//   String? relationWP;
//   String? pFirstName;
//   String? pLastName;
//   String? ageRange;
//   String? pContactMethod;
//   String? pIdentifyAs;
//   String? languageSpoken;
//   String? interpreterR;
//   String? ndisNumber;
//   String? typeOfSupportWork;
//   String? aBNNumber;
//   String? howDidYouHearAboutUs;
//   String? birthYear;
//   String? age;
//   String? location;
//   String? happyToTravel;
//   String? language;
//   String? aboutMe;
//   AvailabilityTime? availabilityTime;
//   String? petFriendly;
//   String? gender;
//   List<Position>? position;
//   String? showering;
//   String? qualifications;
//   String? certificates;
//   String? skills;
//   String? companyName;
//   String? workFrom;
//   String? workTo;
//   String? expYearMonth;
//   String? supportPrefer;
//   String? ranking;
//   String? workAvail;
//   String? mobileVerificationCode;
//   String? accessMethods;
//   String? ageGroups;
//   String? serviceLocations;
//   String? scBusinessAddress;
//   String? scSlLatitude;
//   String? scSlLongitude;
//   String? scSlCity;
//   String? scSlState;
//   String? scSlCountry;
//   String? scSlZipCode;
//   String? scBusinessWebsite;
//   String? registrationNo;
//   String? accreditedProviderStamp;
//   String? providerTradingName;
//   String? registeredCompanysName;
//   String? businessContactNumber;
//   String? businessEmailAddress;
//   String? askQues;
//   String? listType;
//   String? registerType;
//   String? categoryId;
//   String? subCategoryId;
//   List<AllLocation>? allLocation;
//   List<QualificationData>? qualificationData;
//   List<CertificateData>? certificateData;
//   List<SkillData>? skillData;
//   List<CategoryData>? categoryData;
//   String? categoryName;
//
//   SwUserDetails(
//       {this.userId,
//         this.userCode,
//         this.firstName,
//         this.lastName,
//         this.emailId,
//         this.mobileNumber,
//         this.australianRegions,
//         this.userAddress,
//         this.userCity,
//         this.userCountry,
//         this.userState,
//         this.userZipCode,
//         this.userLatitude,
//         this.userLongitude,
//         this.userContactName,
//         this.userContactEmail,
//         this.userContactMobile,
//         this.password,
//         this.dateOfBirth,
//         this.profileImage,
//         this.coverImage,
//         this.profileIdProof,
//         this.paypalEmailId,
//         this.userFacebook,
//         this.userTwitter,
//         this.userYoutube,
//         this.userWebsite,
//         this.registerMode,
//         this.userType,
//         this.userPlan,
//         this.settingReview,
//         this.settingShare,
//         this.settingProfileShow,
//         this.settingGuaranteeShow,
//         this.settingUserStatus,
//         this.settingListingShow,
//         this.settingJobShow,
//         this.settingExpertShow,
//         this.settingProductShow,
//         this.settingBlogShow,
//         this.settingEventShow,
//         this.settingCouponShow,
//         this.userStatus,
//         this.paymentStatus,
//         this.userFollowers,
//         this.userSlug,
//         this.userPoints,
//         this.verificationCode,
//         this.verificationLink,
//         this.verificationStatus,
//         this.userClearNotificationCdt,
//         this.userCdt,
//         this.wNServices,
//         this.pAgeRange,
//         this.nPManaged,
//         this.serviceLocation,
//         this.participantCity,
//         this.participantState,
//         this.participantCountry,
//         this.participantZipCode,
//         this.participantLatitude,
//         this.participantLongitude,
//         this.serviceLatitude,
//         this.serviceLongitude,
//         this.relationWP,
//         this.pFirstName,
//         this.pLastName,
//         this.ageRange,
//         this.pContactMethod,
//         this.pIdentifyAs,
//         this.languageSpoken,
//         this.interpreterR,
//         this.ndisNumber,
//         this.typeOfSupportWork,
//         this.aBNNumber,
//         this.howDidYouHearAboutUs,
//         this.birthYear,
//         this.age,
//         this.location,
//         this.happyToTravel,
//         this.language,
//         this.aboutMe,
//         this.availabilityTime,
//         this.petFriendly,
//         this.gender,
//         this.position,
//         this.showering,
//         this.qualifications,
//         this.certificates,
//         this.skills,
//         this.companyName,
//         this.workFrom,
//         this.workTo,
//         this.expYearMonth,
//         this.supportPrefer,
//         this.ranking,
//         this.workAvail,
//         this.mobileVerificationCode,
//         this.accessMethods,
//         this.ageGroups,
//         this.serviceLocations,
//         this.scBusinessAddress,
//         this.scSlLatitude,
//         this.scSlLongitude,
//         this.scSlCity,
//         this.scSlState,
//         this.scSlCountry,
//         this.scSlZipCode,
//         this.scBusinessWebsite,
//         this.registrationNo,
//         this.accreditedProviderStamp,
//         this.providerTradingName,
//         this.registeredCompanysName,
//         this.businessContactNumber,
//         this.businessEmailAddress,
//         this.askQues,
//         this.listType,
//         this.registerType,
//         this.categoryId,
//         this.subCategoryId,
//         this.allLocation,
//         this.qualificationData,
//         this.certificateData,
//         this.skillData,
//         this.categoryData,
//         this.categoryName});
//
//   SwUserDetails.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     userCode = json['user_code'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     emailId = json['email_id'];
//     mobileNumber = json['mobile_number'];
//     australianRegions = json['australian_regions'];
//     userAddress = json['user_address'];
//     userCity = json['user_city'];
//     userCountry = json['user_country'];
//     userState = json['user_state'];
//     userZipCode = json['user_zip_code'];
//     userLatitude = json['user_latitude'];
//     userLongitude = json['user_longitude'];
//     userContactName = json['user_contact_name'];
//     userContactEmail = json['user_contact_email'];
//     userContactMobile = json['user_contact_mobile'];
//     password = json['password'];
//     dateOfBirth = json['date_of_birth'];
//     profileImage = json['profile_image'];
//     coverImage = json['cover_image'];
//     profileIdProof = json['profile_id_proof'];
//     paypalEmailId = json['paypal_email_id'];
//     userFacebook = json['user_facebook'];
//     userTwitter = json['user_twitter'];
//     userYoutube = json['user_youtube'];
//     userWebsite = json['user_website'];
//     registerMode = json['register_mode'];
//     userType = json['user_type'];
//     userPlan = json['user_plan'];
//     settingReview = json['setting_review'];
//     settingShare = json['setting_share'];
//     settingProfileShow = json['setting_profile_show'];
//     settingGuaranteeShow = json['setting_guarantee_show'];
//     settingUserStatus = json['setting_user_status'];
//     settingListingShow = json['setting_listing_show'];
//     settingJobShow = json['setting_job_show'];
//     settingExpertShow = json['setting_expert_show'];
//     settingProductShow = json['setting_product_show'];
//     settingBlogShow = json['setting_blog_show'];
//     settingEventShow = json['setting_event_show'];
//     settingCouponShow = json['setting_coupon_show'];
//     userStatus = json['user_status'];
//     paymentStatus = json['payment_status'];
//     userFollowers = json['user_followers'];
//     userSlug = json['user_slug'];
//     userPoints = json['user_points'];
//     verificationCode = json['verification_code'];
//     verificationLink = json['verification_link'];
//     verificationStatus = json['verification_status'];
//     userClearNotificationCdt = json['user_clear_notification_cdt'];
//     userCdt = json['user_cdt'];
//     wNServices = json['w_n_services'];
//     pAgeRange = json['p_age_range'];
//     nPManaged = json['n_p_managed'];
//     serviceLocation = json['service_location'];
//     participantCity = json['participant_city'];
//     participantState = json['participant_state'];
//     participantCountry = json['participant_country'];
//     participantZipCode = json['participant_zip_code'];
//     participantLatitude = json['participant_latitude'];
//     participantLongitude = json['participant_longitude'];
//     serviceLatitude = json['service_latitude'];
//     serviceLongitude = json['service_longitude'];
//     relationWP = json['relation_w_p'];
//     pFirstName = json['p_first_name'];
//     pLastName = json['p_last_name'];
//     ageRange = json['age_range'];
//     pContactMethod = json['p_contact_method'];
//     pIdentifyAs = json['p_identify_as'];
//     languageSpoken = json['language_spoken'];
//     interpreterR = json['interpreter_r'];
//     ndisNumber = json['ndis_number'];
//     typeOfSupportWork = json['type_of_support_work'];
//     aBNNumber = json['ABN_number'];
//     howDidYouHearAboutUs = json['how_did_you_hear_about_us'];
//     birthYear = json['birth_year'];
//     age = json['age'];
//     location = json['location'];
//     happyToTravel = json['happy_to_travel'];
//     language = json['language'];
//     aboutMe = json['about_me'];
//     availabilityTime = json['availability_time'] != null
//         ? new AvailabilityTime.fromJson(json['availability_time'])
//         : null;
//     petFriendly = json['pet_friendly'];
//     gender = json['gender'];
//     if (json['position'] != null) {
//       position = <Position>[];
//       json['position'].forEach((v) {
//         position!.add(new Position.fromJson(v));
//       });
//     }
//     showering = json['showering'];
//     qualifications = json['qualifications'];
//     certificates = json['certificates'];
//     skills = json['skills'];
//     companyName = json['company_name'];
//     workFrom = json['work_from'];
//     workTo = json['work_to'];
//     expYearMonth = json['exp_year_month'];
//     supportPrefer = json['support_prefer'];
//     ranking = json['ranking'];
//     workAvail = json['work_avail'];
//     mobileVerificationCode = json['mobile_verification_code'];
//     accessMethods = json['access_methods'];
//     ageGroups = json['age_groups'];
//     serviceLocations = json['service_locations'];
//     scBusinessAddress = json['sc_business_address'];
//     scSlLatitude = json['sc_sl_latitude'];
//     scSlLongitude = json['sc_sl_longitude'];
//     scSlCity = json['sc_sl_city'];
//     scSlState = json['sc_sl_state'];
//     scSlCountry = json['sc_sl_country'];
//     scSlZipCode = json['sc_sl_zip_code'];
//     scBusinessWebsite = json['sc_business_website'];
//     registrationNo = json['registration_no'];
//     accreditedProviderStamp = json['accredited_provider_stamp'];
//     providerTradingName = json['provider_trading_name'];
//     registeredCompanysName = json['registered_companys_name'];
//     businessContactNumber = json['business_contact_number'];
//     businessEmailAddress = json['business_email_address'];
//     askQues = json['ask_ques'];
//     listType = json['list_type'];
//     registerType = json['register_type'];
//     categoryId = json['category_id'];
//     subCategoryId = json['sub_category_id'];
//     if (json['all_location'] != null) {
//       allLocation = <AllLocation>[];
//       json['all_location'].forEach((v) {
//         allLocation!.add(new AllLocation.fromJson(v));
//       });
//     }
//     if (json['qualification_data'] != null) {
//       qualificationData = <QualificationData>[];
//       json['qualification_data'].forEach((v) {
//         qualificationData!.add(new QualificationData.fromJson(v));
//       });
//     }
//     if (json['certificate_data'] != null) {
//       certificateData = <CertificateData>[];
//       json['certificate_data'].forEach((v) {
//         certificateData!.add(new CertificateData.fromJson(v));
//       });
//     }
//     if (json['skill_data'] != null) {
//       skillData = <SkillData>[];
//       json['skill_data'].forEach((v) {
//         skillData!.add(new SkillData.fromJson(v));
//       });
//     }
//     if (json['category_data'] != null) {
//       categoryData = <CategoryData>[];
//       json['category_data'].forEach((v) {
//         categoryData!.add(new CategoryData.fromJson(v));
//       });
//     }
//     categoryName = json['category_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['user_code'] = this.userCode;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['email_id'] = this.emailId;
//     data['mobile_number'] = this.mobileNumber;
//     data['australian_regions'] = this.australianRegions;
//     data['user_address'] = this.userAddress;
//     data['user_city'] = this.userCity;
//     data['user_country'] = this.userCountry;
//     data['user_state'] = this.userState;
//     data['user_zip_code'] = this.userZipCode;
//     data['user_latitude'] = this.userLatitude;
//     data['user_longitude'] = this.userLongitude;
//     data['user_contact_name'] = this.userContactName;
//     data['user_contact_email'] = this.userContactEmail;
//     data['user_contact_mobile'] = this.userContactMobile;
//     data['password'] = this.password;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['profile_image'] = this.profileImage;
//     data['cover_image'] = this.coverImage;
//     data['profile_id_proof'] = this.profileIdProof;
//     data['paypal_email_id'] = this.paypalEmailId;
//     data['user_facebook'] = this.userFacebook;
//     data['user_twitter'] = this.userTwitter;
//     data['user_youtube'] = this.userYoutube;
//     data['user_website'] = this.userWebsite;
//     data['register_mode'] = this.registerMode;
//     data['user_type'] = this.userType;
//     data['user_plan'] = this.userPlan;
//     data['setting_review'] = this.settingReview;
//     data['setting_share'] = this.settingShare;
//     data['setting_profile_show'] = this.settingProfileShow;
//     data['setting_guarantee_show'] = this.settingGuaranteeShow;
//     data['setting_user_status'] = this.settingUserStatus;
//     data['setting_listing_show'] = this.settingListingShow;
//     data['setting_job_show'] = this.settingJobShow;
//     data['setting_expert_show'] = this.settingExpertShow;
//     data['setting_product_show'] = this.settingProductShow;
//     data['setting_blog_show'] = this.settingBlogShow;
//     data['setting_event_show'] = this.settingEventShow;
//     data['setting_coupon_show'] = this.settingCouponShow;
//     data['user_status'] = this.userStatus;
//     data['payment_status'] = this.paymentStatus;
//     data['user_followers'] = this.userFollowers;
//     data['user_slug'] = this.userSlug;
//     data['user_points'] = this.userPoints;
//     data['verification_code'] = this.verificationCode;
//     data['verification_link'] = this.verificationLink;
//     data['verification_status'] = this.verificationStatus;
//     data['user_clear_notification_cdt'] = this.userClearNotificationCdt;
//     data['user_cdt'] = this.userCdt;
//     data['w_n_services'] = this.wNServices;
//     data['p_age_range'] = this.pAgeRange;
//     data['n_p_managed'] = this.nPManaged;
//     data['service_location'] = this.serviceLocation;
//     data['participant_city'] = this.participantCity;
//     data['participant_state'] = this.participantState;
//     data['participant_country'] = this.participantCountry;
//     data['participant_zip_code'] = this.participantZipCode;
//     data['participant_latitude'] = this.participantLatitude;
//     data['participant_longitude'] = this.participantLongitude;
//     data['service_latitude'] = this.serviceLatitude;
//     data['service_longitude'] = this.serviceLongitude;
//     data['relation_w_p'] = this.relationWP;
//     data['p_first_name'] = this.pFirstName;
//     data['p_last_name'] = this.pLastName;
//     data['age_range'] = this.ageRange;
//     data['p_contact_method'] = this.pContactMethod;
//     data['p_identify_as'] = this.pIdentifyAs;
//     data['language_spoken'] = this.languageSpoken;
//     data['interpreter_r'] = this.interpreterR;
//     data['ndis_number'] = this.ndisNumber;
//     data['type_of_support_work'] = this.typeOfSupportWork;
//     data['ABN_number'] = this.aBNNumber;
//     data['how_did_you_hear_about_us'] = this.howDidYouHearAboutUs;
//     data['birth_year'] = this.birthYear;
//     data['age'] = this.age;
//     data['location'] = this.location;
//     data['happy_to_travel'] = this.happyToTravel;
//     data['language'] = this.language;
//     data['about_me'] = this.aboutMe;
//     if (this.availabilityTime != null) {
//       data['availability_time'] = this.availabilityTime!.toJson();
//     }
//     data['pet_friendly'] = this.petFriendly;
//     data['gender'] = this.gender;
//     if (this.position != null) {
//       data['position'] = this.position!.map((v) => v.toJson()).toList();
//     }
//     data['showering'] = this.showering;
//     data['qualifications'] = this.qualifications;
//     data['certificates'] = this.certificates;
//     data['skills'] = this.skills;
//     data['company_name'] = this.companyName;
//     data['work_from'] = this.workFrom;
//     data['work_to'] = this.workTo;
//     data['exp_year_month'] = this.expYearMonth;
//     data['support_prefer'] = this.supportPrefer;
//     data['ranking'] = this.ranking;
//     data['work_avail'] = this.workAvail;
//     data['mobile_verification_code'] = this.mobileVerificationCode;
//     data['access_methods'] = this.accessMethods;
//     data['age_groups'] = this.ageGroups;
//     data['service_locations'] = this.serviceLocations;
//     data['sc_business_address'] = this.scBusinessAddress;
//     data['sc_sl_latitude'] = this.scSlLatitude;
//     data['sc_sl_longitude'] = this.scSlLongitude;
//     data['sc_sl_city'] = this.scSlCity;
//     data['sc_sl_state'] = this.scSlState;
//     data['sc_sl_country'] = this.scSlCountry;
//     data['sc_sl_zip_code'] = this.scSlZipCode;
//     data['sc_business_website'] = this.scBusinessWebsite;
//     data['registration_no'] = this.registrationNo;
//     data['accredited_provider_stamp'] = this.accreditedProviderStamp;
//     data['provider_trading_name'] = this.providerTradingName;
//     data['registered_companys_name'] = this.registeredCompanysName;
//     data['business_contact_number'] = this.businessContactNumber;
//     data['business_email_address'] = this.businessEmailAddress;
//     data['ask_ques'] = this.askQues;
//     data['list_type'] = this.listType;
//     data['register_type'] = this.registerType;
//     data['category_id'] = this.categoryId;
//     data['sub_category_id'] = this.subCategoryId;
//     if (this.allLocation != null) {
//       data['all_location'] = this.allLocation!.map((v) => v.toJson()).toList();
//     }
//     if (this.qualificationData != null) {
//       data['qualification_data'] =
//           this.qualificationData!.map((v) => v.toJson()).toList();
//     }
//     if (this.certificateData != null) {
//       data['certificate_data'] =
//           this.certificateData!.map((v) => v.toJson()).toList();
//     }
//     if (this.skillData != null) {
//       data['skill_data'] = this.skillData!.map((v) => v.toJson()).toList();
//     }
//     if (this.categoryData != null) {
//       data['category_data'] =
//           this.categoryData!.map((v) => v.toJson()).toList();
//     }
//     data['category_name'] = this.categoryName;
//     return data;
//   }
// }
//
// class AvailabilityTime {
//   Monday? monday;
//
//   AvailabilityTime({this.monday});
//
//   AvailabilityTime.fromJson(Map<String, dynamic> json) {
//     monday =
//     json['Monday'] != null ? new Monday.fromJson(json['Monday']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.monday != null) {
//       data['Monday'] = this.monday!.toJson();
//     }
//     return data;
//   }
// }
//
// class Monday {
//   String? day;
//   List<TimeData>? timedata;
//
//   Monday({this.day, this.timedata});
//
//   Monday.fromJson(Map<String, dynamic> json) {
//     day = json['day'];
//     if (json['data'] != null) {
//       timedata = <TimeData>[];
//       json['data'].forEach((v) {
//         timedata!.add(new TimeData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['day'] = this.day;
//     if (this.timedata != null) {
//       data['data'] = this.timedata!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class TimeData {
//   String? from;
//   String? to;
//
//   TimeData({this.from, this.to});
//
//   TimeData.fromJson(Map<String, dynamic> json) {
//     from = json['from'];
//     to = json['to'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['from'] = this.from;
//     data['to'] = this.to;
//     return data;
//   }
// }
//
// class Position {
//   String? position;
//   String? companyName;
//   String? workFrom;
//   String? workTo;
//   String? expYearMonth;
//
//   Position(
//       {this.position,
//         this.companyName,
//         this.workFrom,
//         this.workTo,
//         this.expYearMonth});
//
//   Position.fromJson(Map<String, dynamic> json) {
//     position = json['position'];
//     companyName = json['company_name'];
//     workFrom = json['work_from'];
//     workTo = json['work_to'];
//     expYearMonth = json['exp_year_month'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['position'] = this.position;
//     data['company_name'] = this.companyName;
//     data['work_from'] = this.workFrom;
//     data['work_to'] = this.workTo;
//     data['exp_year_month'] = this.expYearMonth;
//     return data;
//   }
// }
//
// class AllLocation {
//   String? location;
//   String? locationCity;
//   String? locationState;
//   String? locationCountry;
//   String? locationZipCode;
//   String? locationLatitude;
//   String? locationLongitude;
//
//   AllLocation(
//       {this.location,
//         this.locationCity,
//         this.locationState,
//         this.locationCountry,
//         this.locationZipCode,
//         this.locationLatitude,
//         this.locationLongitude});
//
//   AllLocation.fromJson(Map<String, dynamic> json) {
//     location = json['location'];
//     locationCity = json['location_city'];
//     locationState = json['location_state'];
//     locationCountry = json['location_country'];
//     locationZipCode = json['location_zip_code'];
//     locationLatitude = json['location_latitude'];
//     locationLongitude = json['location_longitude'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['location'] = this.location;
//     data['location_city'] = this.locationCity;
//     data['location_state'] = this.locationState;
//     data['location_country'] = this.locationCountry;
//     data['location_zip_code'] = this.locationZipCode;
//     data['location_latitude'] = this.locationLatitude;
//     data['location_longitude'] = this.locationLongitude;
//     return data;
//   }
// }
//
// class QualificationData {
//   String? qualificationsId;
//   String? qualificationsName;
//
//   QualificationData({this.qualificationsId, this.qualificationsName});
//
//   QualificationData.fromJson(Map<String, dynamic> json) {
//     qualificationsId = json['qualifications_id'];
//     qualificationsName = json['qualifications_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['qualifications_id'] = this.qualificationsId;
//     data['qualifications_name'] = this.qualificationsName;
//     return data;
//   }
// }
//
// class CertificateData {
//   String? certificateId;
//   String? certificateName;
//
//   CertificateData({this.certificateId, this.certificateName});
//
//   CertificateData.fromJson(Map<String, dynamic> json) {
//     certificateId = json['certificate_id'];
//     certificateName = json['certificate_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['certificate_id'] = this.certificateId;
//     data['certificate_name'] = this.certificateName;
//     return data;
//   }
// }
//
// class SkillData {
//   String? skillId;
//   String? skillName;
//
//   SkillData({this.skillId, this.skillName});
//
//   SkillData.fromJson(Map<String, dynamic> json) {
//     skillId = json['skill_id'];
//     skillName = json['skill_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['skill_id'] = this.skillId;
//     data['skill_name'] = this.skillName;
//     return data;
//   }
// }
//
// class CategoryData {
//   String? suppOfferId;
//   String? offerTitle;
//   String? offerName;
//
//   CategoryData({this.suppOfferId, this.offerTitle, this.offerName});
//
//   CategoryData.fromJson(Map<String, dynamic> json) {
//     suppOfferId = json['supp_offer_id'];
//     offerTitle = json['offer_title'];
//     offerName = json['offer_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['supp_offer_id'] = this.suppOfferId;
//     data['offer_title'] = this.offerTitle;
//     data['offer_name'] = this.offerName;
//     return data;
//   }
// }
///------------14 feb------------
class SupportWorkerDetailsModel {
  String? message;
  int? status;
  SupportWorkerDetailsData? data;

  SupportWorkerDetailsModel({this.message, this.status, this.data});

  SupportWorkerDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new SupportWorkerDetailsData.fromJson(json['data']) : null;
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

class SupportWorkerDetailsData {
  SwUserDetails? swUserDetails;

  SupportWorkerDetailsData({this.swUserDetails});

  SupportWorkerDetailsData.fromJson(Map<String, dynamic> json) {
    swUserDetails = json['sw_user_details'] != null
        ? new SwUserDetails.fromJson(json['sw_user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.swUserDetails != null) {
      data['sw_user_details'] = this.swUserDetails!.toJson();
    }
    return data;
  }
}

class SwUserDetails {
  String? userId;
  String? userCode;
  String? firstName;
  String? lastName;
  String? emailId;
  String? mobileNumber;
  String? australianRegions;
  String? userAddress;
  String? userCity;
  String? userCountry;
  String? userState;
  String? userZipCode;
  String? userLatitude;
  String? userLongitude;
  String? userContactName;
  String? userContactEmail;
  String? userContactMobile;
  String? password;
  String? dateOfBirth;
  String? profileImage;
  String? coverImage;
  String? profileIdProof;
  String? paypalEmailId;
  String? userFacebook;
  String? userTwitter;
  String? userYoutube;
  String? userWebsite;
  String? registerMode;
  String? userType;
  String? userPlan;
  String? settingReview;
  String? settingShare;
  String? settingProfileShow;
  String? settingGuaranteeShow;
  String? settingUserStatus;
  String? settingListingShow;
  String? settingJobShow;
  String? settingExpertShow;
  String? settingProductShow;
  String? settingBlogShow;
  String? settingEventShow;
  String? settingCouponShow;
  String? userStatus;
  String? paymentStatus;
  String? userFollowers;
  String? userSlug;
  String? userPoints;
  String? verificationCode;
  String? verificationLink;
  String? verificationStatus;
  String? userClearNotificationCdt;
  String? userCdt;
  String? lastActive;
  String? wNServices;
  String? pAgeRange;
  String? nPManaged;
  String? serviceLocation;
  String? participantCity;
  String? participantState;
  String? participantCountry;
  String? participantZipCode;
  String? participantLatitude;
  String? participantLongitude;
  String? serviceLatitude;
  String? serviceLongitude;
  String? relationWP;
  String? pFirstName;
  String? pLastName;
  String? ageRange;
  String? pContactMethod;
  String? pIdentifyAs;
  String? languageSpoken;
  String? interpreterR;
  String? ndisNumber;
  String? typeOfSupportWork;
  String? aBNNumber;
  String? howDidYouHearAboutUs;
  String? birthYear;
  String? age;
  String? location;
  String? happyToTravel;
  String? language;
  String? aboutMe;
  List<AvailabilityTime>? availabilityTime;
  String? petFriendly;
  String? gender;
  List<Position>? position;
  String? showering;
  String? qualifications;
  String? certificates;
  String? skills;
  String? companyName;
  String? workFrom;
  String? workTo;
  String? expYearMonth;
  String? supportPrefer;
  String? ranking;
  String? workAvail;
  String? mobileVerificationCode;
  String? accessMethods;
  String? ageGroups;
  String? serviceLocations;
  String? scBusinessAddress;
  String? scSlLatitude;
  String? scSlLongitude;
  String? scSlCity;
  String? scSlState;
  String? scSlCountry;
  String? scSlZipCode;
  String? scBusinessWebsite;
  String? registrationNo;
  String? accreditedProviderStamp;
  String? providerTradingName;
  String? registeredCompanysName;
  String? businessContactNumber;
  String? businessEmailAddress;
  String? askQues;
  String? listType;
  String? registerType;
  String? categoryId;
  String? subCategoryId;
  List<AllLocation>? allLocation;
  String? emailCategories;
  String? findInRadius;
  List<QualificationData>? qualificationData;
  List<CertificateData>? certificateData;
  List<SkillData>? skillData;
  List<CategoryData>? categoryData;
  String? categoryName;

  SwUserDetails(
      {this.userId,
        this.userCode,
        this.firstName,
        this.lastName,
        this.emailId,
        this.mobileNumber,
        this.australianRegions,
        this.userAddress,
        this.userCity,
        this.userCountry,
        this.userState,
        this.userZipCode,
        this.userLatitude,
        this.userLongitude,
        this.userContactName,
        this.userContactEmail,
        this.userContactMobile,
        this.password,
        this.dateOfBirth,
        this.profileImage,
        this.coverImage,
        this.profileIdProof,
        this.paypalEmailId,
        this.userFacebook,
        this.userTwitter,
        this.userYoutube,
        this.userWebsite,
        this.registerMode,
        this.userType,
        this.userPlan,
        this.settingReview,
        this.settingShare,
        this.settingProfileShow,
        this.settingGuaranteeShow,
        this.settingUserStatus,
        this.settingListingShow,
        this.settingJobShow,
        this.settingExpertShow,
        this.settingProductShow,
        this.settingBlogShow,
        this.settingEventShow,
        this.settingCouponShow,
        this.userStatus,
        this.paymentStatus,
        this.userFollowers,
        this.userSlug,
        this.userPoints,
        this.verificationCode,
        this.verificationLink,
        this.verificationStatus,
        this.userClearNotificationCdt,
        this.userCdt,
        this.lastActive,
        this.wNServices,
        this.pAgeRange,
        this.nPManaged,
        this.serviceLocation,
        this.participantCity,
        this.participantState,
        this.participantCountry,
        this.participantZipCode,
        this.participantLatitude,
        this.participantLongitude,
        this.serviceLatitude,
        this.serviceLongitude,
        this.relationWP,
        this.pFirstName,
        this.pLastName,
        this.ageRange,
        this.pContactMethod,
        this.pIdentifyAs,
        this.languageSpoken,
        this.interpreterR,
        this.ndisNumber,
        this.typeOfSupportWork,
        this.aBNNumber,
        this.howDidYouHearAboutUs,
        this.birthYear,
        this.age,
        this.location,
        this.happyToTravel,
        this.language,
        this.aboutMe,
        this.availabilityTime,
        this.petFriendly,
        this.gender,
        this.position,
        this.showering,
        this.qualifications,
        this.certificates,
        this.skills,
        this.companyName,
        this.workFrom,
        this.workTo,
        this.expYearMonth,
        this.supportPrefer,
        this.ranking,
        this.workAvail,
        this.mobileVerificationCode,
        this.accessMethods,
        this.ageGroups,
        this.serviceLocations,
        this.scBusinessAddress,
        this.scSlLatitude,
        this.scSlLongitude,
        this.scSlCity,
        this.scSlState,
        this.scSlCountry,
        this.scSlZipCode,
        this.scBusinessWebsite,
        this.registrationNo,
        this.accreditedProviderStamp,
        this.providerTradingName,
        this.registeredCompanysName,
        this.businessContactNumber,
        this.businessEmailAddress,
        this.askQues,
        this.listType,
        this.registerType,
        this.categoryId,
        this.subCategoryId,
        this.allLocation,
        this.emailCategories,
        this.findInRadius,
        this.qualificationData,
        this.certificateData,
        this.skillData,
        this.categoryData,
        this.categoryName});

  SwUserDetails.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userCode = json['user_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    emailId = json['email_id'];
    mobileNumber = json['mobile_number'];
    australianRegions = json['australian_regions'];
    userAddress = json['user_address'];
    userCity = json['user_city'];
    userCountry = json['user_country'];
    userState = json['user_state'];
    userZipCode = json['user_zip_code'];
    userLatitude = json['user_latitude'];
    userLongitude = json['user_longitude'];
    userContactName = json['user_contact_name'];
    userContactEmail = json['user_contact_email'];
    userContactMobile = json['user_contact_mobile'];
    password = json['password'];
    dateOfBirth = json['date_of_birth'];
    profileImage = json['profile_image'];
    coverImage = json['cover_image'];
    profileIdProof = json['profile_id_proof'];
    paypalEmailId = json['paypal_email_id'];
    userFacebook = json['user_facebook'];
    userTwitter = json['user_twitter'];
    userYoutube = json['user_youtube'];
    userWebsite = json['user_website'];
    registerMode = json['register_mode'];
    userType = json['user_type'];
    userPlan = json['user_plan'];
    settingReview = json['setting_review'];
    settingShare = json['setting_share'];
    settingProfileShow = json['setting_profile_show'];
    settingGuaranteeShow = json['setting_guarantee_show'];
    settingUserStatus = json['setting_user_status'];
    settingListingShow = json['setting_listing_show'];
    settingJobShow = json['setting_job_show'];
    settingExpertShow = json['setting_expert_show'];
    settingProductShow = json['setting_product_show'];
    settingBlogShow = json['setting_blog_show'];
    settingEventShow = json['setting_event_show'];
    settingCouponShow = json['setting_coupon_show'];
    userStatus = json['user_status'];
    paymentStatus = json['payment_status'];
    userFollowers = json['user_followers'];
    userSlug = json['user_slug'];
    userPoints = json['user_points'];
    verificationCode = json['verification_code'];
    verificationLink = json['verification_link'];
    verificationStatus = json['verification_status'];
    userClearNotificationCdt = json['user_clear_notification_cdt'];
    userCdt = json['user_cdt'];
    lastActive = json['last_active'];
    wNServices = json['w_n_services'];
    pAgeRange = json['p_age_range'];
    nPManaged = json['n_p_managed'];
    serviceLocation = json['service_location'];
    participantCity = json['participant_city'];
    participantState = json['participant_state'];
    participantCountry = json['participant_country'];
    participantZipCode = json['participant_zip_code'];
    participantLatitude = json['participant_latitude'];
    participantLongitude = json['participant_longitude'];
    serviceLatitude = json['service_latitude'];
    serviceLongitude = json['service_longitude'];
    relationWP = json['relation_w_p'];
    pFirstName = json['p_first_name'];
    pLastName = json['p_last_name'];
    ageRange = json['age_range'];
    pContactMethod = json['p_contact_method'];
    pIdentifyAs = json['p_identify_as'];
    languageSpoken = json['language_spoken'];
    interpreterR = json['interpreter_r'];
    ndisNumber = json['ndis_number'];
    typeOfSupportWork = json['type_of_support_work'];
    aBNNumber = json['ABN_number'];
    howDidYouHearAboutUs = json['how_did_you_hear_about_us'];
    birthYear = json['birth_year'];
    age = json['age'];
    location = json['location'];
    happyToTravel = json['happy_to_travel'];
    language = json['language'];
    aboutMe = json['about_me'];
    if (json['availability_time'] != null) {
      availabilityTime = <AvailabilityTime>[];
      json['availability_time'].forEach((v) {
        availabilityTime!.add(new AvailabilityTime.fromJson(v));
      });
    }
    petFriendly = json['pet_friendly'];
    gender = json['gender'];
    if (json['position'] != null) {
      position = <Position>[];
      json['position'].forEach((v) {
        position!.add(new Position.fromJson(v));
      });
    }
    showering = json['showering'];
    qualifications = json['qualifications'];
    certificates = json['certificates'];
    skills = json['skills'];
    companyName = json['company_name'];
    workFrom = json['work_from'];
    workTo = json['work_to'];
    expYearMonth = json['exp_year_month'];
    supportPrefer = json['support_prefer'];
    ranking = json['ranking'];
    workAvail = json['work_avail'];
    mobileVerificationCode = json['mobile_verification_code'];
    accessMethods = json['access_methods'];
    ageGroups = json['age_groups'];
    serviceLocations = json['service_locations'];
    scBusinessAddress = json['sc_business_address'];
    scSlLatitude = json['sc_sl_latitude'];
    scSlLongitude = json['sc_sl_longitude'];
    scSlCity = json['sc_sl_city'];
    scSlState = json['sc_sl_state'];
    scSlCountry = json['sc_sl_country'];
    scSlZipCode = json['sc_sl_zip_code'];
    scBusinessWebsite = json['sc_business_website'];
    registrationNo = json['registration_no'];
    accreditedProviderStamp = json['accredited_provider_stamp'];
    providerTradingName = json['provider_trading_name'];
    registeredCompanysName = json['registered_companys_name'];
    businessContactNumber = json['business_contact_number'];
    businessEmailAddress = json['business_email_address'];
    askQues = json['ask_ques'];
    listType = json['list_type'];
    registerType = json['register_type'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    if (json['all_location'] != null) {
      allLocation = <AllLocation>[];
      json['all_location'].forEach((v) {
        allLocation!.add(new AllLocation.fromJson(v));
      });
    }
    emailCategories = json['email_categories'];
    findInRadius = json['find_in_radius'];
    if (json['qualification_data'] != null) {
      qualificationData = <QualificationData>[];
      json['qualification_data'].forEach((v) {
        qualificationData!.add(new QualificationData.fromJson(v));
      });
    }
    if (json['certificate_data'] != null) {
      certificateData = <CertificateData>[];
      json['certificate_data'].forEach((v) {
        certificateData!.add(new CertificateData.fromJson(v));
      });
    }
    if (json['skill_data'] != null) {
      skillData = <SkillData>[];
      json['skill_data'].forEach((v) {
        skillData!.add(new SkillData.fromJson(v));
      });
    }
    if (json['category_data'] != null) {
      categoryData = <CategoryData>[];
      json['category_data'].forEach((v) {
        categoryData!.add(new CategoryData.fromJson(v));
      });
    }
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_code'] = this.userCode;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email_id'] = this.emailId;
    data['mobile_number'] = this.mobileNumber;
    data['australian_regions'] = this.australianRegions;
    data['user_address'] = this.userAddress;
    data['user_city'] = this.userCity;
    data['user_country'] = this.userCountry;
    data['user_state'] = this.userState;
    data['user_zip_code'] = this.userZipCode;
    data['user_latitude'] = this.userLatitude;
    data['user_longitude'] = this.userLongitude;
    data['user_contact_name'] = this.userContactName;
    data['user_contact_email'] = this.userContactEmail;
    data['user_contact_mobile'] = this.userContactMobile;
    data['password'] = this.password;
    data['date_of_birth'] = this.dateOfBirth;
    data['profile_image'] = this.profileImage;
    data['cover_image'] = this.coverImage;
    data['profile_id_proof'] = this.profileIdProof;
    data['paypal_email_id'] = this.paypalEmailId;
    data['user_facebook'] = this.userFacebook;
    data['user_twitter'] = this.userTwitter;
    data['user_youtube'] = this.userYoutube;
    data['user_website'] = this.userWebsite;
    data['register_mode'] = this.registerMode;
    data['user_type'] = this.userType;
    data['user_plan'] = this.userPlan;
    data['setting_review'] = this.settingReview;
    data['setting_share'] = this.settingShare;
    data['setting_profile_show'] = this.settingProfileShow;
    data['setting_guarantee_show'] = this.settingGuaranteeShow;
    data['setting_user_status'] = this.settingUserStatus;
    data['setting_listing_show'] = this.settingListingShow;
    data['setting_job_show'] = this.settingJobShow;
    data['setting_expert_show'] = this.settingExpertShow;
    data['setting_product_show'] = this.settingProductShow;
    data['setting_blog_show'] = this.settingBlogShow;
    data['setting_event_show'] = this.settingEventShow;
    data['setting_coupon_show'] = this.settingCouponShow;
    data['user_status'] = this.userStatus;
    data['payment_status'] = this.paymentStatus;
    data['user_followers'] = this.userFollowers;
    data['user_slug'] = this.userSlug;
    data['user_points'] = this.userPoints;
    data['verification_code'] = this.verificationCode;
    data['verification_link'] = this.verificationLink;
    data['verification_status'] = this.verificationStatus;
    data['user_clear_notification_cdt'] = this.userClearNotificationCdt;
    data['user_cdt'] = this.userCdt;
    data['last_active'] = this.lastActive;
    data['w_n_services'] = this.wNServices;
    data['p_age_range'] = this.pAgeRange;
    data['n_p_managed'] = this.nPManaged;
    data['service_location'] = this.serviceLocation;
    data['participant_city'] = this.participantCity;
    data['participant_state'] = this.participantState;
    data['participant_country'] = this.participantCountry;
    data['participant_zip_code'] = this.participantZipCode;
    data['participant_latitude'] = this.participantLatitude;
    data['participant_longitude'] = this.participantLongitude;
    data['service_latitude'] = this.serviceLatitude;
    data['service_longitude'] = this.serviceLongitude;
    data['relation_w_p'] = this.relationWP;
    data['p_first_name'] = this.pFirstName;
    data['p_last_name'] = this.pLastName;
    data['age_range'] = this.ageRange;
    data['p_contact_method'] = this.pContactMethod;
    data['p_identify_as'] = this.pIdentifyAs;
    data['language_spoken'] = this.languageSpoken;
    data['interpreter_r'] = this.interpreterR;
    data['ndis_number'] = this.ndisNumber;
    data['type_of_support_work'] = this.typeOfSupportWork;
    data['ABN_number'] = this.aBNNumber;
    data['how_did_you_hear_about_us'] = this.howDidYouHearAboutUs;
    data['birth_year'] = this.birthYear;
    data['age'] = this.age;
    data['location'] = this.location;
    data['happy_to_travel'] = this.happyToTravel;
    data['language'] = this.language;
    data['about_me'] = this.aboutMe;
    if (this.availabilityTime != null) {
      data['availability_time'] =
          this.availabilityTime!.map((v) => v.toJson()).toList();
    }
    data['pet_friendly'] = this.petFriendly;
    data['gender'] = this.gender;
    if (this.position != null) {
      data['position'] = this.position!.map((v) => v.toJson()).toList();
    }
    data['showering'] = this.showering;
    data['qualifications'] = this.qualifications;
    data['certificates'] = this.certificates;
    data['skills'] = this.skills;
    data['company_name'] = this.companyName;
    data['work_from'] = this.workFrom;
    data['work_to'] = this.workTo;
    data['exp_year_month'] = this.expYearMonth;
    data['support_prefer'] = this.supportPrefer;
    data['ranking'] = this.ranking;
    data['work_avail'] = this.workAvail;
    data['mobile_verification_code'] = this.mobileVerificationCode;
    data['access_methods'] = this.accessMethods;
    data['age_groups'] = this.ageGroups;
    data['service_locations'] = this.serviceLocations;
    data['sc_business_address'] = this.scBusinessAddress;
    data['sc_sl_latitude'] = this.scSlLatitude;
    data['sc_sl_longitude'] = this.scSlLongitude;
    data['sc_sl_city'] = this.scSlCity;
    data['sc_sl_state'] = this.scSlState;
    data['sc_sl_country'] = this.scSlCountry;
    data['sc_sl_zip_code'] = this.scSlZipCode;
    data['sc_business_website'] = this.scBusinessWebsite;
    data['registration_no'] = this.registrationNo;
    data['accredited_provider_stamp'] = this.accreditedProviderStamp;
    data['provider_trading_name'] = this.providerTradingName;
    data['registered_companys_name'] = this.registeredCompanysName;
    data['business_contact_number'] = this.businessContactNumber;
    data['business_email_address'] = this.businessEmailAddress;
    data['ask_ques'] = this.askQues;
    data['list_type'] = this.listType;
    data['register_type'] = this.registerType;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    if (this.allLocation != null) {
      data['all_location'] = this.allLocation!.map((v) => v.toJson()).toList();
    }
    data['email_categories'] = this.emailCategories;
    data['find_in_radius'] = this.findInRadius;
    if (this.qualificationData != null) {
      data['qualification_data'] =
          this.qualificationData!.map((v) => v.toJson()).toList();
    }
    if (this.certificateData != null) {
      data['certificate_data'] =
          this.certificateData!.map((v) => v.toJson()).toList();
    }
    if (this.skillData != null) {
      data['skill_data'] = this.skillData!.map((v) => v.toJson()).toList();
    }
    if (this.categoryData != null) {
      data['category_data'] =
          this.categoryData!.map((v) => v.toJson()).toList();
    }
    data['category_name'] = this.categoryName;
    return data;
  }
}

class AvailabilityTime {
  String? day;
  List<availData>? data;

  AvailabilityTime({this.day, this.data});

  AvailabilityTime.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['data'] != null) {
      data = <availData>[];
      json['data'].forEach((v) {
        data!.add(new availData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class availData {
  String? from;
  String? to;

  availData({this.from, this.to});

  availData.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}

class Position {
  String? position;
  String? companyName;
  String? workFrom;
  String? workTo;
  String? expYearMonth;

  Position(
      {this.position,
        this.companyName,
        this.workFrom,
        this.workTo,
        this.expYearMonth});

  Position.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    companyName = json['company_name'];
    workFrom = json['work_from'];
    workTo = json['work_to'];
    expYearMonth = json['exp_year_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['company_name'] = this.companyName;
    data['work_from'] = this.workFrom;
    data['work_to'] = this.workTo;
    data['exp_year_month'] = this.expYearMonth;
    return data;
  }
}

class AllLocation {
  String? location;
  String? locationCity;
  String? locationState;
  String? locationCountry;
  String? locationZipCode;
  String? locationLatitude;
  String? locationLongitude;

  AllLocation(
      {this.location,
        this.locationCity,
        this.locationState,
        this.locationCountry,
        this.locationZipCode,
        this.locationLatitude,
        this.locationLongitude});

  AllLocation.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    locationCity = json['location_city'];
    locationState = json['location_state'];
    locationCountry = json['location_country'];
    locationZipCode = json['location_zip_code'];
    locationLatitude = json['location_latitude'];
    locationLongitude = json['location_longitude'];
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
    return data;
  }
}

class QualificationData {
  String? qualificationsId;
  String? qualificationsName;

  QualificationData({this.qualificationsId, this.qualificationsName});

  QualificationData.fromJson(Map<String, dynamic> json) {
    qualificationsId = json['qualifications_id'];
    qualificationsName = json['qualifications_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qualifications_id'] = this.qualificationsId;
    data['qualifications_name'] = this.qualificationsName;
    return data;
  }
}

class CertificateData {
  String? certificateId;
  String? certificateName;

  CertificateData({this.certificateId, this.certificateName});

  CertificateData.fromJson(Map<String, dynamic> json) {
    certificateId = json['certificate_id'];
    certificateName = json['certificate_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['certificate_id'] = this.certificateId;
    data['certificate_name'] = this.certificateName;
    return data;
  }
}

class SkillData {
  String? skillId;
  String? skillName;

  SkillData({this.skillId, this.skillName});

  SkillData.fromJson(Map<String, dynamic> json) {
    skillId = json['skill_id'];
    skillName = json['skill_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skill_id'] = this.skillId;
    data['skill_name'] = this.skillName;
    return data;
  }
}

class CategoryData {
  String? suppOfferId;
  String? offerTitle;
  String? offerName;

  CategoryData({this.suppOfferId, this.offerTitle, this.offerName});

  CategoryData.fromJson(Map<String, dynamic> json) {
    suppOfferId = json['supp_offer_id'];
    offerTitle = json['offer_title'];
    offerName = json['offer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supp_offer_id'] = this.suppOfferId;
    data['offer_title'] = this.offerTitle;
    data['offer_name'] = this.offerName;
    return data;
  }
}
