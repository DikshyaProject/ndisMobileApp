import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/intl.dart';
import 'package:ndisparticipant/Helpers/expand_row.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/home.dart';

import '../../../Helpers/services/services.dart';
import '../../../Helpers/theme/theme.dart';
import '../../../bottom_navigation/bloc/bloc.dart';
import '../../profile_model/profile_count_data_model.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  bool isOpen = false;
  List<String> profile_items = [
    'My Profile',
  ];
  String profile = 'PROFILE PAGES';
  List<String> my_sr_items = [
    'My Direct Queries',
    'My Service Request',
  ];
  String my_sr = 'MY SERVICE REQUESTS';
  List<String> job_items_for_general = [
    'Job Profile',
    'Looking for Job',
    'All Applied Jobs',
  ];
  List<String> job_items_for_sup_work = [
    'Job Profile',
    'All Applied Jobs',
  ];
  List<String> job_items_for_expert = [
    'Post Jobs',
    'Review Applicants',
  ];
  String job = 'JOBS';
  List<String> my_activities_items_for_general = [
    "Reviews",
    "Liked Listings",
    "Followings",
    "Notifications",
    "My Events",
    "How to's",
  ];
  List<String> my_activities_items_for_sup_work = [
    "Reviews",
    "Liked Listings",
    "Followings",
    "Notifications",
    "My Events",
    "How to's",
    "Setting",
  ];
  List<String> my_activities_items_for_expert = [
    "Reviews",
    "Liked Listings",
    "Followings",
    "System Notifications",
    "Notifications",
    "Post Events",
    "Blog Posts",
    "Setting",
    "How to's",
    "Coupons",
  ];
  String my_activities = 'MY ACTIVITIES';
  List<String> purchase_items = [
    "Orders",
    "Order History",
    "Transaction History",
  ];
  String purchase = 'PURCHASES';
  List<String> settings_items = [
    "Change Password",
    "Change Email Address",
    "Change Mobile Number",
    "Log Out",
  ];
  String settings = 'SETTINGS';
  List<String> lead_items = [
    "My Direct Leads",
    "My Generic Leads",
  ];
  String lead = 'LEADS AND ENQUIRY';
  List<String> payment_items = [
    "Payment & Plan",
    "Promotions",
    "SEO",
    "Ad Summary",
    "Payment Invoice",
  ];
  String payment = 'PAYMENT & PROMOTIONS';
  List<String> business_items = [
    "Add Listing",
    "Company Details",
    "Service Categories",
    "Services Offered",
    "Service Locations",
    "Special Offers",
    "Map & Photo Gallery",
    "Working Hours",
    "Business Details",
  ];
  String business = 'BUSINESS PROFILE';
  List<String> real_state_items = [
    "List Rental Properties",
    "List Property for Sale",
    "List Holiday Destination Properties",
  ];
  String real_state = 'REAL ESTATE';
  List<String> e_comm_items = [
    "Products",
    "Inventory",
    "My Orders",
    "Order History",
    "Payments",
    "Customers",
    "Vehicle for Sale",
  ];
  String e_comm = 'E-COMMERNCE';
  String review_count = "";
  String liked_count = "";
  String followings_count = "";
  ProfileCountsData? count_data;

  @override
  void initState() {
    showHideProgress(true);
    BlocProvider.of<HomeBloc>(context).add(ProfileReviewCountEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeInitial) {
          Navigator.of(context).pop();
        } else if (state is ProfileViewParticipantPageState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.participantViewProfilePage);
        } else if (state is ProfileViewGeneralPageState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.profileGeneralUserViewProfilePage);
        } else if (state is PaymentsClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.PaymentPlanPage);
        } else if (state is SeoClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.SeoPage);
        } else if (state is AdSummaryState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.AdSummaryPage);
        } else if (state is PromotionsState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.PromotionsPage);
        } else if (state is PaymentInvoiceState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.PaymentInvoicePage);
        } else if (state is ProfileViewServiceExpertPageState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.profileNdisExpertViewProfilePage);
        } else if (state is ProfileUserDataPageErrorState) {
          showHideProgress(false);
          if (state.message == "Data Not Found") {
            sharedPrefs.IsLogin = false;
            sharedPrefs.userName = "";
            sharedPrefs.serviceLocation = "";
            sharedPrefs.userType = "";
            sharedPrefs.userImage = "";
            Phoenix.rebirth(context);
            showSnackBar("User not found!", Colors.red, context);
          } else {
            BlocProvider.of<HomeBloc>(context)
                .add(ProfileEventDashboardPageBack());
          }
        } else if (state is ProfileSupportWorkerPageState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.profileSupportWorkerPage);
        } else if (state is ProfileErrorState) {
          showHideProgress(false);
          showSnackBar(state.message!, Colors.red, context);
          BlocProvider.of<HomeBloc>(context).add(ProfileResetEvent());
        } else if (state is JobProfileClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.JobProfilePage);
        } else if (state is AllAppliedJobClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.AllAppliedJobsPage);
        } else if (state is LookingForJobClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.LookingForJobPage);
        } else if (state is MyServiceBookingBtnClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.MyServiceBookingPage);
        } else if (state is MyDirectQueriesBtnClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.MyDirectQueriesPage);
        } else if (state is LikedListingClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.LikedListPage);
        } else if (state is ReviewPageClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.ReviewsPage);
        } else if (state is NotificationClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.NotificationPage);
        } else if (state is HowTosClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.HowTosPage);
        } else if (state is FollowingsClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.FollowingsPage);
        } else if (state is MyEventsClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.MyEventsPage);
        } else if (state is SettingClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.SettingPage);
        } else if (state is ChangePasswordClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.ChangePasswordPage);
        } else if (state is ChangeEmailClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.ChangeEmailPage);
        } else if (state is ChangeMobileClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.ChangeMobilePage);
        } else if (state is MyOrdersClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.OrdersPage);
        } else if (state is OrderHistoryClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.OrderHistoryPage);
        } else if (state is TransactionHistoryClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.TransactionListPage);
        } else if (state is MyDirectLeadState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.MyDirectLeadsPage);
        } else if (state is MyGenericLeadState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.MyGenericLeadsPage);
        } else if (state is AboutUsBtnClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.AboutUsPage);
        } else if (state is ContactUsBtnClickState) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.ContactUsPage);
        } else if (state is ProfileReviewCountState) {
          count_data = state.profileCountsModel?.data;
          review_count = "${count_data?.reviews}";
          liked_count = "${count_data?.allLikes}";
          followings_count = "${count_data?.followings}";
          BlocProvider.of<HomeBloc>(context).add(ProfileResetEvent());
          showHideProgress(false);
        }

        print("current_state_is____${sharedPrefs.userType}");
      },
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 180.0.scale(),
                  ),
                  Container(
                    height: 140.0.scale(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0.scale()),
                          bottomRight: Radius.circular(10.0.scale())),
                      color: kColorThemePurpleColor.withOpacity(0.6),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ProfileEventBackBtnClick(""));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            )),
                        AHorizontalSpace(20.0.scale()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200.0.scale(),
                              child: Wrap(
                                children: [
                                  Text(
                                    "Welcome Back  ",
                                    style: textStyleCustomColor(
                                        15.0.scale(), Colors.white),
                                  ),
                                  Text(
                                    "${sharedPrefs.userName}",
                                    style: textStyleBoldCustomColor(
                                        17.0.scale(), Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "${sharedPrefs.userType}",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.white),
                            ),
                            Text(
                              DateFormat("Join on dd, MMM yyyy")
                                  .format(DateTime.parse(
                                      sharedPrefs.userRegisterDate))
                                  .toString(),
                              style: textStyleCustomColor(
                                  13.0.scale(), Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          height: 70.0.scale(),
                          width: 70.0.scale(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.grey)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: NetworkImagesWidgets(
                                url: "${sharedPrefs.userImage}",
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    )
                        .leftPadding(12.0.scale())
                        .rightPadding(12.0.scale())
                        .topPadding(12.0.scale())
                        .bottomPadding(40.0.scale()),
                  ),
                  Positioned(
                    bottom: 12.0.scale(),
                    left: 20.0.scale(),
                    right: 20.0.scale(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.all(8.0.scale()),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  color:
                                      kColorThemePurpleColor.withOpacity(0.6),
                                  offset: Offset(1.0,
                                      1.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("All reviews",
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black)),
                                Text("$review_count",
                                    style: textStyleBoldCustomColor(
                                        20.0.scale(), Colors.black)),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(8.0.scale()),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  color:
                                      kColorThemePurpleColor.withOpacity(0.6),
                                  offset: Offset(1.0,
                                      1.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Liked Listings",
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black)),
                                Text("$liked_count",
                                    style: textStyleBoldCustomColor(
                                        20.0.scale(), Colors.black)),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(8.0.scale()),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  color:
                                      kColorThemePurpleColor.withOpacity(0.6),
                                  offset: Offset(1.0,
                                      1.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Followings",
                                    style: textStyleBoldCustomColor(
                                        12.0.scale(), Colors.black)),
                                Text("$followings_count",
                                    style: textStyleBoldCustomColor(
                                        20.0.scale(), Colors.black)),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),

              AVerticalSpace(8.0.scale()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context)
                            .add(AboutUsBtnClick());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0.scale(), vertical: 5.0.scale()),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kColorThemePurpleColor.withOpacity(0.6),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.question_answer_rounded,
                              color: Colors.white,
                              size: 16.0.scale(),
                            ),
                            Text("  About Us",
                                style: textStyleBoldCustomColor(
                                    14.0.scale(), Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context)
                            .add(ContactUsBtnClick());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0.scale(), vertical: 5.0.scale()),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kColorThemePurpleColor.withOpacity(0.6),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.contact_phone,
                              color: Colors.white,
                              size: 16.0.scale(),
                            ),
                            Text("  Contact Us",
                                style: textStyleBoldCustomColor(
                                    14.0.scale(), Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AVerticalSpace(15.0.scale()),

              ///for General &  Participant user listing
              sharedPrefs.userType == "General" ||
                      sharedPrefs.userType == "Participant"
                  ? general_dash_view()
                  : sharedPrefs.userType == "Support Worker"
                      ? support_worker_dash_view()
                      : sharedPrefs.userType == "NDIS service experts"
                          ? expert_dash_view()
                          :

                          ///else logout only
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.0.scale()),
                              child: InkWell(
                                onTap: () {
                                  sharedPrefs.IsLogin = false;
                                  sharedPrefs.userName = "";
                                  sharedPrefs.serviceLocation = "";
                                  sharedPrefs.userType = "";
                                  sharedPrefs.userImage = "";
                                  BlocProvider.of<HomeBloc>(context)
                                      .add(ProfileEventBackBtnClick(""));
                                  Phoenix.rebirth(context);
                                },
                                child: Container(
                                  height: 50.0.scale(),
                                  alignment: Alignment.centerLeft,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0.scale()),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: kColorThemePurpleColor
                                            .withOpacity(0.6),
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Log Out",
                                    style: textStyleBoldCustomColor(
                                        14.0.scale(), Colors.black),
                                  ),
                                ),
                              ),
                            ),
            ],
          ),
        ),
      ),
    );
  }

  Widget support_worker_dash_view() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              title: profile,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: profile_items.map((e) {
                  return InkWell(
                    onTap: () {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(ProfileViewBtnClick(sharedPrefs.userType));
                      isOpen = false;
                    },
                    child: Text(
                      "${e}",
                      style: textStyleBoldBlack(14, Colors.black),
                    ).bottomPadding(8.0.scale()),
                  );
                }).toList(),
              ).leftPadding(10.0.scale()).bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: my_sr,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: my_sr_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "My Service Request") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyServiceBookingBtnClick());
                              isOpen = false;
                            } else if (e == "My Direct Queries") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyDirectQueriesBtnClick());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: lead,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: lead_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "My Direct Leads") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyDirectLeadEvent());
                              isOpen = false;
                            } else if (e == "My Generic Leads") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyGenericLeadEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: job,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: job_items_for_sup_work.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Job Profile") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(JobProfileClickEvent());
                              isOpen = false;
                            } else if (e == "All Applied Jobs") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(AllAppliedJobClickEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: payment,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: payment_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Payment & Plan") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(PaymentsClickEvent());
                              isOpen = false;
                            } else if (e == "Promotions") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(PromotionsEvent());
                              isOpen = false;
                            } else if (e == "SEO") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(SeoClickEvent());
                              isOpen = false;
                            } else if (e == "Ad Summary") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(AdSummaryEvent());
                              isOpen = false;
                            } else if (e == "Payment Invoice") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(PaymentInvoiceEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: my_activities,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: my_activities_items_for_sup_work.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Reviews") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ReviewPageClickEvent());
                              isOpen = false;
                            } else if (e == "Liked Listings") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(LikedListingClickEvent());
                              isOpen = false;
                            } else if (e == "Notifications") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(NotificationClickEvent(''));
                              isOpen = false;
                            } else if (e == "How to's") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(HowTosClickEvent());
                              isOpen = false;
                            } else if (e == "Followings") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(FollowingsClickEvent());
                              isOpen = false;
                            } else if (e == "My Events") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyEventsClickEvent());
                              isOpen = false;
                            } else if (e == "Setting") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(SettingClickEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: purchase,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: purchase_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Orders") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyOrdersClickEvent());
                              isOpen = false;
                            } else if (e == "Order History") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(OrderHistoryClickEvent());
                              isOpen = false;
                            } else if (e == "Transaction History") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(TransactionHistoryClickEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: settings,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: settings_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Log Out") {
                              sharedPrefs.IsLogin = false;
                              sharedPrefs.userName = "";
                              sharedPrefs.serviceLocation = "";
                              sharedPrefs.userType = "";
                              sharedPrefs.userImage = "";
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ProfileEventBackBtnClick(""));
                              Phoenix.rebirth(context);
                              isOpen = false;
                            } else if (e == "Change Password") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangePasswordClickEvent());
                              isOpen = false;
                            } else if (e == "Change Email Address") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangeEmailClickEvent());
                              isOpen = false;
                            } else if (e == "Change Mobile Number") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangeMobileClickEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
        ],
      ),
    );
  }

  Widget expert_dash_view() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              title: profile,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: profile_items.map((e) {
                  return InkWell(
                    onTap: () {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(ProfileViewBtnClick(sharedPrefs.userType));
                      isOpen = false;
                    },
                    child: Text(
                      "${e}",
                      style: textStyleBoldBlack(14, Colors.black),
                    ).bottomPadding(8.0.scale()),
                  );
                }).toList(),
              ).leftPadding(10.0.scale()).bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: business,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: business_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Add Listing") {
                              // showHideProgress(true);
                              // BlocProvider.of<HomeBloc>(context)
                              //     .add(MyServiceBookingBtnClick());
                              isOpen = false;
                            } else if (e == "Company Details") {
                              isOpen = false;
                            } else if (e == "Service Categories") {
                              isOpen = false;
                            } else if (e == "Services Offered") {
                              isOpen = false;
                            } else if (e == "Service Locations") {
                              isOpen = false;
                            } else if (e == "Special Offers") {
                              isOpen = false;
                            } else if (e == "Map & Photo Gallery") {
                              isOpen = false;
                            } else if (e == "Working Hours") {
                              isOpen = false;
                            } else if (e == "Business Details") {
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: my_sr,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: my_sr_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "My Service Request") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyServiceBookingBtnClick());
                              isOpen = false;
                            } else if (e == "My Direct Queries") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyDirectQueriesBtnClick());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: lead,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: lead_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "My Direct Leads") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyDirectLeadEvent());
                              isOpen = false;
                            } else if (e == "My Generic Leads") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyGenericLeadEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: job,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: job_items_for_expert.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Post Jobs") {
                              // showHideProgress(true);
                              // BlocProvider.of<HomeBloc>(context)
                              //     .add(JobProfileClickEvent());
                              isOpen = false;
                            } else if (e == "Review Applicants") {
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: real_state,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: real_state_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "List Rental Properties") {
                              // showHideProgress(true);
                              // BlocProvider.of<HomeBloc>(context)
                              //     .add(JobProfileClickEvent());
                              isOpen = false;
                            } else if (e == "List Property for Sale") {
                              isOpen = false;
                            } else if (e ==
                                "List Holiday Destination Properties") {
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: e_comm,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: e_comm_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Products") {
                              // showHideProgress(true);
                              // BlocProvider.of<HomeBloc>(context)
                              //     .add(JobProfileClickEvent());
                              isOpen = false;
                            } else if (e == "Inventory") {
                              isOpen = false;
                            } else if (e == "My Orders") {
                              isOpen = false;
                            } else if (e == "Order History") {
                              isOpen = false;
                            } else if (e == "Payments") {
                              isOpen = false;
                            } else if (e == "Customers") {
                              isOpen = false;
                            } else if (e == "Vehicle for Sale") {
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: payment,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: payment_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Payment & Plan") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(PaymentsClickEvent());
                              isOpen = false;
                            } else if (e == "Promotions") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(PromotionsEvent());
                              isOpen = false;
                            } else if (e == "SEO") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(SeoClickEvent());
                              isOpen = false;
                            } else if (e == "Ad Summary") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(AdSummaryEvent());
                              isOpen = false;
                            } else if (e == "Payment Invoice") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(PaymentInvoiceEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: my_activities,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: my_activities_items_for_expert.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Reviews") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ReviewPageClickEvent());
                              isOpen = false;
                            } else if (e == "Liked Listings") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(LikedListingClickEvent());
                              isOpen = false;
                            } else if (e == "Followings") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(FollowingsClickEvent());
                              isOpen = false;
                            } else if (e == "System Notifications") {
                              // showHideProgress(true);
                              // BlocProvider.of<HomeBloc>(context)
                              //     .add(NotificationClickEvent());
                              isOpen = false;
                            } else if (e == "Notifications") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(NotificationClickEvent(''));
                              isOpen = false;
                            } else if (e == "Post Events") {
                              // showHideProgress(true);
                              // BlocProvider.of<HomeBloc>(context)
                              //     .add(NotificationClickEvent());
                              isOpen = false;
                            } else if (e == "Blog Posts") {
                              // showHideProgress(true);
                              // BlocProvider.of<HomeBloc>(context)
                              //     .add(NotificationClickEvent());
                              isOpen = false;
                            } else if (e == "Setting") {
                              // showHideProgress(true);
                              // BlocProvider.of<HomeBloc>(context)
                              //     .add(NotificationClickEvent());
                              isOpen = false;
                            } else if (e == "How to's") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(HowTosClickEvent());
                              isOpen = false;
                            } else if (e == "Coupons") {
                              // showHideProgress(true);
                              // BlocProvider.of<HomeBloc>(context)
                              //     .add(MyEventsClickEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: settings,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: settings_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Log Out") {
                              sharedPrefs.IsLogin = false;
                              sharedPrefs.userName = "";
                              sharedPrefs.serviceLocation = "";
                              sharedPrefs.userType = "";
                              sharedPrefs.userImage = "";
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ProfileEventBackBtnClick(""));
                              Phoenix.rebirth(context);
                              isOpen = false;
                            } else if (e == "Change Password") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangePasswordClickEvent());
                              isOpen = false;
                            } else if (e == "Change Email Address") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangeEmailClickEvent());
                              isOpen = false;
                            } else if (e == "Change Mobile Number") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangeMobileClickEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
        ],
      ),
    );
  }

  Widget general_dash_view() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              title: profile,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: profile_items.map((e) {
                  return InkWell(
                    onTap: () {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(ProfileViewBtnClick(sharedPrefs.userType));
                      isOpen = false;
                    },
                    child: Text(
                      "${e}",
                      style: textStyleBoldBlack(14, Colors.black),
                    ).bottomPadding(8.0.scale()),
                  );
                }).toList(),
              ).leftPadding(10.0.scale()).bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: my_sr,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: my_sr_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "My Service Request") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyServiceBookingBtnClick());
                              isOpen = false;
                            } else if (e == "My Direct Queries") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyDirectQueriesBtnClick());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: job,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: job_items_for_general.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Job Profile") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(JobProfileClickEvent());
                              isOpen = false;
                            } else if (e == "All Applied Jobs") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(AllAppliedJobClickEvent());
                              isOpen = false;
                            } else if (e == "Looking for Job") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(LookingForJobClickEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: my_activities,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: my_activities_items_for_general.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Reviews") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ReviewPageClickEvent());
                              isOpen = false;
                            } else if (e == "Liked Listings") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(LikedListingClickEvent());
                              isOpen = false;
                            } else if (e == "Notifications") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(NotificationClickEvent(''));
                              isOpen = false;
                            } else if (e == "How to's") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(HowTosClickEvent());
                              isOpen = false;
                            } else if (e == "Followings") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(FollowingsClickEvent());
                              isOpen = false;
                            } else if (e == "My Events") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyEventsClickEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: purchase,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: purchase_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Orders") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(MyOrdersClickEvent());
                              isOpen = false;
                            } else if (e == "Order History") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(OrderHistoryClickEvent());
                              isOpen = false;
                            } else if (e == "Transaction History") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(TransactionHistoryClickEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
          AVerticalSpace(10.0.scale()),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kColorThemePurpleColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: ExpandCardOutside(
              box_color: Colors.transparent,
              title_color: Colors.black,
              isopen: isOpen,
              title: settings,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: settings_items.map((e) {
                        return InkWell(
                          onTap: () {
                            if (e == "Log Out") {
                              sharedPrefs.IsLogin = false;
                              sharedPrefs.userName = "";
                              sharedPrefs.serviceLocation = "";
                              sharedPrefs.userType = "";
                              sharedPrefs.userImage = "";
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ProfileEventBackBtnClick(""));
                              Phoenix.rebirth(context);
                              isOpen = false;
                            } else if (e == "Change Password") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangePasswordClickEvent());
                              isOpen = false;
                            } else if (e == "Change Email Address") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangeEmailClickEvent());
                              isOpen = false;
                            } else if (e == "Change Mobile Number") {
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(ChangeMobileClickEvent());
                              isOpen = false;
                            }
                          },
                          child: Text(
                            "${e}",
                            style: textStyleBoldBlack(14, Colors.black),
                          ).bottomPadding(8.0.scale()),
                        );
                      }).toList())
                  .leftPadding(10.0.scale())
                  .bottomPadding(10.0.scale()),
            ),
          ),
        ],
      ),
    );
  }
}
