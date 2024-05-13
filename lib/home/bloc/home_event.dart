import 'package:equatable/equatable.dart';
import 'package:ndisparticipant/home/home.dart';
import 'package:ndisparticipant/home/model/participant/language_model.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeEventHometoLoginBtnClick extends HomeEvent {
  HomeEventHometoLoginBtnClick();

  @override
  List<Object> get props => [];
}

class HomeEventProfileBtnClick extends HomeEvent {
  HomeEventProfileBtnClick();

  @override
  List<Object> get props => [];
}

class EventJobSubCattoLoginBtnClick extends HomeEvent {
  String screenName;
  String? category_name;
  String? category_id;

  EventJobSubCattoLoginBtnClick(
      this.screenName, this.category_name, this.category_id);

  @override
  List<Object> get props => [];
}

class EventAllJobtoLoginBtnClick extends HomeEvent {
  String screenName;

  EventAllJobtoLoginBtnClick(
    this.screenName,
  );

  @override
  List<Object> get props => [];
}

class EventProductDetailtoLoginBtnClick extends HomeEvent {
  String screenName;

  EventProductDetailtoLoginBtnClick(
    this.screenName,
  );

  @override
  List<Object> get props => [];
}

class EventServiceDetailtoLoginBtnClick extends HomeEvent {
  String screenName;

  EventServiceDetailtoLoginBtnClick(
    this.screenName,
  );

  @override
  List<Object> get props => [screenName];
}

class EventSupportWorkerToLoginBtnClick extends HomeEvent {
  String screenName;

  EventSupportWorkerToLoginBtnClick(
    this.screenName,
  );

  @override
  List<Object> get props => [screenName];
}

class EventEventDetailToLoginBtnClick extends HomeEvent {
  String screenName;
  String event_id;

  EventEventDetailToLoginBtnClick(
    this.screenName,
    this.event_id,
  );

  @override
  List<Object> get props => [screenName, event_id];
}

class EventPostSearchBtnClick extends HomeEvent {
  String searchText;

  EventPostSearchBtnClick(
    this.searchText,
  );

  @override
  List<Object> get props => [searchText];
}

class EventBlogDetailToLoginBtnClick extends HomeEvent {
  String screenName;
  String blog_id;

  EventBlogDetailToLoginBtnClick(
    this.screenName,
    this.blog_id,
  );

  @override
  List<Object> get props => [screenName, blog_id];
}

class EventPropDetailToLoginBtnClick extends HomeEvent {
  String screenName;
  String property_id;

  EventPropDetailToLoginBtnClick(
    this.screenName,
    this.property_id,
  );

  @override
  List<Object> get props => [screenName, property_id];
}

class EventAcmPropDetailToLoginBtnClick extends HomeEvent {
  String screenName;
  String property_id;

  EventAcmPropDetailToLoginBtnClick(
    this.screenName,
    this.property_id,
  );

  @override
  List<Object> get props => [screenName, property_id];
}

class EventPlanDetailToLoginBtnClick extends HomeEvent {
  String screenName;
  String plan_id;

  EventPlanDetailToLoginBtnClick(
    this.screenName,
    this.plan_id,
  );

  @override
  List<Object> get props => [screenName, plan_id];
}

class EventSupportCoordToLoginBtnClick extends HomeEvent {
  String screenName;

  EventSupportCoordToLoginBtnClick(
    this.screenName,
  );

  @override
  List<Object> get props => [screenName];
}

class EventPsychoToLoginBtnClick extends HomeEvent {
  String screenName;

  EventPsychoToLoginBtnClick(
    this.screenName,
  );

  @override
  List<Object> get props => [screenName];
}

class EventAdvocacyToLoginBtnClick extends HomeEvent {
  String screenName;

  EventAdvocacyToLoginBtnClick(
    this.screenName,
  );

  @override
  List<Object> get props => [screenName];
}

class EventServExpertToLoginBtnClick extends HomeEvent {
  String screenName;

  EventServExpertToLoginBtnClick(
    this.screenName,
  );

  @override
  List<Object> get props => [screenName];
}

class EventJobDetailtoLoginBtnClick extends HomeEvent {
  String screenName;

  EventJobDetailtoLoginBtnClick(
    this.screenName,
  );

  @override
  List<Object> get props => [screenName];
}

class HomeAllCategoryPageBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeGridNdisServiceExpertBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeAccommodationHousingBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomePlanManagersBtnClick extends HomeEvent {
  String? screenName;

  HomePlanManagersBtnClick(this.screenName);

  @override
  List<Object> get props => [screenName ?? ''];
}

class HomePsychosocialBtnClick extends HomeEvent {
  HomePsychosocialBtnClick();

  @override
  List<Object> get props => [];
}

class PsychosocialDetailBtnClick extends HomeEvent {
  String list_id;

  PsychosocialDetailBtnClick(this.list_id);

  @override
  List<Object> get props => [list_id];
}

class AdvocacyDetailBtnClick extends HomeEvent {
  String list_id;

  AdvocacyDetailBtnClick(this.list_id);

  @override
  List<Object> get props => [list_id];
}

class AdvocacySupportBtnClick extends HomeEvent {
  AdvocacySupportBtnClick();

  @override
  List<Object> get props => [];
}

class HomeMarketPlaceBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class AccommodationHousingRefresh extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeAccommodationHousingforRentBtnClick extends HomeEvent {
  String? property_type;
  String? cat_id;

  HomeAccommodationHousingforRentBtnClick(this.property_type, this.cat_id);

  @override
  List<Object> get props => [property_type!, cat_id!];
}

class HomeAccommodationHousingforSaleBtnClick extends HomeEvent {
  String? property_type;

  HomeAccommodationHousingforSaleBtnClick(this.property_type);

  @override
  List<Object> get props => [property_type!];
}

class HomeAccommodationHousingforholidayBtnClick extends HomeEvent {
  String? property_type;

  HomeAccommodationHousingforholidayBtnClick(this.property_type);

  @override
  List<Object> get props => [property_type!];
}

class HomeSupportCoordinatorPageBtnClick extends HomeEvent {
  String? screenName;

  HomeSupportCoordinatorPageBtnClick(this.screenName);

  @override
  List<Object> get props => [screenName ?? ''];
}

class HomeEventsPageBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeJobsResetEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeJobsPageBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeHomeEventDetailsBackBtnClick extends HomeEvent {
  HomeHomeEventDetailsBackBtnClick();

  @override
  List<Object> get props => [];
}

class HomeEventsDetailPageClick extends HomeEvent {
  String? id;
  String? screenType;

  HomeEventsDetailPageClick(this.id, this.screenType);

  @override
  List<Object> get props => [id!, screenType!];
}

class HomeSupportCoordinatorListClick extends HomeEvent {
  String? category_id;
  String? sub_category_id;
  String? screenName;

  HomeSupportCoordinatorListClick(
      this.category_id, this.sub_category_id, this.screenName);

  @override
  List<Object> get props => [category_id!, sub_category_id!, screenName ?? ''];
}

class HomeMarketPlaceProductsClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeMarketPlaceProductForVehicalSaleClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeMarketPlacePropertySaleClick extends HomeEvent {
  String? property_type;

  HomeMarketPlacePropertySaleClick(this.property_type);

  @override
  List<Object> get props => [property_type!];
}

class HomeNewsListBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeNotificationCountEvent extends HomeEvent {
  HomeNotificationCountEvent();

  @override
  List<Object> get props => [];
}

class HomeEventHomeResetState extends HomeEvent {
  HomeEventHomeResetState();

  @override
  List<Object> get props => [];
}

class HomeSupportCoordinatorDetailClick extends HomeEvent {
  String? listingid;
  String? screenName;

  HomeSupportCoordinatorDetailClick(this.listingid, this.screenName);

  @override
  List<Object> get props => [listingid!, screenName ?? ''];
}

class HomePlanManagerDetailClick extends HomeEvent {
  String listingid;
  String? screen;

  HomePlanManagerDetailClick(this.listingid, this.screen);

  @override
  List<Object> get props => [listingid, screen ?? ''];
}

class HomeSearchLocationCityBtnClick extends HomeEvent {
  String? screen;

  HomeSearchLocationCityBtnClick(this.screen);

  @override
  List<Object> get props => [screen ?? ''];
}

class HomeNewsDetailsBackBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeMpEventMyCartBack extends HomeEvent {
  @override
  List<Object> get props => [];
}

class EventPlaceOrderClick extends HomeEvent {
  EventPlaceOrderClick();

  @override
  List<Object> get props => [];
}

class EventVehicleCheckoutClick extends HomeEvent {
  EventVehicleCheckoutClick();

  @override
  List<Object> get props => [];
}

class EventProductCheckoutClick extends HomeEvent {
  EventProductCheckoutClick();

  @override
  List<Object> get props => [];
}

class HomeEventMyCartPageClick extends HomeEvent {
  bool isCheckOut = false;
  String product_id;
  String quantity;
  String screenName;

  HomeEventMyCartPageClick(
      this.isCheckOut, this.product_id, this.quantity, this.screenName);

  @override
  List<Object> get props => [isCheckOut, product_id, quantity, screenName];
}

class HomeMpProductDetailPageEvent extends HomeEvent {
  String? product_id;

  HomeMpProductDetailPageEvent(this.product_id);

  @override
  List<Object> get props => [product_id!];
}

class HomeMpVehicalDetailPageBtnClick extends HomeEvent {
  String? vehicle_id;

  HomeMpVehicalDetailPageBtnClick(this.vehicle_id);

  @override
  List<Object> get props => [vehicle_id!];
}

class HomeBlogDetilsPageBtnClick extends HomeEvent {
  String? id;

  HomeBlogDetilsPageBtnClick(this.id);

  @override
  List<Object> get props => [id!];
}

class HomeNewsDetilsPageClick extends HomeEvent {
  String? news_id;
  String? screenType;

  HomeNewsDetilsPageClick(this.news_id, this.screenType);

  @override
  List<Object> get props => [news_id!, screenType!];
}

class HomeServiceExpertDetilsPageClick extends HomeEvent {
  String category_id;

  HomeServiceExpertDetilsPageClick(this.category_id);

  @override
  List<Object> get props => [category_id];
}

class HomeBlogListPageListBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeNewsPageClickEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ServiceEnquiryEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeSearchEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeFindSupportPageClickEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventjJobsDetailsBackBtnClick extends HomeEvent {
  String cat_name;
  String cat_id;

  HomeEventjJobsDetailsBackBtnClick(this.cat_name, this.cat_id);

  @override
  List<Object> get props => [];
}

class HomeMpPropertyDetailsBtnClick extends HomeEvent {
  String? property_id;

  HomeMpPropertyDetailsBtnClick(this.property_id);

  @override
  List<Object> get props => [property_id!];
}

class HomeAccommodationPropertyDetailsBtnClick extends HomeEvent {
  String? property_id;

  HomeAccommodationPropertyDetailsBtnClick(this.property_id);

  @override
  List<Object> get props => [property_id!];
}

class HomeSupportWorkerPageBtnClick extends HomeEvent {
  String? screenName;

  HomeSupportWorkerPageBtnClick(this.screenName);

  @override
  List<Object> get props => [screenName ?? ''];
}

class HomeSearchPageBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomePopularServicesBackBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventHomePageDetailsBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventLogintoSignupBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventBackBtnClick extends HomeEvent {
  String? screenName;

  HomeEventBackBtnClick(this.screenName);

  @override
  List<Object> get props => [screenName ?? ''];
}

class HomeEventLoginBackBtnClick extends HomeEvent {
  String? screenName;

  HomeEventLoginBackBtnClick(this.screenName);

  @override
  List<Object> get props => [screenName!];
}

class EventLikeUnlike extends HomeEvent {
  String? listing_id;
  String? listing_user_id;

  EventLikeUnlike(this.listing_id, this.listing_user_id);

  @override
  List<Object> get props => [listing_id!, listing_user_id!];
}
class SerProviderResetEvent extends HomeEvent {
  SerProviderResetEvent();

  @override
  List<Object> get props => [];
}
class FilterClickEvent extends HomeEvent {
  FilterClickEvent();

  @override
  List<Object> get props => [];
}

class HomeEventSupportWorkerSubCatgoryListDetailsBtnClick extends HomeEvent {
  String? supp_cat_id;
  String? screenName;

  HomeEventSupportWorkerSubCatgoryListDetailsBtnClick(
      this.supp_cat_id, this.screenName);

  @override
  List<Object> get props => [supp_cat_id!, this.screenName ?? ''];
}

class HomeEventSupportWorkeMoreDetailsBtnClick extends HomeEvent {
  String? user_id;
  String? screenName;

  HomeEventSupportWorkeMoreDetailsBtnClick(this.user_id, this.screenName);

  @override
  List<Object> get props => [user_id!, screenName ?? ''];
}

class HomeEventServiceDetailsClick extends HomeEvent {
  String listId;

  HomeEventServiceDetailsClick(this.listId);

  @override
  List<Object> get props => [listId];
}

class HomeRentPropertyDetailsBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventsJobsSubcategoryPageClick extends HomeEvent {
  String category_id;
  String category_name;

  HomeEventsJobsSubcategoryPageClick(this.category_id, this.category_name);

  @override
  List<Object> get props => [];
}

class HomeJobsSearchEvent extends HomeEvent {
  String job_cat_id;
  String lat;
  String lng;

  HomeJobsSearchEvent(this.job_cat_id, this.lat, this.lng);

  @override
  List<Object> get props => [job_cat_id, lat, lng];
}

// class HomeEventsJobsSubcategoryBackFromLogin extends HomeEvent {
//   String category_id;
//   String category_name;
//   HomeEventsJobsSubcategoryBackFromLogin(this.category_id, this.category_name);
//   @override
//   List<Object> get props => [category_id, category_name];
// }

class HomeEventsJobsDetailsPageClick extends HomeEvent {
  String job_id;
  String screen;

  HomeEventsJobsDetailsPageClick(this.job_id, this.screen);

  @override
  List<Object> get props => [job_id, screen];
}

class HomeEventSubCatgoryListDetailsBtnClick extends HomeEvent {
  String? category_id;
  String? screen;
  String? cat_name;

  HomeEventSubCatgoryListDetailsBtnClick(this.category_id, this.screen, this.cat_name);

  @override
  List<Object> get props => [category_id!, screen!, cat_name!];
}

class HomeEventBackLocationToSignUp extends HomeEvent {
  String typePage;

  HomeEventBackLocationToSignUp(this.typePage);

  @override
  List<Object> get props => [typePage];
}

class HomeEventBackLocationToSearch extends HomeEvent {
  HomeEventBackLocationToSearch();

  @override
  List<Object> get props => [];
}

class HomeEventServiceDetailsBtnClick extends HomeEvent {
  String? Listingid;
  String? screenType;

  HomeEventServiceDetailsBtnClick(this.Listingid, this.screenType);

  @override
  List<Object> get props => [Listingid!, screenType!];
}

class HomeEventPlanPricingListBtnClick extends HomeEvent {
  List<Features> features;
  PricingPlanDataModel? pricingDataPlanModel;
  Plan plan;
  Map<String, dynamic>? requestParams;

  HomeEventPlanPricingListBtnClick(
      this.features, this.pricingDataPlanModel, this.plan, this.requestParams);

  @override
  List<Object> get props =>
      [features, pricingDataPlanModel!, plan, requestParams!];
}

class HomePricingGetStartedbtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventPlanPricingListBackBtnClick extends HomeEvent {
  // Features features;
  PricingPlanDataModel? pricingDataPlanModel;
  Map<String, dynamic>? requestParams;

  HomeEventPlanPricingListBackBtnClick(this.pricingDataPlanModel);

  @override
  List<Object> get props => [pricingDataPlanModel ?? PricingPlanDataModel()];
}

class HomeEventBackLocationToParticipant extends HomeEvent {
  String typePage;
  String selectedUserType;
  UserProfileData userProfData;
  // GetParticipantRegistrationModel? participateInfoData;
  ParticipantRegistrationData? participateInfoData;

  HomeEventBackLocationToParticipant(this.typePage, this.selectedUserType,
      this.userProfData, this.participateInfoData);

  @override
  List<Object> get props =>
      [typePage, selectedUserType, userProfData, participateInfoData!];
}

class HomeEventSupportWorkerBackbtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventbtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventPricingPlanBackbtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventSupportWorkerBackBtnClick extends HomeEvent {
  String UserType;

  HomeEventSupportWorkerBackBtnClick(this.UserType);

  @override
  List<Object> get props => [UserType];
}

class HomeEventParticipantBackBtnClick extends HomeEvent {
  String UserType;
  UserProfileData userProfData;

  HomeEventParticipantBackBtnClick(this.UserType, this.userProfData);

  @override
  List<Object> get props => [UserType, userProfData];
}

class HomeEventSigupStep1ContinueBtnClick extends HomeEvent {
  String selectedUserType;
  UserProfileData userProfData;

  HomeEventSigupStep1ContinueBtnClick(this.selectedUserType, this.userProfData);

  @override
  List<Object> get props => [selectedUserType, userProfData];
}

class HomeEventLanguageApi extends HomeEvent {}

class HomeEventOtpVerifyToStep2BtnClick extends HomeEvent {
  String UserType;
  String pinEmail;
  String pinMobile;
  String emailId_str;
  String mobile_str;
  UserProfileData? userProfData;

  HomeEventOtpVerifyToStep2BtnClick(this.UserType, this.pinEmail,
      this.pinMobile, this.emailId_str, this.mobile_str, this.userProfData);

  @override
  List<Object> get props =>
      [UserType, pinEmail, pinMobile, emailId_str, mobile_str, userProfData!];
}

class HomeGeneralbtnRegisterButtonClick extends HomeEvent {
  String userType;
  String pinEmail;
  String pinMobile;
  String emailId_str;
  String mobile_str;
  UserProfileData userProfData;

  HomeGeneralbtnRegisterButtonClick(this.userType, this.pinEmail,
      this.pinMobile, this.emailId_str, this.mobile_str, this.userProfData);

  @override
  List<Object> get props =>
      [userType, pinEmail, pinMobile, emailId_str, mobile_str, userProfData];
}

class HomeEventSupportWorkerCongratToSupportPageClick extends HomeEvent {
  String? UserType;
  UserProfileData? userProfData;

  HomeEventSupportWorkerCongratToSupportPageClick(
      this.UserType, this.userProfData);

  @override
  List<Object> get props => [UserType ?? "", userProfData ?? UserProfileData()];
}

class HomeEventOtpVerifyToCongratulationScreenClick extends HomeEvent {
  String UserType;
  UserProfileData userProfData;
  String pinEmail;
  String pinMobile;
  String emailId_str;
  String mobile_str;

  HomeEventOtpVerifyToCongratulationScreenClick(
      this.UserType, this.userProfData, this.pinEmail, this.pinMobile, this.emailId_str, this.mobile_str);

  @override
  List<Object> get props => [UserType, userProfData,pinEmail, pinMobile, emailId_str, mobile_str];
}

class HomeResendOtp extends HomeEvent {
  String otpType;
  String emailId;
  String emailMobile;
  String selectedUserType;
  UserProfileData userProfData;

  HomeResendOtp(this.otpType, this.emailId, this.emailMobile,
      this.selectedUserType, this.userProfData);

  @override
  List<Object> get props =>
      [otpType, emailId, emailMobile, selectedUserType, userProfData];
}

class HomeEventResetHome extends HomeEvent {}

class HomeEventResetOtpPage extends HomeEvent {
  String selectedUserType;
  UserProfileData userProfData;

  HomeEventResetOtpPage(this.selectedUserType, this.userProfData);

  @override
  List<Object> get props => [selectedUserType, userProfData];
}

class HomeEventSignupReset extends HomeEvent {}

class HomeEventJobsSubCategoryBackBtnClick extends HomeEvent {}

class HomeEventLocationbtnClick extends HomeEvent {
  String typePage;

  HomeEventLocationbtnClick(this.typePage);

  @override
  List<Object> get props => [typePage];
}

class HomeEventAddressbtnClick extends HomeEvent {
  String typePage;
  String selectedUserType;
  UserProfileData userProfData;

  HomeEventAddressbtnClick(
      this.typePage, this.selectedUserType, this.userProfData);

  @override
  List<Object> get props => [typePage, selectedUserType, userProfData];
}

class ServiceEnquiryAddressbtnClick extends HomeEvent {
  String typePage;

  ServiceEnquiryAddressbtnClick(this.typePage);

  @override
  List<Object> get props => [typePage];
}

class HomeEventSupportWorkerApiDataClick extends HomeEvent {
  Map<String, dynamic>? requestParams;

  HomeEventSupportWorkerApiDataClick(this.requestParams);

  @override
  List<Object> get props => [requestParams!];
}

class HomeEventLoginBtnClick extends HomeEvent {
  String emailId;
  String pwd;
  String screenName;
  String categoryName;
  String categoryId;
  String eventId;
  String blogId;

  HomeEventLoginBtnClick(this.emailId, this.pwd, this.screenName,
      this.categoryName, this.categoryId, this.eventId, this.blogId);

  @override
  List<Object> get props =>
      [emailId, pwd, screenName, categoryName, categoryId, eventId, blogId];
}

class HomeEventForgotBtnClick extends HomeEvent {
  String emailId;

  HomeEventForgotBtnClick(this.emailId);

  @override
  List<Object> get props => [emailId];
}

class ContactSWBtnClick extends HomeEvent {
  String userId;
  String expertId;
  String enquiryDate;
  String enquiryMessage;
  String enquiryLocation;

  ContactSWBtnClick(this.userId, this.expertId, this.enquiryDate,
      this.enquiryMessage, this.enquiryLocation);

  @override
  List<Object> get props =>
      [userId, expertId, enquiryDate, enquiryMessage, enquiryLocation];
}

class GetQuoteSPBtnClick extends HomeEvent {
  String userId;
  String listingId;
  String enquiryMessage;

  GetQuoteSPBtnClick(
    this.userId,
    this.listingId,
    this.enquiryMessage,
  );

  @override
  List<Object> get props => [userId, listingId, enquiryMessage];
}

class GetQuoteScoordBtnClick extends HomeEvent {
  String userId;
  String listingId;
  String enquiryMessage;

  GetQuoteScoordBtnClick(
    this.userId,
    this.listingId,
    this.enquiryMessage,
  );

  @override
  List<Object> get props => [userId, listingId, enquiryMessage];
}

class GetQuotePsychoBtnClick extends HomeEvent {
  String userId;
  String listingId;
  String enquiryMessage;

  GetQuotePsychoBtnClick(
    this.userId,
    this.listingId,
    this.enquiryMessage,
  );

  @override
  List<Object> get props => [userId, listingId, enquiryMessage];
}

class GetQuoteAdvocacyBtnClick extends HomeEvent {
  String userId;
  String listingId;
  String enquiryMessage;

  GetQuoteAdvocacyBtnClick(
    this.userId,
    this.listingId,
    this.enquiryMessage,
  );

  @override
  List<Object> get props => [userId, listingId, enquiryMessage];
}

class GetQuoteServExpertBtnClick extends HomeEvent {
  String listingId;
  String enquiryMessage;

  GetQuoteServExpertBtnClick(
    this.listingId,
    this.enquiryMessage,
  );

  @override
  List<Object> get props => [listingId, enquiryMessage];
}

class SendEnquiryBlogClick extends HomeEvent {
  String userId;
  String listingId;
  String enquiryMessage;

  SendEnquiryBlogClick(
    this.userId,
    this.listingId,
    this.enquiryMessage,
  );

  @override
  List<Object> get props => [userId, listingId, enquiryMessage];
}

class GetQuotePropClick extends HomeEvent {
  String propId;
  String enquiryMessage;

  GetQuotePropClick(
    this.propId,
    this.enquiryMessage,
  );

  @override
  List<Object> get props => [propId, enquiryMessage];
}

class GetQuotePlanClickEvent extends HomeEvent {
  String userId;
  String listingId;
  String enquiryMessage;

  GetQuotePlanClickEvent(
    this.userId,
    this.listingId,
    this.enquiryMessage,
  );

  @override
  List<Object> get props => [userId, listingId, enquiryMessage];
}

class SendEnquiryEventClick extends HomeEvent {
  String userId;
  String listingId;
  String enquiryMessage;

  SendEnquiryEventClick(
    this.userId,
    this.listingId,
    this.enquiryMessage,
  );

  @override
  List<Object> get props => [userId, listingId, enquiryMessage];
}

class ApplyJobEventClick extends HomeEvent {
  String userId;
  String listingId;

  ApplyJobEventClick(
    this.userId,
    this.listingId,
  );

  @override
  List<Object> get props => [userId, listingId];
}

class HomeEventSupportWorkerToPricingPlanPage extends HomeEvent {
  List<Languages>? languageArrayData;
  UserProfileData userProfData;
  String selectedUserType;
  GetSupportWorkerRegistrationModel? supportWorkerInfoData;
  Map<String, dynamic>? requestParams;

  HomeEventSupportWorkerToPricingPlanPage(
      this.languageArrayData,
      this.userProfData,
      this.selectedUserType,
      this.supportWorkerInfoData,
      this.requestParams);

  @override
  List<Object> get props => [
        languageArrayData!,
        userProfData,
        selectedUserType,
        supportWorkerInfoData!,
        requestParams!
      ];
}

class SupportWorkerUpdateProfileEvent extends HomeEvent {
  Map<String, dynamic>? requestParams;

  SupportWorkerUpdateProfileEvent(this.requestParams);

  @override
  List<Object> get props => [requestParams!];
}

class HomeEventSubmitBtnClick extends HomeEvent {
  String first_name;
  String last_name;
  String emailId;
  String mobile_number;
  String password;
  String user_type;
  String wnServices;
  String ndisp_managed;
  String service_location;
  String relation_w_parti;
  String parti_first_name;
  String parti_last_name;
  String age_range;
  String parti_contact_method;
  String part_identify_as;
  String language_spoken;
  String interpreter_requi;
  String ndisNumber;
  String serviceLatitude;
  String serviceLongitude;

  HomeEventSubmitBtnClick(
      {required this.first_name,
      required this.last_name,
      required this.emailId,
      required this.mobile_number,
      required this.password,
      required this.user_type,
      required this.wnServices,
      required this.ndisp_managed,
      required this.service_location,
      required this.relation_w_parti,
      required this.parti_first_name,
      required this.parti_last_name,
      required this.age_range,
      required this.parti_contact_method,
      required this.part_identify_as,
      required this.language_spoken,
      required this.interpreter_requi,
      required this.ndisNumber,
      required this.serviceLatitude,
      required this.serviceLongitude});

  @override
  List<Object> get props => [
        first_name,
        last_name,
        emailId,
        mobile_number,
        password,
        user_type,
        wnServices,
        ndisp_managed,
        service_location,
        relation_w_parti,
        parti_first_name,
        parti_last_name,
        age_range,
        parti_contact_method,
        part_identify_as,
        language_spoken,
        interpreter_requi,
        ndisNumber,
        serviceLatitude,
        serviceLongitude
      ];
}

class HomeResetEvent extends HomeEvent {
  bool isFromSupWork;

  HomeResetEvent(this.isFromSupWork);
}

/////////////profile//////////////////

class ProfileViewBtnClick extends HomeEvent {
  String userType;

  ProfileViewBtnClick(this.userType);

  @override
  List<Object> get props => [userType];
}

class MyDirectLeadEvent extends HomeEvent {
  MyDirectLeadEvent();

  @override
  List<Object> get props => [];
}

class MyGenericLeadEvent extends HomeEvent {
  MyGenericLeadEvent();

  @override
  List<Object> get props => [];
}

class ProfileReviewCountEvent extends HomeEvent {
  ProfileReviewCountEvent();

  @override
  List<Object> get props => [];
}

class MyServiceBookingBtnClick extends HomeEvent {
  MyServiceBookingBtnClick();

  @override
  List<Object> get props => [];
}

class AddListingBtnClick extends HomeEvent {
  AddListingBtnClick();

  @override
  List<Object> get props => [];
}

class ServicesOfferedBtnClick extends HomeEvent {
  ServicesOfferedBtnClick();

  @override
  List<Object> get props => [];
}

class ServiceLocationsBtnClick extends HomeEvent {
  ServiceLocationsBtnClick();

  @override
  List<Object> get props => [];
}

class AboutUsBtnClick extends HomeEvent {
  AboutUsBtnClick();

  @override
  List<Object> get props => [];
}

class ContactUsBtnClick extends HomeEvent {
  ContactUsBtnClick();

  @override
  List<Object> get props => [];
}

class MyDirectQueriesBtnClick extends HomeEvent {
  MyDirectQueriesBtnClick();

  @override
  List<Object> get props => [];
}

class JobProfileClickEvent extends HomeEvent {
  JobProfileClickEvent();

  @override
  List<Object> get props => [];
}

class AllAppliedJobClickEvent extends HomeEvent {
  AllAppliedJobClickEvent();

  @override
  List<Object> get props => [];
}

class LookingForJobClickEvent extends HomeEvent {
  LookingForJobClickEvent();

  @override
  List<Object> get props => [];
}

class ReviewPageClickEvent extends HomeEvent {
  ReviewPageClickEvent();

  @override
  List<Object> get props => [];
}

class LikedListingClickEvent extends HomeEvent {
  LikedListingClickEvent();

  @override
  List<Object> get props => [];
}

class NotificationClickEvent extends HomeEvent {
  String screen;
  NotificationClickEvent(this.screen);

  @override
  List<Object> get props => [screen];
}

class HowTosClickEvent extends HomeEvent {
  HowTosClickEvent();

  @override
  List<Object> get props => [];
}

class FollowingsClickEvent extends HomeEvent {
  FollowingsClickEvent();

  @override
  List<Object> get props => [];
}

class AllUserClickEvent extends HomeEvent {
  AllUserClickEvent();

  @override
  List<Object> get props => [];
}

class MyEventsClickEvent extends HomeEvent {
  MyEventsClickEvent();

  @override
  List<Object> get props => [];
}

class SettingClickEvent extends HomeEvent {
  SettingClickEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordClickEvent extends HomeEvent {
  ChangePasswordClickEvent();

  @override
  List<Object> get props => [];
}

class ChangeEmailClickEvent extends HomeEvent {
  ChangeEmailClickEvent();

  @override
  List<Object> get props => [];
}

class ChangeMobileClickEvent extends HomeEvent {
  ChangeMobileClickEvent();

  @override
  List<Object> get props => [];
}

class MyOrdersClickEvent extends HomeEvent {
  MyOrdersClickEvent();

  @override
  List<Object> get props => [];
}

class PaymentsClickEvent extends HomeEvent {
  PaymentsClickEvent();

  @override
  List<Object> get props => [];
}

class SeoClickEvent extends HomeEvent {
  SeoClickEvent();

  @override
  List<Object> get props => [];
}

class AdSummaryEvent extends HomeEvent {
  AdSummaryEvent();

  @override
  List<Object> get props => [];
}

class PromotionsEvent extends HomeEvent {
  PromotionsEvent();

  @override
  List<Object> get props => [];
}

class PaymentInvoiceEvent extends HomeEvent {
  PaymentInvoiceEvent();

  @override
  List<Object> get props => [];
}

class OrderHistoryClickEvent extends HomeEvent {
  OrderHistoryClickEvent();

  @override
  List<Object> get props => [];
}

class TransactionHistoryClickEvent extends HomeEvent {
  TransactionHistoryClickEvent();

  @override
  List<Object> get props => [];
}

class OrderDetailClickEvent extends HomeEvent {
  String orderId;
  String screenName;

  OrderDetailClickEvent(this.orderId, this.screenName);

  @override
  List<Object> get props => [orderId, screenName];
}

class ProfileResetEvent extends HomeEvent {
  ProfileResetEvent();

  @override
  List<Object> get props => [];
}

class FollowUnfollowEvent extends HomeEvent {
  String idToBeFollow;

  FollowUnfollowEvent(this.idToBeFollow);

  @override
  List<Object> get props => [idToBeFollow];
}

class ProfileParticipantUpdateBtnClick extends HomeEvent {

  String mobileNumber;
  String user_address;
  String user_city;
  String userState;
  String user_country;
  String user_zip_code;
  String user_latitude;
  String user_longitude;
  // String password;
  String password_old;
  String user_facebook;
  String user_twitter;
  String user_youtube;
  String user_website;
  String profile_image_old;
  String cover_photo_old;
  String profile_id_proof_old;
  String profile_image;
  String cover_image;
  String profile_id_proof;
  String w_n_services;
  String p_age_range;
  String n_p_managed;
  String service_location;
  String participant_city;
  String participant_state;
  String participant_country;
  String participant_zip_code;
  String participant_latitude;
  String participant_longitude;
  String relation_w_p;
  String age_range;
  String p_contact_method;
  String p_identify_as;
  String language_spoken;
  String interpreter_r;
  String ndis_number;
  String p_first_name;
  String p_last_name;
  String aus_region;

  ProfileParticipantUpdateBtnClick(
      {

      required this.p_first_name,
      required this.p_last_name,
      required this.aus_region,
      required this.mobileNumber,
      required this.user_address,
      required this.user_city,
      required this.user_country,
      required this.userState,
      required this.user_zip_code,
      required this.user_latitude,
      required this.user_longitude,
      // required this.password,
      required this.password_old,
      required this.user_facebook,
      required this.user_twitter,
      required this.user_youtube,
      required this.user_website,
      required this.profile_image_old,
      required this.cover_photo_old,
      required this.profile_id_proof_old,

      required this.profile_image,
      required this.cover_image,
      required this.profile_id_proof,
      required this.w_n_services,
      required this.p_age_range,
      required this.n_p_managed,
      required this.service_location,
      required this.participant_city,
      required this.participant_state,
      required this.participant_country,
      required this.participant_zip_code,
      required this.participant_latitude,
      required this.participant_longitude,
      required this.relation_w_p,
      required this.age_range,
      required this.p_contact_method,
      required this.p_identify_as,
      required this.language_spoken,
      required this.interpreter_r,
      required this.ndis_number
      });

  @override
  List<Object> get props => [
        mobileNumber,
    p_first_name,
    p_last_name,
    aus_region,
        user_address,
        user_city,
        user_country,
        userState,
        user_zip_code,
        user_latitude,
        user_longitude,
        // password,
        password_old,
        user_facebook,
        user_twitter,
        user_youtube,
        user_website,
    profile_image_old,
    cover_photo_old,
    profile_id_proof_old,

        profile_image,
        cover_image,
        profile_id_proof,
        w_n_services,
        p_age_range,
        n_p_managed,
        service_location,
        participant_city,
        participant_state,
        participant_country,
        participant_zip_code,
        participant_latitude,
        participant_longitude,
        relation_w_p,
        age_range,
        p_contact_method,
        p_identify_as,
        language_spoken,
        interpreter_r,
        ndis_number
      ];
}

class CreateJobProfileBtnClick extends HomeEvent {
  String job_profile_resume;
  String user_id;
  String job_profile_image;
  String cover_image;
  String skill_set;
  String sub_category_id;
  String current_company;
  String years_of_experience;
  String notice_period;
  String available_time_start;
  String educational_qualification;
  String experience_1;
  String experience_2;
  String experience_3;
  String experience_4;
  String education_1;
  String education_2;
  String education_3;
  String education_4;
  String additional_info_1;
  String additional_info_2;
  String additional_info_3;
  String additional_info_4;

  CreateJobProfileBtnClick({
    required this.job_profile_resume,
    required this.user_id,
    required this.job_profile_image,
    required this.cover_image,
    required this.skill_set,
    required this.sub_category_id,
    required this.current_company,
    required this.years_of_experience,
    required this.notice_period,
    required this.available_time_start,
    required this.educational_qualification,
    required this.experience_1,
    required this.experience_2,
    required this.experience_3,
    required this.experience_4,
    required this.education_1,
    required this.education_2,
    required this.education_3,
    required this.education_4,
    required this.additional_info_1,
    required this.additional_info_2,
    required this.additional_info_3,
    required this.additional_info_4,
  });

  @override
  List<Object> get props => [
        job_profile_resume,
        user_id,
        job_profile_image,
        cover_image,
        skill_set,
        sub_category_id,
        current_company,
        years_of_experience,
        notice_period,
        available_time_start,
        educational_qualification,
        experience_1,
        experience_2,
        experience_3,
        experience_4,
        education_1,
        education_2,
        education_3,
        education_4,
        additional_info_1,
        additional_info_2,
        additional_info_3,
        additional_info_4,
      ];
}

class ChangePasswordBtnClick extends HomeEvent {
  String new_password;

  ChangePasswordBtnClick({
    required this.new_password,
  });

  @override
  List<Object> get props => [
        new_password,
      ];
}

class ChangeMobileBtnClick extends HomeEvent {
  String mobile;

  ChangeMobileBtnClick({
    required this.mobile,
  });

  @override
  List<Object> get props => [
        mobile,
      ];
}

class ChangeEmailBtnClick extends HomeEvent {
  String email;

  ChangeEmailBtnClick({
    required this.email,
  });

  @override
  List<Object> get props => [
        email,
      ];
}

class ProfileParticipantEventBackBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ProfileSuppCoordEventBackBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

// class HomeEventBackBtnClick extends HomeEvent {
//   String? screenName;
//   HomeEventBackBtnClick(this.screenName);
//
//   @override
//   List<Object> get props => [screenName??''];
// }

class ChangeSettingEvent extends HomeEvent {
  String? accountStatus;
  String? reviewStatus;
  String? shareStatus;
  String? profileStatus;

  ChangeSettingEvent(this.accountStatus, this.reviewStatus, this.shareStatus,
      this.profileStatus);

  @override
  List<Object> get props => [
        accountStatus ?? '',
        reviewStatus ?? '',
        shareStatus ?? '',
        profileStatus ?? '',
      ];
}

class ProfileLocationSearchEventBtnClick extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventDashboardPageBack extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ProfileLocationSearchEventBackBtnClick extends HomeEvent {
  String strScreen;

  ProfileLocationSearchEventBackBtnClick(this.strScreen);

  @override
  List<Object> get props => [strScreen];
}

class ProfileNdisExpertUpdateBtnClick extends HomeEvent {
  String userId;
  String mobileNumber;
  String dateOfBirth;
  String userCity;
  String userAddress;
  String userCountry;
  String userState;
  String userzipCode;
  String userLatitude;
  String userLongitude;
  String password;
  String passwordOld;
  String userFacebook;
  String userTwitter;
  String userYoutube;
  String userWebsite;
  String profileImage;
  String coverImage;
  String profileIdProof;

  ProfileNdisExpertUpdateBtnClick(
      {required this.userId,
      required this.mobileNumber,
      required this.dateOfBirth,
      required this.userCity,
      required this.userAddress,
      required this.userCountry,
      required this.userState,
      required this.userzipCode,
      required this.userLatitude,
      required this.userLongitude,
      required this.password,
      required this.passwordOld,
      required this.userFacebook,
      required this.userTwitter,
      required this.userYoutube,
      required this.userWebsite,
      required this.profileImage,
      required this.coverImage,
      required this.profileIdProof});

  @override
  List<Object> get props => [
        userId,
        mobileNumber,
        dateOfBirth,
        userCity,
        userAddress,
        userCountry,
        userState,
        userzipCode,
        userLatitude,
        userLongitude,
        password,
        passwordOld,
        userFacebook,
        userTwitter,
        userYoutube,
        userWebsite,
        profileImage,
        coverImage,
        profileIdProof
      ];
}

class ProfileGeneralUpdateBtnClick extends HomeEvent {
  String mobileNumber;
  String region;
  String userCity;
  String userAddress;
  String userCountry;
  String userState;
  String userzipCode;
  String userLatitude;
  String userLongitude;
  String passwordOld;
  String userFacebook;
  String userTwitter;
  String userYoutube;
  String userWebsite;
  String profileImage;
  String profileImageId;
  String coverImage;
  String coverImageId;
  String profileIdProof;
  String profileIdProofId;

  ProfileGeneralUpdateBtnClick(
      {
      required this.mobileNumber,
      required this.region,
      required this.userCity,
      required this.userAddress,
      required this.userCountry,
      required this.userState,
      required this.userzipCode,
      required this.userLatitude,
      required this.userLongitude,
      required this.passwordOld,
      required this.userFacebook,
      required this.userTwitter,
      required this.userYoutube,
      required this.userWebsite,
      required this.profileImage,
      required this.profileImageId,
      required this.coverImage,
      required this.coverImageId,
      required this.profileIdProof,
      required this.profileIdProofId,
      });

  @override
  List<Object> get props => [
        mobileNumber,
        region,
        userCity,
        userAddress,
        userCountry,
        userState,
        userzipCode,
        userLatitude,
        userLongitude,
        passwordOld,
        userFacebook,
        userTwitter,
        userYoutube,
        userWebsite,
        profileImage,
        profileImageId,
        coverImage,
        coverImageId,
        profileIdProof,
        profileIdProofId
      ];
}

class ProfileEventDashboardPageBack extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ProfileEventBackBtnClick extends HomeEvent {
  String? screenName;

  ProfileEventBackBtnClick(this.screenName);

  @override
  List<Object> get props => [screenName ?? ''];
}
