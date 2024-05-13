import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../../../Helpers/services/services.dart';
import '../../../Helpers/theme/theme.dart';
import '../../../Helpers/utils/network_image_widget.dart';
import '../../../Helpers/utils/utils.dart';
import '../../../bottom_navigation/bloc/bloc.dart';
import '../../../bottom_navigation/bottom_navigation.dart';
import '../../../components/components.dart';
import '../../home.dart';
import '../../model/general/ourserviceList_model.dart';
import '../../model/home/home_details_model.dart';
import '../../model/news/news_list_mnodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{
  List<dynamic>? getPanelistInfo;
  List<OurServiceModel>? ourServiceList = [];
  bool showProgressIndicator = false;
  String frnatdate = "";
  DateTime datetime = DateTime.now();
  late ScrollController scrollController;
  final List<String> imgList = ["assets/images/ic_banner_bg.png"];
  bool today = true;
  bool tomorrow = false;
  bool thisweek = false;
  bool thismonth = false;
  HomeDetailsData? getHomeDetailsData;
  List<PopularServicesNearYou>? popularServicesNearYou = [];
  List<NewsSliderData>? newsSliderData = [];
  List<FeatureEventsInCity>? featureEventsInCity = [];
  String url = "";
  NewsListData? newsListData;
  List<Newslidelist>? latestAndPopular = [];

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  final key = GlobalKey<AnimatedListState>();
  ValueNotifier<String?> badge_count = ValueNotifier('');
  bool _showCartBadge = false;
  int addIntegers(int a, [int b = 0, int c = 0]) {
    return a + b + c;
  }

  void add_main() {
    // Adding three integers
    int sum1 = addIntegers(1); // Adds 1 + 0 + 0
    int sum2 = addIntegers(1, 2); // Adds 1 + 2 + 0
    int sum3 = addIntegers(1, 2, 3); // Adds 1 + 2 + 3

    // Printing the results
    print('Sum 1: $sum1');
    print('Sum 2: $sum2');
    print('Sum 3: $sum3');
  }
   Widget design(){
    return ListView.builder(
       itemCount: 5,
       itemBuilder: (context, index) {
         double width;
         if (index % 3 == 0) {
           width = MediaQuery.of(context).size.width;
         } else {
           width = MediaQuery.of(context).size.width / 2;
         }

         print("width____is______$width");
         return Container(
           width: width,
           color: Colors.blue,
           margin: EdgeInsets.all(8.0),
           padding: EdgeInsets.all(16.0),
           child: Center(
             child: Text(
               'Item $index',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 18.0,
               ),
             ),
           ),
         );
       },
     );
   }



  @override
  void initState() {
    print("image__________${sharedPrefs.userImage}");
    showHideProgress(true);
    BlocProvider.of<HomeBloc>(context).add(HomeEventHomePageDetailsBtnClick());
    BlocProvider.of<HomeBloc>(context).add(HomeNewsListBtnClick());
    if (sharedPrefs.IsLogin) {
      BlocProvider.of<HomeBloc>(context).add(HomeNotificationCountEvent());
    }

    scrollController = ScrollController();
    ourServiceList = [
      OurServiceModel(
          image: "ic_all_services_provider", title: "All Service Provider"),
      OurServiceModel(image: "ic_support_worker", title: "Support Workers"),
      OurServiceModel(image: "ic_job", title: "Jobs"),
      OurServiceModel(
          image: "ic_support_corrdinator", title: "Support Coordinators"),
      OurServiceModel(
          image: "ic_services_experts", title: "NDIS Service Experts"),
      OurServiceModel(image: "ic_plan_manager", title: "Plan Managers"),
      OurServiceModel(image: "ic_events", title: "Events"),
      OurServiceModel(image: "ic_market_place", title: "Markets Place"),
      OurServiceModel(
          image: "ic_accomodation_housing", title: "Accommodation Housing"),
      OurServiceModel(image: "ic_job", title: "Find Supports"),
      OurServiceModel(image: "ic_blogs", title: "Blog"),
      OurServiceModel(image: "ic_job", title: "News"),
    ];

     
    super.initState();
  }


  Widget build(BuildContext context) {

    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          if (state is HomeLoginPageState) {

            showHideProgress(false);
            Navigator.of(context).pushNamed(HomeNavigator.loginPage);
          }
          if (state is ProfileInitial) {
            Navigator.of(context).pushNamed(HomeNavigator.dashBoardPage);
          }
          if (state is NotificationClickState) {
            showHideProgress(false);
            Navigator.of(context).pushNamed(HomeNavigator.NotificationPage);
          }
          if (state is HomeNotiCountState) {
            badge_count.value = "${state.notiCountModel?.data}";
            _showCartBadge = badge_count.value.toString() != "";
          }
          if (state is HomeAllCategoryPageState) {
            showHideProgress(false);
              
            Navigator.of(context)
                .pushNamed(HomeNavigator.homeAllCategoryListPage);
          }
          if (state is HomeAccommodationHousingState) {
            showHideProgress(false);
              
            Navigator.of(context)
                .pushNamed(HomeNavigator.homeHomeAccommodationHousingPage);
          }
          if (state is HomeSupportWorkerPageState) {
              
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.homeSupportWorkerListPage);
   
          }
          if (state is HomeSupportCoordinatorsPageState) {
              
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.supportCoordinatorPage);
          }
          if (state is HomeEventsPageBtnClickState) {
              
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.HomeEventPage);
          }
          if (state is HomeJobsPageState) {
              
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.HomeJobsPage);
          }
          if (state is HomeNdisServiceExpertMainListingPageState) {
              
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.hMainServiceExpertListPage);
          }
          if (state is HomePlanManagersBtnClickState) {
              
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.hPlanManagersPage);
          }
          if (state is HomeMarketPlaceBtnClickState) {
              
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.homeMarketPlacePage);
          }
          if (state is HomeBlogListPageState) {
              
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.homeBlogListPage);
          }
          if (state is HomeNewsPageClickState) {
              
            showHideProgress(false);

            Navigator.of(context)
                .pushNamed(HomeNavigator.hNewsPage);
          }
          if (state is HomeFindSupportPageState) {
              
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.hFindSupportPage);
          }
          if (state is HomeSearchState) {
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.hHomeSearchPage);
          }
          if (state is HomeerrorloadingState) {
            showHideProgress(false);
            BlocProvider.of<HomeBloc>(context).add(HomeEventHomeResetState());
            showSnackBar(state.message, Colors.black, context);
          }
          if (state is HomeHomePageDetailsPageState) {
            showHideProgress(false);
            setState(() {
              getHomeDetailsData = state.getHomeDetailsData;
              popularServicesNearYou =
                  getHomeDetailsData!.popularServicesNearYou;
              newsSliderData = getHomeDetailsData!.newsSliderData;
              featureEventsInCity = getHomeDetailsData!.featureEventsInCity;
              url = getHomeDetailsData!.url!;
            });

          }
          if (state is HomeNewsListHomeState) {
            setState(() {
              newsListData = state.newsListData;
              latestAndPopular = newsListData!.newslidelist;
            });

          }
          // if (state is HomeServiceDetailsState) {
          //   showHideProgress(false);
          //     
          //   Navigator.of(context)
          //       .pushNamed(HomeNavigator.homeServiceDetailsPage)
          //       .then((value) => value != null ? refreshPage() : null);
          // }
          if (state is HomeSubCatgoryListDetailsState) {
            showHideProgress(false);
            Navigator.of(context)
                .pushNamed(HomeNavigator.homeSubCatgoryListDetailsPage);
          }
          if (state is HomeNewsDetilsPageClickState) {
            showHideProgress(false);
              
            Navigator.of(context)
                .pushNamed(HomeNavigator.hNewsDetailPage);
          }
          if (state is HomeEventsDetailPageClickState) {
            showHideProgress(false);
              
            Navigator.of(context)
                .pushNamed(HomeNavigator.HomeEventDetailPage);
          }
          if (state is ServiceEnquiryState) {
            showHideProgress(false);

            Navigator.of(context).pushNamed(HomeNavigator.ServiceEnquiryPage);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: false,
            toolbarHeight: 70.0.scale(),
            backgroundColor: kColorThemePurpleColor,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                if (sharedPrefs.IsLogin == false) {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeEventHometoLoginBtnClick());
                } else {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeEventProfileBtnClick());
                }
              },
              child: sharedPrefs.userImage == ""
                  ? Padding(
                padding: EdgeInsets.fromLTRB(4.0.scale(), 15.0.scale(), 0, 8.0.scale()),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100.0.scale()),
                          ),
                          child: Icon(Icons.person)),
                    ) :
              Padding(
                padding: EdgeInsets.fromLTRB(4.0.scale(), 15.0.scale(), 0, 8.0.scale()),
                child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0.scale()),
                          border: Border.all(color: Colors.white)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0.scale()),
                          child: NetworkImagesWidgets(
                            url: "${sharedPrefs.userImage}",
                            fit: BoxFit.cover,
                            loaderColor: Colors.white,
                          ),
                        ),
                      ),
                  ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 10.0.scale()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sharedPrefs.IsLogin == false
                        ? "Sign in"
                        : sharedPrefs.userName,
                    style: textStyleBoldCustomColor(14.0.scale(), Colors.white),
                  ),
                  sharedPrefs.IsLogin == false? Text(''):
                  sharedPrefs.serviceLocation == ''? Text(''):
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/ic_location_header.png',
                        width: 12.0.scale(),
                        height: 12.0.scale(),
                      ),
                      AHorizontalSpace(2.0.scale()),
                      Text(
                        sharedPrefs.serviceLocation,
                        style: textStyleCustomColor(12.0.scale(), Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ).expand(),
                    ],
                  )
                ],
              ),
            ),
            actions: [
              Padding(
                padding:
                    EdgeInsets.only(right: 15.0.scale(), top: 25.0.scale()),
                child: ValueListenableBuilder(
                    valueListenable: badge_count,
                    builder: (context, notiCount, child) {
                      return badges.Badge(
                        position:
                            badges.BadgePosition.topEnd(top: -12, end: -7),
                        badgeAnimation: badges.BadgeAnimation.scale(
                          animationDuration: Duration(seconds: 1),
                          colorChangeAnimationDuration: Duration(seconds: 1),
                          loopAnimation: false,
                          curve: Curves.fastOutSlowIn,
                          colorChangeAnimationCurve: Curves.easeInCubic,
                        ),
                        showBadge: _showCartBadge,
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.red,
                        ),
                        badgeContent: Text(
                          badge_count.value.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        child: InkWell(
                          onTap: (){
                            showHideProgress(true);
                            BlocProvider.of<HomeBloc>(context).add(NotificationClickEvent('Home'));
                          },
                          child: Image.asset(
                            'assets/images/ic_bell_header.png',
                            width: 25.0.scale(),
                            height: 25.0.scale(),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kColorThemePurpleColor,
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(20.0),
                      bottomRight: const Radius.circular(20.0),
                    )),
                height: 60.0.scale(),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    showHideProgress(true);
                    BlocProvider.of<HomeBloc>(context).add(HomeSearchEvent());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width -
                                100.0.scale(),
                            height: 40.0.scale(),
                            color: Colors.white,
                            child: Text("Search All Service")
                                .align(Alignment.center),
                          )).leftPadding(20.0.scale()),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                width: 40.0.scale(),
                                height: 40.0.scale(),
                                color: Colors.purple,
                                child: Text(""),
                              )),
                          Image.asset(
                            'assets/images/ic_filter_icon.png',
                            width: 25.0.scale(),
                            height: 25.0.scale(),
                          )
                        ],
                      ).rightPadding(20.0.scale()),
                    ],
                  ),
                ),
              ),

              Column(
                children: [
                  if (popularServicesNearYou!.isNotEmpty)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AVerticalSpace(5.0.scale()),
                        _GridProductListWidget(ourServiceList, showHideProgress),
                        AVerticalSpace(5.0.scale()),
                        Text(
                          "Popular Services Near you",
                          style: textStyleBoldCustomColor(15.0, Colors.black),
                        ).align(Alignment.center),
                        AVerticalSpace(5.0.scale()),
                        if (popularServicesNearYou!.length > 0)
                          PopularServiceNearbyYou(
                              popularServicesNearYou, showHideProgress),
                        AVerticalSpace(15.0.scale()),
                      ],
                    ),
                  if (featureEventsInCity!.isNotEmpty)
                    Column(
                      children: [
                        Text(
                          "Featured event in city",
                          style: textStyleBoldCustomColor(15.0, Colors.black),
                        ),
                        Text(
                          "lacinia viverra lectus. Fusce imperdiet ullamcorper metus eu fringilla.",
                          textAlign: TextAlign.center,
                          style: textStyleBoldCustomColor(10.0, Colors.black),
                        ).leftPadding(5.0.scale()).rightPadding(5.0.scale()),
                        AVerticalSpace(5.0.scale()),
                        FeaturedEventInCity(
                            featureEventsInCity, showHideProgress),
                        AVerticalSpace(5.0.scale()),
                      ],
                    ),
                  if (latestAndPopular!.isNotEmpty)
                    Column(
                      children: [
                        Text(
                          "News & Magazines",
                          style: textStyleBoldCustomColor(15.0, Colors.black),
                        ),
                        Text(
                          "All news updates in one place. Bizbook",
                          style: textStyleBoldCustomColor(10.0, Colors.black),
                        ),
                        AVerticalSpace(5.0.scale()),
                        NewsMagazines(latestAndPopular, showHideProgress),
                        AVerticalSpace(10.0.scale()),
                      ],
                    ).align(Alignment.center),
                ],
              ).scroll().topPadding(60.0.scale())
            ],
          ),
          floatingActionButton:  RippleAnimation(
            repeat: true,
            color: Colors.green,
            minRadius: 23,
            ripplesCount: 1,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                if (sharedPrefs.IsLogin == false){
                  showSnackBar('You have to login first', Colors.black, context);
                }else {
                  showHideProgress(true);
                  BlocProvider.of<HomeBloc>(context).add((ServiceEnquiryEvent()));
                }
              },
              child: Container(
                  height: 50.0.scale(),
                  width: 50.0.scale(),
                  padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0.scale()),
                border: Border.all(color: Colors.white, width: 5.0.scale()),
                color: Colors.green,
              ),
                child:  Image.asset("assets/images/help.png", height: 25.0.scale(),)
              ),
            ),
          ),
        ));
  }
}

class _GridProductListWidget extends StatefulWidget {
  List<OurServiceModel>? ourServiceListM;
  Function showHideProgress1;

  _GridProductListWidget(this.ourServiceListM, this.showHideProgress1);

  @override
  _GridProductListWidgetState createState() => _GridProductListWidgetState();
}

class _GridProductListWidgetState extends State<_GridProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return GoogleGrid(
      columnCount: 4,
      gap: 5.0.scale(),
      padding: const EdgeInsets.all(5.0),
      children: [
        for (int i = 0; i < widget.ourServiceListM!.length; i++)
          SizedBox(
            height: 90.0.scale(),
            width: 60.0.scale(),
            child: Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (widget.ourServiceListM![i].title ==
                        "All Service Provider") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeAllCategoryPageBtnClick());
                    } else if (widget.ourServiceListM![i].title ==
                        "Support Coordinators") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeSupportCoordinatorPageBtnClick(''));
                    } else if (widget.ourServiceListM![i].title == "Events") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventsPageBtnClick());
                    } else if (widget.ourServiceListM![i].title ==
                        "Support Workers") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeSupportWorkerPageBtnClick(""));
                    } else if (widget.ourServiceListM![i].title == "Jobs") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeJobsPageBtnClick());
                    } else if (widget.ourServiceListM![i].title ==
                        "NDIS Service Experts") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeGridNdisServiceExpertBtnClick());
                    } else if (widget.ourServiceListM![i].title ==
                        "Accommodation Housing") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeAccommodationHousingBtnClick());
                    } else if (widget.ourServiceListM![i].title ==
                        "Plan Managers") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomePlanManagersBtnClick(''));
                    } else if (widget.ourServiceListM![i].title ==
                        "Markets Place") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add((HomeMarketPlaceBtnClick()));
                    } else if (widget.ourServiceListM![i].title == "Blog") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add((HomeBlogListPageListBtnClick()));
                    } else if (widget.ourServiceListM![i].title == "News") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add((HomeNewsPageClickEvent()));
                    } else if (widget.ourServiceListM![i].title ==
                        "Find Supports") {
                      widget.showHideProgress1(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add((HomeFindSupportPageClickEvent()));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(3.0.scale()),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          bottomLeft: Radius.circular(4.0),
                          bottomRight: Radius.circular(4.0),
                          topRight: Radius.circular(4.0)),
                    ),
                    child: Image.asset(
                      "assets/images/${widget.ourServiceListM![i].image}.png",
                      height: 40.0.scale(),
                      width: 40.0.scale(),
                    ),
                  ),
                ),
                Text(
                  widget.ourServiceListM![i].title.toString(),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textStyleBoldCustomColor(
                      12.0.scale(), Colors.black),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class PopularServiceNearbyYou extends StatefulWidget {
  List<PopularServicesNearYou>? popularServicesNearYou;
  Function showHideProgress1;

  PopularServiceNearbyYou(this.popularServicesNearYou, this.showHideProgress1);

  @override
  State<PopularServiceNearbyYou> createState() =>
      _PopularServiceNearbyYouState();
}

class _PopularServiceNearbyYouState extends State<PopularServiceNearbyYou> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0.scale()),
      height: 200.0.scale(),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.popularServicesNearYou!.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(

          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 220.0.scale(),
                    height: 160.0.scale(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0.scale()), topRight: Radius.circular(10.0.scale())),
                      child: NetworkImagesWidgets(
                        url:
                            "${widget.popularServicesNearYou![index].categoryImage}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 160.0.scale(),
                    width: 220.0.scale(),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0.scale()), topRight: Radius.circular(10.0.scale()))
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      width: 200.0.scale(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.popularServicesNearYou?[index].categoryName}",
                              style: textStyleBoldCustomColor(
                                  12.0.scale(), Colors.white),
                            ),
                            Text(
                              "Listing ${widget.popularServicesNearYou![index].listingsCount!}",
                              style:
                                  textStyleCustomColor(12.0.scale(), Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0.scale(), vertical: 10.0.scale()),
                width: 220.0.scale(),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0.scale()), bottomRight: Radius.circular(10.0.scale()))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Show All (${widget.popularServicesNearYou![index].listingsCount!})",
                      style: textStyleBoldCustomColor(
                          12.0.scale(), Colors.black),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        widget.showHideProgress1(true);
                        BlocProvider.of<HomeBloc>(context).add(
                            HomeEventSubCatgoryListDetailsBtnClick(
                                widget.popularServicesNearYou![index].categoryId, "Home", widget.popularServicesNearYou![index].categoryName));
                      },
                      child: Text(
                        "More Details",
                        style: textStyleBoldCustomColor(
                            12.0.scale(), kColorThemePurpleColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).rightPadding(10.0.scale()),
        ),
      ),
    );
  }
}

class ExploreMoreSevices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 120.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Container(
            width: 200.0.scale(),
            height: 120.0.scale(),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 100.0.scale(),
                    width: 200.0.scale(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          offset: Offset(
                              1.0, 1.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "text",
                          style:
                              textStyleCustomColor(12.0.scale(), Colors.black),
                        )
                      ],
                    )
                        .align(Alignment.centerLeft)
                        .leftPadding(8.0.scale())
                        .rightPadding(8.0.scale())
                        .topPadding(2.0.scale())
                        .bottomPadding(4.0.scale()),
                  ),
                ),
                Positioned(
                  top: 40.0.scale(),
                  left: 40.0.scale(),
                  child: Text(
                    "Support Worker",
                    style: textStyleCustomColor(12.0.scale(), Colors.black),
                  ),
                )
              ],
            ),
          ),
        ).leftPadding(5.0.scale()).rightPadding(5.0.scale()),
      ),
    );
  }
}

class FeaturedEventInCity extends StatefulWidget {
  List<FeatureEventsInCity>? featureEventsInCity;
  Function showHideProgress1;

  FeaturedEventInCity(this.featureEventsInCity, this.showHideProgress1);

  @override
  State<FeaturedEventInCity> createState() => _FeaturedEventInCityState();
}

class _FeaturedEventInCityState extends State<FeaturedEventInCity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.0.scale(),
      padding: EdgeInsets.only(left: 10.0.scale()),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.featureEventsInCity!.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            widget.showHideProgress1(true);
            BlocProvider.of<HomeBloc>(context).add(HomeEventsDetailPageClick(
                widget.featureEventsInCity![index].eventId,
                "Home")); //"Home"));
          },
          child: Container(
            width: 220.0.scale(),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.scale()),
                border: Border.all(color: Colors.grey)),
            child: Stack(
              children: [
                Container(
                  height: 150.0.scale(),
                  width: 220.0.scale(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0.scale()),
                      topLeft: Radius.circular(10.0.scale()),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0.scale()),
                      topLeft: Radius.circular(10.0.scale()),
                    ),
                    child: NetworkImagesWidgets(
                      url: "${widget.featureEventsInCity![index].eventImage}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 120,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        maxRadius: 30,
                        child: Text(
                            DateFormat.MMMd().format(DateTime.parse(widget
                                .featureEventsInCity![index].eventStartDate!
                                .toString())),
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.white)),
                        // foregroundImage: NetworkImage("enterImageUrl"),
                      ),
                    ),
                    Text(
                      "${widget.featureEventsInCity?[index].eventName}",
                      style: textStyleBoldBlack(12.0.scale(), Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                        "${widget.featureEventsInCity?[index].eventDescription}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            textStyleCustomColor(10.0.scale(), Colors.black)),
                    AVerticalSpace(5.0.scale()),
                    if (widget.featureEventsInCity?[index].eventAddress != '')
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_locationlist.png',
                            height: 20.0.scale(),
                            width: 20.0.scale(),
                            color: Colors.green,
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text("${widget.featureEventsInCity?[index].eventAddress}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleCustomColor(
                                      10.0.scale(), Colors.black))
                              .expand()
                        ],
                      ),
                    AVerticalSpace(10.0.scale()),
                    Container(
                        height: 0.5.scale(),
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xFF878787)),
                    AVerticalSpace(10.0.scale()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Get ticket",
                            style: textStyleBoldCustomColor(
                                12.0.scale(), Colors.black)),
                        Text("Upcoming",
                            style: textStyleBoldCustomColor(
                                12.0.scale(), kColorThemePurpleColor)),
                        Text(
                            widget.featureEventsInCity?[index].eventType ==
                                    "paid"
                                ? "\$${widget.featureEventsInCity?[index].event_ticket_price}"
                                : "${widget.featureEventsInCity?[index].eventType}",
                            style: textStyleBoldCustomColor(
                                12.0.scale(), Colors.green))
                      ],
                    )
                  ],
                ).leftPadding(10.0.scale()).rightPadding(10.0.scale())
              ],
            ),
          ).rightPadding(10.0.scale()),
        ),
      ),
    );
  }
}

class NewsMagazines extends StatefulWidget {
  List<Newslidelist>? latestAndPopular1;
  Function showHideProgress1;

  NewsMagazines(this.latestAndPopular1, this.showHideProgress1);

  @override
  State<NewsMagazines> createState() => _NewsMagazinesState();
}

class _NewsMagazinesState extends State<NewsMagazines> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 200.0.scale(),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.latestAndPopular1!.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            widget.showHideProgress1(true);
            BlocProvider.of<HomeBloc>(context).add(HomeNewsDetilsPageClick(
                widget.latestAndPopular1![index].newsId, "Home"));
          },
          child: Container(
            width: 300.0.scale(),
            height: 200.0.scale(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
            ),
            child: Stack(
              children: [
                Container(
                  width: 300.0.scale(),
                  height: 200.0.scale(),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(10.0.scale())),
                      border: Border.all(color: Colors.grey)),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(10.0.scale())),
                    child: NetworkImagesWidgets(
                      url: widget.latestAndPopular1![index].newsImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10.0.scale(),
                  right: 5.0.scale(),
                  child: Container(
                    height: 30.0.scale(),
                    color: Colors.redAccent,
                    child: Text(
                      widget.latestAndPopular1![index].categoryName!,
                      textAlign: TextAlign.center,
                      style: textStyleCustomColor(10.0.scale(), Colors.white),
                    )
                        .topPadding(5.0.scale())
                        .leftPadding(5.0.scale())
                        .rightPadding(5.0.scale()),
                  ),
                ),
                Positioned(
                    bottom: 20.0.scale(),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 25.0.scale(),
                        color: Colors.black26,
                        child: Marquee(
                          text:
                              "${widget.latestAndPopular1![index].newsTitle!.toUpperCase() ?? ''}",
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.white),
                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          blankSpace: 100.0,
                          velocity: 100.0,
                          pauseAfterRound: Duration(seconds: 1),
                          startPadding: 5.0,
                          accelerationDuration: Duration(seconds: 1),
                          accelerationCurve: Curves.linear,
                          decelerationDuration: Duration(seconds: 1),
                          decelerationCurve: Curves.easeOut,
                        ))),
              ],
            ),
          ),
        ).leftPadding(5.0.scale()).rightPadding(5.0.scale()),
      ),
    );
  }
}
