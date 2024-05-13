import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/home/screen/home/h_accommodation/home_accommodationHousingPage.dart';
import 'package:ndisparticipant/home/screen/home/h_accommodation/home_accommodation_holidays_listPage.dart';
import 'package:ndisparticipant/home/screen/home/h_accommodation/home_accommodation_property_details_page.dart';
import 'package:ndisparticipant/home/screen/home/h_accommodation/home_accommodation_renProperty_details.dart';
import 'package:ndisparticipant/home/screen/home/h_accommodation/home_accommodation_rent_listPage.dart';
import 'package:ndisparticipant/home/screen/home/h_accommodation/home_accommodation_sale_list.dart';
import 'package:ndisparticipant/home/screen/home/h_all_service/home_all_category_pagelist.dart';
import 'package:ndisparticipant/home/screen/home/h_all_service/serivce_details_page.dart';
import 'package:ndisparticipant/home/screen/home/h_all_service/subcategory_list_destils.dart';
import 'package:ndisparticipant/home/screen/home/h_blog/h_blog_details_page.dart';
import 'package:ndisparticipant/home/screen/home/h_blog/h_blog_list_page.dart';
import 'package:ndisparticipant/home/screen/home/h_find_support/advocacy_detail_page.dart';
import 'package:ndisparticipant/home/screen/home/h_find_support/psycho_recovery_page.dart';
import 'package:ndisparticipant/home/screen/home/h_jobs/h_jobs_details_page.dart';
import 'package:ndisparticipant/home/screen/home/h_jobs/h_jobs_subcategory_page.dart';
import 'package:ndisparticipant/home/screen/home/h_market_place/h_market_all_product_list.dart';
import 'package:ndisparticipant/home/screen/home/h_market_place/h_market_place_page.dart';
import 'package:ndisparticipant/home/screen/home/h_market_place/h_mp_my_cart_page.dart';
import 'package:ndisparticipant/home/screen/home/h_market_place/h_mp_product_detail_page.dart';
import 'package:ndisparticipant/home/screen/home/h_market_place/h_mp_property_details_page.dart';
import 'package:ndisparticipant/home/screen/home/h_market_place/h_mp_property_sale_list_page.dart';
import 'package:ndisparticipant/home/screen/home/h_market_place/h_mp_vehical-detail_page.dart';
import 'package:ndisparticipant/home/screen/home/h_market_place/marketplace_vehical_sale_listpage.dart';
import 'package:ndisparticipant/home/screen/home/h_plan_managers/h_plan_detail_page.dart';
import 'package:ndisparticipant/home/screen/home/h_plan_managers/h_plan_managers_page.dart';
import 'package:ndisparticipant/home/screen/home/h_search/home_search_page.dart';
import 'package:ndisparticipant/home/screen/home/h_search/location_for_city.dart';
import 'package:ndisparticipant/home/screen/home/service_enquiry_form.dart';
import 'package:ndisparticipant/home/screen/support_worker/pricing_listing_page.dart';
import '../root/root.dart';
import 'home.dart';
import 'screen/home/h_ndis_service_experts/h_ndis_service_experts.dart';
import 'screen/home/h_support_coordinators/h_support_coordinators_detail_page.dart';
import 'screen/home/h_support_coordinators/h_support_coordinators_list_page.dart';
import 'screen/home/h_support_coordinators/h_support_coordinators_page.dart';
import 'screen/profile/about_us_page.dart';
import 'screen/profile/business_profile/add_listing_page.dart';
import 'screen/profile/business_profile/service_location_page.dart';
import 'screen/profile/business_profile/services_offered_page.dart';
import 'screen/profile/contact_us_page.dart';
import 'screen/profile/dashboard_page.dart';
import 'screen/profile/general/profile_general_page.dart';
import 'screen/profile/job/all_applied_job.dart';
import 'screen/profile/job/job_profile_page.dart';
import 'screen/profile/job/looking_for_job.dart';
import 'screen/profile/lead_enquiry/my_direct_leads_page.dart';
import 'screen/profile/lead_enquiry/my_generic_leads_page.dart';
import 'screen/profile/my_activities/all_user_page.dart';
import 'screen/profile/my_activities/followings_page.dart';
import 'screen/profile/my_activities/how_to_s_page.dart';
import 'screen/profile/my_activities/liked_list_page.dart';
import 'screen/profile/my_activities/my_events_page.dart';
import 'screen/profile/my_activities/notification_page.dart';
import 'screen/profile/my_activities/reviews_page.dart';
import 'screen/profile/my_activities/setting_page.dart';
import 'screen/profile/my_service_request/my_direct_queries_page.dart';
import 'screen/profile/my_service_request/my_service_bookings_page.dart';
import 'screen/profile/ndisexpert/profile_ndis_service_expert.dart';
import 'screen/profile/participant/profile_participant_page.dart';
import 'screen/profile/payments/ad_summary_page.dart';
import 'screen/profile/payments/payment_invoice_page.dart';
import 'screen/profile/payments/payment_plan_page.dart';
import 'screen/profile/payments/promotions_page.dart';
import 'screen/profile/payments/seo_page.dart';
import 'screen/profile/purchases/order_detail_page.dart';
import 'screen/profile/purchases/order_history_page.dart';
import 'screen/profile/purchases/orders_page.dart';
import 'screen/profile/purchases/transaction_list_page.dart';
import 'screen/profile/settings/change_email_page.dart';
import 'screen/profile/settings/change_mobile_number.dart';
import 'screen/profile/settings/change_password_page.dart';
import 'screen/profile/support_worker/profile_user_support_worker_page.dart';

class HomeNavigator extends StatefulWidget {
  static const String homePage = '/homePage';
  static const String loginPage = '/loginPage';
  static const String homeAllCategoryListPage = '/homeAllCategoryListPage';
  static const String homeHomeAccommodationHousingPage =
      '/homeHomeAccommodationHousingPage';
  static const String homeAccommodationRentalListPage =
      '/homeAccommodationRentalListPage';
  static const String homeRentPropertyDetailsPage =
      '/homeRentPropertyDetailsPage';
  static const String homeBlogListPage = '/homeBlogListPage';
  static const String homeBlogDetilsPage = '/homeBlogDetilsPage';
  static const String homeMarketPlacePropertySaleList =
      '/homeMarketPlacePropertySaleList';
  static const String homeSupportWorkerListPage = '/homeSupportWorkerListPage';
  static const String homeSupportWorkerSubCatgoryListDetailsPage =
      '/homeSupportWorkerSubCatgoryListDetailsPage';
  static const String homeSupportWorkerServiceDetailsPage =
      '/homeSupportWorkerServiceDetailsPage';
  static const String homeJobssubCategoryPage = '/homeJobssubCategoryPage';
  static const String homeJobsDetailsPage = '/homeJobsDetailsPage';
  static const String homeMarketPlacePage = '/homeMarketPlacePage';
  static const String hMarketPlaceProductPage = '/hMarketPlaceProductPage';
  static const String hMarketPlaceVehicalSale = '/hMarketPlaceVehicalSale';
  static const String hMarketPlaceProductDetailPage =
      '/hMarketPlaceProductDetailPage';
  static const String hMarketPlaceMycartPage = '/hMarketPlaceMycartPage';
  static const String hNewsPage = '/hNewsPage';
  static const String hNewsDetailPage = '/hNewsDetailPage';
  static const String hFindSupportPage = '/hFindSupportPage';
  static const String hServiceExpertListPage = '/hServiceExpertListPage';
  static const String hServiceExpertDetailsPage = '/hServiceExpertDetailsPage';

  static const String hPlanManagersPage = '/hPlanManagersPage';
  static const String hPsychoRecoveryPage = '/psychoRecoveryPage';
  static const String hPsychoRecoveryDetailPage = '/psychoRecoveryDetailPage';
  static const String hAdvocacyDetailPage = '/advocacyDetailPage';
  static const String AdvocacySupportPage = '/advocacySupportPage';
  static const String hPlanManagersDetailPage = '/hPlanManagersDetailPage';
  static const String hMainServiceExpertListPage =
      '/hMainServiceExpertListPage';
  static const String homeSubCatgoryListDetailsPage =
      '/homeSubCatgoryListDetailsPage';
  static const String homeServiceDetailsPage = '/homeServiceDetailsPage';
  static const String FilterScreen = '/FilterScreen';
  static const String signupPageStep1 = '/signupPageStep1';
  static const String otpPage = '/otpPage';
  static const String locationSearchPage = '/locationSearchPage';
  static const String participantRegisterPage = '/participantRegisterPage';
  static const String supportWorkerRegisterPage = '/supportWorkerRegisterPage';
  static const String supportWorkerCongratulationPage =
      '/supportWorkerCongratulationPage';
  static const String pricingPlanPage = '/pricingPlanPage';
  static const String pricingListingPage = '/pricingListingPage';
  static const String billingDetailPage = '/BillingDetailPage';
  static const String supportCoordinatorPage = '/supportCoordinatorPage';
  static const String HomeSupportCoordinatorsList =
      '/HomeSupportCoordinatorsList';
  static const String HomeSupportCoordinatorsDetail =
      '/HomeSupportCoordinatorsDetail';
  static const String HomeEventPage = '/HomeEventPage';
  static const String HomeEventDetailPage = '/HomeEventDetailPage';
  static const String ServiceEnquiryPage = '/ServiceEnquiryPage';
  static const String HomeJobsPage = '/HomeJobsPage';
  static const String hHomeSearchPage = '/hHomeSearchPage';
  static const String hvehicalDetailsPage = '/hvehicalDetailsPage';
  static const String hMpPropertyDetailsPage = '/hMpPropertyDetailsPage';
  static const String hAccommodationHolidaysListPage =
      '/hAccommodationHolidaysListPage';
  static const String hAccommodationSalealListPage =
      '/hAccommodationSalealListPage';
  static const String hLocationSearch = '/hLocationSearch';
  static const String hHomeAccomodationPropertyDetailsPage =
      '/hHomeAccomodationPropertyDetailsPage';

  //////////// Profile /////////////
  static const String dashBoardPage = '/dashBoardPage';
  static const String participantViewProfilePage =
      '/participantViewProfilePage';
  static const String profileNdisExpertViewProfilePage =
      '/profileNdisExpertViewProfilePage';
  static const String profileGeneralUserViewProfilePage =
      '/profileGeneralUserViewProfilePage';
  static const String locationSearchProfilePage = '/locationSearchProfilePage';
  static const String profileSupportWorkerPage = '/profileSupportWorkerPage';
  static const String JobProfilePage = '/jobProfilePage';
  static const String AllAppliedJobsPage = '/allAppliedJobsPage';
  static const String MyServiceBookingPage = '/myServiceBookingPage';
  static const String MyDirectQueriesPage = '/myDirectQueriesPage';
  static const String ReviewsPage = '/reviewsPage';
  static const String LikedListPage = '/likedListPage';
  static const String NotificationPage = '/notificationPage';
  static const String HowTosPage = '/howTosPage';
  static const String FollowingsPage = '/followingsPage';
  static const String LookingForJobPage = '/lookingForJobPage';
  static const String MyEventsPage = '/myEventsPage';
  static const String ChangePasswordPage = '/changePasswordPage';
  static const String ChangeEmailPage = '/changeEmailPage';
  static const String ChangeMobilePage = '/changeMobilePage';
  static const String OrdersPage = '/ordersPage';
  static const String OrderDetailPage = '/orderDetailPage';
  static const String AboutUsPage = '/aboutUsPage';
  static const String ContactUsPage = '/contactUsPage';
  static const String AddListingPage = '/addListingPage';
  static const String AllUserPage = '/allUserPage';
  static const String OrderHistoryPage = '/orderHistoryPage';
  static const String ServicesOfferedPage = '/servicesOfferedPage';
  static const String ServiceLocationPage = '/serviceLocationPage';
  static const String TransactionListPage = '/transactionListPage';
  static const String MyDirectLeadsPage = '/myDirectLeadsPage';
  static const String MyGenericLeadsPage = '/myGenericLeadsPage';
  static const String PaymentPlanPage = '/paymentPlanPage';
  static const String SeoPage = '/seoPage';
  static const String AdSummaryPage = '/adSummaryPage';
  static const String PromotionsPage = '/promotionsPage';
  static const String PaymentInvoicePage = '/paymentInvoicePage';
  static const String SettingPage = '/settingPage';

  final UserRepository? userRepository;

  const HomeNavigator({this.userRepository});

  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  _HomeRouter? _router;

  @override
  void initState() {
    super.initState();
    _router = _HomeRouter(homeBloc: BlocProvider.of<HomeBloc>(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        print("in bloc Builder of Profile ");
        return Navigator(
          initialRoute: HomeNavigator.homePage,
          onGenerateRoute: _router!.onGenerateRoute,
        );
      },
    );
  }

  @override
  void dispose() {
    _router!.dispose();
    super.dispose();
  }
}

class _HomeRouter {
  final HomeBloc? homeBloc;

  _HomeRouter({this.homeBloc});

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeNavigator.homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomePage(),
          ),
        );
        break;
      case HomeNavigator.loginPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: LoginPage(),
          ),
        );
        break;
      case HomeNavigator.signupPageStep1:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: SignUpPageStep1(),
          ),
        );
        break;
      case HomeNavigator.otpPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AuthOtpPage(),
          ),
        );
        break;
      case HomeNavigator.participantRegisterPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ParticipantPage(),
          ),
        );
        break;
      case HomeNavigator.supportWorkerRegisterPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: SupportWorkerPage(),
          ),
        );
        break;
      case HomeNavigator.supportWorkerCongratulationPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: SupportWorkerCongratulationPage(),
          ),
        );
        break;
      case HomeNavigator.locationSearchPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: LocationSearchPage(),
          ),
        );
        break;
      case HomeNavigator.pricingPlanPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: PricingPlanPage(),
          ),
        );
        break;
      case HomeNavigator.pricingListingPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: PricingListingPage(),
          ),
        );
        break;
      case HomeNavigator.billingDetailPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: BillingDetailPage(),
          ),
        );
        break;
      case HomeNavigator.homeAllCategoryListPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeAllCategoryListPage(),
          ),
        );
        break;
      case HomeNavigator.supportCoordinatorPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeSupportCoordinators(),
          ),
        );
        break;
      case HomeNavigator.HomeSupportCoordinatorsList:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeSupportCoordinatorsList(),
          ),
        );
        break;
      case HomeNavigator.HomeSupportCoordinatorsDetail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: SupportCoordinatorDetailsPage(),
          ),
        );
        break;
      case HomeNavigator.hMainServiceExpertListPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeServiceExpertMainCategoryList(),
          ),
        );
        break;
      case HomeNavigator.HomeEventPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeAllEvents(),
          ),
        );
        break;
      case HomeNavigator.HomeEventDetailPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: EventDetailScreen(),
          ),
        );
        break;
      case HomeNavigator.ServiceEnquiryPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ServiceEnquiryScreen(),
          ),
        );
        break;
      case HomeNavigator.HomeJobsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeJobsScreen(),
          ),
        );
        break;
      case HomeNavigator.homeSupportWorkerListPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeSupportWorkerListPage(),
          ),
        );
        break;

      case HomeNavigator.homeSupportWorkerSubCatgoryListDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: SupportWorkerSubCategoryPage(),
          ),
        );
        break;

      case HomeNavigator.homeSupportWorkerServiceDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: SupportWorkerServiceDetailsPage(),
          ),
        );
        break;

      case HomeNavigator.homeMarketPlacePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeMarketPlace(),
          ),
        );
        break;

      case HomeNavigator.hMarketPlaceProductPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: MarketPlaceProducts(),
          ),
        );
        break;
      case HomeNavigator.hMarketPlaceVehicalSale:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: MarketPlaceVehicalSale(),
          ),
        );
        break;

      case HomeNavigator.hMarketPlaceMycartPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeMpMyCartPage(),
          ),
        );
        break;
      case HomeNavigator.hNewsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeNewsScreen(),
          ),
        );
        break;
      case HomeNavigator.hNewsDetailPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: NewsDetailScreen(),
          ),
        );
        break;
      case HomeNavigator.hFindSupportPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeFindSupport(),
          ),
        );
        break;

      case HomeNavigator.hServiceExpertListPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeServiceExpertListPage(),
          ),
        );
        break;
      case HomeNavigator.hServiceExpertDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ServiceExpertDetails(),
          ),
        );
        break;

      case HomeNavigator.hMarketPlaceProductDetailPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: MpProductDetail(),
          ),
        );
        break;

      case HomeNavigator.homeJobssubCategoryPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeJobsSubCatrgoryPage(),
          ),
        );
        break;

      case HomeNavigator.homeJobsDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeJobsetailsPage(),
          ),
        );
        break;

      case HomeNavigator.hPlanManagersPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomePlanManagersPage(),
          ),
        );
        break;
      case HomeNavigator.hPsychoRecoveryPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: PsychoRecoveryPage(),
          ),
        );
        break;
      case HomeNavigator.hPsychoRecoveryDetailPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: PsychoRecoveryDetailPage(),
          ),
        );
        break;
      case HomeNavigator.hAdvocacyDetailPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AdvocacyDetailPage(),
          ),
        );
        break;
      case HomeNavigator.AdvocacySupportPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AdvocacySupportPage(),
          ),
        );
        break;

      case HomeNavigator.hPlanManagersDetailPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: PlanManagersDetailsPage(),
          ),
        );
        break;

      case HomeNavigator.homeSubCatgoryListDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeSubCatgoryListDetailsPage(),
          ),
        );
        break;
      case HomeNavigator.homeServiceDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeServiceDetailsPage(),
          ),
        );
        break;
      case HomeNavigator.FilterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: FilterScreen(),
          ),
        );
        break;
      case HomeNavigator.homeHomeAccommodationHousingPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeAccommodationHousingPage(),
          ),
        );
        break;
      case HomeNavigator.homeAccommodationRentalListPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AccommodationRentalListPage(),
          ),
        );
        break;
      case HomeNavigator.homeRentPropertyDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: RentPropertyDetailsPage(),
          ),
        );
        break;
      case HomeNavigator.homeBlogListPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: BlogListPage(),
          ),
        );
        break;
      case HomeNavigator.homeBlogDetilsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: BlogDetilsPage(),
          ),
        );
        break;
      case HomeNavigator.homeMarketPlacePropertySaleList:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: MarketPlacePropertySaleList(),
          ),
        );
        break;
      case HomeNavigator.hHomeSearchPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeSearchPage(),
          ),
        );
        break;
      case HomeNavigator.hvehicalDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: vehicalDetailsPage(),
          ),
        );
        break;
      case HomeNavigator.hMpPropertyDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: MpPropertyDetailsPage(),
          ),
        );
        break;
      case HomeNavigator.hAccommodationHolidaysListPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AccommodationHolidaysListPage(),
          ),
        );
        break;
      case HomeNavigator.hAccommodationSalealListPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AccommodationSalealListPage(),
          ),
        );
        break;
      case HomeNavigator.hHomeAccomodationPropertyDetailsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HomeAccomodationPropertyDetailsPage(),
          ),
        );
        break;
      case HomeNavigator.hLocationSearch:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: LocationSearchCity(),
          ),
        );
        break;
      case HomeNavigator.dashBoardPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: DashBoardPage(),
          ),
        );
        break;
      case HomeNavigator.participantViewProfilePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ProfileParticipantPage(),
          ),
        );

        break;
      case HomeNavigator.profileNdisExpertViewProfilePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ProfileNdisServiceExpert(),
          ),
        );
        break;
      case HomeNavigator.profileGeneralUserViewProfilePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ProfileGeneralUserPage(),
          ),
        );
        break;
      case HomeNavigator.locationSearchProfilePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ProfileNdisServiceExpert(),
          ),
        );
        break;
      case HomeNavigator.JobProfilePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: JobProfilePage(),
          ),
        );
        break;
      case HomeNavigator.AllAppliedJobsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AllAppliedJobsPage(),
          ),
        );
        break;
      case HomeNavigator.MyServiceBookingPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: MyServiceBookingsPage(),
          ),
        );
        break;
      case HomeNavigator.MyDirectQueriesPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: MyDirectQueriesPage(),
          ),
        );
        break;
      case HomeNavigator.ReviewsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ReviewsPage(),
          ),
        );
        break;
      case HomeNavigator.LikedListPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: LikedListPage(),
          ),
        );
        break;
      case HomeNavigator.NotificationPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: NotificationPage(),
          ),
        );
        break;
      case HomeNavigator.HowTosPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: HowTosPage(),
          ),
        );
        break;
      case HomeNavigator.FollowingsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: FollowingsPage(),
          ),
        );
        break;
      case HomeNavigator.LookingForJobPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: LookingForJobPage(),
          ),
        );
        break;
      case HomeNavigator.MyEventsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: MyEventsPage(),
          ),
        );
        break;
      case HomeNavigator.ChangePasswordPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ChangePasswordPage(),
          ),
        );
        break;
      case HomeNavigator.ChangeEmailPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ChangeEmailPage(),
          ),
        );
        break;
      case HomeNavigator.ChangeMobilePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ChangeMobilePage(),
          ),
        );
        break;
      case HomeNavigator.OrdersPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: OrdersPage(),
          ),
        );
        break;
      case HomeNavigator.OrderDetailPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: OrderDetailPage(),
          ),
        );
        break;
      case HomeNavigator.AboutUsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AboutUsPage(),
          ),
        );
        break;
      case HomeNavigator.ContactUsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ContactUsPage(),
          ),
        );
        break;
      case HomeNavigator.AddListingPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AddListingPage(),
          ),
        );
        break;
      case HomeNavigator.AllUserPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AllUserPage(),
          ),
        );
        break;
      case HomeNavigator.OrderHistoryPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: OrderHistoryPage(),
          ),
        );
        break;
      case HomeNavigator.ServicesOfferedPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ServicesOfferedPage(),
          ),
        );
        break;
      case HomeNavigator.ServiceLocationPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ServiceLocationPage(),
          ),
        );
        break;
      case HomeNavigator.TransactionListPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: TransactionListPage(),
          ),
        );
        break;
      case HomeNavigator.MyDirectLeadsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: MyDirectLeadsPage(),
          ),
        );
        break;
      case HomeNavigator.MyGenericLeadsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: MyGenericLeadsPage(),
          ),
        );
        break;
      case HomeNavigator.PaymentPlanPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: PaymentPlanPage(),
          ),
        );
        break;
      case HomeNavigator.SeoPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: SeoPage(),
          ),
        );
        break;
      case HomeNavigator.AdSummaryPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: AdSummaryPage(),
          ),
        );
        break;
      case HomeNavigator.PromotionsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: PromotionsPage(),
          ),
        );
        break;
      case HomeNavigator.PaymentInvoicePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: PaymentInvoicePage(),
          ),
        );
        break;
      case HomeNavigator.SettingPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: SettingPage(),
          ),
        );
      case HomeNavigator.profileSupportWorkerPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>.value(
            value: homeBloc!,
            child: ProfileSupportWorkerPage(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    //homeBloc.close();
  }
}
