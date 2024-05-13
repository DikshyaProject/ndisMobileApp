import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/components/components.dart';

import '../../Helpers/services/services.dart';
import '../../Helpers/utils/utils.dart';
import '../../home/home.dart';
import '../../root/root.dart';
import '../bloc/bloc.dart';

const double _kNavigationFontSize = 14;

class BottomNavigationMainTabPage extends StatefulWidget {
  final UserRepository? userRepository;

  const BottomNavigationMainTabPage({this.userRepository});

  @override
  _BottomNavigationMainTabPageState createState() =>
      _BottomNavigationMainTabPageState();
}

class _BottomNavigationMainTabPageState
    extends State<BottomNavigationMainTabPage> {
  BottomNavigationTab? _selectedTab;
  bool notificationOnMessage = false;
  int selecteImageTab = 0;
  bool? _showLoadingAnimation;
  bool? _showBottomNavigation;
  PricingPlanDataModel? pricingDataPlanModel;

  HomeBloc? homeBloc;
  late BlocProvider<HomeBloc> homeProvider;

  List<_BottomNavigationItemDetails> _tabItemDetails = [];

  void onTabTapped(int index) {
    BlocProvider.of<BottomNavigationBloc>(context).add(
        BottomNavigationEventTabChanged(
            selectedTab: BottomNavigationTab.values[index]));
  }

  @override
  void initState() {
    _selectedTab = (BlocProvider.of<BottomNavigationBloc>(context).state
            as BottomNavigationDefaultState)
        .selectedTab;
    _showLoadingAnimation = (BlocProvider.of<BottomNavigationBloc>(context)
            .state as BottomNavigationDefaultState)
        .showLoadingAnimation;
    _showBottomNavigation = (BlocProvider.of<BottomNavigationBloc>(context)
            .state as BottomNavigationDefaultState)
        .showBottomNavigation;

    super.initState();

    homeBloc = new HomeBloc(userRepository: widget.userRepository);
    initializeProviders();
  }

  bool showBottomNavigationBar = true;
  bool showProgressIndicator = false;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<RootBloc, RootState>(
        listener: (context, state) {
          if (state is RootHomeState) {
            if (state.isBackHome ?? false) {
              if (widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeSupportWorkerScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.HomeAllServiceScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeJobScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeSupportCoordinatorScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeNdisExpertScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeEventScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeMarketPlaceScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomePlanManagerScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeAccomodationScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeBlogsScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeNewsScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.HomeFindSupportScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.HomeServiceEnquiryScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeToSearchScreen ||
                  widget.userRepository!.ScreenName ==
                      ScreenNavigation.HomeToLoginScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.HomePage;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isSupWork2Home ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.SupportWorker2ndPage) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeSupportWorkerScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsSupportWorker2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFsSupportWorkerScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isLocToEnq ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.ServiceEnquiryToLocationScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.HomeServiceEnquiryScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isSupWork3Home ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.SupportWorker3rdPage) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.SupportWorker2ndPage;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsSupportWorker3rdScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFsSupportWorker2ndScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isFromLogin ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.SupWorToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.SupportWorker2ndPage;
                homeBloc!
                    .add(HomeEventLoginBackBtnClick('support_worker_contact'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.AllServiceToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeAllService3rdScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('service_pro_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }else if (widget.userRepository!.ScreenName == ScreenNavigation.PsychoToLoginScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.HomeFsPsycho2Screen;
                homeBloc!.add(HomeEventLoginBackBtnClick('psycho_login'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName == ScreenNavigation.AdvocacyToLoginScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.HomeFsAdvocacy2Screen;
                homeBloc!.add(HomeEventLoginBackBtnClick('advocacy_login'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.JobDetailToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeJobs3rdScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('job_detail2'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.JobSubCatToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeJobs2ndScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('job_sub_cat'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.AllJobsToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeJobScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('all_cat_job'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.SupCoordToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.SupportCoordinator3rdPage;
                homeBloc!
                    .add(HomeEventLoginBackBtnClick('support_coord_get_quote'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.NdisExpertToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeNdisExpert3rdScreen;
                homeBloc!.add(
                    HomeEventLoginBackBtnClick('service_expert_get_quote'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.EventToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeEvent2ndScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('event_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.PlanDetailToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomePlanManager2ndScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('plan_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.BlogDetailToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeBlog2ndScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('blog_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.PropDetailToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMpProperty3rdScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('mp_prop_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.AcmPropDetailToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeAccomodation3rdScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('acm_prop_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.FindSupWorToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFsSupportWorker2ndScreen;
                homeBloc!
                    .add(HomeEventLoginBackBtnClick('support_worker_contact'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.FindSupCoordToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFsSupportCoord3rdPage;
                homeBloc!
                    .add(HomeEventLoginBackBtnClick('support_coord_get_quote'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.FindPlanDetailToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFsPlanManager2ndScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('plan_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeServiceDetailToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomePopularServiceDetailScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('service_pro_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeEventDetailToLoginScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeToEventDetailScreen;
                homeBloc!.add(HomeEventLoginBackBtnClick('event_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isAllServ2Home ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeAllService2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeAllServiceScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeToService2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomePage;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isAllServ3Home ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeAllService3rdScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeAllService2ndScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomePopularServiceDetailScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.HomePage;
                homeBloc!.add(HomePopularServicesBackBtnClick());
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isJob2Home ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeJobs2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeJobScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isJob3Home ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeJobs3rdScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeJobs2ndScreen;
                homeBloc!.add(HomeEventBackBtnClick('job_detail2'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeJobs3rdFrom1stScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeJobScreen;
                homeBloc!.add(HomeEventBackBtnClick('job_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isSearchJob ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeJobsToSearchScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeJobScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeToSearch2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeToSearchScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.ProfileToSearchScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.SupportWorkToProfileScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isSupCoord2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.SupportCoordinator2ndPage) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeSupportCoordinatorScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsSupportCoord2ndPage) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFsSupportCoordScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isSupCoord3 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.SupportCoordinator3rdPage) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.SupportCoordinator2ndPage;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsSupportCoord3rdPage) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFsSupportCoord2ndPage;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isExpert2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeNdisExpert2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeNdisExpertScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isExpert3 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeNdisExpert3rdScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeNdisExpert2ndScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isEvent2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeEvent2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeEventScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeToEventDetailScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.HomePage;
                homeBloc!.add(HomeHomeEventDetailsBackBtnClick());
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isMpProd2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeMpProduct2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMarketPlaceScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isMpProd3 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeMpProduct3rdScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMpProduct2ndScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isMpProd4 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeMpProduct4thScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMpProduct3rdScreen;
                homeBloc!.add(HomeEventBackBtnClick('product_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isMpProd5 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeMpProduct5thScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMpProduct4thScreen;
                homeBloc!.add(HomeEventBackBtnClick('product_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isMpVehicle2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeMpVehicle2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMarketPlaceScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isMpVehicle3 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeMpVehicle3rdScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMpVehicle2ndScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isMpVehicle4 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeMpVehicle4thScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMpVehicle3rdScreen;
                homeBloc!.add(HomeEventBackBtnClick('vehicle_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isMpVehicle5 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeMpVehicle5thScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMpVehicle4thScreen;
                homeBloc!.add(HomeEventBackBtnClick('vehicle_detail'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isMpProp2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeMpProperty2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMarketPlaceScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isMpProp3 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeMpProperty3rdScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeMpProperty2ndScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isPlan2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomePlanManager2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomePlanManagerScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsPlanManager2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFsPlanManagerScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isAccomoRent2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeAccomodation2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeAccomodationScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isAccomoRent3 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeAccomodation3rdScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeAccomodation2ndScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isBlog2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeBlog2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeBlogsScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isNews2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeNews2ndScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeNewsScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeToNewsDetailScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.HomePage;
                homeBloc!.add(HomeNewsDetailsBackBtnClick());
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isNotiHome ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeToNotification) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomePage;
                homeBloc!.add(ProfileEventBackBtnClick('Home'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isFindSupAdvo ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsAdvocacyScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFindSupportScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isFindSupPsycho ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsPsychoScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFindSupportScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isFindSupPsycho2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsPsycho2Screen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFsPsychoScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isFsAdvocacy2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsAdvocacy2Screen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFsAdvocacyScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isFsSupWork ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsSupportWorkerScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFindSupportScreen;
                homeBloc!.add(HomeEventBackBtnClick('find_support'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isFsSupCoord ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsSupportCoordScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFindSupportScreen;
                homeBloc!.add(HomeEventBackBtnClick('find_support'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isFsPlanManager ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.HomeFsPlanManagerScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeFindSupportScreen;
                homeBloc!.add(HomeEventBackBtnClick('find_support'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            } else if (state.isForgot ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.LoginToForgotScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeToLoginScreen;
                Navigator.of(context, rootNavigator: true).pop();
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }
            else if (state.isSignup ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.LoginToSignUpScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomeToLoginScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isSignupLocation ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.SignupToLocationScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.LoginToSignUpScreen;
                homeBloc!.add(HomeEventBackLocationToSignUp('SignUp'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isOtp ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.OtpPageScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.LoginToSignUpScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isPartic ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.OtpToParticipantScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.OtpPageScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isPartiLocation ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.PrticiToLocationScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.OtpToParticipantScreen;
                homeBloc!.add(HomeEventBackBtnClick('participant'));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isCongrats ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.SupportWorkerCongratulationScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.OtpPageScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isCongratsToReg ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.CongratsToRegScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.SupportWorkerCongratulationScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isPartiProToLoc ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.PrticiProfileToLocationScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.ProfileParticipantsProfileScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isGenProToLoc ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.GeneralProfileToLocationScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.ProfileGeneralProfileScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isFilterToLoc ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.FilterToLocationScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.FilterPage;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }else if (state.isFilter ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.FilterPage) {
                widget.userRepository!.ScreenName = ScreenNavigation.HomeAllService2ndScreen;
                homeBloc!.add(HomeEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }
            else if (state.isPaymentPageListing ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.PricingListingPage) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.HomePageScreen;
                homeBloc!.add(HomeEventPlanPricingListBackBtnClick(
                    pricingDataPlanModel));
                BlocProvider.of<RootBloc>(context)
                    .add(RootBackResetEvent());
              }
            }
            else if (state.isProfileBack ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.ProfileContactUsScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.ProfileAboutUsScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.ProfileGeneralProfileScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.ProfileDirectQueryScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.ServiceRequestScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.SupportWorkToProfileScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.JobProfileScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.LookingForJobScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.AppliedJobScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.ReviewsScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.LikedListScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.FollowingScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.NotificationScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.MyEventsScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.HowToScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.ProfileOrdersScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.OrderHistoryScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.TransactionHistoryScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.ChangeEmailScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.ChangeMobileScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.ChangePasswordScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.DirectLeadScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.GenericLeadScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.PaymentPlanScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.PromotionScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.SEOScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.AdSummaryScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.PayInvoiceScreen ||
                  widget.userRepository!.ScreenName == ScreenNavigation.ProfileSettingScreen) {
                widget.userRepository!.ScreenName = ScreenNavigation.ProfilePage;
                homeBloc!.add(ProfileEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context)
                    .add(RootBackResetEvent());
              }
              else if(widget.userRepository!.ScreenName == ScreenNavigation.ProfileParticipantsProfileScreen ){
                widget.userRepository!.ScreenName = ScreenNavigation.ProfilePage;
                homeBloc!.add(ProfileParticipantEventBackBtnClick());
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }
            else if (state.isAllUser ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.AllUserScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.FollowingScreen;
                homeBloc!.add(ProfileEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context)
                    .add(RootBackResetEvent());
              }
            }else if (state.isProfileToHomeBack ?? false) {
              if (widget.userRepository!.ScreenName == ScreenNavigation.ProfilePage) {
                widget.userRepository!.ScreenName = ScreenNavigation.HomePage;
                homeBloc!.add(ProfileEventBackBtnClick(''));
                BlocProvider.of<RootBloc>(context).add(RootBackResetEvent());
              }
            }
            else if (state.isOrder2 ?? false) {
              if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.OrderDetailScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.ProfileOrdersScreen;
                homeBloc!.add(ProfileEventBackBtnClick('my_order'));
                BlocProvider.of<RootBloc>(context)
                    .add(RootBackResetEvent());
              } else if (widget.userRepository!.ScreenName ==
                  ScreenNavigation.OrderHistoryDetailScreen) {
                widget.userRepository!.ScreenName =
                    ScreenNavigation.OrderHistoryScreen;
                homeBloc!.add(ProfileEventBackBtnClick('order_history'));
                BlocProvider.of<RootBloc>(context)
                    .add(RootBackResetEvent());
              }
            }
          }
        },
        child: BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
            listener: (context, state) {
          setState(() {
            _selectedTab = (state as BottomNavigationDefaultState).selectedTab;
            _showLoadingAnimation =
                (state as BottomNavigationDefaultState).showLoadingAnimation;
            _showBottomNavigation =
                (state as BottomNavigationDefaultState).showBottomNavigation;

            //  print("_showBottomNavigation_____$_showBottomNavigation");
          });

          if (_selectedTab == BottomNavigationTab.HOME) {
            if (state is BottomNavigationDefaultState) {
              // homeBloc.add(HomeEventReset());
            }
          }

          if (state is BottomNavigationDefaultState) {}
        }, builder: (context, state) {
          if (state is BottomNavigationDefaultState) {
            if (sharedPrefs.IsLogin == false) {
              print("I_am_here");
              _tabItemDetails = [
                _BottomNavigationItemDetails(
                    imgBaseName: "ic_home_icon", title: "Home"),
                _BottomNavigationItemDetails(
                    imgBaseName: "ic_lead_icon", title: "Lead"),
                _BottomNavigationItemDetails(
                    imgBaseName: "ic_add_bussiness", title: "Bussiness"),
              ];
            } else {
              _tabItemDetails = [
                _BottomNavigationItemDetails(
                    imgBaseName: "ic_home_icon", title: "Home"),
                _BottomNavigationItemDetails(
                    imgBaseName: "ic_lead_icon", title: "Lead"),
                _BottomNavigationItemDetails(
                    imgBaseName: "ic_add_bussiness", title: "Bussiness"),
                _BottomNavigationItemDetails(
                    imgBaseName: "ic_profile_icon", title: "Dashboard"),
              ];
            }
          }

          return Stack(
            children: [
              SafeArea(
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: _getSelectedTabContentView(_selectedTab!),
                  // bottomNavigationBar: _showBottomNavigation == true
                  //     ? BottomNavigationBar(
                  //         backgroundColor: Colors.white,
                  //         onTap: onTabTapped,
                  //         currentIndex: _selectedTab!.index,
                  //         elevation: 0,
                  //         iconSize: 40,
                  //         showSelectedLabels: true,
                  //         unselectedItemColor: Colors.grey,
                  //         selectedItemColor: kColorThemePurpleColor,
                  //         showUnselectedLabels: false,
                  //         type: BottomNavigationBarType.fixed,
                  //         items: [
                  //           if (sharedPrefs.IsLogin == false)
                  //             for (int curTabIndex = 0;
                  //                 curTabIndex < 3;
                  //                 curTabIndex++)
                  //               BottomNavigationBarItem(
                  //                 backgroundColor: Colors.white,
                  //                 icon: _selectedTab!.index == curTabIndex
                  //                     ? Image.asset(
                  //                         'assets/images/${_tabItemDetails[curTabIndex].imgBaseName}.png',
                  //                         color: kColorThemePurpleColor,
                  //                         height: 25.0.scale(),
                  //                       )
                  //                     : Image.asset(
                  //                         'assets/images/${_tabItemDetails[curTabIndex].imgBaseName}.png',
                  //                         color: Colors.grey,
                  //                         height: 25.0.scale(),
                  //                       ),
                  //                 label: _tabItemDetails[curTabIndex].title,
                  //               ),
                  //           if (sharedPrefs.IsLogin == true)
                  //             for (int curTabIndex = 0;
                  //                 curTabIndex < 4;
                  //                 curTabIndex++)
                  //               BottomNavigationBarItem(
                  //                 backgroundColor: Colors.white,
                  //                 icon: _selectedTab!.index == curTabIndex
                  //                     ? Image.asset(
                  //                         'assets/images/${_tabItemDetails[curTabIndex].imgBaseName}.png',
                  //                         color: kColorThemePurpleColor,
                  //                         height: 25.0.scale(),
                  //                       )
                  //                     : Image.asset(
                  //                         'assets/images/${_tabItemDetails[curTabIndex].imgBaseName}.png',
                  //                         color: Colors.grey,
                  //                         height: 25.0.scale(),
                  //                       ),
                  //                 label: _tabItemDetails[curTabIndex].title,
                  //               ),
                  //         ],
                  //       )
                  //     : null,
                ),
              ),
              if (_showLoadingAnimation!) ALoadingAnimation()
            ],
          );
        })).darkStatusBarText().pageBgColor(Colors.white);
  }

  Widget _getSelectedTabContentView(BottomNavigationTab selectedTab) {
    Widget tabContentView;
    switch (selectedTab) {
      case BottomNavigationTab.HOME:
        tabContentView = homeProvider;
        break;
      // case BottomNavigationTab.LeadManagment:
      //   tabContentView = homeProvider;
      //   break;
      // case BottomNavigationTab.AddBussiness:
      //   tabContentView = homeProvider;
      //   break;
      // case BottomNavigationTab.Profile:
      //   tabContentView = profileProvider;
      //   break;
    }
    return tabContentView;
  }

  void initializeProviders() {
    homeProvider = BlocProvider.value(value: homeBloc!, child: HomeNavigator());
    // surveysProvider =
    //     BlocProvider.value(value: surveysBloc!, child: SurveysNavigator());
    // profileProvider =
    //     BlocProvider.value(value: profileBloc!, child: ProfileNavigator());
    // surveysProvider = BlocProvider.value(value: surveysBloc!, child: Sur,)
  }

  @override
  void dispose() {
    homeBloc!.close();
    // surveysBloc!.close();
    // profileBloc!.close();
    super.dispose();
  }
}

class _BottomNavigationItemDetails {
  final String? imgBaseName;
  final String? title;

  _BottomNavigationItemDetails({this.imgBaseName, this.title});
}
