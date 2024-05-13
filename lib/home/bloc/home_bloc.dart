import 'package:bloc/bloc.dart';
import 'package:ndisparticipant/Helpers/services/services.dart';

import '../../Helpers/utils/enumerations.dart';
import '../../networking/network_api_call_state.dart';
import '../../root/root.dart';
import '../home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserRepository? _userRepository;

  HomeBloc({UserRepository? userRepository}) : super(HomeInitial()) {
    _userRepository = userRepository;
    on<HomeEventResetHome>(mapHistoryListReset);
    on<HomeEventResetOtpPage>(mapHomeEventResetOtpPage);
    on<SupportWorkerUpdateProfileEvent>(mapSupportWorkerUpdateProfileEvent);
    on<HomeEventHometoLoginBtnClick>(mapHomeEventHometoLoginBtnClick);
    on<HomeEventProfileBtnClick>(mapHomeEventProfileBtnClick);
    on<EventJobSubCattoLoginBtnClick>(mapEventJobSubCattoLoginBtnClick);
    on<EventAllJobtoLoginBtnClick>(mapEventAllJobtoLoginBtnClick);
    on<EventProductDetailtoLoginBtnClick>(mapEventProductDetailtoLoginBtnClick);
    on<EventServiceDetailtoLoginBtnClick>(mapEventServiceDetailtoLoginBtnClick);
    on<EventSupportWorkerToLoginBtnClick>(mapEventSupportWorkerToLoginBtnClick);
    on<EventSupportCoordToLoginBtnClick>(mapEventSupportCoordToLoginBtnClick);
    on<EventPsychoToLoginBtnClick>(mapEventPsychoToLoginBtnClick);
    on<EventAdvocacyToLoginBtnClick>(mapEventAdvocacyToLoginBtnClick);
    on<EventServExpertToLoginBtnClick>(mapEventServExpertToLoginBtnClick);
    on<EventEventDetailToLoginBtnClick>(mapEventEventDetailToLoginBtnClick);
    on<EventBlogDetailToLoginBtnClick>(mapEventBlogDetailToLoginBtnClick);
    on<EventPropDetailToLoginBtnClick>(mapEventPropDetailToLoginBtnClick);
    on<EventAcmPropDetailToLoginBtnClick>(mapEventAcmPropDetailToLoginBtnClick);
    on<EventPlanDetailToLoginBtnClick>(mapEventPlanDetailToLoginBtnClick);
    on<EventJobDetailtoLoginBtnClick>(mapEventJobDetailtoLoginBtnClick);
    on<HomeEventLogintoSignupBtnClick>(mapHomeEventLogintoSignupBtnClick);
    on<HomeEventBackBtnClick>(mapHomeEventBackBtnClick);
    on<HomeEventBackLocationToSignUp>(mapHomeEventLocationToSignUp);
    on<HomeEventSigupStep1ContinueBtnClick>(
        mapHomeEventSigupStep1ContinueBtnClick);
    on<HomeEventOtpVerifyToStep2BtnClick>(mapHomeEventOtpVerifyToStep2BtnClick);
    on<HomeEventHomePageDetailsBtnClick>(mapHomeEventHomePageDetailsBtnClick);
    on<HomeAllCategoryPageBtnClick>(mapHomeAllCategoryPageBtnClick);
    on<HomeSupportCoordinatorPageBtnClick>(
        mapHomeSupportCoordinatorPageBtnClick);

    on<HomeSupportCoordinatorListClick>(mapHomeSupportCoordinatorListClick);
    on<HomeSupportCoordinatorDetailClick>(mapHomeSupportCoordinatorDetailClick);
    on<HomeEventsPageBtnClick>(mapHomeEventsPageBtnClick);
    on<HomeEventsDetailPageClick>(mapHomeEventsDetailPageClick);
    on<HomeJobsPageBtnClick>(mapHomeJobsPageBtnClick);
    on<HomeJobsResetEvent>(maHomeJobsResetEvent);

    on<HomePlanManagerDetailClick>(mapHomePlanManagerDetailClick);
    on<HomeMarketPlaceProductsClick>(mapHomeMarketPlaceProductsClick);
    on<HomeMarketPlaceProductForVehicalSaleClick>(
        mapHomeMarketPlaceProductForVehicalSaleClick);
    on<HomeMarketPlacePropertySaleClick>(mapHomeMarketPlacePropertySaleClick);
    on<HomeMpProductDetailPageEvent>(mapHomeMpProductDetailPageEvent);
    on<HomeMpVehicalDetailPageBtnClick>(mapHomeMpVehicalDetailPageBtnClick);
    on<HomeMpPropertyDetailsBtnClick>(mapHomeMpPropertyDetailsBtnClick);
    on<HomeAccommodationPropertyDetailsBtnClick>(
        mapHomeAccommodationPropertyDetailsBtnClick);
    on<HomeEventMyCartPageClick>(mapHomeEventMyCartPageClick);
    on<HomeMpEventMyCartBack>(mapHomeMpEventMyCartBack);
    on<EventPlaceOrderClick>(mapEventPlaceOrderClick);
    on<EventVehicleCheckoutClick>(mapEventVehicleCheckoutClick);
    on<EventProductCheckoutClick>(mapEventProductCheckoutClick);

    on<HomeSupportWorkerPageBtnClick>(mapHomeSupportWorkerPageBtnClick);
    on<EventLikeUnlike>(mapEventLikeUnlike);
    on<SerProviderResetEvent>(mapSerProviderResetEvent);
    on<FilterClickEvent>(mapFilterClickEvent);
    on<HomeEventSupportWorkerSubCatgoryListDetailsBtnClick>(
        mapHomeEventSupportWorkerSubCatgoryListDetailsBtnClick);

    on<HomeEventSupportWorkeMoreDetailsBtnClick>(
        mapHomeEventSupportWorkeMoreDetailsBtnClick);
    on<HomeEventsJobsSubcategoryPageClick>(
        mapHomeEventsJobsSubcategoryPageClick);
    on<HomeJobsSearchEvent>(mapHomeJobsSearchEvent);
    on<HomeEventServiceDetailsClick>(mapHomeEventServiceDetailsClick);
    on<HomeEventsJobsDetailsPageClick>(mapHomeEventsJobsDetailsPageClick);
    on<HomeAccommodationHousingBtnClick>(mapHomeAccommodationHousingBtnClick);
    on<HomePlanManagersBtnClick>(mapHomePlanManagersBtnClick);
    on<HomePsychosocialBtnClick>(mapHomePsychosocialBtnClick);
    on<PsychosocialDetailBtnClick>(mapPsychosocialDetailBtnClick);
    on<AdvocacyDetailBtnClick>(mapAdvocacyDetailBtnClick);
    on<AdvocacySupportBtnClick>(mapAdvocacySupportBtnClick);
    on<HomeMarketPlaceBtnClick>(mapHomeMarketPlaceBtnClick);
    on<AccommodationHousingRefresh>(mapAccommodationHousingRefresh);
    on<HomeEventParticipantBackBtnClick>(mapHomeEventParticipantBackBtnClick);
    on<HomeEventSubmitBtnClick>(mapHomeEventSubmitBtnClick);
    on<HomeEventOtpVerifyToCongratulationScreenClick>(
        mapHomeEventOtpVerifyToCongratulationScreenClick);
    on<HomeEventSupportWorkerCongratToSupportPageClick>(
        mapHomeEventSupportWorkerCongratToSupportPageClick);
    on<HomeEventSupportWorkerBackbtnClick>(
        mapHomeEventSupportWorkerBackbtnClick);
    on<HomeResendOtp>(mapHomeResendOtp);
    on<HomeEventSignupReset>(mapHomeEventSignupReset);
    on<HomeEventLocationbtnClick>(mapHomeEventLocationbtnClick);
    on<HomeEventAddressbtnClick>(mapHomeEventAddressbtnClick);
    on<ServiceEnquiryAddressbtnClick>(mapServiceEnquiryAddressbtnClick);
    on<HomeEventBackLocationToParticipant>(
        mapHomeEventBackLocationToParticipant);
    on<HomeEventSubCatgoryListDetailsBtnClick>(
        mapHomeEventSubCatgoryListDetailsBtnClick);
    on<HomeEventSupportWorkerToPricingPlanPage>(
        mapHomeEventSupportWorkerToPricingPlanPage);
    on<HomeEventPlanPricingListBtnClick>(mapHomeEventPlanPricingListBtnClick);
    on<HomeGeneralbtnRegisterButtonClick>(mapHomeGeneralbtnRegisterButtonClick);
    on<HomeEventPricingPlanBackbtnClick>(mapHomeEventPricingPlanBackbtnClick);
    on<HomeEventPlanPricingListBackBtnClick>(
        mapHomeEventPlanPricingListBackBtnClick);
    on<HomePricingGetStartedbtnClick>(mapHomePricingGetStartedbtnClick);
    on<HomeEventSupportWorkerApiDataClick>(
        mapHomeEventSupportWorkerApiDataClick);
    on<HomeEventLoginBtnClick>(mapHomeEventLoginBtnClick);
    on<HomeEventServiceDetailsBtnClick>(mapHomeEventServiceDetailsBtnClick);
    on<HomeEventForgotBtnClick>(mapHomeEventForgotBtnClick);
    on<ContactSWBtnClick>(mapContactSWBtnClick);
    on<GetQuoteSPBtnClick>(mapGetQuoteSPBtnClick);
    on<GetQuoteScoordBtnClick>(mapGetQuoteScoordBtnClick);
    on<GetQuotePsychoBtnClick>(mapGetQuotePsychoBtnClick);
    on<GetQuoteAdvocacyBtnClick>(mapGetQuoteAdvocacyBtnClick);
    on<GetQuoteServExpertBtnClick>(mapGetQuoteServExpertBtnClick);
    on<SendEnquiryBlogClick>(mapSendEnquiryBlogClick);
    on<GetQuotePropClick>(mapGetQuotePropClick);
    on<GetQuotePlanClickEvent>(mapGetQuotePlanClickEvent);
    on<SendEnquiryEventClick>(mapSendEnquiryEventClick);
    on<ApplyJobEventClick>(mapApplyJobEventClick);
    on<HomeResetEvent>(mapHomeResetEvent);
    on<HomeGridNdisServiceExpertBtnClick>(mapHomeGridNdisServiceExpertBtnClick);
    on<HomeAccommodationHousingforRentBtnClick>(
        mapHomeAccommodationHousingforRentBtnClick);
    on<HomeAccommodationHousingforSaleBtnClick>(
        mapHomeAccommodationHousingforSaleBtnClick);
    on<HomeAccommodationHousingforholidayBtnClick>(
        mapHomeAccommodationHousingforholidayBtnClick);
    on<HomeRentPropertyDetailsBtnClick>(mapHomeRentPropertyDetailsBtnClick);
    on<HomeBlogListPageListBtnClick>(mapHomeBlogListPageListBtnClick);
    on<HomeBlogDetilsPageBtnClick>(mapHomeBlogDetilsPageBtnClick);
    on<HomeNewsPageClickEvent>(mapHomeNewsPageClickEvent);
    on<ServiceEnquiryEvent>(mapServiceEnquiryEvent);
    on<HomeFindSupportPageClickEvent>(mapHomeFindSupportPageClickEvent);
    on<HomeNewsDetilsPageClick>(mapHomeNewsDetilsPageClick);
    on<HomeServiceExpertDetilsPageClick>(mapHomeServiceExpertDetilsPageClick);
    on<HomeNewsListBtnClick>(mapHomeNewsListBtnClick);
    on<HomeSearchEvent>(mapHomeSearchEvent);
    on<HomeSearchLocationCityBtnClick>(mapHomeSearchLocationCityBtnClick);
    on<HomeEventBackLocationToSearch>(mapHomeEventBackLocationToSearch);
    on<HomeEventLoginBackBtnClick>(mapHomeEventLoginBackBtnClick);
    on<HomeSearchPageBtnClick>(mapHomeSearchPageBtnClick);
    on<HomePopularServicesBackBtnClick>(mapHomePopularServicesBackBtnClick);
    on<HomeNewsDetailsBackBtnClick>(mapHomeNewsDetailsBackBtnClick);
    on<HomeHomeEventDetailsBackBtnClick>(mapHomeHomeEventDetailsBackBtnClick);
    on<HomeNotificationCountEvent>(mapHomeNotificationCountEvent);
    on<HomeEventHomeResetState>(mapHomeEventHomeResetState);
    on<EventPostSearchBtnClick>(mapEventPostSearchBtnClick);

    ///// profile //////

    on<ProfileViewBtnClick>(mapProfileViewBtnClick);
    on<MyDirectLeadEvent>(mapMyDirectLeadEvent);
    on<MyGenericLeadEvent>(mapMyGenericLeadEvent);
    on<ProfileReviewCountEvent>(mapProfileReviewCountEvent);
    on<MyServiceBookingBtnClick>(mapMyServiceBookingBtnClick);
    on<AddListingBtnClick>(mapAddListingBtnClick);
    on<ServicesOfferedBtnClick>(mapServicesOfferedBtnClick);
    on<ServiceLocationsBtnClick>(mapServiceLocationsBtnClick);
    on<AboutUsBtnClick>(mapAboutUsBtnClick);
    on<ContactUsBtnClick>(mapContactUsBtnClick);
    on<MyDirectQueriesBtnClick>(mapMyDirectQueriesBtnClick);
    on<JobProfileClickEvent>(mapJobProfileClick);
    on<AllAppliedJobClickEvent>(mapAllAppliedJobClickEvent);
    on<LookingForJobClickEvent>(mapLookingForJobClickEvent);
    on<ReviewPageClickEvent>(mapReviewPageClickEvent);
    on<LikedListingClickEvent>(mapLikedListingClickEvent);
    on<NotificationClickEvent>(mapNotificationClickEvent);
    on<HowTosClickEvent>(mapHowTosClickEvent);
    on<FollowingsClickEvent>(mapFollowingsClickEvent);
    on<AllUserClickEvent>(mapAllUserClickEvent);
    on<MyEventsClickEvent>(mapMyEventsClickEvent);
    on<SettingClickEvent>(mapSettingClickEvent);
    on<ChangePasswordClickEvent>(mapChangePasswordClickEvent);
    on<ChangeEmailClickEvent>(mapChangeEmailClickEvent);
    on<ChangeMobileClickEvent>(mapChangeMobileClickEvent);
    on<OrderDetailClickEvent>(mapOrderDetailClickEvent);
    on<MyOrdersClickEvent>(mapMyOrdersClickEvent);
    on<OrderHistoryClickEvent>(mapOrderHistoryClickEvent);
    on<TransactionHistoryClickEvent>(mapTransactionHistoryClickEvent);
    on<ProfileParticipantUpdateBtnClick>(mapProfileParticipantUpdateBtnClick);
    on<CreateJobProfileBtnClick>(mapCreateJobProfileBtnClick);
    on<ChangePasswordBtnClick>(mapChangePasswordBtnClick);
    on<ChangeMobileBtnClick>(mapChangeMobileBtnClick);
    on<ChangeEmailBtnClick>(mapChangeEmailBtnClick);
    on<ProfileParticipantEventBackBtnClick>(
        mapProfileParticipantEventBackBtnClick);
    on<ProfileSuppCoordEventBackBtnClick>(mapProfileSuppCoordEventBackBtnClick);
    on<ProfileLocationSearchEventBtnClick>(
        mapProfileLocationSearchEventBtnClick);

    on<ProfileNdisExpertUpdateBtnClick>(mapProfileNdisExpertUpdateBtnClick);
    on<ProfileGeneralUpdateBtnClick>(mapProfileGeneralUpdateBtnClick);

    on<ProfileEventDashboardPageBack>(mapProfileEventDashboardPageBack);
    on<ProfileEventBackBtnClick>(mapProfileEventBackBtnClick);
    on<ProfileResetEvent>(mapProfileResetEvent);
    on<FollowUnfollowEvent>(mapFollowUnfollowEvent);
    on<PaymentsClickEvent>(mapPaymentsClickEvent);
    on<SeoClickEvent>(mapSeoClickEvent);
    on<AdSummaryEvent>(mapAdSummaryEvent);
    on<PromotionsEvent>(mapPromotionsEvent);
    on<PaymentInvoiceEvent>(mapPaymentInvoiceEvent);
    on<ChangeSettingEvent>(mapChangeSettingEvent);
  }

  void mapHomeGridNdisServiceExpertBtnClick(
      HomeGridNdisServiceExpertBtnClick event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getNdisServiceCategoryApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeNdisExpertScreen;
      emitter(HomeResetState());
      emitter(HomeNdisServiceExpertMainListingPageState(
          _userRepository!.getNdisServiceCatData()));
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeMarketPlacePropertySaleClick(
      HomeMarketPlacePropertySaleClick event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .getNDISPropertySaleApi(event.property_type.toString(), '');
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeMpProperty2ndScreen;
      emitter(HomeMarketPlacePropertySaleState(
          _userRepository!.getNDISPropertySaleData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeAccommodationHousingforRentBtnClick(
      HomeAccommodationHousingforRentBtnClick event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .getNDISPropertySaleApi(
            event.property_type.toString(), event.cat_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeAccomodation2ndScreen;
      emitter(HomeAccommodationHousingforRentState(
          _userRepository!.getNDISPropertySaleData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeAccommodationHousingforSaleBtnClick(
      HomeAccommodationHousingforSaleBtnClick event,
      Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .getNDISPropertySaleApi(event.property_type.toString(), "");
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(HomeAccommodationHousingforSaleState(
          _userRepository!.getNDISPropertySaleData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeAccommodationHousingforholidayBtnClick(
      HomeAccommodationHousingforholidayBtnClick event,
      Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .getNDISPropertySaleApi(event.property_type.toString(), '');
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(HomeAccommodationHousingforholidayState(
          _userRepository!.getNDISPropertySaleData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeRentPropertyDetailsBtnClick(
      HomeRentPropertyDetailsBtnClick event, Emitter<HomeState> emitter) {
    emitter(HomeRentPropertyDetailsState());
  }

  void mapHomeSearchPageBtnClick(
      HomeSearchPageBtnClick event, Emitter<HomeState> emitter) {}

  void mapHomeEventLoginBackBtnClick(
      HomeEventLoginBackBtnClick event, Emitter<HomeState> emitter) {
    if (event.screenName == "" || event.screenName == null) {
      emitter(HomeInitial());
    } else if (event.screenName == "job_sub_cat") {
      print('state_after_login_success____$state');
      emitter(HomeEventsJobsSubcategoryPageState(
          jobsByCatData: _userRepository?.getJobsListByCatData()));
    } else if (event.screenName == "product_detail") {
      emitter(HomeMpProductDetailPageState(
          _userRepository?.getAllProductDetailsData(), ''));
    } else if (event.screenName == "all_cat_job") {
      emitter(HomeJobsPageState(_userRepository!.getAllJobsCategoryData(),
          _userRepository!.getJobsCatDropData()));
    } else if (event.screenName == ("job_detail")) {
      emitter(HomeEventsJobsDetailsPageState(
          detailData: _userRepository?.getJobsDetailsData()));
    } else if (event.screenName == ("job_detail2")) {
      emitter(HomeEventsJobsDetailsPageState(
          detailData: _userRepository?.getJobsDetailsData()));
    } else if (event.screenName == "service_pro_detail") {
      emitter(HomeServiceDetailsState(
          _userRepository!.getServiceDetailsPageData(), ""));
    } else if (event.screenName == "support_worker_contact") {
      emitter(HomeSupportWorkerSubCategoryPageState(
          _userRepository!.getsupportWorkerUserData(), '', ''));
    } else if (event.screenName == "support_coord_get_quote") {
      emitter(HomeSupportCoordinatorsDetailPageState(
          _userRepository!.getSupportCoordinatorDetailsData(), ''));
    } else if (event.screenName == "service_expert_get_quote") {
      emitter(HomeServiceDetailsClickState(
          _userRepository!.getExpertDetailsData()));
    } else if (event.screenName == "event_detail") {
      emitter(HomeEventsDetailPageClickState(
          _userRepository!.getEventDetailsData(), "", ""));
    } else if (event.screenName == "blog_detail") {
      print('state_after_login_success blog____$state');
      emitter(HomeBlogDetilsPageState(
          _userRepository!.getBlogListDetailsData(), ""));
      print('state_after_login_success blogsf____$state');
    } else if (event.screenName == "mp_prop_detail") {
      emitter(HomeMpPropertyDetailsState(
          _userRepository?.getMpPropertyDetailsData()));
    } else if (event.screenName == "acm_prop_detail") {
      emitter(HomeAccommodationPropertyDetailsState(
          _userRepository?.getMpPropertyDetailsData()));
    } else if (event.screenName == "plan_detail") {
      emitter(HomePlanManagerDetailClickState(
          _userRepository!.getServiceDetailsPageData(), ''));
    } else if (event.screenName == "psycho_login") {
      emitter(PsychosocialDetailBtnClickState(
          _userRepository!.getSupportCoordinatorDetailsData()));
    } else if (event.screenName == "advocacy_login") {
      emitter(AdvocacyDetailBtnClickState(
          _userRepository!.getSupportCoordinatorDetailsData()));
    }
  }

  void mapHomeBlogListPageListBtnClick(
      HomeBlogListPageListBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getBlogListDataApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeBlogsScreen;
      emitter(HomeBlogListPageState(_userRepository!.getBlogListData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeBlogDetilsPageBtnClick(
      HomeBlogDetilsPageBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.BlogDetailsApi(event.id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeBlog2ndScreen;
      emitter(HomeBlogDetilsPageState(
          _userRepository!.getBlogListDetailsData(), event.id));
      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeNewsPageClickEvent(
      HomeNewsPageClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getNewsListapi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeNewsScreen;
      emitter(HomeNewsPageClickState(_userRepository!.getNewsListData()));
      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapServiceEnquiryEvent(
      ServiceEnquiryEvent event, Emitter<HomeState> emitter) async {

    // NetworkApiCallState<bool> apiCallState = await _userRepository!.getNewsListapi();
    // if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeServiceEnquiryScreen;
      emitter(ServiceEnquiryState());
    // } else {
    //   emitter(HomeerrorloadingState(apiCallState.message!));
    // }
  }

  void mapHomeFindSupportPageClickEvent(
      HomeFindSupportPageClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getFindSupportApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeFindSupportScreen;
      emitter(
          HomeFindSupportPageState(_userRepository?.getFindSupportListData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeServiceExpertDetilsPageClick(
      HomeServiceExpertDetilsPageClick event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .ServiceExpertListsApi(event.category_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeNdisExpert2ndScreen;
      emitter(HomeResetState());
      emitter(HomeServiceExpertDetilsPageState(
          _userRepository!.getServiceExpertListingData(), event.category_id));
      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeNewsDetilsPageClick(
      HomeNewsDetilsPageClick event, Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.NewsDetailsApi(event.news_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenType == "Home") {
        _userRepository!.ScreenName = ScreenNavigation.HomeToNewsDetailScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.HomeNews2ndScreen;
      }

      emitter(HomeNewsDetilsPageClickState(
          _userRepository!.getNewsDetailsData(), event.screenType));
      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventLoginBtnClick(
      HomeEventLoginBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 =
        await _userRepository!.getUserLoginApi(event.emailId, event.pwd);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenName == "" || event.screenName == null) {
        emitter(HomeInitial());
      } else if (event.screenName == "job_sub_cat") {
        print('state_after_login_success____$state');
        emitter(HomeEventsJobsSubcategoryPageState(
            jobsByCatData: _userRepository?.getJobsListByCatData(),
            category_name: event.categoryName,
            category_id: event.categoryId));
      } else if (event.screenName == "all_cat_job") {
        emitter(HomeJobsPageState(_userRepository!.getAllJobsCategoryData(),
            _userRepository!.getJobsCatDropData()));
      } else if (event.screenName == "all_cat_job") {
        emitter(HomeJobsPageState(_userRepository!.getAllJobsCategoryData(),
            _userRepository!.getJobsCatDropData()));
      } else if (event.screenName == "job_detail") {
        emitter(HomeEventsJobsDetailsPageState(
            detailData: _userRepository?.getJobsDetailsData()));
      } else if (event.screenName == "service_pro_detail") {
        _userRepository!.ScreenName = ScreenNavigation.HomeAllService3rdScreen;
        emitter(HomeServiceDetailsState(
            _userRepository!.getServiceDetailsPageData(), ""));
      } else if (event.screenName == "Home") {
        _userRepository!.ScreenName =
            ScreenNavigation.HomePopularServiceDetailScreen;
        emitter(HomeServiceDetailsState(
            _userRepository!.getServiceDetailsPageData(), ""));
      } else if (event.screenName == "support_worker_contact") {
        _userRepository!.ScreenName = ScreenNavigation.SupportWorker2ndPage;
        emitter(HomeSupportWorkerSubCategoryPageState(
            _userRepository!.getsupportWorkerUserData(), "", ''));
      } else if (event.screenName == "find_support") {
        _userRepository!.ScreenName =
            ScreenNavigation.HomeFsSupportWorker2ndScreen;
        emitter(HomeSupportWorkerSubCategoryPageState(
            _userRepository!.getsupportWorkerUserData(), "", ''));
      } else if (event.screenName == "support_coord_get_quote") {
        _userRepository!.ScreenName =
            ScreenNavigation.SupportCoordinator3rdPage;
        emitter(HomeSupportCoordinatorsDetailPageState(
            _userRepository!.getSupportCoordinatorDetailsData(), ''));
      } else if (event.screenName == "fs_sup_cord") {
        _userRepository!.ScreenName =
            ScreenNavigation.HomeFsSupportCoord3rdPage;
        emitter(HomeSupportCoordinatorsDetailPageState(
            _userRepository!.getSupportCoordinatorDetailsData(), ''));
      } else if (event.screenName == "service_expert_get_quote") {
        _userRepository!.ScreenName = ScreenNavigation.HomeNdisExpert3rdScreen;
        emitter(HomeServiceDetailsClickState(
            _userRepository!.getExpertDetailsData()));
      } else if (event.screenName == "event_detail") {
        _userRepository!.ScreenName = ScreenNavigation.HomeEvent2ndScreen;
        emitter(HomeEventsDetailPageClickState(
            _userRepository!.getEventDetailsData(), "", ""));
      } else if (event.screenName == "event_home") {
        _userRepository!.ScreenName = ScreenNavigation.HomeToEventDetailScreen;
        emitter(HomeEventsDetailPageClickState(
            _userRepository!.getEventDetailsData(), "", ""));
      } else if (event.screenName == "psycho_login") {
        _userRepository!.ScreenName = ScreenNavigation.HomeFsPsycho2Screen;
        emitter(PsychosocialDetailBtnClickState(
            _userRepository!.getSupportCoordinatorDetailsData()));
      } else if (event.screenName == "advocacy_login") {
        _userRepository!.ScreenName = ScreenNavigation.HomeFsAdvocacy2Screen;
        emitter(AdvocacyDetailBtnClickState(
            _userRepository!.getSupportCoordinatorDetailsData()));
      } else if (event.screenName == "blog_detail") {
        emitter(HomeBlogDetilsPageState(
            _userRepository!.getBlogListDetailsData(), event.blogId));
      } else if (event.screenName == "mp_prop_detail") {
        _userRepository!.ScreenName = ScreenNavigation.HomeMpProperty3rdScreen;
        emitter(HomeMpPropertyDetailsState(
            _userRepository?.getMpPropertyDetailsData()));
      } else if (event.screenName == "acm_prop_detail") {
        _userRepository!.ScreenName =
            ScreenNavigation.HomeAccomodation3rdScreen;
        emitter(HomeAccommodationPropertyDetailsState(
            _userRepository?.getMpPropertyDetailsData()));
      } else if (event.screenName == "plan_detail") {
        _userRepository!.ScreenName = ScreenNavigation.HomePlanManager2ndScreen;
        emitter(HomePlanManagerDetailClickState(
            _userRepository!.getServiceDetailsPageData(), ''));
      } else if (event.screenName == "fs_plan") {
        _userRepository!.ScreenName =
            ScreenNavigation.HomeFsPlanManager2ndScreen;
        emitter(HomePlanManagerDetailClickState(
            _userRepository!.getServiceDetailsPageData(), ''));
      } else if (event.screenName == "product_detail") {
        emitter(HomeMpProductDetailPageState(
            _userRepository?.getAllProductDetailsData(), ''));
      }
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapHomeEventForgotBtnClick(
      HomeEventForgotBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 =
        await _userRepository!.forgotPassApi(event.emailId);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(ForgotApiSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapContactSWBtnClick(
      ContactSWBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 =
        await _userRepository!.contactSupportWorkerApi(
      event.userId,
      event.expertId,
      event.enquiryDate,
      event.enquiryMessage,
      event.enquiryLocation,
    );
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(ContactSwSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapGetQuoteSPBtnClick(
      GetQuoteSPBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 = await _userRepository!
        .GetQuoteServProApi(
            event.userId, event.listingId, event.enquiryMessage, false);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(GetQuoteSpSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapGetQuoteScoordBtnClick(
      GetQuoteScoordBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 = await _userRepository!
        .GetQuoteServProApi(
            event.userId, event.listingId, event.enquiryMessage, true);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(GetQuoteScoordSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapGetQuotePsychoBtnClick(
      GetQuotePsychoBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 = await _userRepository!
        .GetQuoteServProApi(
            event.userId, event.listingId, event.enquiryMessage, false);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(GetQuoteScoordSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapGetQuoteAdvocacyBtnClick(
      GetQuoteAdvocacyBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 = await _userRepository!
        .GetQuoteServProApi(
            event.userId, event.listingId, event.enquiryMessage, false);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(GetQuoteScoordSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapGetQuoteServExpertBtnClick(
      GetQuoteServExpertBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.GetQuoteServExpertApi(
      event.listingId,
      event.enquiryMessage,
    );
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(GetQuoteSerExpertSuccessState(apiCallState.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapSendEnquiryBlogClick(
      SendEnquiryBlogClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 = await _userRepository!
        .SendEnquiryApi(
            event.userId, event.listingId, event.enquiryMessage, true);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(SendEnquiryBlogSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapGetQuotePropClick(
      GetQuotePropClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 = await _userRepository!
        .GetQuotePropertyApi(event.propId, event.enquiryMessage);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(GetquotePropSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapGetQuotePlanClickEvent(
      GetQuotePlanClickEvent event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 = await _userRepository!
        .GetQuotePlanApi(event.userId, event.listingId, event.enquiryMessage);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(GetQuotePlanSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapSendEnquiryEventClick(
      SendEnquiryEventClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 = await _userRepository!
        .SendEnquiryApi(
            event.userId, event.listingId, event.enquiryMessage, false);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(SendEnquiryEventSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapApplyJobEventClick(
      ApplyJobEventClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 =
        await _userRepository!.ApplyJobApi(event.userId, event.listingId);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(ApplyJobEventSuccessState(apiCallState1.message.toString()));
    } else {
      emitter(ApplyJoberrorState(apiCallState1.message!));
    }
  }

  void mapHomeResetEvent(
      HomeResetEvent event, Emitter<HomeState> emitter) async {
    // emitter(HomeLoginPageState("","",""));
  }

  void mapHomeEventSupportWorkerApiDataClick(
      HomeEventSupportWorkerApiDataClick event,
      Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 =
        await _userRepository!.getSupportWorkerRegisterApi(event.requestParams);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      emitter(HomeInitial());
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapHomePricingGetStartedbtnClick(
      HomePricingGetStartedbtnClick event, Emitter<HomeState> emitter) async {
    emitter(HomeBillingPageState());
  }

  void mapHomeResendOtp(HomeResendOtp event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 =
        await _userRepository!.getOtpApi(event.emailId, event.emailMobile);
    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      print("=====otp");
      emitter(HomeResetState());
      emitter(HomeOtpPageState(event.selectedUserType, event.userProfData,
          _userRepository!.mobileOtp, _userRepository!.emailOtp));
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapHomeGeneralbtnRegisterButtonClick(
      HomeGeneralbtnRegisterButtonClick event,
      Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .getVerifyOtpApi(event.pinMobile, event.pinEmail, event.emailId_str,
            event.mobile_str);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.userProfData.userType == "NDIS service experts") {
        NetworkApiCallState<bool> apiCallState1 = await _userRepository!
            .registerNDISServiceExpertUserApi(
                event.userProfData.firstName!,
                event.userProfData.lastName!,
                event.userProfData.emailId!,
                event.userProfData.mobileNumber!,
                event.userProfData.password!,
                event.userProfData.userType!,
                sharedPrefs.serviceLocation,
                sharedPrefs.keyLatitude,
                sharedPrefs.keyLongitude,
                event.userProfData.regionId!);
        if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
          emitter(HomeInitial());
        } else {
          emitter(HomeerrorloadingState(apiCallState1.message!));
        }
      } else {
        NetworkApiCallState<bool> apiCallState1 = await _userRepository!
            .getGeneralRegisterApi(
                event.userProfData.firstName!,
                event.userProfData.lastName!,
                event.userProfData.emailId!,
                event.userProfData.mobileNumber!,
                event.userProfData.password!,
                event.userProfData.userType!,
                sharedPrefs.serviceLocation,
                sharedPrefs.keyLatitude,
                sharedPrefs.keyLongitude,
                event.userProfData.regionId!);
        if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
          emitter(HomeInitial());
        } else {
          emitter(HomeerrorloadingState(apiCallState1.message!));
        }
      }
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventPlanPricingListBtnClick(
      HomeEventPlanPricingListBtnClick event,
      Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.PricingListingPage;
    emitter(HomePricingPlanListingPageState(event.features,
        event.pricingDataPlanModel, event.plan, event.requestParams));
  }

  void mapHomeEventPlanPricingListBackBtnClick(
      HomeEventPlanPricingListBackBtnClick event,
      Emitter<HomeState> emitter) async {
    emitter(HomePricingPlanState(
        _userRepository!.getPricingDataPlanModel(), event.requestParams));
  }

  void mapHomeEventPricingPlanBackbtnClick(
      HomeEventPricingPlanBackbtnClick event,
      Emitter<HomeState> emitter) async {
    emitter(HomeSupportRegisterPageState());
  }

  void mapHomeEventSupportWorkerToPricingPlanPage(
      HomeEventSupportWorkerToPricingPlanPage event,
      Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!.getPricingPlanApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(HomePricingPlanState(
          _userRepository!.getPricingDataPlanModel(), event.requestParams));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }


  void mapSupportWorkerUpdateProfileEvent
      (SupportWorkerUpdateProfileEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!.
    SupportWorkerUpdateApi(event.requestParams);

    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(ProfileInitial());
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }



  void mapHomeEventResetOtpPage(
      HomeEventResetOtpPage event, Emitter<HomeState> emitter) async {
    emitter(
        HomeOtpPageState(event.selectedUserType, event.userProfData, "", ""));
  }

  void mapHomeEventLocationbtnClick(
      HomeEventLocationbtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.SignupToLocationScreen;

    if (event.typePage == "SignUp") {
      emitter(HomeLocationSearchPageState(event.typePage));
    }
  }

  void mapHomeSearchLocationCityBtnClick(
      HomeSearchLocationCityBtnClick event, Emitter<HomeState> emitter) async {
    if (event.screen == "Jobs") {
      _userRepository!.ScreenName = ScreenNavigation.HomeJobsToSearchScreen;
      emitter(JobSearchLocationState(event.screen));
    } else if (event.screen == "sup_work_profile") {
      _userRepository!.ScreenName = ScreenNavigation.ProfileToSearchScreen;
      emitter(ProfileSearchLocationState(event.screen));
    }else if (event.screen == "general") {
      _userRepository!.ScreenName = ScreenNavigation.GeneralProfileToLocationScreen;
      emitter(ProfileSearchLocationPageState(event.screen));
    } else if (event.screen == "participant") {
      _userRepository!.ScreenName = ScreenNavigation.PrticiProfileToLocationScreen;
      emitter(ParticipantSearchLocationState(event.screen));
    } else if (event.screen == "participant_service") {
      _userRepository!.ScreenName = ScreenNavigation.PrticiProfileToLocationScreen;
      emitter(ParticipantSearchLocationState(event.screen));
    }  else if (event.screen == "filter") {
      _userRepository!.ScreenName = ScreenNavigation.FilterToLocationScreen;
      emitter(FilterSearchLocationState(event.screen));
    } else {
      _userRepository!.ScreenName = ScreenNavigation.HomeToSearch2ndScreen;
      emitter(HomeSearchLocationCityState());
    }
  }

  void mapHomeEventAddressbtnClick(
      HomeEventAddressbtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.PrticiToLocationScreen;

    emitter(HomeAddressSearchPageState(event.typePage, event.userProfData,
        event.selectedUserType, _userRepository!.getParticipateInfoData()));
  }

  void mapServiceEnquiryAddressbtnClick(
      ServiceEnquiryAddressbtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.ServiceEnquiryToLocationScreen;

    emitter(ServiceEnquiryAddressbtnClickState(event.typePage));
  }

  void mapHomeEventSupportWorkerBackbtnClick(
      HomeEventSupportWorkerBackbtnClick event,
      Emitter<HomeState> emitter) async {
    // _userRepository!.ScreenName = ScreenNavigation.SupportCoordinatorRegistrationPage;
    //
    // emitter(HomeSignUpPage1State(_userRepository!.getParticipateInfoData(),
    //     _userRepository!.getRegionModelData()));
  }

  void mapHomeEventSignupReset(
      HomeEventSignupReset event, Emitter<HomeState> emitter) async {
    emitter(HomeSignUpPage1State(_userRepository!.getParticipateInfoData(),
        _userRepository!.getRegionModelData()));
  }

  void mapHomeEventLocationToSignUp(
      HomeEventBackLocationToSignUp event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.LoginToSignUpScreen;

    emitter(HomeSignUpPage1State(_userRepository!.getParticipateInfoData(),
        _userRepository!.getRegionModelData()));
  }

  void mapHomeEventBackLocationToSearch(
      HomeEventBackLocationToSearch event, Emitter<HomeState> emitter) async {
    emitter(HomeSearchState(_userRepository!.getHomeSearchData()));
  }

  void mapHistoryListReset(
      HomeEventResetHome event, Emitter<HomeState> emitter) async {
    emitter(HomeInitial());
  }

  void mapHomeEventSubmitBtnClick(
      HomeEventSubmitBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .participantRegistrationApi(
            firstname: event.first_name,
            lastName: event.last_name,
            emailId: event.emailId,
            password: event.password,
            mobilenumber: event.mobile_number,
            usertype: event.user_type,
            partiFirstName: event.parti_first_name,
            partiLastName: event.parti_last_name,
            ageRange: event.age_range,
            ndisPlanManaged: event.ndisp_managed,
            interpreterRequired: event.interpreter_requi,
            languageSpoken: event.language_spoken,
            NdisNumber: event.ndisNumber,
            partiIdentify: event.part_identify_as,
            prefContactMethod: event.parti_contact_method,
            relationWparticipant: event.relation_w_parti,
            worklocation: event.service_location,
            wnServices: event.wnServices);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(HomeInitial());
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventOtpVerifyToCongratulationScreenClick(
      HomeEventOtpVerifyToCongratulationScreenClick event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!.getVerifyOtpApi(event.pinMobile, event.pinEmail,
        event.emailId_str, event.mobile_str);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.SupportWorkerCongratulationScreen;
      emitter(HomeSupportCongratulationPageState(event.UserType, _userRepository!.getSupportWorkerInfoData(),
          event.userProfData));
    }else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventParticipantBackBtnClick(
      HomeEventParticipantBackBtnClick event,
      Emitter<HomeState> emitter) async {
    emitter(HomeOtpPageState(event.UserType, event.userProfData, "", ""));
  }

  void mapHomeEventServiceDetailsBtnClick(
      HomeEventServiceDetailsBtnClick event, Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .SubCategoryDetailsApi(event.Listingid.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenType == "Home") {
        _userRepository!.ScreenName =
            ScreenNavigation.HomePopularServiceDetailScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.HomeAllService3rdScreen;
      }

      emitter(HomeServiceDetailsState(
          _userRepository!.getServiceDetailsPageData(), event.screenType));

      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventBackBtnClick(
      HomeEventBackBtnClick event, Emitter<HomeState> emitter) async {
    print("state $state");
    if (state is HomeLoginPageState) {
      emitter(HomeInitial());
    }else if (state is FilterClickState) {
      emitter(HomeSubCatgoryListDetailsState(_userRepository!.getSubCatDetailsData(), "",''));
    } else if (state is HomeSupportCongratulationPageState) {
      emitter(HomeOtpPageState('',UserProfileData(),'',''));
    }else if (state is HomeSupportRegisterPageState) {
      emitter(HomeSupportCongratulationPageState('', _userRepository!.getSupportWorkerInfoData(),UserProfileData()));
    }else if (state is HomeParticipantRegisterPageState) {
      emitter(HomeOtpPageState('Participant', UserProfileData(),
          _userRepository!.mobileOtp, _userRepository!.emailOtp));
    }
    else if (state is ServiceEnquiryAddressbtnClickState) {
      emitter(ServiceEnquiryState());
    }
    else if (state is ServiceEnquiryState) {
      emitter(HomeInitial());
    } else if (state is HomeSignUpPage1State) {
      emitter(HomeLoginPageState("", "", "", "", "", ""));
    } else if (state is HomeMyCartPageClickState) {
      print("aadafefefff${event.screenName}");
      if (event.screenName == "product_detail") {
        emitter(HomeMpProductDetailPageState(
            _userRepository?.getAllProductDetailsData(), ''));
      } else if (event.screenName == "vehicle_detail") {
        emitter(HomeMpVehicalDetailPageState(
            _userRepository?.getVehicalDetailsData()));
      }
    } else if (state is HomeMpProductDetailPageState) {
      emitter(HomeMarketPlaceProductsPageState(
          _userRepository!.getAllProductListData()));
    } else if (state is HomeMpVehicalDetailPageState) {
      emitter(HomeMarketPlaceProductForVehicalSaleState(
          _userRepository!.getMarketPlaceAllVehivalData()));
    } else if (state is HomeAllCategoryPageState) {
      emitter(HomeInitial());
    } else if (state is HomeInitial) {
      emitter(HomeInitial());
    } else if (state is HomeSignUpPage1State) {
      emitter(HomeInitial());
    } else if (state is HomeMarketPlaceBtnClickState) {
      emitter(HomeInitial());
    } else if (state is HomeMarketPlaceProductForVehicalSaleState) {
      emitter(HomeMarketPlaceBtnClickState(_userRepository!.getmpCatData()));
    } else if (state is HomeMpPropertyDetailsState) {
      emitter(HomeMarketPlacePropertySaleState(
          _userRepository!.getNDISPropertySaleData()));
    } else if (state is HomeMarketPlacePropertySaleState) {
      emitter(HomeMarketPlaceBtnClickState(_userRepository!.getmpCatData()));
    } else if (state is HomeOtpPageState) {
      emitter(HomeSignUpPage1State(_userRepository!.getParticipateInfoData(),
          _userRepository!.getRegionModelData()));
    } else if (state is HomeSupportWorkerServiceDetailsPageState) {
      print('State--->>${state}');
      emitter(HomeSupportWorkerSubCategoryPageState(
          _userRepository!.getsupportWorkerUserData(), '', ''));
    } else if (state is HomeSearchState) {
      print('State--->>${state}');
      emitter(HomeInitial());
    } else if (state is HomeSearchLocationCityState) {
      print('State--->>${state}');
      emitter(HomeSearchState(_userRepository!.getHomeSearchData()));
    } else if (state is HomeAllCategoryPageState) {
      print('State--->>${state}');
      emitter(HomeInitial());
    } else if (state is HomeSubCatgoryListDetailsState) {
      print('State--3333->>${event.screenName}');
      if (event.screenName == "Home") {
        emitter(HomeInitial());
      } else {
        emitter(
            HomeAllCategoryPageState(_userRepository!.getAllcategoryData()));
      }
    } else if (state is HomeServiceDetailsState) {
      print('State--->>${state}');
      emitter(HomeSubCatgoryListDetailsState(_userRepository!.getSubCatDetailsData(), "",''));
    } else if (state is HomeSupportWorkerSubCategoryPageState) {
      print('State--->>${state}');
      emitter(HomeSupportWorkerPageState(
          _userRepository?.getSupportWorkerCatListData(), ""));
    } else if (state is HomeSupportWorkerPageState) {
      if (event.screenName == "find_support") {
        emitter(HomeFindSupportPageState(
            _userRepository?.getFindSupportListData()));
      } else {
        emitter(HomeInitial());
      }
    } else if (state is JobSearchLocationState) {
      emitter(HomeJobsPageState(
        _userRepository!.getAllJobsCategoryData(),
        _userRepository!.getJobsCatDropData(),
      ));
    }else if (state is FilterSearchLocationState) {
      emitter(FilterClickState());
    }
    else if (state is ProfileSearchLocationState) {
      emitter(ProfileSupportWorkerPageState(
          _userRepository!.getUserProfileDataModel(),
          _userRepository!.getSupportWorkerInfoData(),
          _userRepository!.getSupportWorkerDropData()));
    }  else if (state is ProfileSearchLocationPageState) {
      emitter(ProfileViewGeneralPageState(
          _userRepository!.getUserProfileDataModel(),
          _userRepository!.getSupportWorkerDropData()));
    } else if (state is ParticipantSearchLocationState) {
      emitter(ProfileViewParticipantPageState(_userRepository!.getUserProfileDataModel(),
          _userRepository!.getParticipateInfoData(),
          _userRepository!.getSupportWorkerDropData()));
    }
    else if (state is HomeSupportWorkerServiceDetailsPageState) {
      print('State--->>${state}');
      emitter(HomeSupportWorkerSubCategoryPageState(
          _userRepository!.getsupportWorkerUserData(), '', ''));
    } else if (state is HomeJobsPageState) {
      print('State--->>${state}');
      emitter(HomeInitial());
    } else if (state is HomeEventsJobsSubcategoryPageState) {
      print('State--12->>${state}');
      emitter(HomeJobsPageState(_userRepository?.getAllJobsCategoryData(),
          _userRepository?.getJobsCatDropData()));
    } else if (state is HomeEventsJobsDetailsPageState) {
      if (event.screenName == "job_detail") {
        print('State-0-->>${state}');
        emitter(HomeJobsPageState(_userRepository?.getAllJobsCategoryData(),
            _userRepository?.getJobsCatDropData()));
      } else {
        emitter(HomeEventsJobsSubcategoryPageState());
      }
    } else if (state is HomeSupportCoordinatorsPageState) {
      if (event.screenName == "find_support") {
        emitter(HomeFindSupportPageState(
            _userRepository?.getFindSupportListData()));
      } else {
        emitter(HomeInitial());
      }
    } else if (state is HomeSupportCoordinatorsListPageState) {
      print('State--->>${state}');
      emitter(HomeSupportCoordinatorsPageState(
          _userRepository!.getAllSCoordcategoryData(), ''));
    } else if (state is HomeSupportCoordinatorsDetailPageState) {
      print('State--->>${state}');
      emitter(HomeSupportCoordinatorsListPageState(
          _userRepository!.getSupCorrdinatoreSubCatData(), ''));
    } else if (state is HomeNdisServiceExpertMainListingPageState) {
      print('State--->>${state}');
      emitter(HomeInitial());
    } else if (state is HomeServiceExpertDetilsPageState) {
      print('State--->>${state}');
      emitter(HomeNdisServiceExpertMainListingPageState(
          _userRepository!.getNdisServiceCatData()));
    } else if (state is HomeServiceDetailsClickState) {
      print('State--->>${state}');
      emitter(HomeServiceExpertDetilsPageState(
          _userRepository!.getServiceExpertListingData(), ''));
    } else if (state is HomePlanManagersBtnClickState) {
      if (event.screenName == "find_support") {
        emitter(HomeFindSupportPageState(
            _userRepository?.getFindSupportListData()));
      } else {
        emitter(HomeInitial());
      }
    } else if (state is HomePlanManagerDetailClickState) {
      print('State--->>${state}');
      emitter(HomePlanManagersBtnClickState(
          _userRepository?.getPlanManCatData(), ''));
    } else if (state is HomeEventsPageBtnClickState) {
      print('State--->>${state}');
      emitter(HomeInitial());
    } else if (state is HomeEventsDetailPageClickState) {
      print('State--->>${state}');
      emitter(HomeEventsPageBtnClickState(_userRepository!.getEventListData()));
    } else if (state is HomeBlogListPageState) {
      print('State--->>${state}');
      emitter(HomeInitial());
    } else if (state is HomeBlogDetilsPageState) {
      print('State--->>${state}');
      emitter(HomeBlogListPageState(_userRepository!.getBlogListData()));
    } else if (state is HomeAccommodationHousingState) {
      print('State--->>${state}');
      emitter(HomeInitial());
    } else if (state is HomeAccommodationHousingforRentState) {
      print('State--->>${state}');
      emitter(HomeAccommodationHousingState(
          _userRepository!.getAccommodationListData()));
    } else if (state is HomeAccommodationHousingforSaleState) {
      print('State--->>${state}');
      emitter(HomeAccommodationHousingState(
          _userRepository!.getAccommodationListData()));
    } else if (state is HomeAccommodationHousingforholidayState) {
      print('State--->>${state}');
      emitter(HomeAccommodationHousingState(
          _userRepository!.getAccommodationListData()));
    } else if (state is HomeAccommodationPropertyDetailsState) {
      print('State--->>${state}');
      emitter(HomeAccommodationHousingforSaleState(
          _userRepository!.getNDISPropertySaleData()));
    } else if (state is HomeAccommodationPropertyDetailsState) {
      print('State--->>${state}');
      emitter(HomeAccommodationHousingforRentState(
          _userRepository!.getNDISPropertySaleData()));
    } else if (state is HomeAccommodationPropertyDetailsState) {
      print('State--->>${state}');
      emitter(HomeAccommodationHousingforholidayState(
          _userRepository!.getNDISPropertySaleData()));
    } else if (state is HomeFindSupportPageState) {
      print('State--->>${state}');
      emitter(HomeInitial());
    } else if (state is HomeNewsPageClickState) {
      emitter(HomeInitial());
    } else if (state is HomeNewsDetilsPageClickState) {
      emitter(HomeNewsPageClickState(_userRepository!.getNewsListData()));
    } else if (state is HomeMarketPlaceProductsPageState) {
      emitter(HomeMarketPlaceBtnClickState(_userRepository!.getmpCatData()));
    } else if (state is HomeerrorloadingState) {
      emitter(HomeInitial());
    } else if (state is HomePsychosocialBtnClickState) {
      emitter(
          HomeFindSupportPageState(_userRepository?.getFindSupportListData()));
    } else if (state is PsychosocialDetailBtnClickState) {
      emitter(HomePsychosocialBtnClickState(
          _userRepository?.getPsychoSocialData()));
    } else if (state is AdvocacySupportBtnClickState) {
      emitter(
          HomeFindSupportPageState(_userRepository?.getFindSupportListData()));
    } else if (state is AdvocacyDetailBtnClickState) {
      emitter(
          AdvocacySupportBtnClickState(_userRepository?.getAdvocacySuppData()));
    }
  }

  void mapHomeEventBackLocationToParticipant(
      HomeEventBackLocationToParticipant event,
      Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.OtpToParticipantScreen;
    emitter(HomeParticipantRegisterPageState(event.selectedUserType,
        _userRepository!.getParticipateInfoData(), event.userProfData));
  }

  void mapHomeEventOtpVerifyToStep2BtnClick(
      HomeEventOtpVerifyToStep2BtnClick event,
      Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .getVerifyOtpApi(event.pinMobile, event.pinEmail, event.emailId_str,
            event.mobile_str);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {

      _userRepository!.ScreenName = ScreenNavigation.OtpToParticipantScreen;
    emitter(HomeParticipantRegisterPageState(event.UserType,
          _userRepository!.getParticipateInfoData(), event.userProfData));
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventSubCatgoryListDetailsBtnClick(
      HomeEventSubCatgoryListDetailsBtnClick event,
      Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .SubCategoryListDetailsApi(event.category_id.toString(), '');
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screen == "Home") {
        _userRepository!.ScreenName = ScreenNavigation.HomeToService2ndScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.HomeAllService2ndScreen;
      }

      emitter(HomeSubCatgoryListDetailsState(
          _userRepository!.getSubCatDetailsData(), event.screen, event.cat_name));
      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventHomePageDetailsBtnClick(
      HomeEventHomePageDetailsBtnClick event,
      Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getHomeDetailsDataApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(HomeHomePageDetailsPageState(
          _userRepository!.getHomeDetailsAPIData()));
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeAllCategoryPageBtnClick(
      HomeAllCategoryPageBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getHomeAllCategoryDataApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeAllServiceScreen;
      emitter(HomeAllCategoryPageState(_userRepository!.getAllcategoryData()));
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeAccommodationHousingBtnClick(
      HomeAccommodationHousingBtnClick event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getAccommodationListApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeAccomodationScreen;
      emitter(HomeAccommodationHousingState(
          _userRepository!.getAccommodationListData()));
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomePlanManagersBtnClick(
      HomePlanManagersBtnClick event, Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.planManagersApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenName == "find_support") {
        _userRepository!.ScreenName = ScreenNavigation.HomeFsPlanManagerScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.HomePlanManagerScreen;
      }
      emitter(HomePlanManagersBtnClickState(
          _userRepository?.getPlanManCatData(), event.screenName));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomePsychosocialBtnClick(
      HomePsychosocialBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.psychoSocialRecoveryApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeFsPsychoScreen;
      emitter(HomePsychosocialBtnClickState(
          _userRepository?.getPsychoSocialData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapPsychosocialDetailBtnClick(
      PsychosocialDetailBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .SubCoordinatoreDetailsApi(event.list_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeFsPsycho2Screen;
      emitter(PsychosocialDetailBtnClickState(
        _userRepository!.getSupportCoordinatorDetailsData(),
      ));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapAdvocacyDetailBtnClick(
      AdvocacyDetailBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .SubCoordinatoreDetailsApi(event.list_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeFsAdvocacy2Screen;
      emitter(AdvocacyDetailBtnClickState(
        _userRepository!.getSupportCoordinatorDetailsData(),
      ));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapAdvocacySupportBtnClick(
      AdvocacySupportBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.advocacySupportOrgApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeFsAdvocacyScreen;
      emitter(
          AdvocacySupportBtnClickState(_userRepository?.getAdvocacySuppData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapAccommodationHousingRefresh(
      AccommodationHousingRefresh event, Emitter<HomeState> emitter) async {
    emitter(HomeAccommodationHousingState(
        _userRepository!.getAccommodationListData()));
  }

  void mapHomeMarketPlaceBtnClick(
      HomeMarketPlaceBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getmpCategoryApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeMarketPlaceScreen;
      emitter(HomeResetState());
      emitter(HomeMarketPlaceBtnClickState(_userRepository!.getmpCatData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeSupportCoordinatorPageBtnClick(
      HomeSupportCoordinatorPageBtnClick event,
      Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getSupportCoordCategoryApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenName == "find_support") {
        _userRepository!.ScreenName = ScreenNavigation.HomeFsSupportCoordScreen;
      } else {
        _userRepository!.ScreenName =
            ScreenNavigation.HomeSupportCoordinatorScreen;
      }

      emitter(HomeResetState());
      emitter(HomeSupportCoordinatorsPageState(
          _userRepository!.getAllSCoordcategoryData(), event.screenName));
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeSearchEvent(
      HomeSearchEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getHomeSearchApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeToSearchScreen;
      emitter(HomeSearchState(_userRepository!.getHomeSearchData()));
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeSupportCoordinatorListClick(
      HomeSupportCoordinatorListClick event, Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .SupCorrdinatorSubCatAPi(
            event.category_id.toString(), event.sub_category_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenName == "find_support") {
        _userRepository!.ScreenName = ScreenNavigation.HomeFsSupportCoord2ndPage;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.SupportCoordinator2ndPage;
      }

      emitter(HomeSupportCoordinatorsListPageState(
          _userRepository!.getSupCorrdinatoreSubCatData(), event.screenName));
      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeSupportCoordinatorDetailClick(
      HomeSupportCoordinatorDetailClick event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .SubCoordinatoreDetailsApi(event.listingid.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenName == "find_support") {
        _userRepository!.ScreenName = ScreenNavigation.HomeFsSupportCoord3rdPage;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.SupportCoordinator3rdPage;
      }

      emitter(HomeSupportCoordinatorsDetailPageState(
          _userRepository!.getSupportCoordinatorDetailsData(),
          event.screenName));

      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventsPageBtnClick(
      HomeEventsPageBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getEventListDataApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeEventScreen;
      emitter(HomeEventsPageBtnClickState(_userRepository!.getEventListData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventsDetailPageClick(
      HomeEventsDetailPageClick event, Emitter<HomeState> emitter) async {
    print("screenType_is___${event.screenType}");


    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.EventDetailsApi(event.id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenType == "Home") {
        _userRepository!.ScreenName = ScreenNavigation.HomeToEventDetailScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.HomeEvent2ndScreen;
      }

      emitter(HomeEventsDetailPageClickState(
          _userRepository!.getEventDetailsData(), event.id, event.screenType));
      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void maHomeJobsResetEvent(
      HomeJobsResetEvent event, Emitter<HomeState> emitter) async {
    emitter(HomeJobsPageState(_userRepository!.getAllJobsCategoryData(),
        _userRepository!.getJobsCatDropData()));
  }

  void mapHomeJobsPageBtnClick(
      HomeJobsPageBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getJobAllCategoryApi();

    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeJobScreen;
      NetworkApiCallState<bool> apiCallStateForJobDropdown =
          await _userRepository!.getjobCatDropdownApi();

      if (apiCallStateForJobDropdown.status == NetworkRequestStatus.COMPLETED) {
        emitter(HomeJobsPageState(_userRepository!.getAllJobsCategoryData(),
            _userRepository!.getJobsCatDropData()));
      }
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomePlanManagerDetailClick(
      HomePlanManagerDetailClick event, Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .SubCategoryDetailsApi(event.listingid.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screen == "find_support") {
        _userRepository!.ScreenName = ScreenNavigation.HomeFsPlanManager2ndScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.HomePlanManager2ndScreen;
      }

      emitter(HomePlanManagerDetailClickState(
          _userRepository!.getServiceDetailsPageData(), event.screen));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeMarketPlaceProductsClick(
      HomeMarketPlaceProductsClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getMarketPlaceAllProductListDataApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeMpProduct2ndScreen;
      emitter(HomeMarketPlaceProductsPageState(
          _userRepository!.getAllProductListData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeMarketPlaceProductForVehicalSaleClick(
      HomeMarketPlaceProductForVehicalSaleClick event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getMarketPlaceProductForVehicalSaleDataApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeMpVehicle2ndScreen;
      emitter(HomeMarketPlaceProductForVehicalSaleState(
          _userRepository!.getMarketPlaceAllVehivalData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeMpProductDetailPageEvent(
      HomeMpProductDetailPageEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .getMPAllProductDetailsApi(event.product_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeMpProduct3rdScreen;
      emitter(HomeMpProductDetailPageState(
          _userRepository?.getAllProductDetailsData(),
          event.product_id.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeMpVehicalDetailPageBtnClick(
      HomeMpVehicalDetailPageBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .getMPVehicalProductDetailsApi(event.vehicle_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeMpVehicle3rdScreen;
      emitter(HomeMpVehicalDetailPageState(
          _userRepository?.getVehicalDetailsData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeMpPropertyDetailsBtnClick(
      HomeMpPropertyDetailsBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .getMPPropertyDetailsApi(event.property_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeMpProperty3rdScreen;
      emitter(HomeMpPropertyDetailsState(
          _userRepository?.getMpPropertyDetailsData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeAccommodationPropertyDetailsBtnClick(
      HomeAccommodationPropertyDetailsBtnClick event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .getMPPropertyDetailsApi(event.property_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeAccomodation3rdScreen;
      emitter(HomeAccommodationPropertyDetailsState(
          _userRepository?.getMpPropertyDetailsData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventMyCartPageClick(
      HomeEventMyCartPageClick event, Emitter<HomeState> emitter) async {
    print(
        "checking_______${event.screenName} &&_______ ${_userRepository!.ScreenName}");


    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.addToCartApi(event.product_id, event.quantity);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenName == "product_detail" && event.isCheckOut == true) {
        _userRepository!.ScreenName = ScreenNavigation.HomeMpProduct5thScreen;
      } else if (event.screenName == "vehicle_detail" &&
          event.isCheckOut == false) {
        _userRepository!.ScreenName = ScreenNavigation.HomeMpVehicle4thScreen;
      } else if (event.screenName == "vehicle_detail" &&
          event.isCheckOut == true) {
        _userRepository!.ScreenName = ScreenNavigation.HomeMpVehicle5thScreen;
      } else if (event.screenName == "product_detail" &&
          event.isCheckOut == false) {
        _userRepository!.ScreenName = ScreenNavigation.HomeMpProduct4thScreen;
      }

      NetworkApiCallState<bool> apiCallState1 =
          await _userRepository!.getMyCartApi();
      emitter(HomeMyCartPageClickState(event.isCheckOut, apiCallState.message!,
          event.screenName, _userRepository!.getCartDataModel()));

      if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
        emitter(HomeMyCartPageClickState(
            event.isCheckOut,
            apiCallState.message!,
            event.screenName,
            _userRepository!.getCartDataModel()));
      }
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeMpEventMyCartBack(
      HomeMpEventMyCartBack event, Emitter<HomeState> emitter) async {
    emitter(HomeMpEventMyCartBackState());
  }

  void mapHomePopularServicesBackBtnClick(
      HomePopularServicesBackBtnClick event, Emitter<HomeState> emitter) async {
    emitter(HomeInitial());
  }

  void mapHomeNewsDetailsBackBtnClick(
      HomeNewsDetailsBackBtnClick event, Emitter<HomeState> emitter) async {
    emitter(HomeInitial());
  }

  void mapHomeHomeEventDetailsBackBtnClick(
      HomeHomeEventDetailsBackBtnClick event,
      Emitter<HomeState> emitter) async {
    emitter(HomeInitial());
  }

  void mapEventPlaceOrderClick(
      EventPlaceOrderClick event, Emitter<HomeState> emitter) async {
    emitter(HomeMyCartPageClickState(
        false, "message", '', _userRepository!.getCartDataModel()));
  }

  void mapEventProductCheckoutClick(
      EventProductCheckoutClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.HomeMpProduct5thScreen;
  }

  void mapEventVehicleCheckoutClick(
      EventVehicleCheckoutClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.HomeMpVehicle5thScreen;
  }

  void mapHomeSupportWorkerPageBtnClick(
      HomeSupportWorkerPageBtnClick event, Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getSupportWorkerCatListApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenName == "find_support") {
        _userRepository!.ScreenName = ScreenNavigation.HomeFsSupportWorkerScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.HomeSupportWorkerScreen;
      }

      emitter(HomeSupportWorkerPageState(
          _userRepository?.getSupportWorkerCatListData(), event.screenName));
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapEventLikeUnlike(EventLikeUnlike event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!.LikeUnlikeApi(event.listing_id, event.listing_user_id);

    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(HomeResetState());
      emitter(LikeUnlikeSuccessState());
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapSerProviderResetEvent(SerProviderResetEvent event, Emitter<HomeState> emitter) async {
      emitter(HomeSubCatgoryListDetailsState(_userRepository!.getSubCatDetailsData(), '', ''));
  }
  void mapFilterClickEvent(FilterClickEvent event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.FilterPage;
    emitter(FilterClickState());
  }

  void mapHomeEventSupportWorkerSubCatgoryListDetailsBtnClick(
      HomeEventSupportWorkerSubCatgoryListDetailsBtnClick event,
      Emitter<HomeState> emitter) async {

    print("here====================${_userRepository!.ScreenName}");
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .SupportWorkeruserListsApi(event.supp_cat_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenName == 'find_support') {
        _userRepository!.ScreenName =
            ScreenNavigation.HomeFsSupportWorker2ndScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.SupportWorker2ndPage;
      }

      emitter(HomeSupportWorkerSubCategoryPageState(
          _userRepository!.getsupportWorkerUserData(),
          event.screenName,
          event.supp_cat_id));
      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeNewsListBtnClick(
      HomeNewsListBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getNewsListapi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(HomeNewsListHomeState(_userRepository!.getNewsListData()));
      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeNotificationCountEvent(
      HomeNotificationCountEvent event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.NotificationCountApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(HomeNotiCountState(_userRepository!.getNotiCountData()));
      // emitter(HomeNotiCountState(apiCallState.data.toString()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventHomeResetState(
      HomeEventHomeResetState event, Emitter<HomeState> emitter) async {
    emitter(HomeInitial());
  }

  void mapEventPostSearchBtnClick(
      EventPostSearchBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.PostSearchApi(event.searchText);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(PostSearchBtnClickState(_userRepository!.getPostSearchData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventSupportWorkeMoreDetailsBtnClick(
      HomeEventSupportWorkeMoreDetailsBtnClick event,
      Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .SUpportWorkerDetailsApi(event.user_id.toString());
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screenName == 'find_support') {
        _userRepository!.ScreenName =
            ScreenNavigation.HomeFsSupportWorker3rdScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.SupportWorker3rdPage;
      }

      emitter(HomeSupportWorkerServiceDetailsPageState(
          _userRepository!.getSupportWorkerDetailsData(), event.screenName));
      print("in state");
    } else {
      print("error");
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventsJobsSubcategoryPageClick(
      HomeEventsJobsSubcategoryPageClick event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getJobListByCatApi(event.category_id);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeJobs2ndScreen;
      emitter(HomeEventsJobsSubcategoryPageState(
          jobsByCatData: _userRepository?.getJobsListByCatData(),
          category_name: event.category_name,
          category_id: event.category_id));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  ///job search api event
  void mapHomeJobsSearchEvent(
      HomeJobsSearchEvent event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .jobSearchApi(event.job_cat_id, event.lat, event.lng);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(HomeJobsSearchState(_userRepository!.getJobSearchData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventServiceDetailsClick(
      HomeEventServiceDetailsClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.ServiceExpertDetailsApi(event.listId);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.HomeNdisExpert3rdScreen;
      emitter(HomeResetState());
      emitter(HomeServiceDetailsClickState(
          _userRepository?.getExpertDetailsData()));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventsJobsDetailsPageClick(
      HomeEventsJobsDetailsPageClick event, Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getJobDetailsApi(event.job_id);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      if (event.screen == "job_detail") {
        _userRepository!.ScreenName = ScreenNavigation.HomeJobs3rdFrom1stScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.HomeJobs3rdScreen;
      }

      emitter(HomeEventsJobsDetailsPageState(
          detailData: _userRepository?.getJobsDetailsData(),
          screen: event.screen));
    } else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventSupportWorkerCongratToSupportPageClick(
      HomeEventSupportWorkerCongratToSupportPageClick? event,
      Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState= await _userRepository!.getLanguageApi();

    if (apiCallState.status == NetworkRequestStatus.COMPLETED){
      _userRepository!.ScreenName = ScreenNavigation.CongratsToRegScreen;

      emitter(HomeSupportRegisterPageState(
      userType: event?.UserType,
      supportWorkerInfoData: _userRepository?.getSupportWorkerInfoData(),
      userProfData: event?.userProfData,
      languageArrayData: _userRepository?.getLanguageArrayData(),
    ));
    }else{
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapHomeEventSigupStep1ContinueBtnClick(
      HomeEventSigupStep1ContinueBtnClick event,
      Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState1 = await _userRepository!.getOtpApi(
        event.userProfData.emailId!, event.userProfData!.mobileNumber!);

    if (apiCallState1.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.OtpPageScreen;

      if (event.selectedUserType == "Support Worker") {
        NetworkApiCallState<bool> apiCallState =
            await _userRepository!.getSupportWorkerDataApi();
        if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
          emitter(HomeOtpPageState(event.selectedUserType, event.userProfData,
              _userRepository!.mobileOtp, _userRepository!.emailOtp));
        } else {
          emitter(HomeerrorloadingState(apiCallState1.message!));
        }
      } else {
        emitter(HomeOtpPageState(event.selectedUserType, event.userProfData,
            _userRepository!.mobileOtp, _userRepository!.emailOtp));
      }
    } else {
      emitter(HomeerrorloadingState(apiCallState1.message!));
    }
  }

  void mapHomeEventProfileBtnClick(
      HomeEventProfileBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.ProfilePage;

    emitter(ProfileInitial());
  }

  void mapHomeEventHometoLoginBtnClick(
      HomeEventHometoLoginBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.HomeToLoginScreen;

    emitter(HomeLoginPageState("", "", "", "", "", ""));
  }

  void mapEventJobSubCattoLoginBtnClick(
      EventJobSubCattoLoginBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.JobSubCatToLoginScreen;

    print("demo" + event.screenName);
    emitter(HomeLoginPageState(
        event.screenName, event.category_name, event.category_id, "", "", ""));
  }

  void mapEventAllJobtoLoginBtnClick(
      EventAllJobtoLoginBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.AllJobsToLoginScreen;

    emitter(HomeLoginPageState(event.screenName, "", "", "", "", ""));
  }

  void mapEventProductDetailtoLoginBtnClick(
      EventProductDetailtoLoginBtnClick event,
      Emitter<HomeState> emitter) async {
    // _userRepository!.ScreenName = ScreenNavigation.AllJobsToLoginScreen;
    emitter(HomeLoginPageState(event.screenName, "", "", "", "", ""));
  }

  void mapEventServiceDetailtoLoginBtnClick(
      EventServiceDetailtoLoginBtnClick event,
      Emitter<HomeState> emitter) async {
    if (event.screenName == "Home") {
      _userRepository!.ScreenName =
          ScreenNavigation.HomeServiceDetailToLoginScreen;
    } else {
      _userRepository!.ScreenName = ScreenNavigation.AllServiceToLoginScreen;
    }

    emitter(HomeLoginPageState(event.screenName, "", "", "", "", ""));
  }

  void mapEventSupportWorkerToLoginBtnClick(
      EventSupportWorkerToLoginBtnClick event,
      Emitter<HomeState> emitter) async {
    if (event.screenName == "find_support") {
      _userRepository!.ScreenName = ScreenNavigation.FindSupWorToLoginScreen;
    } else {
      _userRepository!.ScreenName = ScreenNavigation.SupWorToLoginScreen;
    }
    emitter(HomeLoginPageState(event.screenName, "", "", "", "", ""));
  }

  void mapEventSupportCoordToLoginBtnClick(
      EventSupportCoordToLoginBtnClick event,
      Emitter<HomeState> emitter) async {
    if (event.screenName == "fs_sup_cord") {
      _userRepository!.ScreenName = ScreenNavigation.FindSupCoordToLoginScreen;
    } else {
      _userRepository!.ScreenName = ScreenNavigation.SupCoordToLoginScreen;
    }

    emitter(HomeLoginPageState(event.screenName, "", "", "", "", ""));
  }

  void mapEventPsychoToLoginBtnClick(
      EventPsychoToLoginBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.PsychoToLoginScreen;

    emitter(HomeLoginPageState(event.screenName, "", "", "", "", ""));
  }

  void mapEventAdvocacyToLoginBtnClick(
      EventAdvocacyToLoginBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.AdvocacyToLoginScreen;

    emitter(HomeLoginPageState(event.screenName, "", "", "", "", ""));
  }

  void mapEventServExpertToLoginBtnClick(
      EventServExpertToLoginBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.NdisExpertToLoginScreen;

    emitter(HomeLoginPageState(event.screenName, "", "", "", "", ""));
  }

  void mapEventEventDetailToLoginBtnClick(
      EventEventDetailToLoginBtnClick event, Emitter<HomeState> emitter) async {
    if (event.screenName == "event_detail") {
      _userRepository!.ScreenName = ScreenNavigation.EventToLoginScreen;
    } else {
      _userRepository!.ScreenName =
          ScreenNavigation.HomeEventDetailToLoginScreen;
    }

    emitter(
        HomeLoginPageState(event.screenName, "", "", event.event_id, "", ""));
  }

  void mapEventBlogDetailToLoginBtnClick(
      EventBlogDetailToLoginBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.BlogDetailToLoginScreen;

    emitter(
        HomeLoginPageState(event.screenName, "", "", "", event.blog_id, ""));
  }

  void mapEventPropDetailToLoginBtnClick(
      EventPropDetailToLoginBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.PropDetailToLoginScreen;

    emitter(HomeLoginPageState(
        event.screenName, "", "", "", event.property_id, ""));
  }

  void mapEventAcmPropDetailToLoginBtnClick(
      EventAcmPropDetailToLoginBtnClick event,
      Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.AcmPropDetailToLoginScreen;

    emitter(HomeLoginPageState(
        event.screenName, "", "", "", event.property_id, ""));
  }

  void mapEventPlanDetailToLoginBtnClick(
      EventPlanDetailToLoginBtnClick event, Emitter<HomeState> emitter) async {
    if (event.screenName == "fs_plan") {
      _userRepository!.ScreenName =
          ScreenNavigation.FindPlanDetailToLoginScreen;
    } else {
      _userRepository!.ScreenName = ScreenNavigation.PlanDetailToLoginScreen;
    }

    emitter(
        HomeLoginPageState(event.screenName, "", "", "", "", event.plan_id));
  }

  void mapEventJobDetailtoLoginBtnClick(
      EventJobDetailtoLoginBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.JobDetailToLoginScreen;

    emitter(HomeLoginPageState(event.screenName, "", "", "", "", ""));
  }

  void mapHomeEventLogintoSignupBtnClick(
      HomeEventLogintoSignupBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getParticiPantDataApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.LoginToSignUpScreen;
      NetworkApiCallState<bool> apiCallState =
          await _userRepository!.getRegionDataApi();
      if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
        emitter(HomeSignUpPage1State(_userRepository!.getParticipateInfoData(),
            _userRepository!.getRegionModelData()));
      } else {
        emitter(HomeSignUpPage1State(_userRepository!.getParticipateInfoData(),
            _userRepository!.getRegionModelData()));
      }
      print("data=====");
    } else {
      emitter(HomeSignUpPage1State(_userRepository!.getParticipateInfoData(),
          _userRepository!.getRegionModelData()));
    }
  }

  ///////// profile //////////////

  void mapProfileEventBackBtnClick(
      ProfileEventBackBtnClick event, Emitter<HomeState> emitter) async {
    if (state is ProfileInitial) {
      emitter(HomeInitial());
    } else if (state is ProfileViewServiceExpertPageState) {
      emitter(ProfileInitial());
    } else if (state is ProfileSupportWorkerPageState) {
      emitter(ProfileInitial());
    } else if (state is ProfileViewGeneralPageState) {
      emitter(ProfileInitial());
    } else if (state is PaymentInvoiceState) {
      emitter(ProfileInitial());
    } else if (state is SettingClickState) {
      emitter(ProfileInitial());
    } else if (state is PromotionsState) {
      emitter(ProfileInitial());
    } else if (state is AdSummaryState) {
      emitter(ProfileInitial());
    } else if (state is SeoClickState) {
      emitter(ProfileInitial());
    } else if (state is PaymentsClickState) {
      emitter(ProfileInitial());
    } else if (state is MyGenericLeadState) {
      emitter(ProfileInitial());
    } else if (state is ProfileErrorState) {
      emitter(ProfileInitial());
    } else if (state is JobProfileClickState) {
      emitter(ProfileInitial());
    } else if (state is MyDirectLeadState) {
      emitter(ProfileInitial());
    } else if (state is MyServiceBookingBtnClickState) {
      emitter(ProfileInitial());
    } else if (state is MyDirectQueriesBtnClickState) {
      emitter(ProfileInitial());
    } else if (state is AllAppliedJobClickState) {
      emitter(ProfileInitial());
    } else if (state is ReviewPageClickState) {
      emitter(ProfileInitial());
    } else if (state is LikedListingClickState) {
      emitter(ProfileInitial());
    } else if (state is NotificationClickState) {
      if(event.screenName=='Home'){
        emitter(HomeInitial());
      }else{
        emitter(ProfileInitial());
      }
    } else if (state is HowTosClickState) {
      emitter(ProfileInitial());
    } else if (state is FollowingsClickState) {
      emitter(ProfileInitial());
    } else if (state is LookingForJobClickState) {
      emitter(ProfileInitial());
    } else if (state is MyEventsClickState) {
      emitter(ProfileInitial());
    } else if (state is ChangePasswordClickState) {
      emitter(ProfileInitial());
    } else if (state is ChangeEmailClickState) {
      emitter(ProfileInitial());
    } else if (state is ChangeMobileClickState) {
      emitter(ProfileInitial());
    } else if (state is MyOrdersClickState) {
      emitter(ProfileInitial());
    } else if (state is OrderDetailClickState) {
      if (event.screenName == "my_order") {
        emitter(MyOrdersClickState(_userRepository!.getMyOrderDataModel()));
      } else if (event.screenName == "order_history") {
        emitter(OrderHistoryClickState(
            _userRepository!.getOrderHistoryDataModel()));
      }
    } else if (state is AboutUsBtnClickState) {
      emitter(ProfileInitial());
    } else if (state is ContactUsBtnClickState) {
      emitter(ProfileInitial());
    } else if (state is OrderHistoryClickState) {
      emitter(ProfileInitial());
    } else if (state is AddListingBtnClickState) {
      emitter(ProfileInitial());
    } else if (state is ServicesOfferedBtnClickState) {
      emitter(ProfileInitial());
    } else if (state is ServiceLocationsBtnClickState) {
      emitter(ProfileInitial());
    } else if (state is TransactionHistoryClickState) {
      emitter(ProfileInitial());
    } else if (state is AllUserClickState) {
      emitter(FollowingsClickState(_userRepository!.getFollowingsDataModel()));
    }
  }

  void mapProfileEventDashboardPageBack(
      ProfileEventDashboardPageBack event, Emitter<HomeState> emitter) async {
    emitter(ProfileInitial());
  }

  void mapProfileParticipantEventBackBtnClick(
      ProfileParticipantEventBackBtnClick event,
      Emitter<HomeState> emitter) async {
    emitter(ProfileInitial());
  }

  void mapProfileSuppCoordEventBackBtnClick(
      ProfileSuppCoordEventBackBtnClick event,
      Emitter<HomeState> emitter) async {
    emitter(ProfileInitial());
  }

  void mapProfileNdisExpertUpdateBtnClick(
      ProfileNdisExpertUpdateBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .NdisServiceExpertUpdateApi(
            id: event.userId,
            postCode: event.userzipCode,
            userYoutube: event.userYoutube,
            userTwitter: event.userTwitter,
            userState: event.userState,
            userCity: event.userCity,
            userLongitude: event.userLongitude,
            userLatitude: event.userLatitude,
            password: event.password,
            profileimage: event.profileImage,
            mobilenumber: event.mobileNumber,
            profile_id_proof: event.profileIdProof,
            user_website: event.userWebsite,
            userFacebook: event.userFacebook,
            serviceLocation: "",
            cover_image: event.coverImage);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(ProfileInitial());
    }
  }

  void mapProfileGeneralUpdateBtnClick(
      ProfileGeneralUpdateBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .GeneralUserUpdateApi(
            postCode: event.userzipCode,
            userYoutube: event.userYoutube,
            userTwitter: event.userTwitter,
            userState: event.userState,
            userCity: event.userCity,
            userLongitude: event.userLongitude,
            userLatitude: event.userLatitude,
            profileimage: event.profileImage,
            mobilenumber: event.mobileNumber,
            profile_id_proof: event.profileIdProof,
            user_website: event.userWebsite,
            userFacebook: event.userFacebook,
            serviceLocation: event.userAddress,
            cover_image: event.coverImage,
            passwordOld: event.passwordOld,
            userCountry: event.userCountry,
            profile_id_proofOld: event.profileIdProofId,
            cover_imageOld: event.coverImageId,
            profileimageOld: event.profileImageId,
            region: event.region);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(ProfileInitial());
    }else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapProfileLocationSearchEventBtnClick(
      ProfileLocationSearchEventBtnClick event,
      Emitter<HomeState> emitter) async {
    emitter(ProfileSearchLocationPageState(''));
  }

  void mapProfileLocationSearchEventBackBtnClick(
      ProfileLocationSearchEventBackBtnClick event,
      Emitter<HomeState> emitter) async {
    if (event.strScreen == "Service Expert") {
      emitter(ProfileViewServiceExpertPageState(
          _userRepository!.getUserProfileDataModel()));
    }
  }

  void mapJobProfileClick(
      JobProfileClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.getJobProfDropdownapi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.JobProfileScreen;
      emitter(JobProfileClickState(_userRepository!.getJobProfileDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapFollowUnfollowEvent(
      FollowUnfollowEvent event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.FollowUnfollowApi(event.idToBeFollow);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(FollowUnfollowResetState());
      emitter(FollowUnfollowState(apiCallState.message));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapPaymentsClickEvent(
      PaymentsClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.PaymentPlanApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.PaymentPlanScreen;
      emitter(PaymentsClickState(_userRepository!.getPaymentDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapSeoClickEvent(SeoClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.SeoListApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.SEOScreen;
      emitter(SeoClickState(_userRepository!.getSeoDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapAdSummaryEvent(
      AdSummaryEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.AdSummaryApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.AdSummaryScreen;
      emitter(AdSummaryState(_userRepository!.getAdDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapPromotionsEvent(
      PromotionsEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.PromotionsApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.PromotionScreen;
      emitter(PromotionsState(_userRepository!.getPromotionsDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapPaymentInvoiceEvent(
      PaymentInvoiceEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.invoicesApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.PayInvoiceScreen;
      emitter(PaymentInvoiceState(_userRepository!.getInvoicesDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapChangeSettingEvent(
      ChangeSettingEvent event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .changeProfileSettingApi(event.accountStatus, event.reviewStatus,
            event.shareStatus, event.profileStatus);

    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(ChangeSettingState(apiCallState.message));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapProfileResetEvent(
      ProfileResetEvent event, Emitter<HomeState> emitter) async {
    emitter(ProfileInitial());
  }

  void mapContactUsBtnClick(
      ContactUsBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.ProfileContactUsScreen;

    emitter(ContactUsBtnClickState());
  }

  void mapAboutUsBtnClick(
      AboutUsBtnClick event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.ProfileAboutUsScreen;

    emitter(AboutUsBtnClickState());
  }

  void mapOrderDetailClickEvent(
      OrderDetailClickEvent event, Emitter<HomeState> emitter) async {


    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.OrderDetailApi(event.orderId);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {

      if (event.screenName == "my_order") {
        _userRepository!.ScreenName = ScreenNavigation.OrderDetailScreen;
      } else {
        _userRepository!.ScreenName = ScreenNavigation.OrderHistoryDetailScreen;
      }

      emitter(OrderDetailClickState(
          _userRepository!.getOrderDetailModel(), event.screenName));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapMyOrdersClickEvent(
      MyOrdersClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.MyOrdersApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.ProfileOrdersScreen;
      emitter(MyOrdersClickState(_userRepository!.getMyOrderDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapOrderHistoryClickEvent(
      OrderHistoryClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.OrderHistoryApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.OrderHistoryScreen;
      emitter(
          OrderHistoryClickState(_userRepository!.getOrderHistoryDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapTransactionHistoryClickEvent(
      TransactionHistoryClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.TransactionHistoryApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.TransactionHistoryScreen;
      emitter(TransactionHistoryClickState(
          _userRepository!.getTransactionHistoryDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapChangeMobileClickEvent(
      ChangeMobileClickEvent event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.ChangeMobileScreen;

    emitter(ChangeMobileClickState());
  }

  void mapChangeEmailClickEvent(
      ChangeEmailClickEvent event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.ChangeEmailScreen;

    emitter(ChangeEmailClickState());
  }

  void mapChangePasswordClickEvent(
      ChangePasswordClickEvent event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.ChangePasswordScreen;

    emitter(ChangePasswordClickState());
  }

  void mapMyEventsClickEvent(
      MyEventsClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.MyEventApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.MyEventsScreen;
      emitter(MyEventsClickState(_userRepository!.getMyEventDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapSettingClickEvent(
      SettingClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.GetSettingApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.ProfileSettingScreen;
      emitter(SettingClickState(_userRepository!.getSettingDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapFollowingsClickEvent(
      FollowingsClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.FollowingListApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.FollowingScreen;
      emitter(FollowingsClickState(_userRepository!.getFollowingsDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapAllUserClickEvent(
      AllUserClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.AllUserApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.AllUserScreen;
      emitter(AllUserClickState(_userRepository!.getAllUserDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapHowTosClickEvent(
      HowTosClickEvent event, Emitter<HomeState> emitter) async {
    _userRepository!.ScreenName = ScreenNavigation.HowToScreen;

    emitter(HowTosClickState());
  }

  void mapNotificationClickEvent(
      NotificationClickEvent event, Emitter<HomeState> emitter) async {

    if(event.screen == 'Home'){
      _userRepository!.ScreenName = ScreenNavigation.HomeToNotification;
    }else{
      _userRepository!.ScreenName = ScreenNavigation.NotificationScreen;
    }
    // NetworkApiCallState<bool> apiCallState =
    //     await _userRepository!.NotificationListApi();
    // if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
    //   _userRepository!.ScreenName = ScreenNavigation.NotificationScreen;
      emitter(NotificationClickState(/*_userRepository!.getNotiListDataModel()*/event.screen));
    // } else {
    //   emitter(ProfileErrorState(apiCallState.message));
    // }
  }

  void mapLikedListingClickEvent(
      LikedListingClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.LikedListApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.LikedListScreen;
      emitter(LikedListingClickState(_userRepository!.getLikedListDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapAddListingBtnClick(
      AddListingBtnClick event, Emitter<HomeState> emitter) async {
    emitter(AddListingBtnClickState());
  }

  void mapServiceLocationsBtnClick(
      ServiceLocationsBtnClick event, Emitter<HomeState> emitter) async {
    emitter(ServiceLocationsBtnClickState());
  }

  void mapServicesOfferedBtnClick(
      ServicesOfferedBtnClick event, Emitter<HomeState> emitter) async {
    emitter(ServicesOfferedBtnClickState());
  }

  void mapReviewPageClickEvent(
      ReviewPageClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.AllReviewsApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.ReviewsScreen;
      emitter(ReviewPageClickState(_userRepository!.getReviewsDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapAllAppliedJobClickEvent(
      AllAppliedJobClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.appliedJobApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.AppliedJobScreen;
      emitter(AllAppliedJobClickState(_userRepository!.appliedJobDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapLookingForJobClickEvent(
      LookingForJobClickEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.lookingForJobApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.LookingForJobScreen;
      emitter(
          LookingForJobClickState(_userRepository!.lookingForJobDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapMyServiceBookingBtnClick(
      MyServiceBookingBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.serviceBookingApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.ServiceRequestScreen;
      emitter(MyServiceBookingBtnClickState(
          _userRepository!.getServiceBookingsDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapMyDirectQueriesBtnClick(
      MyDirectQueriesBtnClick event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.directQueriesApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.ProfileDirectQueryScreen;
      emitter(MyDirectQueriesBtnClickState(
          _userRepository!.getDirectQueriesDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapProfileViewBtnClick(
      ProfileViewBtnClick event, Emitter<HomeState> emitter) async {
    if (event.userType == "Participant") {

      NetworkApiCallState<bool> apiCallState = await _userRepository!.getParticiPantDataApi();
      if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
        _userRepository!.ScreenName = ScreenNavigation.ProfileParticipantsProfileScreen;
        NetworkApiCallState<bool> apiCallState = await _userRepository!.getUserProfileDataApi();

        if (apiCallState.status == NetworkRequestStatus.COMPLETED){

          NetworkApiCallState<bool> apiCallState = await _userRepository!.getAllDropDataApi();
          if (apiCallState.status == NetworkRequestStatus.COMPLETED){
            emitter(ProfileViewParticipantPageState(_userRepository!.getUserProfileDataModel(),
                _userRepository!.getParticipateInfoData(),
                _userRepository!.getSupportWorkerDropData()));
          }
        }
      } else {
        emitter(ProfileUserDataPageErrorState(apiCallState.message));
      }
    } else if (event.userType == "General") {

      NetworkApiCallState<bool> apiCallState = await _userRepository!.getUserProfileDataApi();
      if (apiCallState.status == NetworkRequestStatus.COMPLETED) {

        _userRepository!.ScreenName = ScreenNavigation.ProfileGeneralProfileScreen;
        NetworkApiCallState<bool> apiCallState = await _userRepository!.getAllDropDataApi();
        if (apiCallState.status == NetworkRequestStatus.COMPLETED) {

          emitter(ProfileViewGeneralPageState(_userRepository!.getUserProfileDataModel(),
            _userRepository!.getSupportWorkerDropData(),));
        }else {
          emitter(ProfileUserDataPageErrorState(apiCallState.message));
        }
      } else {
        emitter(ProfileUserDataPageErrorState(apiCallState.message));
      }
    } else if (event.userType == "NDIS service experts") {
      print(sharedPrefs.userID);
      NetworkApiCallState<bool> apiCallState =
          await _userRepository!.getUserProfileDataApi();
      if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
        emitter(ProfileViewServiceExpertPageState(
            _userRepository!.getUserProfileDataModel()));
      } else {
        emitter(ProfileUserDataPageErrorState(apiCallState.message));
      }
    } else {
      NetworkApiCallState<bool> apiCallState =
          await _userRepository!.getUserProfileDataApi();
      if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
        _userRepository!.ScreenName = ScreenNavigation.SupportWorkToProfileScreen;

        NetworkApiCallState<bool> apiCallState =
            await _userRepository!.getSupportWorkerDataApi();
        if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
          NetworkApiCallState<bool> apiCallState = await _userRepository!.getAllDropDataApi();
          if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
            emitter(ProfileSupportWorkerPageState(
              _userRepository!.getUserProfileDataModel(),
              _userRepository!.getSupportWorkerInfoData(),
              _userRepository!.getSupportWorkerDropData(),
            ));
          } else {
            emitter(ProfileUserDataPageErrorState(apiCallState.message));
          }
        } else {
          emitter(ProfileUserDataPageErrorState(apiCallState.message));
        }
      } else {
        emitter(ProfileUserDataPageErrorState(apiCallState.message));
      }
    }
  }

  void mapProfileParticipantUpdateBtnClick(
      ProfileParticipantUpdateBtnClick event,
      Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .participantUpdateApi(
            userState: event.userState,
            oldPassword: event.password_old,
            userCountry: event.user_country,
            userPost: event.user_zip_code,
            // password: event.password,
            userFb: event.user_facebook,
            userTwt: event.user_twitter,
            userYt: event.user_youtube,
            userWeb: event.user_website,
            userAddress: event.user_address,
            wnServices: event.w_n_services,
            relationWparticipant: event.relation_w_p,
            prefContactMethod: event.p_contact_method,
            partiIdentify: event.p_identify_as,
            NdisNumber: event.ndis_number,
            languageSpoken: event.language_spoken,
            interpreterRequired: event.interpreter_r,
            ndisPlanManaged: event.n_p_managed,
            ageRange: event.age_range,
            pageRange: event.p_age_range,
            mobilenumber: event.mobileNumber,
            serviceLocation: event.service_location,
            userCity: event.user_city,
            userLatitude: event.user_latitude,
            userLongitude: event.user_longitude,
            profile_id_proof: event.profile_id_proof,
            cover_image: event.cover_image,
            profileimage: event.profile_image,
      profile_id_proof_old: event.profile_id_proof_old,
      profileimageOld: event.profile_image_old,
      cover_imageOld: event.cover_photo_old,
      serviceCity: event.participant_city,
      serviceState: event.participant_state,
      serviceCountry: event.participant_country,
      serviceZip: event.participant_zip_code,
      serviceLat: event.participant_latitude,
      serviceLng: event.participant_longitude,
      pFirstName: event.p_first_name,
      pLastName: event.p_last_name,
      region: event.aus_region,
      );
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(ProfileInitial());
    }else {
      emitter(HomeerrorloadingState(apiCallState.message!));
    }
  }

  void mapCreateJobProfileBtnClick(
      CreateJobProfileBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.CreateJobProfileApi(
      id: event.user_id,
      resumeImage: event.job_profile_resume,
      profileImage: event.job_profile_image,
      coverImage: event.cover_image,
      subCatId: event.sub_category_id,
      skillSet: event.skill_set,
      currentCompany: event.current_company,
      yOExperience: event.years_of_experience,
      noticePeriod: event.notice_period,
      availTime: event.available_time_start,
      eduQualification: event.educational_qualification,
      Exp1: event.experience_1,
      Exp2: event.experience_2,
      Exp3: event.experience_3,
      Exp4: event.experience_4,
      Edu1: event.education_1,
      Edu2: event.education_2,
      Edu3: event.education_3,
      Edu4: event.education_4,
      Add1: event.additional_info_1,
      Add2: event.additional_info_2,
      Add3: event.additional_info_3,
      Add4: event.additional_info_4,
    );
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(ProfileInitial());
    } else {
      emitter(ProfileUserDataPageErrorState(apiCallState.message));
    }
  }

  void mapChangePasswordBtnClick(
      ChangePasswordBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState = await _userRepository!
        .ChangePasswordApi(newPassword: event.new_password);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(ChangePasswordSuccessState(apiCallState.message));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapChangeMobileBtnClick(
      ChangeMobileBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.ChangeMobileApi(mobile: event.mobile);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(ChangeMobileSuccessState(apiCallState.message));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapChangeEmailBtnClick(
      ChangeEmailBtnClick event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.ChangeEmailApi(emailId: event.email);
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(ChangeEmailSuccessState(apiCallState.message));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapProfileReviewCountEvent(
      ProfileReviewCountEvent event, Emitter<HomeState> emitter) async {
    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.ProfileCountsDataApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      emitter(ProfileReviewCountState(_userRepository!.getCountsDataModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapMyDirectLeadEvent(
      MyDirectLeadEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.MyDirectLeadsApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.DirectLeadScreen;
      emitter(MyDirectLeadState(_userRepository!.getDirectLeadModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }

  void mapMyGenericLeadEvent(
      MyGenericLeadEvent event, Emitter<HomeState> emitter) async {

    NetworkApiCallState<bool> apiCallState =
        await _userRepository!.MyGenericLeadsApi();
    if (apiCallState.status == NetworkRequestStatus.COMPLETED) {
      _userRepository!.ScreenName = ScreenNavigation.GenericLeadScreen;
      emitter(MyGenericLeadState(_userRepository!.getGenericLeadModel()));
    } else {
      emitter(ProfileErrorState(apiCallState.message));
    }
  }
}
