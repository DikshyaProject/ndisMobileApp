import 'package:equatable/equatable.dart';
import 'package:ndisparticipant/home/model/blog/post_search_model.dart';
import 'package:ndisparticipant/home/model/find_support/advocacy_support_org_model.dart';
import 'package:ndisparticipant/home/model/find_support/psychosocial_model.dart';
import 'package:ndisparticipant/home/model/home/noti_count_model.dart';
import 'package:ndisparticipant/home/model/jobs/h_all_job_category_model.dart';
import 'package:ndisparticipant/home/model/jobs/job_details_model.dart';
import 'package:ndisparticipant/home/model/jobs/job_list_by_cat_model.dart';
import 'package:ndisparticipant/home/model/jobs/job_search_model.dart';
import 'package:ndisparticipant/home/model/jobs/jobs_dropdown_model.dart';
import 'package:ndisparticipant/home/model/market_place/MpCategoryModel.dart';
import 'package:ndisparticipant/home/model/market_place/cart_list_model.dart';
import 'package:ndisparticipant/home/model/ndis_expert/ndis_service_category_model.dart';
import 'package:ndisparticipant/home/model/ndis_expert/service_expert_detail_model.dart';
import 'package:ndisparticipant/home/model/participant/language_model.dart';
import 'package:ndisparticipant/home/model/plan_managers/plan_manager_list_model.dart';
import 'package:ndisparticipant/home/model/support-coordinator/h_s_coordinator_category_model.dart';
import 'package:ndisparticipant/home/profile_model/sup_work_pro_drop_model.dart';

import '../home.dart';
import '../model/blog/blog_list_model.dart';
import '../model/blog/bloglist_details_model.dart';
import '../model/find_support/find_support_list_model.dart';
import '../model/h_event/eventlist_details_model.dart';
import '../model/h_event/eventlist_model.dart';
import '../model/home/all_category_model.dart';
import '../model/home/home_accommodation_list_model.dart';
import '../model/home/home_details_model.dart';
import '../model/home/service_details_page_model.dart';
import '../model/home/subcategory_listDetails_model.dart';
import '../model/home_search/search_model.dart';
import '../model/market_place/all_product_details_model.dart';
import '../model/market_place/all_product_list_model.dart';
import '../model/market_place/market_place_vehial_list_model.dart';
import '../model/market_place/mp_property_details_model.dart';
import '../model/market_place/mp_vehical_details_model.dart';
import '../model/market_place/ndis_propety_sale.dart';
import '../model/ndis_expert/ndis_expert_services_list.dart';
import '../model/news/news_details_model.dart';
import '../model/news/news_list_mnodel.dart';
import '../model/support-coordinator/support_corrdinator_details_model.dart';
import '../model/support-coordinator/support_corrdinator_subcat_list_model.dart';
import '../model/support_worker/support_worker_cat_list_model.dart';
import '../model/support_worker/support_worker_details.dart';
import '../model/support_worker/support_worker_user_list_model.dart';
import '../profile_model/ad_summary_model.dart';
import '../profile_model/all_applied_job_model.dart';
import '../profile_model/all_reviews_model.dart';
import '../profile_model/all_user_model.dart';
import '../profile_model/followings_model.dart';
import '../profile_model/get_setting_model.dart';
import '../profile_model/get_user_data_response_model.dart';
import '../profile_model/job_profile_dropdown_model.dart';
import '../profile_model/liked_list_model.dart';
import '../profile_model/looking_for_job_model.dart';
import '../profile_model/my_direct_lead_model.dart';
import '../profile_model/my_direct_queries_model.dart';
import '../profile_model/my_events_model.dart';
import '../profile_model/my_generic_lead_model.dart';
import '../profile_model/my_orders_model.dart';
import '../profile_model/my_service_bookings_model.dart';
import '../profile_model/notification_list_model.dart';
import '../profile_model/order_detail_model.dart';
import '../profile_model/order_history_model.dart';
import '../profile_model/payment_invoices_model.dart';
import '../profile_model/payments_model.dart';
import '../profile_model/profile_count_data_model.dart';
import '../profile_model/promotions_model.dart';
import '../profile_model/seo_list_model.dart';
import '../profile_model/transaction_history_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  HomeInitial();

  @override
  List<Object> get props => [];
}

class HomeFindSupportBackState extends HomeState {
  HomeFindSupportBackState();

  @override
  List<Object> get props => [];
}

class HomeMpProductsDetailBackState extends HomeState {
  HomeMpProductsDetailBackState();

  @override
  List<Object> get props => [];
}

class HomeMarketPlaceProductsPageState extends HomeState {
  MarketPlaceAllProductListData? marketPlaceAllProductListData;

  HomeMarketPlaceProductsPageState(this.marketPlaceAllProductListData);

  @override
  List<Object> get props => [marketPlaceAllProductListData!];
}

class HomeMarketPlaceProductForVehicalSaleState extends HomeState {
  MarketPlaceAllVehivalData? marketPlaceAllVehivalData;

  HomeMarketPlaceProductForVehicalSaleState(this.marketPlaceAllVehivalData);

  @override
  List<Object> get props => [marketPlaceAllVehivalData!];
}

class HomeMpProductDetailPageState extends HomeState {
  AllProductDetailsData? allProductDetailsData;
  String productId;

  HomeMpProductDetailPageState(this.allProductDetailsData, this.productId);

  @override
  List<Object> get props =>
      [allProductDetailsData ?? AllProductDetailsData(), productId];
}

class HomeMpVehicalDetailPageState extends HomeState {
  VehicalDetailsData? vehicalDetailsData;

  HomeMpVehicalDetailPageState(this.vehicalDetailsData);

  @override
  List<Object> get props => [vehicalDetailsData!];
}

class HomeMarketPlacePropertySaleState extends HomeState {
  NDISPropertySaleData? ndisPropertySaleData;

  HomeMarketPlacePropertySaleState(this.ndisPropertySaleData);

  @override
  List<Object> get props => [ndisPropertySaleData!];
}

class HomeMyCartPageClickState extends HomeState {
  bool isCheckOut = false;
  String message;
  String screenName;
  CartListModel? cartListModel;

  HomeMyCartPageClickState(
      this.isCheckOut, this.message, this.screenName, this.cartListModel);

  @override
  List<Object> get props =>
      [isCheckOut, message, screenName, cartListModel ?? CartListModel()];
}

class HomeSearchState extends HomeState {
  HomeSearchData? homeSearchData;

  HomeSearchState(this.homeSearchData);

  @override
  List<Object> get props => [homeSearchData!];
}

class HomeMpEventMyCartBackState extends HomeState {
  HomeMpEventMyCartBackState();

  @override
  List<Object> get props => [];
}

class PlaceOrderClickState extends HomeState {
  PlaceOrderClickState();

  @override
  List<Object> get props => [];
}

class HomePlanManagerDetailClickState extends HomeState {
  ServiceDetailsPageData? serviceDetailsPageData;
  String? screen;

  HomePlanManagerDetailClickState(this.serviceDetailsPageData, this.screen);

  @override
  List<Object> get props => [serviceDetailsPageData!, screen ?? ''];
}

class ForgotApiSuccessState extends HomeState {
  late String message;

  ForgotApiSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class ContactSwSuccessState extends HomeState {
  late String message;

  ContactSwSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class GetQuoteSpSuccessState extends HomeState {
  late String message;

  GetQuoteSpSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class GetQuoteScoordSuccessState extends HomeState {
  late String message;

  GetQuoteScoordSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class GetQuoteSerExpertSuccessState extends HomeState {
  late String message;

  GetQuoteSerExpertSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class SendEnquiryBlogSuccessState extends HomeState {
  late String message;

  SendEnquiryBlogSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class GetquotePropSuccessState extends HomeState {
  late String message;

  GetquotePropSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class GetQuotePlanSuccessState extends HomeState {
  late String message;

  GetQuotePlanSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class SendEnquiryEventSuccessState extends HomeState {
  late String message;

  SendEnquiryEventSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class ApplyJobEventSuccessState extends HomeState {
  late String message;

  ApplyJobEventSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class HomeNdisServiceExpertMainListingPageState extends HomeState {
  NdisServiceCatData? categoryModelData;

  HomeNdisServiceExpertMainListingPageState(this.categoryModelData);

  @override
  List<Object> get props => [categoryModelData!];
}

class ResetHomeInitial extends HomeState {
  ResetHomeInitial();

  @override
  List<Object> get props => [];
}

class HomeLoginPageState extends HomeState {
  String screen;
  String? category_name;
  String? category_id;
  String? event_id;
  String? blog_id;
  String? plan_id;

  HomeLoginPageState(this.screen, this.category_name, this.category_id,
      this.event_id, this.blog_id, this.plan_id);

  @override
  List<Object> get props =>
      [screen, category_name!, category_id!, event_id!, blog_id!, plan_id!];
}

class HomeSubCatgoryListDetailsState extends HomeState {
  SubCatDetailsData? subCatDetailsData;
  String? screenType;
  String? cat_name;

  HomeSubCatgoryListDetailsState(this.subCatDetailsData, this.screenType, this.cat_name);

  @override
  List<Object> get props => [subCatDetailsData!, screenType!, cat_name!];
}

class FilterClickState extends HomeState {
  FilterClickState();

  @override
  List<Object> get props => [];
}

class HomeServiceDetailsState extends HomeState {
  ServiceDetailsPageData? serviceDetailsPageData;
  String? screenType;

  HomeServiceDetailsState(this.serviceDetailsPageData, this.screenType);

  @override
  List<Object> get props => [serviceDetailsPageData!, screenType!];
}

class HomeOtpPageState extends HomeState {
  String selectedUserType;
  String? mobileOtp;
  String? emailOtp;
  UserProfileData userProfData;

  HomeOtpPageState(
      this.selectedUserType, this.userProfData, this.mobileOtp, this.emailOtp);

  @override
  List<Object> get props =>
      [selectedUserType, userProfData, mobileOtp!, emailOtp!];
}

class HomeOptStateError extends HomeState {
  String message;

  HomeOptStateError(this.message);

  @override
  List<Object> get props => [message];
}

class HomeParticipantRegisterPageState extends HomeState {
  String userType;
  ParticipantRegistrationData? userInfoData;
  UserProfileData? userProfData;

  HomeParticipantRegisterPageState(
      this.userType, this.userInfoData, this.userProfData);

  @override
  List<Object> get props => [userType, userInfoData!, userProfData!];
}

class HomeHomePageDetailsPageState extends HomeState {
  HomeDetailsData? getHomeDetailsData;

  HomeHomePageDetailsPageState(this.getHomeDetailsData);

  @override
  List<Object> get props => [getHomeDetailsData!];
}

class HomeSupportRegisterPageState extends HomeState {
  String? userType;
  GetSupportWorkerRegistrationModel? supportWorkerInfoData;
  UserProfileData? userProfData;
  List<Languages>? languageArrayData;

  HomeSupportRegisterPageState(
      {this.userType,
      this.supportWorkerInfoData,
      this.userProfData,
      this.languageArrayData});

  @override
  List<Object> get props => [
        userType ?? "",
        supportWorkerInfoData ?? GetSupportWorkerRegistrationModel(),
        userProfData ?? UserProfileData(),
        languageArrayData ?? []
      ];
}

class HomeSupportCongratulationPageState extends HomeState {
  String userType;
  GetSupportWorkerRegistrationModel? supportWorkerInfoData;
  UserProfileData userProfData;

  HomeSupportCongratulationPageState(
      this.userType, this.supportWorkerInfoData, this.userProfData);

  @override
  List<Object> get props => [userType, supportWorkerInfoData!, userProfData];
}

class HomeSignUpPage1State extends HomeState {
  ParticipantRegistrationData? userInfoData;
  RegionModelList? regionModelData;

  HomeSignUpPage1State(this.userInfoData, this.regionModelData);

  @override
  List<Object> get props => [userInfoData!, regionModelData!];
}

class GetRegionState extends HomeState {
  RegionModelList? regionModelData;

  GetRegionState( this.regionModelData);

  @override
  List<Object> get props => [ regionModelData!];
}

class HomePricingPlanState extends HomeState {
  PricingPlanDataModel? pricingDataPlanModel;
  Map<String, dynamic>? requestParams;

  HomePricingPlanState(this.pricingDataPlanModel, this.requestParams);

  @override
  List<Object> get props => [pricingDataPlanModel!, requestParams!];
}

class HomePricingPlanListingPageState extends HomeState {
  List<Features> features;
  PricingPlanDataModel? pricingDataPlanModel;
  Plan plan;
  Map<String, dynamic>? requestParams;

  HomePricingPlanListingPageState(
      this.features, this.pricingDataPlanModel, this.plan, this.requestParams);

  @override
  List<Object> get props =>
      [features, pricingDataPlanModel!, plan, requestParams!];
}

class HomeResetState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLocationSearchPageState extends HomeState {
  String typePage;

  HomeLocationSearchPageState(this.typePage);

  @override
  List<Object> get props => [typePage];
}

class HomeAllCategoryPageState extends HomeState {
  CategoryModelData? categoryModelData;

  HomeAllCategoryPageState(this.categoryModelData);

  @override
  List<Object> get props => [categoryModelData?? CategoryModelData()];
}

class HomeAccommodationHousingState extends HomeState {
  AccommodationListData? accommodationListData;

  HomeAccommodationHousingState(this.accommodationListData);

  @override
  List<Object> get props => [accommodationListData?? AccommodationListData()];
}

class HomeAccommodationHousingforRentState extends HomeState {
  NDISPropertySaleData? ndisPropertySaleData;

  HomeAccommodationHousingforRentState(this.ndisPropertySaleData);

  @override
  List<Object> get props => [ndisPropertySaleData?? NDISPropertySaleData()];
}

class HomeAccommodationHousingforSaleState extends HomeState {
  NDISPropertySaleData? ndisPropertySaleData;

  HomeAccommodationHousingforSaleState(this.ndisPropertySaleData);

  @override
  List<Object> get props => [ndisPropertySaleData!];
}

class HomeAccommodationHousingforholidayState extends HomeState {
  NDISPropertySaleData? ndisPropertySaleData;

  HomeAccommodationHousingforholidayState(this.ndisPropertySaleData);

  @override
  List<Object> get props => [ndisPropertySaleData!];
}

class HomeSupportCoordinatorsPageState extends HomeState {
  ScoordData? categoryModelData;
  String? screenName;

  HomeSupportCoordinatorsPageState(this.categoryModelData, this.screenName);

  @override
  List<Object> get props =>
      [categoryModelData ?? ScoordData(), screenName ?? ''];
}

class ProfileSearchLocationState extends HomeState {
  String? screen;

  ProfileSearchLocationState(this.screen);

  @override
  List<Object> get props => [screen ?? ''];
}

class JobSearchLocationState extends HomeState {
  String? screen;

  JobSearchLocationState(this.screen);

  @override
  List<Object> get props => [screen ?? ''];
}

class HomeSearchLocationCityState extends HomeState {
  HomeSearchLocationCityState();

  @override
  List<Object> get props => [];
}

class HomeNewsListHomeState extends HomeState {
  NewsListData? newsListData;

  HomeNewsListHomeState(this.newsListData);

  @override
  List<Object> get props => [newsListData!];
}

class HomeNotiCountState extends HomeState {
  NotiCountModel? notiCountModel;

  // String? notiCount;
  HomeNotiCountState(this.notiCountModel);

  @override
  List<Object> get props => [notiCountModel!];
}

class PostSearchBtnClickState extends HomeState {
  PostSearchModel? postSearchModel;

  PostSearchBtnClickState(this.postSearchModel);

  @override
  List<Object> get props => [postSearchModel ?? PostSearchModel()];
}

class HomeSupportCoordinatorsListPageState extends HomeState {
  SupCorrdinatoreSubCatData? supCorrdinatoreSubCatData;
  String? screenName;

  HomeSupportCoordinatorsListPageState(
      this.supCorrdinatoreSubCatData, this.screenName);

  @override
  List<Object> get props => [supCorrdinatoreSubCatData!, screenName ?? ""];
}

class HomeSupportCoordinatorsDetailPageState extends HomeState {
  SupportCoordinatorDetailsData? supportCoordinatorDetailsData;
  String? screenName;

  HomeSupportCoordinatorsDetailPageState(
      this.supportCoordinatorDetailsData, this.screenName);

  @override
  List<Object> get props => [supportCoordinatorDetailsData!, screenName ?? ''];
}

class HomeEventsPageBtnClickState extends HomeState {
  EventListData? eventListData;

  HomeEventsPageBtnClickState(this.eventListData);

  @override
  List<Object> get props => [eventListData!];
}

class HomeBlogListPageState extends HomeState {
  BlogListData? blogListData;

  HomeBlogListPageState(this.blogListData);

  @override
  List<Object> get props => [blogListData!];
}

class HomeBlogDetilsPageState extends HomeState {
  BlogListDetailsData? blogListDetailsData;
  String? blogId;

  HomeBlogDetilsPageState(this.blogListDetailsData, this.blogId);

  @override
  List<Object> get props => [blogListDetailsData!, blogId!];
}

class HomeJobsBackState extends HomeState {
  HomeJobsBackState();

  @override
  List<Object> get props => [];
}

class HomeNewsBackState extends HomeState {
  HomeNewsBackState();

  @override
  List<Object> get props => [];
}

class HomeNewsPageClickState extends HomeState {
  NewsListData? newsListData;

  HomeNewsPageClickState(this.newsListData);

  @override
  List<Object> get props => [newsListData!];
}
class ServiceEnquiryState extends HomeState {

  ServiceEnquiryState();

  @override
  List<Object> get props => [];
}

class HomeFindSupportPageState extends HomeState {
  FindSupportListData? findSupportListData;

  HomeFindSupportPageState(this.findSupportListData);

  @override
  List<Object> get props => [findSupportListData!];
}

class HomeServiceExpertDetilsPageState extends HomeState {
  ServiceExpertListingData? serviceExpertListingData;
  String catId;

  HomeServiceExpertDetilsPageState(this.serviceExpertListingData, this.catId);

  @override
  List<Object> get props => [serviceExpertListingData!, catId];
}

class HomeNewsDetilsPageClickState extends HomeState {
  NewsDetailsData? newsDetailsData;
  String? screenType;

  HomeNewsDetilsPageClickState(this.newsDetailsData, this.screenType);

  @override
  List<Object> get props => [newsDetailsData!, screenType!];
}

class HomeEventsDetailPageClickState extends HomeState {
  EventDetailsData? eventDetailsData;
  String? eventId;
  String? screenType;

  HomeEventsDetailPageClickState(
      this.eventDetailsData, this.eventId, this.screenType);

  @override
  List<Object> get props => [eventDetailsData!, eventId!, screenType!];
}

class HomeJobsPageState extends HomeState {
  AllJobData? allJobData;
  jobsDropData? jobs_Drop_Data;

  HomeJobsPageState(
    this.allJobData,
    this.jobs_Drop_Data,
  );

  @override
  List<Object> get props => [
        allJobData ?? AllJobData(),
        jobs_Drop_Data ?? jobsDropData(),
      ];
}

class HomeSupportWorkerPageState extends HomeState {
  SupportWorkerCatListData? supportWorkerCatListData;
  String? screenName;

  HomeSupportWorkerPageState(this.supportWorkerCatListData, this.screenName);

  @override
  List<Object> get props => [supportWorkerCatListData!, screenName ?? ''];
}

class HomeSupportWorkerSubCategoryPageState extends HomeState {
  SupportWorkerUserData? supportWorkerUserData;
  String? screenName;
  String? supp_cat_id;

  HomeSupportWorkerSubCategoryPageState(
      this.supportWorkerUserData, this.screenName, this.supp_cat_id);

  @override
  List<Object> get props =>
      [supportWorkerUserData!, screenName ?? '', supp_cat_id ?? ''];
}

class HomeSupportWorkerServiceDetailsPageState extends HomeState {
  SupportWorkerDetailsData? supportWorkerDetailsData;
  String? screenName;

  HomeSupportWorkerServiceDetailsPageState(
      this.supportWorkerDetailsData, this.screenName);

  @override
  List<Object> get props => [supportWorkerDetailsData!, screenName ?? ''];
}

class HomeRentPropertyDetailsState extends HomeState {
  HomeRentPropertyDetailsState();

  @override
  List<Object> get props => [];
}

class HomeMpPropertyDetailsState extends HomeState {
  MpPropertyDetailsData? mpPropertyDetailsData;

  HomeMpPropertyDetailsState(this.mpPropertyDetailsData);

  @override
  List<Object> get props => [mpPropertyDetailsData!];
}

class HomeAccommodationPropertyDetailsState extends HomeState {
  MpPropertyDetailsData? mpPropertyDetailsData;

  HomeAccommodationPropertyDetailsState(this.mpPropertyDetailsData);

  @override
  List<Object> get props => [mpPropertyDetailsData!];
}

class HomeAddressSearchPageState extends HomeState {
  String typePage;
  UserProfileData userProfData;
  String selectedUserType;
  ParticipantRegistrationData? participateInfoData;

  HomeAddressSearchPageState(this.typePage, this.userProfData,
      this.selectedUserType, this.participateInfoData);

  @override
  List<Object> get props =>
      [typePage, userProfData, selectedUserType, participateInfoData!];
}

class ServiceEnquiryAddressbtnClickState extends HomeState {
  String typePage;
  ServiceEnquiryAddressbtnClickState(this.typePage);

  @override
  List<Object> get props => [typePage];
}

class HomeerrorloadingState extends HomeState {
  late String message;

  HomeerrorloadingState(this.message);

  @override
  List<Object> get props => [message];
}

class LikeUnlikeSuccessState extends HomeState {
  LikeUnlikeSuccessState();

  @override
  List<Object> get props => [];
}

class ApplyJoberrorState extends HomeState {
  late String message;

  ApplyJoberrorState(this.message);

  @override
  List<Object> get props => [message];
}

class HomeBillingPageState extends HomeState {
  HomeBillingPageState();

  @override
  List<Object> get props => [];
}

class HomeEventsJobsSubcategoryPageState extends HomeState {
  JobByCatData? jobsByCatData;
  String? category_name;
  String? category_id;

  HomeEventsJobsSubcategoryPageState(
      {this.jobsByCatData, this.category_name, this.category_id});

  @override
  List<Object> get props => [jobsByCatData ?? JobByCatData()];
}

class HomeServiceDetailsClickState extends HomeState {
  ExpertDetailModel? expertDetailModel;

  HomeServiceDetailsClickState(this.expertDetailModel);

  @override
  List<Object> get props => [expertDetailModel ?? ExpertDetailModel()];
}

class ServiceExpertDetailBackState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeJobsSearchState extends HomeState {
  JobSearchDataModel? jobSearchDataModel;

  HomeJobsSearchState(this.jobSearchDataModel);

  @override
  List<Object> get props => [jobSearchDataModel ?? JobSearchDataModel()];
}

class JobSubCatBackState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeEventsJobsSubcategoryPageresetState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeEventsJobsDetailsPageState extends HomeState {
  jobDetailsData? detailData;
  String? screen;

  HomeEventsJobsDetailsPageState({this.detailData, this.screen});

  @override
  List<Object> get props => [detailData ?? jobDetailsData(), screen ?? ""];
}

class HomeEventsJobsDetailsPageResetState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomePlanManagersBtnClickState extends HomeState {
  PlanManagerData? planManagerData;
  String? screenName;

  HomePlanManagersBtnClickState(this.planManagerData, this.screenName);

  @override
  List<Object> get props => [planManagerData!, screenName ?? ''];
}

class HomePsychosocialBtnClickState extends HomeState {
  PsychoSocialModel? psychoSocialModel;

  HomePsychosocialBtnClickState(this.psychoSocialModel);

  @override
  List<Object> get props => [psychoSocialModel ?? PsychoSocialModel()];
}

class PsychosocialDetailBtnClickState extends HomeState {
  SupportCoordinatorDetailsData? supportCoordinatorDetailsData;

  PsychosocialDetailBtnClickState(this.supportCoordinatorDetailsData);

  @override
  List<Object> get props =>
      [supportCoordinatorDetailsData ?? SupportCoordinatorDetailsData()];
}

class AdvocacyDetailBtnClickState extends HomeState {
  SupportCoordinatorDetailsData? supportCoordinatorDetailsData;

  AdvocacyDetailBtnClickState(this.supportCoordinatorDetailsData);

  @override
  List<Object> get props =>
      [supportCoordinatorDetailsData ?? SupportCoordinatorDetailsData()];
}

class AdvocacySupportBtnClickState extends HomeState {
  AdvocacySupportModel? advocacySupportModel;

  AdvocacySupportBtnClickState(this.advocacySupportModel);

  @override
  List<Object> get props => [advocacySupportModel ?? AdvocacySupportModel()];
}

class HomeMarketPlaceBtnClickState extends HomeState {
  mpCatData? mp_Cat_Data;

  HomeMarketPlaceBtnClickState(this.mp_Cat_Data);

  @override
  List<Object> get props => [mp_Cat_Data!];
}

//////// profile /////////////
class ProfileInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class JobProfileClickState extends HomeState {
  JobProfileDropdownModel? jobProfDropdownModel;

  JobProfileClickState(this.jobProfDropdownModel);

  @override
  List<Object> get props => [jobProfDropdownModel!];
}

class FollowUnfollowState extends HomeState {
  String? message;

  FollowUnfollowState(this.message);

  @override
  List<Object> get props => [message!];
}


class FollowUnfollowResetState extends HomeState {
  FollowUnfollowResetState();

  @override
  List<Object> get props => [];
}

class PaymentsClickState extends HomeState {
  PaymentsModel? paymentsModel;

  PaymentsClickState(this.paymentsModel);

  @override
  List<Object> get props => [paymentsModel ?? PaymentsModel()];
}

class SeoClickState extends HomeState {
  SeoListModel? seoListModel;

  SeoClickState(this.seoListModel);

  @override
  List<Object> get props => [seoListModel ?? SeoListModel()];
}

class AdSummaryState extends HomeState {
  AdSummaryModel? adSummaryModel;

  AdSummaryState(this.adSummaryModel);

  @override
  List<Object> get props => [adSummaryModel ?? AdSummaryModel()];
}

class PromotionsState extends HomeState {
  PromotionsModel? promotionsModel;

  PromotionsState(this.promotionsModel);

  @override
  List<Object> get props => [promotionsModel ?? PromotionsModel()];
}

class PaymentInvoiceState extends HomeState {
  InvoicesModel? invoicesModel;

  PaymentInvoiceState(this.invoicesModel);

  @override
  List<Object> get props => [invoicesModel ?? InvoicesModel()];
}

class ProfileViewParticipantPageState extends HomeState {
  GetUserProfileData? userProfileDataModel;
  ParticipantRegistrationData? participateInfoData;
  SupWorkProDropModel? allDropData;

  ProfileViewParticipantPageState(
    this.userProfileDataModel,
    this.participateInfoData,
    this.allDropData,
  );

  @override
  List<Object> get props => [userProfileDataModel! ,participateInfoData!, allDropData!];
}

class ProfileViewGeneralPageState extends HomeState {
  GetUserProfileData? userProfileDataModel;
  SupWorkProDropModel? allDropData;

  ProfileViewGeneralPageState(this.userProfileDataModel, this.allDropData);

  @override
  List<Object> get props => [userProfileDataModel!, allDropData!];
}

class ProfileSearchLocationPageState extends HomeState {
  String? screen;

  ProfileSearchLocationPageState(this.screen);

  @override
  List<Object> get props => [screen!];
}

class ParticipantSearchLocationState extends HomeState {
  String? screen;

  ParticipantSearchLocationState(this.screen);

  @override
  List<Object> get props => [screen!];
}
class FilterSearchLocationState extends HomeState {
  String? screen;

  FilterSearchLocationState(this.screen);

  @override
  List<Object> get props => [screen!];
}


class ProfileViewServiceExpertPageState extends HomeState {
  GetUserProfileData? userProfileDataModel;

  ProfileViewServiceExpertPageState(this.userProfileDataModel);

  @override
  List<Object> get props => [userProfileDataModel!];
}

class ProfileUserDataPageErrorState extends HomeState {
  String? message;

  ProfileUserDataPageErrorState(this.message);

  @override
  List<Object> get props => [message!];
}

class ProfileErrorState extends HomeState {
  String? message;

  ProfileErrorState(this.message);

  @override
  List<Object> get props => [message!];
}

class ChangeSettingState extends HomeState {
  String? message;

  ChangeSettingState(this.message);

  @override
  List<Object> get props => [message!];
}

class ChangePasswordSuccessState extends HomeState {
  String? message;

  ChangePasswordSuccessState(this.message);

  @override
  List<Object> get props => [message!];
}

class ChangeMobileSuccessState extends HomeState {
  String? message;

  ChangeMobileSuccessState(this.message);

  @override
  List<Object> get props => [message!];
}

class ChangeEmailSuccessState extends HomeState {
  String? message;

  ChangeEmailSuccessState(this.message);

  @override
  List<Object> get props => [message!];
}

class ProfileReviewCountState extends HomeState {
  ProfileCountsModel? profileCountsModel;

  ProfileReviewCountState(this.profileCountsModel);

  @override
  List<Object> get props => [profileCountsModel ?? ProfileCountsModel()];
}

class MyDirectLeadState extends HomeState {
  DirectLeadsModel? directLeadsModel;

  MyDirectLeadState(this.directLeadsModel);

  @override
  List<Object> get props => [directLeadsModel ?? DirectLeadsModel()];
}

class MyGenericLeadState extends HomeState {
  GenericLeadsModel? genericLeadsModel;

  MyGenericLeadState(this.genericLeadsModel);

  @override
  List<Object> get props => [genericLeadsModel ?? GenericLeadsModel()];
}

class AllAppliedJobClickState extends HomeState {
  AllAppliedJobModel? allAppliedJobModel;

  AllAppliedJobClickState(this.allAppliedJobModel);

  @override
  List<Object> get props => [allAppliedJobModel ?? AllAppliedJobModel()];
}

class LookingForJobClickState extends HomeState {
  LookingForJobModel? lookingForJobModel;

  LookingForJobClickState(this.lookingForJobModel);

  @override
  List<Object> get props => [lookingForJobModel ?? LookingForJobModel()];
}

class ReviewPageClickState extends HomeState {
  AllReviewsModel? allReviewsModel;

  ReviewPageClickState(this.allReviewsModel);

  @override
  List<Object> get props => [allReviewsModel ?? AllReviewsModel()];
}

class LikedListingClickState extends HomeState {
  LikedListModel? likedListModel;

  LikedListingClickState(this.likedListModel);

  @override
  List<Object> get props => [likedListModel ?? LikedListModel()];
}

class AddListingBtnClickState extends HomeState {
  AddListingBtnClickState();

  @override
  List<Object> get props => [];
}

class ServiceLocationsBtnClickState extends HomeState {
  ServiceLocationsBtnClickState();

  @override
  List<Object> get props => [];
}

class ServicesOfferedBtnClickState extends HomeState {
  ServicesOfferedBtnClickState();

  @override
  List<Object> get props => [];
}

class NotificationClickState extends HomeState {
  String screen;
  // NotificationsModel? notificationsModel;

  NotificationClickState(/*this.notificationsModel*/this.screen);

  @override
  List<Object> get props => [/*notificationsModel ?? NotificationsModel()*/screen];
}

class HowTosClickState extends HomeState {
  HowTosClickState();

  @override
  List<Object> get props => [];
}

class MyEventsClickState extends HomeState {
  MyEventsModel? myEventsModel;

  MyEventsClickState(this.myEventsModel);

  @override
  List<Object> get props => [myEventsModel ?? MyEventsModel()];
}

class SettingClickState extends HomeState {
  GetSettingModel? getSettingModel;

  SettingClickState(this.getSettingModel);

  @override
  List<Object> get props => [getSettingModel ?? GetSettingModel()];
}

class ChangePasswordClickState extends HomeState {
  ChangePasswordClickState();

  @override
  List<Object> get props => [];
}

class ChangeEmailClickState extends HomeState {
  ChangeEmailClickState();

  @override
  List<Object> get props => [];
}

class ChangeMobileClickState extends HomeState {
  ChangeMobileClickState();

  @override
  List<Object> get props => [];
}

class MyOrdersClickState extends HomeState {
  MyOrdersModel? myOrdersModel;

  MyOrdersClickState(this.myOrdersModel);

  @override
  List<Object> get props => [myOrdersModel ?? MyOrdersModel()];
}

class OrderHistoryClickState extends HomeState {
  OrderHistroyModel? orderHistroyModel;

  OrderHistoryClickState(this.orderHistroyModel);

  @override
  List<Object> get props => [orderHistroyModel ?? OrderHistroyModel()];
}

class TransactionHistoryClickState extends HomeState {
  TransactionHistoryModel? transactionHistoryModel;

  TransactionHistoryClickState(this.transactionHistoryModel);

  @override
  List<Object> get props =>
      [transactionHistoryModel ?? TransactionHistoryModel()];
}

class OrderDetailClickState extends HomeState {
  OrderDetailModel? orderDetailModel;
  String screenName;

  OrderDetailClickState(this.orderDetailModel, this.screenName);

  @override
  List<Object> get props =>
      [orderDetailModel ?? OrderDetailModel(), screenName];
}

class AboutUsBtnClickState extends HomeState {
  AboutUsBtnClickState();

  @override
  List<Object> get props => [];
}

class ContactUsBtnClickState extends HomeState {
  ContactUsBtnClickState();

  @override
  List<Object> get props => [];
}

class AllUserClickState extends HomeState {
  AllUserModel? allUserModel;

  AllUserClickState(this.allUserModel);

  @override
  List<Object> get props => [allUserModel ?? AllUserModel()];
}

class FollowingsClickState extends HomeState {
  FollowingsModel? followingsModel;

  FollowingsClickState(this.followingsModel);

  @override
  List<Object> get props => [followingsModel ?? FollowingsModel()];
}

class MyServiceBookingBtnClickState extends HomeState {
  ServiceBookingsModel? serviceBookingsModel;

  MyServiceBookingBtnClickState(this.serviceBookingsModel);

  @override
  List<Object> get props => [serviceBookingsModel ?? ServiceBookingsModel()];
}

class MyDirectQueriesBtnClickState extends HomeState {
  DirectQueriesModel? directQueriesModel;

  MyDirectQueriesBtnClickState(this.directQueriesModel);

  @override
  List<Object> get props => [directQueriesModel ?? DirectQueriesModel()];
}

class ProfileSupportWorkerPageState extends HomeState {
  GetUserProfileData? userProfileDataModel;
  GetSupportWorkerRegistrationModel? supportWorkerInfoData;
  SupWorkProDropModel? allDropData;

  ProfileSupportWorkerPageState(
      this.userProfileDataModel, this.supportWorkerInfoData, this.allDropData,);

  @override
  List<Object> get props => [userProfileDataModel!, supportWorkerInfoData!, allDropData?? SupWorkProDropModel, ];
}
