import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:ndisparticipant/home/model/blog/post_search_model.dart';
import 'package:ndisparticipant/home/model/find_support/advocacy_support_org_model.dart';
import 'package:ndisparticipant/home/model/find_support/psychosocial_model.dart';
import 'package:ndisparticipant/home/model/home/noti_count_model.dart';
import 'package:ndisparticipant/home/model/jobs/h_all_job_category_model.dart';
import 'package:ndisparticipant/home/model/jobs/job_details_model.dart';
import 'package:ndisparticipant/home/model/jobs/job_list_by_cat_model.dart';
import 'package:ndisparticipant/home/model/jobs/job_search_model.dart';
import 'package:ndisparticipant/home/model/jobs/jobs_dropdown_model.dart';
import 'package:ndisparticipant/home/model/jobs/location_dropdown_model.dart';
import 'package:ndisparticipant/home/model/market_place/MpCategoryModel.dart';
import 'package:ndisparticipant/home/model/market_place/cart_list_model.dart';
import 'package:ndisparticipant/home/model/ndis_expert/ndis_service_category_model.dart';
import 'package:ndisparticipant/home/model/ndis_expert/service_expert_detail_model.dart';
import 'package:ndisparticipant/home/model/participant/language_model.dart';
import 'package:ndisparticipant/home/model/plan_managers/plan_manager_list_model.dart';
import 'package:ndisparticipant/home/model/support-coordinator/h_s_coordinator_category_model.dart';
import 'package:ndisparticipant/home/profile_model/sup_work_pro_drop_model.dart';

import '../Helpers/services/services.dart';
import '../Helpers/utils/utils.dart';
import '../home/home.dart';
import '../home/model/blog/blog_list_model.dart';
import '../home/model/blog/bloglist_details_model.dart';
import '../home/model/find_support/find_support_list_model.dart';
import '../home/model/h_event/eventlist_details_model.dart';
import '../home/model/h_event/eventlist_model.dart';
import '../home/model/home/all_category_model.dart';
import '../home/model/home/home_accommodation_list_model.dart';
import '../home/model/home/home_details_model.dart';
import '../home/model/home/service_details_page_model.dart';
import '../home/model/home/subcategory_listDetails_model.dart';
import '../home/model/home_search/search_model.dart';
import '../home/model/market_place/all_product_details_model.dart';
import '../home/model/market_place/all_product_list_model.dart';
import '../home/model/market_place/market_place_vehial_list_model.dart';
import '../home/model/market_place/mp_property_details_model.dart';
import '../home/model/market_place/mp_vehical_details_model.dart';
import '../home/model/market_place/ndis_propety_sale.dart';
import '../home/model/ndis_expert/ndis_expert_services_list.dart';
import '../home/model/news/news_details_model.dart';
import '../home/model/news/news_list_mnodel.dart';
import '../home/model/participant/participant_register_response_data.dart';
import '../home/model/support-coordinator/support_corrdinator_details_model.dart';
import '../home/model/support-coordinator/support_corrdinator_subcat_list_model.dart';
import '../home/model/support_worker/support_worker_cat_list_model.dart';
import '../home/model/support_worker/support_worker_details.dart';
import '../home/model/support_worker/support_worker_user_list_model.dart';
import '../home/profile_model/ad_summary_model.dart';
import '../home/profile_model/all_applied_job_model.dart';
import '../home/profile_model/all_reviews_model.dart';
import '../home/profile_model/all_user_model.dart';
import '../home/profile_model/followings_model.dart';
import '../home/profile_model/get_setting_model.dart';
import '../home/profile_model/get_user_data_response_model.dart';
import '../home/profile_model/job_profile_dropdown_model.dart';
import '../home/profile_model/liked_list_model.dart';
import '../home/profile_model/looking_for_job_model.dart';
import '../home/profile_model/my_direct_lead_model.dart';
import '../home/profile_model/my_direct_queries_model.dart';
import '../home/profile_model/my_events_model.dart';
import '../home/profile_model/my_generic_lead_model.dart';
import '../home/profile_model/my_orders_model.dart';
import '../home/profile_model/my_service_bookings_model.dart';
import '../home/profile_model/notification_list_model.dart';
import '../home/profile_model/order_detail_model.dart';
import '../home/profile_model/order_history_model.dart';
import '../home/profile_model/payment_invoices_model.dart';
import '../home/profile_model/payments_model.dart';
import '../home/profile_model/profile_count_data_model.dart';
import '../home/profile_model/promotions_model.dart';
import '../home/profile_model/seo_list_model.dart';
import '../home/profile_model/transaction_history_model.dart';
import '../networking/networking.dart';

class UserRepository {
  String? currentLanguageCode = "";
  ScreenNavigation? ScreenName;
  static String job_lattitude = '';
  static String job_longitude = '';
  static String? job_address = "Search Place";
  static String profile_lattitude = '';
  static String parti_service_lattitude = '';
  static String enquiry_lat = '';
  static String enquiry_lng = '';
  static String enquiry_location = '';
  static String profile_longitude = '';
  static String parti_service_longitude = '';
  static String filter_address = "Suburb / Postcode / City";
  static String filter_lat = '';
  static String filter_lng = '';
  static String? profile_address = "Select Location";
  static String? parti_service_location = "Select Location";
  String? apiBaseUrl;
  NetworkApiProvider? _apiProvider;
  String? day;
  String? points;
  String? details;
  String? emailOtp = "";
  String? mobileOtp = "";
  dynamic? getPanelistInfo;
  List<Languages>? language = [];
  late LanguageModel languageModel;
  RegionModelList? regionModelDataList;
  SupWorkProDropModel? supWorkProDropModel;
  GetParticipantRegistrationModel? getParticipantData;
  ParticipantRegistrationData? participantRegistrationData;
  GetSupportWorkerRegistrationModel? getSupportData;
  HomeDetailsData? getHomeDetailsData;
  late HomePageDetailsModel homePageDetailsModel;
  late AllCategoryModel allCategoryModel;
  CategoryModelData? _categoryModelData;

  ScoordinatorCategoryModel? CategoryDataModel;
  ScoordData? scoordData;
  NdisServiceCategoryModel? NdisCatDataModel;
  NdisServiceCatData? ndisCatData;
  AllJobCategoryModel? allJobCategoryModel;
  AllJobData? allJobData;
  JobsDropdownModel? jobsDropdownModel;
  jobsDropData? jobs_Drop_Data;
  LocationDropdownModel? locationDropdownModel;
  LocDropData? Loc_Drop_Data;

  JobDetailsModel? jobDetailModel;
  jobDetailsData? job_Details_Data;
  MpCategoryModel? mpCategoryModel;
  mpCatData? mp_cat_data;
  JobListByCatModel? jobListByCatModel;
  JobByCatData? jobByCatData;
  PlanManagersModel? planManagersModel;
  PlanManagerData? planManagerData;
  JobSearchDataModel? jobSearchModel;
  JobSearchData? jobSearchData;
  ProfileCountsModel? profileCountsModel;
  ProfileCountsData? profileCountsData;
  DirectLeadsModel? directLeadsModel;
  DirectLeadsData? directLeadsData;
  GenericLeadsModel? genericLeadsModel;
  GenericLeadData? genericLeadData;
  PsychoSocialModel? psychoSocialModel;
  PsychoSocialData? psychoSocialData;
  AdvocacySupportModel? advocacySupportModel;
  AdvocacySupportData? advocacySupportData;
  NotiCountModel? notiCountModel;
  PostSearchModel? postSearchModel;
  PostSearchData? postSearchData;

  ParticipantResponseData? participantResponseData;
  late GeneralRegisterResponseModel? generalRegisterResponseModel;
  late NdisRegistrationResponseModel? ndisServiceExpertRegistResponseModel;
  PricingPlanDataModel? pricingPlanDataModel;
  late SupportWorkerRegistrationResponse? swWorkerResponseModel;
  GetUserProfileData? getUserProfileData;
  UserDataResponseData? userProfieData;

  late SubCategoryListDetailsModel subCategoryListDetailsModel;
  SubCatDetailsData? subCatDetailsData;
  late ServiceDetailsPageModel serviceDetailsPageModel;
  ServiceDetailsPageData? serviceDetailsPageData;
  late AccommodationHousingListModel accommodationHousingListModel;
  AccommodationListData? accommodationListData;
  late ExpertDetailModel expertDetailModel;
  ExpertDetailData? expertDetailData;

  late SupportWorkedCatListModel supportWorkedCatListModel;
  SupportWorkerCatListData? supportWorkerCatListData;
  late SupportWUserListModel supportWUserListModel;
  SupportWorkerUserData? supportWorkerUserData;
  late BlogListModel blogListModel;
  BlogListData? blogListData;
  late SupportCoordinatorDetailsModel supportCoordinatorDetailsModel;
  SupportCoordinatorDetailsData? supportCoordinatorDetailsData;
  late EventListModel eventListModel;
  EventListData? eventListData;
  late EventListDetailsModel eventListDetailsModel;
  EventDetailsData? eventDetailsData;

  late BlogListDetailsModel blogListDetailsModel;
  BlogListDetailsData? blogListDetailsData;
  late SupportCorrdinatorSubcatListModel supportCorrdinatorSubcatListModel;
  SupCorrdinatoreSubCatData? supCorrdinatoreSubCatData;
  late NewsListModel newsListModel;
  NewsListData? newsListData;
  late JobProfileDropdownModel jobProfDropdownModel;
  JobProDropData? jobPDropData;
  late ServiceBookingsModel serviceBookingsModel;
  ServiceBookingsData? serviceBookingsData;
  late PaymentsModel paymentsModel;
  PaymentData? paymentData;
  late SeoListModel seoListModel;
  SeoData? seoData;
  late AdSummaryModel adSummaryModel;
  AdData? adData;
  late PromotionsModel promotionsModel;
  PromotionsData? promotionsData;
  InvoicesModel? invoicesModel;
  InvoicesData? invoicesData;
  late DirectQueriesModel directQueriesModel;
  DirectQeriesData? directQeriesData;
  late LookingForJobModel lookingForJobModel;
  LookingJobData? lookingJobData;
  late AllReviewsModel allReviewsModel;
  AllReviewsData? allReviewsData;
  late AllAppliedJobModel allAppliedJobModel;
  AppliedJobData? appliedJobData;
  late MyEventsModel myEventsModel;
  MyEventData? myEventData;
  late GetSettingModel getSettingModel;
  GetSettingData? getSettingData;
  late MyOrdersModel myOrdersModel;
  MyOrderData? myOrderData;
  late OrderDetailModel orderDetailModel;
  OrderDetailData? orderDetailData;
  late LikedListModel likedListModel;
  List<LikedListData>? likedData;
  late NotificationsModel notificationsModel;
  NotificationsData? notificationsData;
  late FollowingsModel followingsModel;
  FollowingData? followingData;
  late AllUserModel allUserModel;
  AllUserData? allUserData;
  late OrderHistroyModel orderHistroyModel;
  OrderHistoryData? orderHistoryData;
  late TransactionHistoryModel transactionHistoryModel;
  TransactionHistoryData? transactionHistoryData;

  late NewDetailModel newDetailModel;
  NewsDetailsData? newsDetailsData;
  late MarketPlaceAllProductListModel allProductListModel;
  MarketPlaceAllProductListData? marketPlaceAllProductListData;
  late MarketPlaceAllVehicalModel marketPlaceAllVehicalModel;
  MarketPlaceAllVehivalData? marketPlaceAllVehivalData;
  late NDISPropertSaleModel ndisPropertSaleModel;
  NDISPropertySaleData? ndisPropertySaleData;
  late AllProductDetailsModel allProductDetailsModel;
  AllProductDetailsData? allProductDetailsData;
  late MPVehicalDetailsModel mpVehicalDetailsModel;
  VehicalDetailsData? vehicalDetailsData;
  CartListModel? cartListModel;
  CartData? cartData;
  late MPPropertyDetailsModel mpPropertyDetailsModel;
  MpPropertyDetailsData? mpPropertyDetailsData;
  late FindSupportModel findSupportModel;
  FindSupportListData? findSupportListData;
  late HomeSearchModel homeSearchModel;
  HomeSearchData? homeSearchData;
  ServiceExpertListingModel? serviceExpertListingModel;
  ServiceExpertListingData? serviceExpertListingData;
  late SupportWorkerDetailsModel supportWorkerDetailsModel;
  SupportWorkerDetailsData? supportWorkerDetailsData;

  UserRepository() {
    if (FlavorConfig.instance.variables["developerBaseUrl"] == "BaseDevUrl") {
      apiBaseUrl = devTestBaseUrl;
      _apiProvider = NetworkApiProvider(apiBaseUrl!);
    } else {}
  }

  String? token = "";

  getToken() async {
    // token = await FirebaseMessaging.instance.getToken();
    // sharedPrefs.fireBaseToken = token!;
    print("Token ====== ${token}");
  }

  set screenNameSet(ScreenNavigation value) {
    ScreenName = value;
  }

  Future<NetworkApiCallState<bool>> getParticiPantDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getParticiPantInfo,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        print("Status 1");
        getParticipantData = GetParticipantRegistrationModel.fromJson(response);
        participantRegistrationData = getParticipantData!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        print("Status 0");
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getUserProfileDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getUserdataApi, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        getUserProfileData = GetUserProfileData.fromJson(response);

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        print("Status 0");
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getUserLoginApi(
      String email, String pwd) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {"email_id": email, "password": pwd};

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + loginApi, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        sharedPrefs.IsLogin = true;
        sharedPrefs.userPwd = pwd;
        getUserProfileData = GetUserProfileData.fromJson(response);
        sharedPrefs.userName =
            "${getUserProfileData?.data?.userProfileDetails?.firstName}";
        sharedPrefs.userType =
            "${getUserProfileData?.data?.userProfileDetails?.userType}";
        sharedPrefs.userID =
            "${getUserProfileData?.data?.userProfileDetails?.userId}";
        sharedPrefs.userRegisterDate =
            "${getUserProfileData?.data?.userProfileDetails?.userCdt}";
        sharedPrefs.userEmail =
            "${getUserProfileData?.data?.userProfileDetails?.emailId}";
        sharedPrefs.userMobile =
            "${getUserProfileData?.data?.userProfileDetails?.mobileNumber}";
        sharedPrefs.userImage =
            "${getUserProfileData?.data?.userProfileDetails?.profileImage}";
        sharedPrefs.serviceLocation =
            "${getUserProfileData?.data?.userProfileDetails?.serviceLocation}";

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        print("Status 0");
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> forgotPassApi(String email) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {"email_id": email};

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + forgotPasswordApi, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        print("${response["message"]}");
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> contactSupportWorkerApi(
      String user_id,
      String expert_id,
      String enquiry_date,
      String enquiry_message,
      String enquiry_location) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": user_id,
        "support_worker_id": expert_id,
        "enquiry_date": enquiry_date,
        "enquiry_message": enquiry_message,
        "enquiry_location": enquiry_location,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + contact_support_worker, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        print("${response["message"]}");
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> GetQuoteServProApi(String user_id,
      String listing_id, String enquiry_message, bool isFromCoordinator) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        if (isFromCoordinator == true) "support_worker_id": user_id,
        if (isFromCoordinator == false) "user_id": user_id,
        "listing_id": listing_id,
        "enquiry_message": enquiry_message,
      };

      var response = isFromCoordinator == true
          ? await _apiProvider!.postWithUrl(
              apiBaseUrl! + get_quote_support_coordinator_api, requestParams)
          : await _apiProvider!.postWithUrl(
              apiBaseUrl! + get_quote_service_provider_api, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        print("${response["message"]}");
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> GetQuoteServExpertApi(
      String listing_id, String enquiry_message) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
        "listing_id": listing_id,
        "enquiry_message": enquiry_message,
      };

      var response = await _apiProvider!.postWithUrl(
          apiBaseUrl! + get_quote_service_expert_listing, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> SendEnquiryApi(String user_id,
      String listing_id, String enquiry_message, bool isFromBlog) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        if (isFromBlog == true) "blog_id": listing_id,
        if (isFromBlog == false) "event_id": listing_id,
        "enquiry_sender_id": user_id,
        "enquiry_message": enquiry_message,
      };

      var response = isFromBlog == true
          ? await _apiProvider!
              .postWithUrl(apiBaseUrl! + enquiry_blog, requestParams)
          : await _apiProvider!
              .postWithUrl(apiBaseUrl! + enquiry_event, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        print("${response["message"]}");
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> GetQuotePlanApi(
      String user_id, String listing_id, String enquiry_message) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "listing_id": listing_id,
        "user_id": user_id,
        "enquiry_message": enquiry_message,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + get_quote_plan, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        print("${response["message"]}");
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> GetQuotePropertyApi(String listing_id, String enquiry_message) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "property_id": listing_id,
        "user_id": sharedPrefs.userID,
        "enquiry_message": enquiry_message,
      };

      var response = await _apiProvider!.postWithUrl(apiBaseUrl! + get_quote_property_listing, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        print("${response["message"]}");
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> ApplyJobApi(
    String user_id,
    String listing_id,
  ) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": user_id,
        "job_id": listing_id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + apply_job, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        print("${response["message"]}");
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getSupportWorkerDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getSupportWorker,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        getSupportData = GetSupportWorkerRegistrationModel.fromJson(response);
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getNewsListapi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getnews_page,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        newsListModel = NewsListModel.fromJson(response);
        newsListData = newsListModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getJobProfDropdownapi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + get_job_profile_dropdwn,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        jobProfDropdownModel = JobProfileDropdownModel.fromJson(response);
        jobPDropData = jobProfDropdownModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getBlogListDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getBlog_post_list,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        blogListModel = BlogListModel.fromJson(response);
        blogListData = blogListModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>>
      getMarketPlaceAllProductListDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getmarket_place_allproduct,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        allProductListModel = MarketPlaceAllProductListModel.fromJson(response);
        marketPlaceAllProductListData = allProductListModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>>
      getMarketPlaceProductForVehicalSaleDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getmarket_place_allvehicles,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        marketPlaceAllVehicalModel =
            MarketPlaceAllVehicalModel.fromJson(response);
        marketPlaceAllVehivalData = marketPlaceAllVehicalModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getEventListDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getEvents_list,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        eventListModel = EventListModel.fromJson(response);
        eventListData = eventListModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getLanguageApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.get(
        apiBaseUrl! + language_list,
      );
      if (kDebugMode) {
        print(response.toString());
      }

      if (response["status"].toString() == "1") {
         languageModel = LanguageModel.fromJson(response);
        language = languageModel.data.languages;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        language = [];
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getVerifyOtpApi(String pinMobile,
      String pinEmail, String emailId_str, String mobile_str) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "email_id": emailId_str,
        "mobile_number": mobile_str,
        "email_otp": pinEmail,
        "mobile_otp": pinMobile,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + verifyOtp, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getHomeDetailsDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getHomePageDetails,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        homePageDetailsModel = HomePageDetailsModel.fromJson(response);
        getHomeDetailsData = homePageDetailsModel.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getHomeAllCategoryDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getHomeAllcategory,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        allCategoryModel = AllCategoryModel.fromJson(response);
        _categoryModelData = allCategoryModel.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getSupportCoordCategoryApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getSupportCoordcategory,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        CategoryDataModel = ScoordinatorCategoryModel.fromJson(response);
        scoordData = CategoryDataModel?.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getHomeSearchApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getSelect_service_list,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        homeSearchModel = HomeSearchModel.fromJson(response);
        homeSearchData = homeSearchModel?.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getJobAllCategoryApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getAllJobscategory,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if ("${response["status"]}" == "1") {
        allJobCategoryModel = AllJobCategoryModel.fromJson(response);
        allJobData = allJobCategoryModel?.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getjobCatDropdownApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + jobscategoryDrop,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if ("${response["status"]}" == "1") {
        jobsDropdownModel = JobsDropdownModel.fromJson(response);
        jobs_Drop_Data = jobsDropdownModel?.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getjobLocationDropdownApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + jobsCityDrop,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if ("${response["status"]}" == "1") {
        locationDropdownModel = LocationDropdownModel.fromJson(response);
        Loc_Drop_Data = locationDropdownModel?.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getNdisServiceCategoryApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithoutParam(
        apiBaseUrl! + getNdisServiceCategory,
      );
      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        NdisCatDataModel = NdisServiceCategoryModel.fromJson(response);
        ndisCatData = NdisCatDataModel?.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getJobDetailsApi(String job_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "job_id": job_id,
      };

      print("checking_job_detail_params__$requestParams");

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + jobmoredetails, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        jobDetailModel = JobDetailsModel.fromJson(response);
        job_Details_Data = jobDetailModel?.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response.toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getMPAllProductDetailsApi(
      String product_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "product_id": product_id,
      };
      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getallproduct_detail, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        allProductDetailsModel = AllProductDetailsModel.fromJson(response);
        allProductDetailsData = allProductDetailsModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getMPPropertyDetailsApi(
      String property_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "property_id": property_id,
      };
      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getaproperty_detail, requestParams);
      if (kDebugMode) {
        print(response.toString());
      }

      if (response["status"].toString() == "1") {
        mpPropertyDetailsModel = MPPropertyDetailsModel.fromJson(response);
        mpPropertyDetailsData = mpPropertyDetailsModel.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> addToCartApi(
      String product_id, String quantity) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
        "product_id": product_id,
        "qty": quantity
      };
      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + market_place_add_to_cart, requestParams);
      if (kDebugMode) {
        print(response.toString());
      }

      if (response["status"].toString() == "1") {
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getMyCartApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + dashboard_my_cart_list, requestParams);
      if (kDebugMode) {
        print(response.toString());
      }

      if (response["status"].toString() == "1") {
        cartListModel = CartListModel.fromJson(response);
        cartData = cartListModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getMPVehicalProductDetailsApi(
      String vehicle_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "vehicle_id": vehicle_id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getallvehicle_detail, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }

      if (response["status"].toString() == "1") {
        mpVehicalDetailsModel = MPVehicalDetailsModel.fromJson(response);
        vehicalDetailsData = mpVehicalDetailsModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getJobListByCatApi(
      String category_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "category_id": category_id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + jobByCat, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        jobListByCatModel = JobListByCatModel.fromJson(response);
        jobByCatData = jobListByCatModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> jobSearchApi(
      String category_id, String lat, String long) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "category": category_id,
        "latitude": "-37.815781",
        "longitude": "144.9529156"
        // "latitude": lat,
        // "longitude": long,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + job_search, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        jobSearchModel = JobSearchDataModel.fromJson(response);
        jobSearchData = jobSearchModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> planManagersApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response =
          await _apiProvider!.postWithoutParam(apiBaseUrl! + plan_managers);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        planManagersModel = PlanManagersModel.fromJson(response);
        planManagerData = planManagersModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> psychoSocialRecoveryApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!
          .postWithoutParam(apiBaseUrl! + psycho_social_recovery_coach);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        psychoSocialModel = PsychoSocialModel.fromJson(response);
        psychoSocialData = psychoSocialModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> advocacySupportOrgApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!
          .postWithoutParam(apiBaseUrl! + specilised_support_coordination);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        advocacySupportModel = AdvocacySupportModel.fromJson(response);
        advocacySupportData = advocacySupportModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getFindSupportApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response =
          await _apiProvider!.postWithoutParam(apiBaseUrl! + getfind_supports);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        findSupportModel = FindSupportModel.fromJson(response);
        findSupportListData = findSupportModel?.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response['message'].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getNDISPropertySaleApi(
      String property_type, String cat_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "property_type": property_type,
        "category_id": cat_id
      };

      var response = await _apiProvider!.postWithUrl(
          apiBaseUrl! + getmarket_place_allproperty, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        ndisPropertSaleModel = NDISPropertSaleModel.fromJson(response);
        ndisPropertySaleData = ndisPropertSaleModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getmpCategoryApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response =
          await _apiProvider!.postWithoutParam(apiBaseUrl! + mp_cat_list_url);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        mpCategoryModel = MpCategoryModel.fromJson(response);
        mp_cat_data = mpCategoryModel?.data;

        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getGeneralRegisterApi(
      String firstName,
      String lastName,
      String email_id,
      String mobileNumber,
      String Password,
      String userType,
      String location,
      String latitude,
      String longitude,
      String regionId) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "first_name": firstName,
        "last_name": lastName,
        "email_id": email_id,
        "mobile_number": mobileNumber,
        "password": Password,
        "user_type": userType,
        "location": location,
        "user_latitude": sharedPrefs.userLatitude,
        "user_longitude": sharedPrefs.userLongitude,
        "user_city": sharedPrefs.City,
        "user_state": sharedPrefs.userState,
        "user_country": sharedPrefs.userCountry,
        "user_zip_code": sharedPrefs.postCode,
        "user_address": sharedPrefs.addressLocation,
        "region": regionId
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + general_Registration, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        sharedPrefs.userPwd = Password;
        sharedPrefs.IsLogin = true;
        sharedPrefs.userName = firstName;
        sharedPrefs.userType = userType;
        generalRegisterResponseModel =
            GeneralRegisterResponseModel.fromJson(response);

        sharedPrefs.userName =
            generalRegisterResponseModel!.data.generalRegistration.firstName;
        sharedPrefs.userID =
            generalRegisterResponseModel!.data.generalRegistration.userId;
        sharedPrefs.userRegisterDate =
            generalRegisterResponseModel!.data.generalRegistration.userCdt;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> registerNDISServiceExpertUserApi(
      String firstName,
      String lastName,
      String email_id,
      String mobileNumber,
      String Password,
      String userType,
      String location,
      String latitude,
      String longitude,
      String regionId) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "first_name": firstName,
        "last_name": lastName,
        "email_id": email_id,
        "mobile_number": mobileNumber,
        "password": Password,
        "user_type": userType,
        "location": location,
        "user_latitude": sharedPrefs.userLatitude,
        "user_longitude": sharedPrefs.userLongitude,
        "user_city": sharedPrefs.City,
        "user_state": sharedPrefs.userState,
        "user_country": sharedPrefs.userCountry,
        "user_zip_code": sharedPrefs.postCode,
        "user_address": sharedPrefs.addressLocation,
        "region": regionId
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + NDIS_registration, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        sharedPrefs.IsLogin = true;
        sharedPrefs.userType = userType;
        sharedPrefs.userName = firstName;
        sharedPrefs.userPwd = Password;
        ndisServiceExpertRegistResponseModel =
            NdisRegistrationResponseModel.fromJson(response);
        print("user Id" +
            ndisServiceExpertRegistResponseModel!.data.NDISRegistration.userId);
        sharedPrefs.userID =
            ndisServiceExpertRegistResponseModel!.data.NDISRegistration.userId;
        sharedPrefs.userRegisterDate =
            ndisServiceExpertRegistResponseModel!.data.NDISRegistration.userCdt;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> participantRegistrationApi(
      {required String firstname,
      required String lastName,
      required String emailId,
      required String mobilenumber,
      required String password,
      required String usertype,
      required String ndisPlanManaged,
      required String worklocation,
      required String relationWparticipant,
      required String partiFirstName,
      required String partiLastName,
      required String ageRange,
      required String prefContactMethod,
      required String partiIdentify,
      required String languageSpoken,
      required String interpreterRequired,
      required String NdisNumber,
      required String wnServices}) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "first_name": firstname,
        "last_name": lastName,
        "email_id": emailId,
        "mobile_number": mobilenumber,
        "password": password,
        "user_type": usertype,
        "n_p_managed": ndisPlanManaged,
        "service_location": worklocation,
        "relation_w_p": relationWparticipant,
        "p_first_name": partiFirstName,
        "p_last_name": partiLastName,
        "age_range": ageRange,
        "p_contact_method": prefContactMethod,
        "p_identify_as": partiIdentify,
        "language_spoken": languageSpoken,
        "interpreter_r": interpreterRequired,
        "ndis_number": NdisNumber,
        "w_n_services": wnServices,
        "user_latitude": sharedPrefs.userLatitude,
        "user_longitude": sharedPrefs.userLongitude,
        "user_address": sharedPrefs.serviceLocation,
        "user_city": sharedPrefs.City,
        "user_country": sharedPrefs.userCountry,
        "user_state": sharedPrefs.userState,
        "user_zip_code": sharedPrefs.postCode,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + participant_Registration, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        sharedPrefs.IsLogin = true;
        print(password);
        sharedPrefs.userPwd = password;
        sharedPrefs.userType = usertype;
        participantResponseData = ParticipantResponseData.fromJson(response);
        sharedPrefs.participantUserResponseData = jsonEncode(response);
        sharedPrefs.userID =
            participantResponseData!.data.participantUser.userId;
        participantResponseData!.data.participantUser.firstName;
        participantResponseData!.data.participantUser.lastName;
        sharedPrefs.userName =
            participantResponseData!.data.participantUser.firstName;
        sharedPrefs.userRegisterDate =
            participantResponseData!.data.participantUser.userCdt;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        sharedPrefs.userName = "";
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> participantUpdateApi(
      {
      required String mobilenumber,
      // required String password,
      required String userFb,
      required String userTwt,
      required String userYt,
      required String userWeb,
      required String oldPassword,
      required String ndisPlanManaged,
      required String relationWparticipant,
      required String ageRange,
      required String pageRange,
      required String prefContactMethod,
      required String partiIdentify,
      required String languageSpoken,
      required String interpreterRequired,
      required String NdisNumber,
      required String pFirstName,
      required String pLastName,
      required String region,
      required String wnServices,
      required String userLatitude,
      required String userLongitude,
      required String serviceLocation,
      required String serviceCity,
      required String serviceState,
      required String serviceCountry,
      required String serviceZip,
      required String serviceLat,
      required String serviceLng,
      required String userCity,
      required String userState,
      required String userAddress,
      required String userPost,
      required String userCountry,
      required String profile_id_proof,
      required String profile_id_proof_old,
      required String cover_image,
      required String cover_imageOld,
      required String profileimage,
      required String profileimageOld,
      }) async {
    NetworkApiCallState<bool> apiCallState;
    try {

      Map<String, dynamic> requestParams =
      {
        "user_id": sharedPrefs.userID,
        "mobile_number": mobilenumber,
        "user_address": userAddress,
        "user_city": userCity,
        "user_state": userState,
        "user_country": userCountry,
        "user_zip_code": userPost,
        "user_latitude": userLatitude,
        "user_longitude": userLongitude,
        "password_old": oldPassword,
        // "password": password ,
        "user_facebook": userFb,
        "user_twitter": userTwt,
        "user_youtube": userYt,
        "user_website": userWeb,
        "profile_image_old": profileimageOld,
        "cover_photo_old": cover_imageOld,
        "profile_id_proof_old": profile_id_proof_old,
        "profile_image": profileimage,
        "cover_image": cover_image,
        "profile_id_proof": profile_id_proof,
        "w_n_services": wnServices,
        "p_age_range": pageRange,
        "n_p_managed": ndisPlanManaged,
        "service_location": serviceLocation,
        "participant_city": serviceCity,
        "participant_state": serviceState,
        "participant_country": serviceCountry,
        "participant_zip_code": serviceZip,
        "participant_latitude": serviceLat,
        "participant_longitude": serviceLng,
        "relation_w_p": relationWparticipant,
        "age_range": ageRange,
        "p_contact_method": prefContactMethod,
        "p_identify_as": partiIdentify,
        "language_spoken": languageSpoken,
        "interpreter_r": interpreterRequired,
        "ndis_number": NdisNumber,
        "p_first_name": pFirstName,
        "p_last_name": pLastName,
        "region": region,
        "user_type": 'Participant',
      };

      log("requestParams-for-participant--------${requestParams}");

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + participant_profile_update, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        sharedPrefs.IsLogin = true;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        sharedPrefs.userName = "";
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> CreateJobProfileApi({
    required String id,
    required String resumeImage,
    required String profileImage,
    required String coverImage,
    required String skillSet,
    required String subCatId,
    required String currentCompany,
    required String yOExperience,
    required String noticePeriod,
    required String availTime,
    required String eduQualification,
    required String Exp1,
    required String Exp2,
    required String Exp3,
    required String Exp4,
    required String Edu1,
    required String Edu2,
    required String Edu3,
    required String Edu4,
    required String Add1,
    required String Add2,
    required String Add3,
    required String Add4,
  }) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "job_profile_resume": resumeImage,
        "user_id": id,
        "job_profile_image": profileImage,
        "cover_image": coverImage,
        "skill_set": skillSet,
        "sub_category_id": subCatId,
        "current_company": currentCompany,
        "years_of_experience": yOExperience,
        "notice_period": noticePeriod,
        "available_time_start": availTime,
        "educational_qualification": eduQualification,
        "experience_1": Exp1,
        "experience_2": Exp2,
        "experience_3": Exp3,
        "experience_4": Exp4,
        "education_1": Edu1,
        "education_2": Edu2,
        "education_3": Edu3,
        "education_4": Edu4,
        "additional_info_1": Add1,
        "additional_info_2": Add2,
        "additional_info_3": Add3,
        "additional_info_4": Add4
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + create_job_profile, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> ChangePasswordApi({
    required String newPassword,
  }) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "new_password": newPassword,
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + change_user_password, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> ChangeMobileApi({
    required String mobile,
  }) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "mobile": mobile,
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + change_user_mobile, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> ChangeEmailApi({
    required String emailId,
  }) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "email": emailId,
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + change_user_email, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> ProfileCountsDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + reviews_listings_following, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        profileCountsModel = ProfileCountsModel.fromJson(response);
        profileCountsData = profileCountsModel?.data;
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> MyDirectLeadsApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + db_enquiry_vehicle, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        directLeadsModel = DirectLeadsModel.fromJson(response);
        directLeadsData = directLeadsModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> NotificationCountApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!.postWithUrl(
          apiBaseUrl! + dashboard_bell_notifications, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        notiCountModel = NotiCountModel.fromJson(response);
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> PostSearchApi(String text) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {"poststring": text};

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + postsearch, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        postSearchModel = PostSearchModel.fromJson(response);
        postSearchData = postSearchModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> MyGenericLeadsApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + db_enquiry, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        genericLeadsModel = GenericLeadsModel.fromJson(response);
        genericLeadData = genericLeadsModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> FollowUnfollowApi(
      String id_to_be_follow) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": id_to_be_follow,
        "sender_user_id": sharedPrefs.userID
      };

      var response = await _apiProvider!.postWithUrl(
          apiBaseUrl! + user_follow_unfollow_button, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> PaymentPlanApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + dashboard_payment_plan, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        paymentsModel = PaymentsModel.fromJson(response);
        paymentData = paymentsModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> SeoListApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + show_seo_list, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        seoListModel = SeoListModel.fromJson(response);
        seoData = seoListModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> AdSummaryApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + paid_ads_list, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        adSummaryModel = AdSummaryModel.fromJson(response);
        adData = adSummaryModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> PromotionsApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + promote_business, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        promotionsModel = PromotionsModel.fromJson(response);
        promotionsData = promotionsModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> invoicesApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + dashboard_payment_invoice, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        invoicesModel = InvoicesModel.fromJson(response);
        invoicesData = invoicesModel?.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> changeProfileSettingApi(
    String? acc_status,
    String? rev_status,
    String? share_status,
    String? pro_status,
  ) async {
    NetworkApiCallState<bool> apiCallState;

    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
        "account_status": acc_status == "Active"
            ? "0"
            : acc_status == "In-Active"
                ? "1"
                : "2",
        "setting_review": rev_status == "Active" ? "0" : "1",
        "setting_share": share_status == "Active" ? "0" : "1",
        "setting_profile_show": pro_status == "Active" ? "0" : "1"
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + change_user_setting, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        apiCallState =
            NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> serviceBookingApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + my_service_bookings, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        serviceBookingsModel = ServiceBookingsModel.fromJson(response);
        serviceBookingsData = serviceBookingsModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> lookingForJobApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!.postWithUrl(apiBaseUrl! + looking_job, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        lookingForJobModel = LookingForJobModel.fromJson(response);
        lookingJobData = lookingForJobModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> appliedJobApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };
      var response = await _apiProvider!
          .post(apiBaseUrl! + all_applied_jobs, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        allAppliedJobModel = AllAppliedJobModel.fromJson(response);
        appliedJobData = allAppliedJobModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> directQueriesApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + my_direct_queries, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        directQueriesModel = DirectQueriesModel.fromJson(response);
        directQeriesData = directQueriesModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> AllReviewsApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + all_sent_receive_reviews, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        allReviewsModel = AllReviewsModel.fromJson(response);
        allReviewsData = allReviewsModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> LikedListApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + like_listing_rows, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        likedListModel = LikedListModel.fromJson(response);
        likedData = likedListModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> NotificationListApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + dashboard_notifications, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        notificationsModel = NotificationsModel.fromJson(response);
        notificationsData = notificationsModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> MyEventApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + my_events, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        myEventsModel = MyEventsModel.fromJson(response);
        myEventData = myEventsModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> GetSettingApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + db_setting_list, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        getSettingModel = GetSettingModel.fromJson(response);
        getSettingData = getSettingModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> FollowingListApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + following_row_list, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        followingsModel = FollowingsModel.fromJson(response);
        followingData = followingsModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> AllUserApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + dashboard_all_users, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        allUserModel = AllUserModel.fromJson(response);
        allUserData = allUserModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> MyOrdersApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + dashboard_orders, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        myOrdersModel = MyOrdersModel.fromJson(response);
        myOrderData = myOrdersModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> OrderHistoryApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + dashboard_order_history, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        orderHistroyModel = OrderHistroyModel.fromJson(response);
        orderHistoryData = orderHistroyModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> TransactionHistoryApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + transaction_history, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        transactionHistoryModel = TransactionHistoryModel.fromJson(response);
        transactionHistoryData = transactionHistoryModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> OrderDetailApi(String order_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
        "order_id": order_id
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + dashboard_order_detail, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        orderDetailModel = OrderDetailModel.fromJson(response);
        orderDetailData = orderDetailModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> GeneralUserUpdateApi({
    required String mobilenumber,
    required String passwordOld,
    required String userLatitude,
    required String userLongitude,
    required String serviceLocation,
    required String userCity,
    required String userState,
    required String userCountry,
    required String postCode,
    required String profile_id_proof,
    required String profile_id_proofOld,
    required String cover_image,
    required String cover_imageOld,
    required String profileimage,
    required String profileimageOld,
    required String user_website,
    required String userYoutube,
    required String userFacebook,
    required String userTwitter,
    required String region,
  }) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": sharedPrefs.userID,
        "mobile_number": mobilenumber,
        "region": region,
        "user_city": userCity,
        "user_address": serviceLocation,
        "user_state": userState,
        "user_country": userCountry,
        "user_zip_code": postCode,
        "user_latitude": userLatitude,
        "user_longitude": userLongitude,
        "password_old": passwordOld ,
        "user_facebook": userFacebook,
        "user_twitter": userTwitter,
        "user_youtube": userYoutube,
        "user_website": user_website,
        "profile_image_old": profileimageOld,
        "cover_photo_old": cover_imageOld,
        "profile_id_proof_old": profile_id_proofOld,
        "profile_image": profileimage,
        "cover_image": cover_image,
        "profile_id_proof": profile_id_proof,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + general_profile_update, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> NdisServiceExpertUpdateApi({
    required String id,
    required String mobilenumber,
    required String password,
    required String userLatitude,
    required String userLongitude,
    required String serviceLocation,
    required String userCity,
    required String userState,
    required String postCode,
    required String profile_id_proof,
    required String cover_image,
    required String profileimage,
    required String user_website,
    required String userYoutube,
    required String userFacebook,
    required String userTwitter,
  }) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": id,
        "mobile_number": mobilenumber,
        "user_website": user_website,
        "user_youtube": userYoutube,
        "user_twitter": userTwitter,
        "user_facebook": userFacebook,
        "password": password == "" ? sharedPrefs.userPwd : password,
        "password_old": password == "" ? sharedPrefs.userPwd : password,
        "profile_id_proof": profile_id_proof,
        "profile_image": profileimage,
        "cover_image": cover_image,
        "user_address": sharedPrefs.serviceLocation,
        "user_city": sharedPrefs.serviceLocation,
        "user_country": sharedPrefs.serviceLocation,
        "user_state": sharedPrefs.serviceLocation,
        "user_zip_code": sharedPrefs.serviceLocation,
        "user_latitude": sharedPrefs.serviceLocation,
        "user_longitude": sharedPrefs.serviceLocation,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + ndis_expert_profile_update, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        if (password != "") {
          sharedPrefs.userPwd = password;
        }
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getSupportWorkerRegisterApi(
      Map<String, dynamic>? requestParams) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + supportW_Registration, requestParams!);

      if (kDebugMode) {
        log(response.toString());
      }
      if (response["status"].toString() == "1") {
        sharedPrefs.userType = "Support Worker";
        swWorkerResponseModel =
            SupportWorkerRegistrationResponse.fromJson(response);
        sharedPrefs.userID = swWorkerResponseModel!.data.supportWorker.userId;
        sharedPrefs.userName = swWorkerResponseModel!.data.supportWorker.firstName;
        sharedPrefs.userImage = swWorkerResponseModel!.data.supportWorker.profileImage;
        sharedPrefs.IsLogin = true;
        sharedPrefs.userRegisterDate = swWorkerResponseModel!.data.supportWorker.userCdt;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> SupportWorkerUpdateApi(Map<String, dynamic>? requestParams) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!.postWithUrl(apiBaseUrl! + support_worker_profile_update,
          requestParams!);

      if (kDebugMode) {
        log(response.toString());
      }

      if (response["status"].toString() == "1") {
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> SubCategoryListDetailsApi(
    String category_id,
    String sub_category_id,
  ) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "category_id": category_id,
        "sub_category_id": sub_category_id,
        "user": sharedPrefs.userID
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getAll_listings, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        subCategoryListDetailsModel =
            SubCategoryListDetailsModel.fromJson(response);
        subCatDetailsData = subCategoryListDetailsModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> NewsDetailsApi(
    String news_id,
  ) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "news_id": news_id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getnews_details, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        newDetailModel = NewDetailModel.fromJson(response);
        newsDetailsData = newDetailModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> SupCorrdinatorSubCatAPi(
    String category_id,
    String sub_category_id,
  ) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "category_id": category_id,
        "sub_category_id": sub_category_id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getscoordinator_List, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        supportCorrdinatorSubcatListModel =
            SupportCorrdinatorSubcatListModel.fromJson(response);
        supCorrdinatoreSubCatData = supportCorrdinatorSubcatListModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> BlogDetailsApi(
    String id,
  ) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "id": id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getgetblogpostbyid, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        blogListDetailsModel = BlogListDetailsModel.fromJson(response);
        blogListDetailsData = blogListDetailsModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> EventDetailsApi(
    String id,
  ) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "id": id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getEventstbyid, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        eventListDetailsModel = EventListDetailsModel.fromJson(response);
        eventDetailsData = eventListDetailsModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> SubCategoryDetailsApi(
      String listing_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "listing_id": listing_id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getListings_details, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        serviceDetailsPageModel = ServiceDetailsPageModel.fromJson(response);
        serviceDetailsPageData = serviceDetailsPageModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> ServiceExpertDetailsApi(
      String listing_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "listing_id": listing_id,
      };

      var response = await _apiProvider!.postWithUrl(
          apiBaseUrl! + service_experts_listingDetail, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        expertDetailModel = ExpertDetailModel.fromJson(response);
        expertDetailData = expertDetailModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> SubCoordinatoreDetailsApi(
      String listing_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "listing_id": listing_id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getSubCoordinatoreDetails, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        supportCoordinatorDetailsModel =
            SupportCoordinatorDetailsModel.fromJson(response);
        supportCoordinatorDetailsData = supportCoordinatorDetailsModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> SupportWorkeruserListsApi(
      String supp_cat_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "supp_cat_id": supp_cat_id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getsworker_userListt, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        supportWUserListModel = SupportWUserListModel.fromJson(response);
        supportWorkerUserData = supportWUserListModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> ServiceExpertListsApi(
      String category_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "category_id": category_id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getService_ExpertList, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        serviceExpertListingModel =
            ServiceExpertListingModel.fromJson(response);
        serviceExpertListingData = serviceExpertListingModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> SUpportWorkerDetailsApi(
      String user_id) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "user_id": user_id,
      };

      var response = await _apiProvider!
          .postWithUrl(apiBaseUrl! + getSworker_userdetail, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        supportWorkerDetailsModel =
            SupportWorkerDetailsModel.fromJson(response);
        supportWorkerDetailsData = supportWorkerDetailsModel!.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getAllDropDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response =
          await _apiProvider!.postWithoutParam(apiBaseUrl! + all_drop);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        supWorkProDropModel = SupWorkProDropModel.fromJson(response);
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getRegionDataApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response =
          await _apiProvider!.postWithoutParam(apiBaseUrl! + regionlist);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        regionModelDataList = RegionModelList.fromJson(response);
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getPricingPlanApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response =
          await _apiProvider!.postWithoutParam(apiBaseUrl! + pricingPlan);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        pricingPlanDataModel = PricingPlanDataModel.fromJson(response);
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getAccommodationListApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!
          .postWithoutParam(apiBaseUrl! + getaccommodation_categorylist);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        accommodationHousingListModel =
            AccommodationHousingListModel.fromJson(response);
        accommodationListData = accommodationHousingListModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getSupportWorkerCatListApi() async {
    NetworkApiCallState<bool> apiCallState;
    try {
      var response = await _apiProvider!
          .postWithoutParam(apiBaseUrl! + getsworker_categorylist);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        supportWorkedCatListModel =
            SupportWorkedCatListModel.fromJson(response);
        supportWorkerCatListData = supportWorkedCatListModel.data;
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> LikeUnlikeApi(String? list_id, String? list_user_id,) async {
    NetworkApiCallState<bool> apiCallState;
    try {
      Map<String, dynamic> requestParams = {
        "listing": list_id,
        "user": sharedPrefs.userID,
        "listing_user": list_user_id,
      };

      var response = await _apiProvider!.postWithUrl(apiBaseUrl! + likeUnlikeApi, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }
      if (response["status"].toString() == "1") {
        apiCallState = NetworkApiCallState.completed(true, response["message"].toString());
      } else {
        apiCallState = NetworkApiCallState.error(response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState = NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState = NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  Future<NetworkApiCallState<bool>> getOtpApi(
      String email, String mobilenumber) async {
    NetworkApiCallState<bool> apiCallState;
    try {

      Map<String, dynamic> requestParams = {
        "email_id": email,
        "mobile_number": mobilenumber,
      };
      var response = await _apiProvider!.post(apiBaseUrl! + getOtp, requestParams);

      if (kDebugMode) {
        print(response.toString());
      }

      if (response["status"].toString() == "1") {
        Map<String, dynamic> map = response["data"];
        emailOtp = map["EmailOTP"].toString();
        mobileOtp = map["MobileOTP"].toString();
        apiCallState = NetworkApiCallState.completed(true, response.toString());
      } else {
        apiCallState = NetworkApiCallState.error(
            response["message"].toString(), NetworkErrorType.OTHER);
      }
    } catch (Excep) {
      if (kDebugMode) {
        print('Exception Auth ${Excep.toString()}');
      }
      if (Excep is CustomNetworkException) {
        apiCallState =
            NetworkApiCallState.error(Excep.message, Excep.errorType);
      } else {
        apiCallState =
            NetworkApiCallState.error("Unknown Error", NetworkErrorType.OTHER);
      }
    }
    return apiCallState;
  }

  GetUserProfileData? getUserProfileDataModel() {
    return getUserProfileData ?? null;
  }

  JobProfileDropdownModel? getJobProfileDataModel() {
    return jobProfDropdownModel ?? null;
  }

  ServiceBookingsModel? getServiceBookingsDataModel() {
    return serviceBookingsModel ?? null;
  }

  LookingForJobModel? lookingForJobDataModel() {
    return lookingForJobModel ?? null;
  }

  AllAppliedJobModel? appliedJobDataModel() {
    return allAppliedJobModel ?? null;
  }

  DirectQueriesModel? getDirectQueriesDataModel() {
    return directQueriesModel ?? null;
  }

  AllReviewsModel? getReviewsDataModel() {
    return allReviewsModel ?? null;
  }

  LikedListModel? getLikedListDataModel() {
    return likedListModel ?? null;
  }

  NotificationsModel? getNotiListDataModel() {
    return notificationsModel ?? null;
  }

  OrderDetailModel? getOrderDetailModel() {
    return orderDetailModel ?? null;
  }

  PaymentsModel? getPaymentDataModel() {
    return paymentsModel ?? null;
  }

  SeoListModel? getSeoDataModel() {
    return seoListModel ?? null;
  }

  AdSummaryModel? getAdDataModel() {
    return adSummaryModel ?? null;
  }

  PromotionsModel? getPromotionsDataModel() {
    return promotionsModel ?? null;
  }

  InvoicesModel? getInvoicesDataModel() {
    return invoicesModel ?? null;
  }

  MyOrdersModel? getMyOrderDataModel() {
    return myOrdersModel ?? null;
  }

  OrderHistroyModel? getOrderHistoryDataModel() {
    return orderHistroyModel ?? null;
  }

  TransactionHistoryModel? getTransactionHistoryDataModel() {
    return transactionHistoryModel ?? null;
  }

  AllUserModel? getAllUserDataModel() {
    return allUserModel ?? null;
  }

  FollowingsModel? getFollowingsDataModel() {
    return followingsModel ?? null;
  }

  CartListModel? getCartDataModel() {
    return cartListModel ?? null;
  }

  MyEventsModel? getMyEventDataModel() {
    return myEventsModel ?? null;
  }

  GetSettingModel? getSettingDataModel() {
    return getSettingModel ?? null;
  }

  ProfileCountsModel? getCountsDataModel() {
    return profileCountsModel ?? null;
  }

  DirectLeadsModel? getDirectLeadModel() {
    return directLeadsModel ?? null;
  }

  GenericLeadsModel? getGenericLeadModel() {
    return genericLeadsModel ?? null;
  }

  AccommodationListData? getAccommodationListData() {
    return accommodationListData ?? null;
  }

  NdisRegistrationResponseModel? getNdisExpertRegisterResponseModel() {
    return ndisServiceExpertRegistResponseModel ?? null;
  }

  PricingPlanDataModel? getPricingDataPlanModel() {
    return pricingPlanDataModel ?? null;
  }

  ParticipantResponseData? getParticipantResponseModel() {
    return participantResponseData ?? null;
  }

  GeneralRegisterResponseModel? getGeneralRegisterResponseModel() {
    return generalRegisterResponseModel ?? null;
  }

  GetSupportWorkerRegistrationModel? getSupportWorkerInfoData() {
    return getSupportData ?? null;
  }

  SupWorkProDropModel? getSupportWorkerDropData() {
    return supWorkProDropModel ?? null;
  }

  ParticipantRegistrationData? getParticipateInfoData() {
    return participantRegistrationData ?? null;
  }

  CategoryModelData? getAllcategoryData() {
    return _categoryModelData ?? null;
  }

  ScoordData? getAllSCoordcategoryData() {
    return scoordData ?? null;
  }

  mpCatData? getmpCatData() {
    return mp_cat_data ?? null;
  }

  AllJobData? getAllJobsCategoryData() {
    return allJobData ?? null;
  }

  jobsDropData? getJobsCatDropData() {
    return jobs_Drop_Data ?? null;
  }

  LocDropData? getLocationDropData() {
    return Loc_Drop_Data ?? null;
  }

  NdisServiceCatData? getNdisServiceCatData() {
    return ndisCatData ?? null;
  }

  jobDetailsData? getJobsDetailsData() {
    return job_Details_Data ?? null;
  }

  ExpertDetailModel? getExpertDetailsData() {
    return expertDetailModel ?? null;
  }

  JobSearchDataModel? getJobSearchData() {
    return jobSearchModel ?? null;
  }

  JobByCatData? getJobsListByCatData() {
    return jobByCatData ?? null;
  }

  PlanManagerData? getPlanManCatData() {
    return planManagerData ?? null;
  }

  PsychoSocialModel? getPsychoSocialData() {
    return psychoSocialModel ?? null;
  }

  AdvocacySupportModel? getAdvocacySuppData() {
    return advocacySupportModel ?? null;
  }

  HomeDetailsData? getHomeDetailsAPIData() {
    return getHomeDetailsData ?? null;
  }

  List<Languages>? getLanguageArrayData() {
    return language == [] ? [] : language;
  }

  RegionModelList? getRegionModelData() {
    return regionModelDataList ?? null;
  }

  LanguageModel? getLangModelData() {
    return languageModel ?? null;
  }

  SubCatDetailsData? getSubCatDetailsData() {
    return subCatDetailsData ?? null;
  }

  ServiceDetailsPageData? getServiceDetailsPageData() {
    return serviceDetailsPageData ?? null;
  }

  SupportWorkerRegistrationResponse?
      getSupportWorkerRegistrationResponseData() {
    return swWorkerResponseModel ?? null;
  }

  SupportWorkerCatListData? getSupportWorkerCatListData() {
    return supportWorkerCatListData ?? null;
  }

  SupportWorkerUserData? getsupportWorkerUserData() {
    return supportWorkerUserData ?? null;
  }

  BlogListData? getBlogListData() {
    return blogListData ?? null;
  }

  SupportCoordinatorDetailsData? getSupportCoordinatorDetailsData() {
    return supportCoordinatorDetailsData ?? null;
  }

  EventListData? getEventListData() {
    return eventListData ?? null;
  }

  EventDetailsData? getEventDetailsData() {
    return eventDetailsData ?? null;
  }

  BlogListDetailsData? getBlogListDetailsData() {
    return blogListDetailsData ?? null;
  }

  SupCorrdinatoreSubCatData? getSupCorrdinatoreSubCatData() {
    return supCorrdinatoreSubCatData ?? null;
  }

  NewsListData? getNewsListData() {
    return newsListData ?? null;
  }

  NotiCountModel? getNotiCountData() {
    return notiCountModel ?? null;
  }

  PostSearchModel? getPostSearchData() {
    return postSearchModel ?? null;
  }

  NewsDetailsData? getNewsDetailsData() {
    return newsDetailsData ?? null;
  }

  MarketPlaceAllProductListData? getAllProductListData() {
    return marketPlaceAllProductListData ?? null;
  }

  MarketPlaceAllVehivalData? getMarketPlaceAllVehivalData() {
    return marketPlaceAllVehivalData ?? null;
  }

  NDISPropertySaleData? getNDISPropertySaleData() {
    return ndisPropertySaleData ?? null;
  }

  AllProductDetailsData? getAllProductDetailsData() {
    return allProductDetailsData ?? null;
  }

  VehicalDetailsData? getVehicalDetailsData() {
    return vehicalDetailsData ?? null;
  }

  MpPropertyDetailsData? getMpPropertyDetailsData() {
    return mpPropertyDetailsData ?? null;
  }

  FindSupportListData? getFindSupportListData() {
    return findSupportListData ?? null;
  }

  HomeSearchData? getHomeSearchData() {
    return homeSearchData ?? null;
  }

  ServiceExpertListingData? getServiceExpertListingData() {
    return serviceExpertListingData ?? null;
  }

  SupportWorkerDetailsData? getSupportWorkerDetailsData() {
    return supportWorkerDetailsData ?? null;
  }
}
