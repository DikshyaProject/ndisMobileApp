// class GetUserProfileData {
//   GetUserProfileData({
//     required this.message,
//     required this.status,
//     required this.data,
//   });
//   late final String message;
//   late final int status;
//   late final UserDataResponseData data;
//
//   GetUserProfileData.fromJson(Map<String, dynamic> json){
//     message = json['message'];
//     status = json['status'];
//     data = UserDataResponseData.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['message'] = message;
//     _data['status'] = status;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }
//
// class UserDataResponseData {
//   UserDataResponseData({
//     required this.userProfileDetails,
//   });
//   late final UserProfileDetails userProfileDetails;
//
//   UserDataResponseData.fromJson(Map<String, dynamic> json){
//     userProfileDetails = UserProfileDetails.fromJson(json['user_profile_details']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['user_profile_details'] = userProfileDetails.toJson();
//     return _data;
//   }
// }
//
// class UserProfileDetails {
//   UserProfileDetails({
//     required this.userId,
//     required this.userCode,
//     required this.firstName,
//     required this.lastName,
//     required this.emailId,
//     required this.mobileNumber,
//     required this.australianRegions,
//     required this.userAddress,
//     required this.userCity,
//     required this.userCountry,
//     required this.userState,
//     required this.userZipCode,
//     required this.userLatitude,
//     required this.userLongitude,
//     required this.userContactName,
//     required this.userContactEmail,
//     required this.userContactMobile,
//     required this.password,
//     required this.dateOfBirth,
//     required this.profileImage,
//     required this.coverImage,
//     required this.profileIdProof,
//     required this.paypalEmailId,
//     required this.userFacebook,
//     required this.userTwitter,
//     required this.userYoutube,
//     required this.userWebsite,
//     required this.registerMode,
//     required this.userType,
//     required this.userPlan,
//     required this.settingReview,
//     required this.settingShare,
//     required this.settingProfileShow,
//     required this.settingGuaranteeShow,
//     required this.settingUserStatus,
//     required this.settingListingShow,
//     required this.settingJobShow,
//     required this.settingExpertShow,
//     required this.settingProductShow,
//     required this.settingBlogShow,
//     required this.settingEventShow,
//     required this.settingCouponShow,
//     required this.userStatus,
//     required this.paymentStatus,
//     required this.userFollowers,
//     required this.userSlug,
//     required this.userPoints,
//     required this.verificationCode,
//     required this.verificationLink,
//     required this.verificationStatus,
//     required this.userClearNotificationCdt,
//     required this.userCdt,
//     required  this.wNServices,
//     required  this.pAgeRange,
//     required  this.nPManaged,
//     required  this.serviceLocation,
//     required  this.participantCity,
//     required this.participantState,
//     required this.participantCountry,
//     required this.participantZipCode,
//     required this.participantLatitude,
//     required this.participantLongitude,
//     required  this.serviceLatitude,
//     required  this.serviceLongitude,
//     required  this.relationWP,
//     required  this.pFirstName,
//     required this.pLastName,
//     required this.ageRange,
//     required this.pContactMethod,
//     required this.pIdentifyAs,
//     required this.languageSpoken,
//     required this.interpreterR,
//     required this.ndisNumber,
//     required this.typeOfSupportWork,
//     required this.ABNNumber,
//     required this.howDidYouHearAboutUs,
//     required this.birthYear,
//     required this.age,
//     required this.location,
//     required this.happyToTravel,
//     required this.language,
//     required this.aboutMe,
//     required this.availabilityTime,
//     required this.petFriendly,
//     required this.gender,
//     required this.position,
//     required this.showering,
//     required this.qualifications,
//     required this.certificates,
//     required this.skills,
//     required this.companyName,
//     required this.workFrom,
//     required this.workTo,
//     required  this.expYearMonth,
//     required this.supportPrefer,
//     required this.ranking,
//     required this.workAvail,
//     required this.mobileVerificationCode,
//     required this.accessMethods,
//     required this.ageGroups,
//     required  this.serviceLocations,
//     required this.scBusinessAddress,
//     required this.scSlLatitude,
//     required this.scSlLongitude,
//     required this.scSlCity,
//     required this.scSlState,
//     required this.scSlCountry,
//     required this.scSlZipCode,
//     required this.scBusinessWebsite,
//     required this.registrationNo,
//     required this.accreditedProviderStamp,
//     required this.providerTradingName,
//     required this.registeredCompanysName,
//     required this.businessContactNumber,
//     required this.businessEmailAddress,
//     required this.askQues,
//     required this.listType,
//     required this.registerType,
//     required  this.categoryId,
//     required this.subCategoryId,
//     required this.allLocation,
//   });
//   late final String userId;
//   late final String userCode;
//   late final String firstName;
//   late final String lastName;
//   late final String emailId;
//   late final String mobileNumber;
//   late final String australianRegions;
//   late final String userAddress;
//   late final String userCity;
//   late final String userCountry;
//   late final String userState;
//   late final String userZipCode;
//   late final String userLatitude;
//   late final String userLongitude;
//   late final String userContactName;
//   late final String userContactEmail;
//   late final String userContactMobile;
//   late final String password;
//   late final String dateOfBirth;
//   late final String profileImage;
//   late final String coverImage;
//   late final String profileIdProof;
//   late final String paypalEmailId;
//   late final String userFacebook;
//   late final String userTwitter;
//   late final String userYoutube;
//   late final String userWebsite;
//   late final String registerMode;
//   late final String userType;
//   late final String userPlan;
//   late final String settingReview;
//   late final String settingShare;
//   late final String settingProfileShow;
//   late final String settingGuaranteeShow;
//   late final String settingUserStatus;
//   late final String settingListingShow;
//   late final String settingJobShow;
//   late final String settingExpertShow;
//   late final String settingProductShow;
//   late final String settingBlogShow;
//   late final String settingEventShow;
//   late final String settingCouponShow;
//   late final String userStatus;
//   late final String paymentStatus;
//   late final String userFollowers;
//   late final String userSlug;
//   late final String userPoints;
//   late final String verificationCode;
//   late final String verificationLink;
//   late final String verificationStatus;
//   late final String userClearNotificationCdt;
//   late final String userCdt;
//   late final String wNServices;
//   late final String pAgeRange;
//   late final String nPManaged;
//   late final String serviceLocation;
//   late final String participantCity;
//   late final String participantState;
//   late final String participantCountry;
//   late final String participantZipCode;
//   late final String participantLatitude;
//   late final String participantLongitude;
//   late final String serviceLatitude;
//   late final String serviceLongitude;
//   late final String relationWP;
//   late final String pFirstName;
//   late final String pLastName;
//   late final String ageRange;
//   late final String pContactMethod;
//   late final String pIdentifyAs;
//   late final String languageSpoken;
//   late final String interpreterR;
//   late final String ndisNumber;
//   late final String typeOfSupportWork;
//   late final String ABNNumber;
//   late final String howDidYouHearAboutUs;
//   late final String birthYear;
//   late final String age;
//   late final String location;
//   late final String happyToTravel;
//   late final String language;
//   late final String aboutMe;
//   late final String availabilityTime;
//   late final String petFriendly;
//   late final String gender;
//   late final String position;
//   late final String showering;
//   late final String qualifications;
//   late final String certificates;
//   late final String skills;
//   late final String companyName;
//   late final String workFrom;
//   late final String workTo;
//   late final String expYearMonth;
//   late final String supportPrefer;
//   late final String ranking;
//   late final String workAvail;
//   late final String mobileVerificationCode;
//   late final String accessMethods;
//   late final String ageGroups;
//   late final String serviceLocations;
//   late final String scBusinessAddress;
//   late final String scSlLatitude;
//   late final String scSlLongitude;
//   late final String scSlCity;
//   late final String scSlState;
//   late final String scSlCountry;
//   late final String scSlZipCode;
//   late final String scBusinessWebsite;
//   late final String registrationNo;
//   late final String accreditedProviderStamp;
//   late final String providerTradingName;
//   late final String registeredCompanysName;
//   late final String businessContactNumber;
//   late final String businessEmailAddress;
//   late final String askQues;
//   late final String listType;
//   late final String registerType;
//   late final String categoryId;
//   late final String subCategoryId;
//   late final String allLocation;
//
//   UserProfileDetails.fromJson(Map<String, dynamic> json){
//     userId = json['user_id'];
//     userCode = json['user_code']??"";
//     firstName = json['first_name']??"";
//     lastName = json['last_name']??"";
//     emailId = json['email_id']??"";
//     mobileNumber = json['mobile_number']??"";
//     australianRegions = json['australian_regions']??"";
//     userAddress = json['user_address']??"";
//     userCity = json['user_city']??"";
//     userCountry = json['user_country']??"";
//     userState = json['user_state']??"";
//     userZipCode = json['user_zip_code']??"";
//     userLatitude = json['user_latitude']??"";
//     userLongitude = json['user_longitude']??"";
//     userContactName = json['user_contact_name']??"";
//     userContactEmail = json['user_contact_email']??"";
//     userContactMobile = json['user_contact_mobile']??"";
//     password = json['password']??"";
//     dateOfBirth = json['date_of_birth']??"";
//     profileImage = json['profile_image']??"";
//     coverImage = json['cover_image']??"";
//     profileIdProof = json['profile_id_proof']??"";
//     paypalEmailId = json['paypal_email_id']??"";
//     userFacebook = json['user_facebook']??"";
//     userTwitter = json['user_twitter']??"";
//     userYoutube = json['user_youtube']??"";
//     userWebsite = json['user_website']??"";
//     registerMode = json['register_mode']??"";
//     userType = json['user_type']??"";
//     userPlan = json['user_plan']??"";
//     settingReview = json['setting_review']??"";
//     settingShare = json['setting_share']??"";
//     settingProfileShow = json['setting_profile_show']??"";
//     settingGuaranteeShow = json['setting_guarantee_show']??"";
//     settingUserStatus = json['setting_user_status']??"";
//     settingListingShow = json['setting_listing_show']??"";
//     settingJobShow = json['setting_job_show']??"";
//     settingExpertShow = json['setting_expert_show']??"";
//     settingProductShow = json['setting_product_show']??"";
//     settingBlogShow = json['setting_blog_show']??"";
//     settingEventShow = json['setting_event_show']??"";
//     settingCouponShow = json['setting_coupon_show']??"";
//     userStatus = json['user_status']??"";
//     paymentStatus = json['payment_status']??"";
//     userFollowers = json['user_followers']??"";
//     userSlug = json['user_slug']??"";
//     userPoints = json['user_points']??"";
//     verificationCode = json['verification_code']??"";
//     verificationLink = json['verification_link']??"";
//     verificationStatus = json['verification_status']??"";
//     userClearNotificationCdt = json['user_clear_notification_cdt']??"";
//     userCdt = json['user_cdt']??"";;
//     wNServices = json['w_n_services']??"";
//     pAgeRange = json['p_age_range']??"";
//     nPManaged =  json['n_p_managed']??"";;
//     serviceLocation =  json['service_location']??"";
//     participantCity =  json['participant_city']??"";
//     participantState =  json['participant_state']??"";
//     participantCountry= json['participant_country']??"";
//     participantZipCode = json['participant_zip_code']??"";
//     participantLatitude = json['participant_latitude']??"";
//     participantLongitude = json['participant_longitude']??"";
//     serviceLatitude = json['service_latitude']??"";
//     serviceLongitude = json['service_longitude']??"";
//     relationWP = json['relation_w_p']??"";
//     pFirstName = json['p_first_name']??"";
//     pLastName = json['p_last_name']??"";
//     ageRange = json['age_range']??"";
//     pContactMethod = json['p_contact_method']??"";
//     pIdentifyAs = json['p_identify_as']??"";
//     languageSpoken = json['language_spoken']??"";
//     interpreterR = json['interpreter_r']??"";
//     ndisNumber = json['ndis_number']??"";
//     typeOfSupportWork = json['ndis_number']??"";
//     ABNNumber = json['ABN_number']??"";
//     howDidYouHearAboutUs = json['how_did_you_hear_about_us']??"";
//     birthYear = json['birth_year']??"";
//     age = json['age']??"";
//     location = json['location']??"";
//     happyToTravel = json['happy_to_travel']??"";
//     language = json['language']??"";
//     aboutMe = json['about_me']??"";
//     availabilityTime = json['availability_time']??"";
//     petFriendly = json['pet_friendly']??"";
//     gender = json['gender']??"";
//     position = json['position']??"";
//     showering = json['showering']??"";
//     qualifications = json['qualifications']??"";
//     certificates = json['certificates']??"";
//     skills = json['skills']??"";
//     companyName = json['company_name']??"";
//     workFrom = json['work_from']??"";
//     workTo = json['work_to']??"";
//     expYearMonth = json['exp_year_month']??"";
//     supportPrefer = json['support_prefer']??"";
//     ranking  = json['ranking']??"";
//     workAvail = json['work_avail']??"";
//     mobileVerificationCode  = json['mobile_verification_code']??"";
//     accessMethods  = json['access_methods']??"";
//     ageGroups = json['age_groups']??"";
//     serviceLocations = json['service_locations']??"";
//     scBusinessAddress = json['sc_business_address']??"";
//     scSlLatitude = json['sc_sl_latitude']??"";
//     scSlLongitude = json['sc_sl_longitude']??"";
//     scSlCity = json['sc_sl_city']??"";
//     scSlState = json['sc_sl_state']??"";
//     scSlCountry = json['sc_sl_country']??"";
//     scSlZipCode = json['sc_sl_zip_code']??"";
//     scBusinessWebsite = json['sc_business_website']??"";
//     registrationNo = json['registration_no']??"";
//     accreditedProviderStamp= json['accredited_provider_stamp']??"";
//     providerTradingName = json['provider_trading_name']??"";
//     registeredCompanysName = json['registered_companys_name']??"";
//     businessContactNumber = json['business_contact_number']??"";
//     businessEmailAddress = json['business_email_address']??"";
//     askQues = json['ask_ques']??"";
//     listType = json['list_type']??"";
//     registerType = json['register_type']??"";
//     categoryId = json['category_id']??"";
//     subCategoryId = json['sub_category_id']??"";
//     allLocation = json['all_location']??"";
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['user_id'] = userId;
//     _data['user_code'] = userCode;
//     _data['first_name'] = firstName;
//     _data['last_name'] = lastName;
//     _data['email_id'] = emailId;
//     _data['mobile_number'] = mobileNumber;
//     _data['australian_regions'] = australianRegions;
//     _data['user_address'] = userAddress;
//     _data['user_city'] = userCity;
//     _data['user_country'] = userCountry;
//     _data['user_state'] = userState;
//     _data['user_zip_code'] = userZipCode;
//     _data['user_latitude'] = userLatitude;
//     _data['user_longitude'] = userLongitude;
//     _data['user_contact_name'] = userContactName;
//     _data['user_contact_email'] = userContactEmail;
//     _data['user_contact_mobile'] = userContactMobile;
//     _data['password'] = password;
//     _data['date_of_birth'] = dateOfBirth;
//     _data['profile_image'] = profileImage;
//     _data['cover_image'] = coverImage;
//     _data['profile_id_proof'] = profileIdProof;
//     _data['paypal_email_id'] = paypalEmailId;
//     _data['user_facebook'] = userFacebook;
//     _data['user_twitter'] = userTwitter;
//     _data['user_youtube'] = userYoutube;
//     _data['user_website'] = userWebsite;
//     _data['register_mode'] = registerMode;
//     _data['user_type'] = userType;
//     _data['user_plan'] = userPlan;
//     _data['setting_review'] = settingReview;
//     _data['setting_share'] = settingShare;
//     _data['setting_profile_show'] = settingProfileShow;
//     _data['setting_guarantee_show'] = settingGuaranteeShow;
//     _data['setting_user_status'] = settingUserStatus;
//     _data['setting_listing_show'] = settingListingShow;
//     _data['setting_job_show'] = settingJobShow;
//     _data['setting_expert_show'] = settingExpertShow;
//     _data['setting_product_show'] = settingProductShow;
//     _data['setting_blog_show'] = settingBlogShow;
//     _data['setting_event_show'] = settingEventShow;
//     _data['setting_coupon_show'] = settingCouponShow;
//     _data['user_status'] = userStatus;
//     _data['payment_status'] = paymentStatus;
//     _data['user_followers'] = userFollowers;
//     _data['user_slug'] = userSlug;
//     _data['user_points'] = userPoints;
//     _data['verification_code'] = verificationCode;
//     _data['verification_link'] = verificationLink;
//     _data['verification_status'] = verificationStatus;
//     _data['user_clear_notification_cdt'] = userClearNotificationCdt;
//     _data['user_cdt'] = userCdt;
//     _data['w_n_services'] = wNServices;
//     _data['p_age_range'] = pAgeRange;
//     _data['n_p_managed'] = nPManaged;
//     _data['service_location'] = serviceLocation;
//     _data['participant_city'] = participantCity;
//     _data['participant_state'] = participantState;
//     _data['participant_country'] = participantCountry;
//     _data['participant_zip_code'] = participantZipCode;
//     _data['participant_latitude'] = participantLatitude;
//     _data['participant_longitude'] = participantLongitude;
//     _data['service_latitude'] = serviceLatitude;
//     _data['service_longitude'] = serviceLongitude;
//     _data['relation_w_p'] = relationWP;
//     _data['p_first_name'] = pFirstName;
//     _data['p_last_name'] = pLastName;
//     _data['age_range'] = ageRange;
//     _data['p_contact_method'] = pContactMethod;
//     _data['p_identify_as'] = pIdentifyAs;
//     _data['language_spoken'] = languageSpoken;
//     _data['interpreter_r'] = interpreterR;
//     _data['ndis_number'] = ndisNumber;
//     _data['type_of_support_work'] = typeOfSupportWork;
//     _data['ABN_number'] = ABNNumber;
//     _data['how_did_you_hear_about_us'] = howDidYouHearAboutUs;
//     _data['birth_year'] = birthYear;
//     _data['age'] = age;
//     _data['location'] = location;
//     _data['happy_to_travel'] = happyToTravel;
//     _data['language'] = language;
//     _data['about_me'] = aboutMe;
//     _data['availability_time'] = availabilityTime;
//     _data['pet_friendly'] = petFriendly;
//     _data['gender'] = gender;
//     _data['position'] = position;
//     _data['showering'] = showering;
//     _data['qualifications'] = qualifications;
//     _data['certificates'] = certificates;
//     _data['skills'] = skills;
//     _data['company_name'] = companyName;
//     _data['work_from'] = workFrom;
//     _data['work_to'] = workTo;
//     _data['exp_year_month'] = expYearMonth;
//     _data['support_prefer'] = supportPrefer;
//     _data['ranking'] = ranking;
//     _data['work_avail'] = workAvail;
//     _data['mobile_verification_code'] = mobileVerificationCode;
//     _data['access_methods'] = accessMethods;
//     _data['age_groups'] = ageGroups;
//     _data['service_locations'] = serviceLocations;
//     _data['sc_business_address'] = scBusinessAddress;
//     _data['sc_sl_latitude'] = scSlLatitude;
//     _data['sc_sl_longitude'] = scSlLongitude;
//     _data['sc_sl_city'] = scSlCity;
//     _data['sc_sl_state'] = scSlState;
//     _data['sc_sl_country'] = scSlCountry;
//     _data['sc_sl_zip_code'] = scSlZipCode;
//     _data['sc_business_website'] = scBusinessWebsite;
//     _data['registration_no'] = registrationNo;
//     _data['accredited_provider_stamp'] = accreditedProviderStamp;
//     _data['provider_trading_name'] = providerTradingName;
//     _data['registered_companys_name'] = registeredCompanysName;
//     _data['business_contact_number'] = businessContactNumber;
//     _data['business_email_address'] = businessEmailAddress;
//     _data['ask_ques'] = askQues;
//     _data['list_type'] = listType;
//     _data['register_type'] = registerType;
//     _data['category_id'] = categoryId;
//     _data['sub_category_id'] = subCategoryId;
//     _data['all_location'] = allLocation;
//     return _data;
//   }
// }

import 'package:ndisparticipant/home/model/support_worker/support_work_location_data.dart';
import 'package:ndisparticipant/home/model/support_worker/support_worker_experience_data.dart';

import '../model/support_worker/support_available_data_param.dart';

///----------------before 19 march----

// class GetUserProfileData {
//   String? message;
//   int? status;
//   UserDataResponseData? data;
//
//   GetUserProfileData({this.message, this.status, this.data});
//
//   GetUserProfileData.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null
//         ? new UserDataResponseData.fromJson(json['data'])
//         : null;
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
// class UserDataResponseData {
//   UserProfileDetails? userProfileDetails;
//
//   UserDataResponseData({this.userProfileDetails});
//
//   UserDataResponseData.fromJson(Map<String, dynamic> json) {
//     userProfileDetails = json['user_profile_details'] != null
//         ? new UserProfileDetails.fromJson(json['user_profile_details'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.userProfileDetails != null) {
//       data['user_profile_details'] = this.userProfileDetails!.toJson();
//     }
//     return data;
//   }
// }
//
// class UserProfileDetails {
//   String? australianRegions;
//   String? userId;
//   String? findInRadius;
//   List<String>? mailFac;
//   String? joinDate;
//   String? preSerPro;
//   String? profileExpiry;
//   String? happyToTravelName;
//   String? languageName;
//   String? petFriendlyName;
//   String? typeOfSupportWorkName;
//   String? howDidYouHearAboutUsName;
//   String? supportPreferName;
//   String? userCode;
//   String? firstName;
//   String? lastName;
//   String? emailId;
//   String? mobileNumber;
//   String? australian_regions_name;
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
//   dynamic? wNServices;
//   dynamic? pAgeRange;
//   dynamic? nPManaged;
//   dynamic? serviceLocation;
//   dynamic? participantCity;
//   dynamic? participantState;
//   dynamic? participantCountry;
//   dynamic? participantZipCode;
//   dynamic? participantLatitude;
//   dynamic? participantLongitude;
//   dynamic? serviceLatitude;
//   dynamic? serviceLongitude;
//   dynamic? relationWP;
//   dynamic? pFirstName;
//   dynamic? pLastName;
//   dynamic? ageRange;
//   dynamic? pContactMethod;
//   dynamic? pIdentifyAs;
//   dynamic? languageSpoken;
//   dynamic? interpreterR;
//   dynamic? ndisNumber;
//   dynamic? typeOfSupportWork;
//   dynamic? aBNNumber;
//   dynamic? howDidYouHearAboutUs;
//   dynamic? birthYear;
//   dynamic? age;
//   dynamic? location;
//   dynamic? happyToTravel;
//   dynamic? language;
//   dynamic? aboutMe;
//   dynamic? availabilityTime;
//   dynamic? petFriendly;
//   dynamic? gender;
//   dynamic? position;
//   dynamic? showering;
//   dynamic? qualifications;
//   dynamic? certificates;
//   dynamic? skills;
//   dynamic? companyName;
//   dynamic? workFrom;
//   dynamic? workTo;
//   dynamic? expYearMonth;
//   dynamic? supportPrefer;
//   dynamic? ranking;
//   dynamic? workAvail;
//   dynamic? mobileVerificationCode;
//   dynamic? accessMethods;
//   dynamic? ageGroups;
//   dynamic? serviceLocations;
//   String? scBusinessAddress;
//   String? scSlLatitude;
//   String? scSlLongitude;
//   String? scSlCity;
//   String? scSlState;
//   String? scSlCountry;
//   String? scSlZipCode;
//   String? scBusinessWebsite;
//   dynamic? registrationNo;
//   dynamic? accreditedProviderStamp;
//   dynamic? providerTradingName;
//   dynamic? registeredCompanysName;
//   dynamic? businessContactNumber;
//   dynamic? businessEmailAddress;
//   dynamic? askQues;
//   dynamic? listType;
//   dynamic? registerType;
//   dynamic? categoryId;
//   dynamic? subCategoryId;
//   dynamic? allLocation;
//
//   UserProfileDetails(
//       {this.userId,
//       this.userCode,
//       this.firstName,
//       this.lastName,
//       this.emailId,
//       this.mobileNumber,
//       this.australian_regions_name,
//       this.userAddress,
//       this.userCity,
//       this.userCountry,
//       this.userState,
//       this.userZipCode,
//       this.userLatitude,
//       this.userLongitude,
//       this.userContactName,
//       this.userContactEmail,
//       this.userContactMobile,
//       this.password,
//       this.dateOfBirth,
//       this.profileImage,
//       this.coverImage,
//       this.profileIdProof,
//       this.paypalEmailId,
//       this.userFacebook,
//       this.userTwitter,
//       this.userYoutube,
//       this.userWebsite,
//       this.registerMode,
//       this.userType,
//       this.userPlan,
//       this.settingReview,
//       this.settingShare,
//       this.settingProfileShow,
//       this.settingGuaranteeShow,
//       this.settingUserStatus,
//       this.settingListingShow,
//       this.settingJobShow,
//       this.settingExpertShow,
//       this.settingProductShow,
//       this.settingBlogShow,
//       this.settingEventShow,
//       this.settingCouponShow,
//       this.userStatus,
//       this.paymentStatus,
//       this.userFollowers,
//       this.userSlug,
//       this.userPoints,
//       this.verificationCode,
//       this.verificationLink,
//       this.verificationStatus,
//       this.userClearNotificationCdt,
//       this.userCdt,
//       this.wNServices,
//       this.pAgeRange,
//       this.nPManaged,
//       this.serviceLocation,
//       this.participantCity,
//       this.participantState,
//       this.participantCountry,
//       this.participantZipCode,
//       this.participantLatitude,
//       this.participantLongitude,
//       this.serviceLatitude,
//       this.serviceLongitude,
//       this.relationWP,
//       this.pFirstName,
//       this.pLastName,
//       this.ageRange,
//       this.pContactMethod,
//       this.pIdentifyAs,
//       this.languageSpoken,
//       this.interpreterR,
//       this.ndisNumber,
//       this.typeOfSupportWork,
//       this.aBNNumber,
//       this.howDidYouHearAboutUs,
//       this.birthYear,
//       this.age,
//       this.location,
//       this.happyToTravel,
//       this.language,
//       this.aboutMe,
//       this.availabilityTime,
//       this.petFriendly,
//       this.gender,
//       this.position,
//       this.showering,
//       this.qualifications,
//       this.certificates,
//       this.skills,
//       this.companyName,
//       this.workFrom,
//       this.workTo,
//       this.expYearMonth,
//       this.supportPrefer,
//       this.ranking,
//       this.workAvail,
//       this.mobileVerificationCode,
//       this.accessMethods,
//       this.ageGroups,
//       this.serviceLocations,
//       this.scBusinessAddress,
//       this.scSlLatitude,
//       this.scSlLongitude,
//       this.scSlCity,
//       this.scSlState,
//       this.scSlCountry,
//       this.scSlZipCode,
//       this.scBusinessWebsite,
//       this.registrationNo,
//       this.accreditedProviderStamp,
//       this.providerTradingName,
//       this.registeredCompanysName,
//       this.businessContactNumber,
//       this.businessEmailAddress,
//       this.askQues,
//       this.listType,
//       this.registerType,
//       this.categoryId,
//       this.subCategoryId,
//       this.findInRadius,
//       this.mailFac,
//       this.joinDate,
//       this.profileExpiry,
//       this.happyToTravelName,
//       this.languageName,
//       this.petFriendlyName,
//       this.typeOfSupportWorkName,
//       this.howDidYouHearAboutUsName,
//       this.supportPreferName,
//       this.preSerPro,
//       this.allLocation});
//
//   UserProfileDetails.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     findInRadius = json['find_in_radius'];
//     mailFac = json['mail_fac'].cast<String>();
//     joinDate = json['join_date'];
//     preSerPro = json['pre_ser_pro'];
//     profileExpiry = json['profile_expiry'];
//     happyToTravelName = json['happy_to_travel_name'];
//     languageName = json['language_name'];
//     petFriendlyName = json['pet_friendly_name'];
//     typeOfSupportWorkName = json['type_of_support_work_name'];
//     howDidYouHearAboutUsName = json['how_did_you_hear_about_us_name'];
//     supportPreferName = json['support_prefer_name'];
//     userCode = json['user_code'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     emailId = json['email_id'];
//     mobileNumber = json['mobile_number'];
//     australian_regions_name = json['australian_regions_name'];
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
//     availabilityTime = json['availability_time'];
//     petFriendly = json['pet_friendly'];
//     gender = json['gender'];
//     position = json['position'];
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
//     allLocation = json['all_location'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['find_in_radius'] = this.findInRadius;
//     data['mail_fac'] = this.mailFac;
//     data['join_date'] = this.joinDate;
//     data['pre_ser_pro'] = this.preSerPro;
//     data['profile_expiry'] = this.profileExpiry;
//     data['happy_to_travel_name'] = this.happyToTravelName;
//     data['language_name'] = this.languageName;
//     data['pet_friendly_name'] = this.petFriendlyName;
//     data['type_of_support_work_name'] = this.typeOfSupportWorkName;
//     data['how_did_you_hear_about_us_name'] = this.howDidYouHearAboutUsName;
//     data['support_prefer_name'] = this.supportPreferName;
//     data['user_code'] = this.userCode;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['email_id'] = this.emailId;
//     data['mobile_number'] = this.mobileNumber;
//     data['australian_regions_name'] = this.australian_regions_name;
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
//     data['availability_time'] = this.availabilityTime;
//     data['pet_friendly'] = this.petFriendly;
//     data['gender'] = this.gender;
//     data['position'] = this.position;
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
//     data['all_location'] = this.allLocation;
//     return data;
//   }
// }
///----------after
class GetUserProfileData {
  String? message;
  int? status;
  UserDataResponseData? data;

  GetUserProfileData({this.message, this.status, this.data});

  GetUserProfileData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new UserDataResponseData.fromJson(json['data']) : null;
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

class UserDataResponseData {
  UserProfileDetails? userProfileDetails;

  UserDataResponseData({this.userProfileDetails});

  UserDataResponseData.fromJson(Map<String, dynamic> json) {
    userProfileDetails = json['user_profile_details'] != null
        ? new UserProfileDetails.fromJson(json['user_profile_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userProfileDetails != null) {
      data['user_profile_details'] = this.userProfileDetails!.toJson();
    }
    return data;
  }
}

class UserProfileDetails {
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
  String? availabilityTime;
  String? petFriendly;
  String? gender;
  String? position;
  String? showering;
  List<QualificationList>? qualifications;
  List<Certificates>? certificates;
  List<Skills>? skills;
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
  List<SupportWorkLocationData>? allLocation;
  String? emailCategories;
  String? findInRadius;
  String? nPManagedId;
  String? relationWPId;
  String? ageRangeId;
  String? pAgeRangeId;
  String? pIdentifyAsId;
  List<OtherQualifications>? otherQualifications;
  List<OtherCertificates>? otherCertificates;
  List<OtherSkills>? otherSkills;
  List<SupportOffers>? supportOffers;
  List<SupportWorkerExperienceData>? workExp;
  List<Schedule>? schedule;
  List<String>? mailFac;
  String? profileLink;
  String? joinDate;
  String? preSerPro;
  String? profileExpiry;
  String? petFriendlyName;
  String? australianRegionsName;
  String? typeOfSupportWorkName;
  String? howDidYouHearAboutUsName;
  String? happyToTravelName;
  String? languageName;
  String? supportPreferName;

  UserProfileDetails(
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
        this.nPManagedId,
        this.relationWPId,
        this.ageRangeId,
        this.pAgeRangeId,
        this.pIdentifyAsId,
        this.otherQualifications,
        this.otherCertificates,
        this.otherSkills,
        this.supportOffers,
        this.workExp,
        this.schedule,
        this.mailFac,
        this.profileLink,
        this.joinDate,
        this.preSerPro,
        this.profileExpiry,
        this.petFriendlyName,
        this.australianRegionsName,
        this.typeOfSupportWorkName,
        this.howDidYouHearAboutUsName,
        this.happyToTravelName,
        this.languageName,
        this.supportPreferName});

  UserProfileDetails.fromJson(Map<String, dynamic> json) {
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
    availabilityTime = json['availability_time'];
    petFriendly = json['pet_friendly'];
    gender = json['gender'];
    position = json['position'];
    showering = json['showering'];
    if (json['qualifications'] != null) {
      qualifications = <QualificationList>[];
      json['qualifications'].forEach((v) {
        qualifications!.add(new QualificationList.fromJson(v));
      });
    }
    if (json['certificates'] != null) {
      certificates = <Certificates>[];
      json['certificates'].forEach((v) {
        certificates!.add(new Certificates.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
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
      allLocation = <SupportWorkLocationData>[];
      json['all_location'].forEach((v) {
        allLocation!.add(new SupportWorkLocationData.fromJson(v));
      });
    }
    emailCategories = json['email_categories'];
    findInRadius = json['find_in_radius'];
    nPManagedId = json['n_p_managed_id'];
    relationWPId = json['relation_w_p_id'];
    ageRangeId = json['age_range_id'];
    pAgeRangeId = json['p_age_range_id'];
    pIdentifyAsId = json['p_identify_as_id'];
    if (json['other_qualifications'] != null) {
      otherQualifications = <OtherQualifications>[];
      json['other_qualifications'].forEach((v) {
        otherQualifications!.add(new OtherQualifications.fromJson(v));
      });
    }
    if (json['other_certificates'] != null) {
      otherCertificates = <OtherCertificates>[];
      json['other_certificates'].forEach((v) {
        otherCertificates!.add(new OtherCertificates.fromJson(v));
      });
    }
    if (json['other_skills'] != null) {
      otherSkills = <OtherSkills>[];
      json['other_skills'].forEach((v) {
        otherSkills!.add(new OtherSkills.fromJson(v));
      });
    }
    if (json['support_offers'] != null) {
      supportOffers = <SupportOffers>[];
      json['support_offers'].forEach((v) {
        supportOffers!.add(new SupportOffers.fromJson(v));
      });
    }
    if (json['work_exp'] != null) {
      workExp = <SupportWorkerExperienceData>[];
      json['work_exp'].forEach((v) {
        workExp!.add(new SupportWorkerExperienceData.fromJson(v));
      });
    }
    if (json['schedule'] != null) {
      schedule = <Schedule>[];
      json['schedule'].forEach((v) {
        schedule!.add(new Schedule.fromJson(v));
      });
    }
    mailFac = json['mail_fac'].cast<String>();
    profileLink = json['profile_link'];
    joinDate = json['join_date'];
    preSerPro = json['pre_ser_pro'];
    profileExpiry = json['profile_expiry'];
    petFriendlyName = json['pet_friendly_name'];
    australianRegionsName = json['australian_regions_name'];
    typeOfSupportWorkName = json['type_of_support_work_name'];
    howDidYouHearAboutUsName = json['how_did_you_hear_about_us_name'];
    happyToTravelName = json['happy_to_travel_name'];
    languageName = json['language_name'];
    supportPreferName = json['support_prefer_name'];
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
    data['availability_time'] = this.availabilityTime;
    data['pet_friendly'] = this.petFriendly;
    data['gender'] = this.gender;
    data['position'] = this.position;
    data['showering'] = this.showering;
    if (this.qualifications != null) {
      data['qualifications'] =
          this.qualifications!.map((v) => v.toJson()).toList();
    }
    if (this.certificates != null) {
      data['certificates'] = this.certificates!.map((v) => v.toJson()).toList();
    }
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
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
    data['n_p_managed_id'] = this.nPManagedId;
    data['relation_w_p_id'] = this.relationWPId;
    data['age_range_id'] = this.ageRangeId;
    data['p_age_range_id'] = this.pAgeRangeId;
    data['p_identify_as_id'] = this.pIdentifyAsId;
    if (this.otherQualifications != null) {
      data['other_qualifications'] =
          this.otherQualifications!.map((v) => v.toJson()).toList();
    }
    if (this.otherCertificates != null) {
      data['other_certificates'] =
          this.otherCertificates!.map((v) => v.toJson()).toList();
    }
    if (this.otherSkills != null) {
      data['other_skills'] = this.otherSkills!.map((v) => v.toJson()).toList();
    }
    if (this.supportOffers != null) {
      data['support_offers'] =
          this.supportOffers!.map((v) => v.toJson()).toList();
    }
    if (this.workExp != null) {
      data['work_exp'] = this.workExp!.map((v) => v.toJson()).toList();
    }
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.map((v) => v.toJson()).toList();
    }
    data['mail_fac'] = this.mailFac;
    data['profile_link'] = this.profileLink;
    data['join_date'] = this.joinDate;
    data['pre_ser_pro'] = this.preSerPro;
    data['profile_expiry'] = this.profileExpiry;
    data['pet_friendly_name'] = this.petFriendlyName;
    data['australian_regions_name'] = this.australianRegionsName;
    data['type_of_support_work_name'] = this.typeOfSupportWorkName;
    data['how_did_you_hear_about_us_name'] = this.howDidYouHearAboutUsName;
    data['happy_to_travel_name'] = this.happyToTravelName;
    data['language_name'] = this.languageName;
    data['support_prefer_name'] = this.supportPreferName;
    return data;
  }
}

class QualificationList {
  String? name;
  int? status;
  String? id;

  QualificationList({this.name, this.status, this.id});

  QualificationList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}
class Certificates {
  String? name;
  int? status;
  String? id;

  Certificates({this.name, this.status, this.id});

  Certificates.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}
class Skills {
  String? name;
  int? status;
  String? id;

  Skills({this.name, this.status, this.id});

  Skills.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}
class SupportOffers {
  String? name;
  int? status;
  String? id;

  SupportOffers({this.name, this.status, this.id});

  SupportOffers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}


class OtherQualifications {
  String? otherQualifications;

  OtherQualifications({this.otherQualifications});

  OtherQualifications.fromJson(Map<String, dynamic> json) {
    otherQualifications = json['other_qualifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['other_qualifications'] = this.otherQualifications;
    return data;
  }
}

class OtherCertificates {
  String? otherCertificates;

  OtherCertificates({this.otherCertificates});

  OtherCertificates.fromJson(Map<String, dynamic> json) {
    otherCertificates = json['other_certificates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['other_certificates'] = this.otherCertificates;
    return data;
  }
}

class OtherSkills {
  String? otherSkills;

  OtherSkills({this.otherSkills});

  OtherSkills.fromJson(Map<String, dynamic> json) {
    otherSkills = json['other_skills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['other_skills'] = this.otherSkills;
    return data;
  }
}

class Schedule {
  String? day;
  List<AvailableTimeData>? data;

  Schedule({this.day, this.data});

  Schedule.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['data'] != null) {
      data = <AvailableTimeData>[];
      json['data'].forEach((v) {
        data!.add(new AvailableTimeData.fromJson(v));
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

