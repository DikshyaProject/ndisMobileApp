import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:ndisparticipant/root/root.dart';

// import 'package:url_launcher/url_launcher.dart';

import 'Helpers/services/services.dart';
import 'Helpers/theme/ft_theme_data.dart';
import 'Helpers/utils/utils.dart';
import 'bottom_navigation/bottom_navigation.dart';
import 'general/general.dart';
import 'generated/l10n.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
bool appInForeground = true;

initializeCommon() {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs.init().then((_) {
    UserRepository userRepository = UserRepository();

    RootBloc rootBloc = RootBloc(
      userRepository: userRepository,
    );

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values)
        .then((_) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then((_) {
        runApp(Phoenix(
          child: BlocProvider.value(
            value: rootBloc,
            child: App(
              userRepository: userRepository,
              rootBloc: rootBloc,
            ),
          ),
        ));
      });
    });
  });
}

String _screenAction = "";
String surveyUrl = "";
bool _notificationForeground = false;

bool initialTimeValue = false;

class App extends StatefulWidget {
  final UserRepository userRepository;
  final RootBloc rootBloc;

  const App({required this.userRepository, required this.rootBloc});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  static MyAppData of(BuildContext context) {
    return MyAppData.of(context);
  }

  @override
  Widget build(BuildContext context) {
    //  FlavorBanner(
    RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
    return MyAppData(
      routeObserver: routeObserver,
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child!,
            data: MediaQuery.of(context)
                .copyWith(textScaleFactor: 1.0, boldText: false),
          );
        },
        theme: DRThemeData().themeData,
        localizationsDelegates: const [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          MonthYearPickerLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("en"),
        ],
        home: HomeWidget(
          userRepository: widget.userRepository,
          rootBloc: widget.rootBloc,
        ),
        localeListResolutionCallback: (locales, supportedLocales) {
          print('device locales=$locales supported locales=$supportedLocales');

          for (Locale locale in locales!) {
            // if device language is supported by the app,
            // just return it to set it as current app language
            if (supportedLocales.contains(locale)) {
              return locale;
            }
          }

          // if device language is not supported by the app,
          // the app will set it to english but return this to set to Bahasa instead
          return Locale("en");
        },
        locale: Locale("en"),
        navigatorKey: navigatorKey,
        navigatorObservers: [
          routeObserver,
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
    // );
  }
}

class MyAppData extends InheritedWidget {
  final RouteObserver<PageRoute> routeObserver;

  const MyAppData({
    Key? key,
    required this.child,
    required this.routeObserver,
  }) : super(key: key, child: child);

  @override
  final Widget child;

  static MyAppData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyAppData>()!;
  }

  @override
  bool updateShouldNotify(MyAppData oldWidget) {
    return oldWidget.routeObserver != routeObserver;
  }
}

// void _launchUrl(String url) async {
//   Uri uri = Uri.parse(url);
//   if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//     throw 'Could not launch $uri';
//   }
// }

class HomeWidget extends StatefulWidget {
  final UserRepository userRepository;
  final RootBloc rootBloc;

  const HomeWidget({required this.userRepository, required this.rootBloc});

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("Screen_name_________${widget.userRepository!.ScreenName}");
        if (widget.userRepository!.ScreenName == ScreenNavigation.HomePage) {
          return Future<bool>.value(true);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeSupportWorkerScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.SupportWorker2ndPage) {
          widget.rootBloc!.add(RootSupportWorker2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.SupportWorker3rdPage) {
          widget.rootBloc!.add(RootSupportWorker3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.SupWorToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeAllServiceScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName == ScreenNavigation.HomeAllService2ndScreen) {
          widget.rootBloc!.add(RootAllService2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName == ScreenNavigation.FilterPage) {
          widget.rootBloc!.add(RootFilterBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeAllService3rdScreen) {
          widget.rootBloc!.add(RootAllService3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.AllServiceToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.PsychoToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.AdvocacyToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeJobScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeJobs2ndScreen) {
          widget.rootBloc!.add(RootJob2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeJobs3rdScreen) {
          widget.rootBloc!.add(RootJob3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.JobDetailToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.JobSubCatToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.AllJobsToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeJobs3rdFrom1stScreen) {
          widget.rootBloc!.add(RootJob3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeJobsToSearchScreen) {
          widget.rootBloc!.add(RootSearchToJobBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.ProfileToSearchScreen) {
          widget.rootBloc!.add(RootSearchToJobBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeSupportCoordinatorScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.SupportCoordinator2ndPage) {
          widget.rootBloc!.add(RootSupportCoord2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.SupportCoordinator3rdPage) {
          widget.rootBloc!.add(RootSupportCoord3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.SupCoordToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeNdisExpertScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeNdisExpert2ndScreen) {
          widget.rootBloc!.add(RootNdisExpert2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeNdisExpert3rdScreen) {
          widget.rootBloc!.add(RootNdisExpert3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.NdisExpertToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeEventScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeEvent2ndScreen) {
          widget.rootBloc!.add(RootEvents2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.EventToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMarketPlaceScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMpProduct2ndScreen) {
          widget.rootBloc!.add(RootMpProduct2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMpProduct3rdScreen) {
          widget.rootBloc!.add(RootMpProduct3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMpProduct4thScreen) {
          widget.rootBloc!.add(RootMpProduct4BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMpProduct5thScreen) {
          widget.rootBloc!.add(RootMpProduct5BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMpVehicle2ndScreen) {
          widget.rootBloc!.add(RootMpVehicle2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMpVehicle3rdScreen) {
          widget.rootBloc!.add(RootMpVehicle3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMpVehicle4thScreen) {
          widget.rootBloc!.add(RootMpVehicle4BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMpVehicle5thScreen) {
          widget.rootBloc!.add(RootMpVehicle5BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMpProperty2ndScreen) {
          widget.rootBloc!.add(RootMpProperty2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeMpProperty3rdScreen) {
          widget.rootBloc!.add(RootMpProperty3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomePlanManagerScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomePlanManager2ndScreen) {
          widget.rootBloc!.add(RootPlanManager2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.PlanDetailToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeAccomodationScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeAccomodation2ndScreen) {
          widget.rootBloc!.add(RootAccomodation2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeAccomodation3rdScreen) {
          widget.rootBloc!.add(RootAccomodation3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeBlogsScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeBlog2ndScreen) {
          widget.rootBloc!.add(RootBlog2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.BlogDetailToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        }else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.PropDetailToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.AcmPropDetailToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeNewsScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        }  else if (widget.userRepository!.ScreenName == ScreenNavigation.HomeServiceEnquiryScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        }  else if (widget.userRepository!.ScreenName == ScreenNavigation.ServiceEnquiryToLocationScreen) {
          widget.rootBloc!.add(RootEnquiryToLocationBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeNews2ndScreen) {
          widget.rootBloc!.add(RootNews2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFindSupportScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsAdvocacyScreen) {
          widget.rootBloc!.add(RootFsAdvocacyBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsPsychoScreen) {
          widget.rootBloc!.add(RootFsPsychoBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsPsycho2Screen) {
          widget.rootBloc!.add(RootFsPsycho2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsAdvocacy2Screen) {
          widget.rootBloc!.add(RootFsAdvocacy2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsSupportWorkerScreen) {
          widget.rootBloc!.add(RootFsSupWorkBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsSupportWorker2ndScreen) {
          widget.rootBloc!.add(RootSupportWorker2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsSupportWorker3rdScreen) {
          widget.rootBloc!.add(RootSupportWorker3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.FindSupWorToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsSupportCoordScreen) {
          widget.rootBloc!.add(RootFsSupCoordBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsSupportCoord2ndPage) {
          widget.rootBloc!.add(RootSupportCoord2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsSupportCoord3rdPage) {
          widget.rootBloc!.add(RootSupportCoord3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.FindSupCoordToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsPlanManagerScreen) {
          widget.rootBloc!.add(RootFsPlanManagerEvent());
          return Future<bool>.value(false);
        }else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeToService2ndScreen) {
          widget.rootBloc!.add(RootAllService2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsPlanManager2ndScreen) {
          widget.rootBloc!.add(RootPlanManager2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.FindPlanDetailToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomePopularServiceDetailScreen) {
          widget.rootBloc!.add(RootAllService3BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeServiceDetailToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeToEventDetailScreen) {
          widget.rootBloc!.add(RootEvents2BackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeEventDetailToLoginScreen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsPsycho2Screen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeFsAdvocacy2Screen) {
          widget.rootBloc!.add(RootLoginToBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeToNewsDetailScreen) {
          widget.rootBloc!.add(RootNews2BackEvent());
          return Future<bool>.value(false);
        }else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeToNotification) {
          widget.rootBloc!.add(RootNotiToHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeToSearchScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeToSearch2ndScreen) {
          widget.rootBloc!.add(RootSearchToJobBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.HomeToLoginScreen) {
          widget.rootBloc!.add(RootHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.ProfilePage) {
          widget.rootBloc!.add(RootProfileToHomeBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.LoginToForgotScreen) {
          widget.rootBloc!.add(RootLoginToForgotEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.LoginToSignUpScreen) {
          widget.rootBloc!.add(RootLoginToSignupEvent());
          return Future<bool>.value(false);
        }else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.SignupToLocationScreen) {
          widget.rootBloc!.add(RootSignupToLocationEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.OtpPageScreen) {
          widget.rootBloc!.add(RootSignupToOtpEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.OtpToParticipantScreen) {
          widget.rootBloc!.add(RootOtpToParticiEvent());
          return Future<bool>.value(false);
        }else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.PrticiToLocationScreen) {
          widget.rootBloc!.add(RootParticiToLocationEvent());
          return Future<bool>.value(false);
        }else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.SupportWorkerCongratulationScreen) {
          widget.rootBloc!.add(RootCongratulationsEvent());
          return Future<bool>.value(false);
        }else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.CongratsToRegScreen) {
          widget.rootBloc!.add(RootCongratsToRegEvent());
          return Future<bool>.value(false);
        }else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.PrticiProfileToLocationScreen) {
          widget.rootBloc!.add(RootPartiProToLocationEvent());
          return Future<bool>.value(false);
        }else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.GeneralProfileToLocationScreen) {
          widget.rootBloc!.add(RootGeneralToLocationEvent());
          return Future<bool>.value(false);
        }else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.FilterToLocationScreen) {
          widget.rootBloc!.add(RootFilterToLocationEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.SupportCoordinatorRegistrationPage) {
          widget.rootBloc!.add(RootSupportCoordinatorRegistrationPage());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.PricingListingPage) {
          widget.rootBloc!.add(RootPricingListingPage());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
                ScreenNavigation.ProfileContactUsScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.ProfileAboutUsScreen ||
            widget.userRepository!.ScreenName == ScreenNavigation.ProfileGeneralProfileScreen ||
            widget.userRepository!.ScreenName == ScreenNavigation.ProfileParticipantsProfileScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.ProfileDirectQueryScreen ||
            widget.userRepository!.ScreenName == ScreenNavigation.ServiceRequestScreen ||
            widget.userRepository!.ScreenName == ScreenNavigation.SupportWorkToProfileScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.JobProfileScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.LookingForJobScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.AppliedJobScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.ReviewsScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.LikedListScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.FollowingScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.NotificationScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.MyEventsScreen ||
            widget.userRepository!.ScreenName == ScreenNavigation.HowToScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.ProfileOrdersScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.OrderHistoryScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.TransactionHistoryScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.ChangeEmailScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.ChangeMobileScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.ChangePasswordScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.DirectLeadScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.GenericLeadScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.PaymentPlanScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.PromotionScreen ||
            widget.userRepository!.ScreenName == ScreenNavigation.SEOScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.AdSummaryScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.PayInvoiceScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.ProfileSettingScreen) {
          widget.rootBloc!.add(RootProfileBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
            ScreenNavigation.AllUserScreen) {
          widget.rootBloc!.add(RootAllUserBackEvent());
          return Future<bool>.value(false);
        } else if (widget.userRepository!.ScreenName ==
                ScreenNavigation.OrderDetailScreen ||
            widget.userRepository!.ScreenName ==
                ScreenNavigation.OrderHistoryDetailScreen) {
          widget.rootBloc!.add(RootOrderDetailBackEvent());
          return Future<bool>.value(false);
        } else {
          return Future<bool>.value(true);
        }
      },
      child: BlocBuilder<RootBloc, RootState>(builder: (context, state) {
        return GestureDetector(
          onDoubleTap: () {
            print("This doubletab");
          },
          child: Stack(
            children: [
              getWidgetBlocRootState(),
            ],
          ),
        );
      }),
    );
  }

  Widget getWidgetBlocRootState() {
    Widget? widgetForState;
    RootState rootBlocState = BlocProvider.of<RootBloc>(context).state;
    print(rootBlocState.toString());
    switch (rootBlocState.runtimeType) {
      case RootInitial:
        widgetForState = SplashScreen();
        break;
      case RootHomeState:
        widgetForState =
            BottomNavigationNavigator(userRepository: widget.userRepository);
        break;
    }
    return widgetForState!;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setDeviceMetrics(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
        MediaQuery.of(context).devicePixelRatio);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //aPrint(  UserRepository().ClinicFindScreen());
    //  aPrint("state = $state");
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      setState(() {
        appInForeground = false;
      });
      print('app inactive in lock screen!');
    } else if (state == AppLifecycleState.resumed) {
      print("in app foreground===" + _notificationForeground.toString());
      if (sharedPrefs.IsLogin == true) {
        if (_screenAction == "survey") {
          if (_notificationForeground == true) {
            _notificationForeground = false;

            BlocProvider.of<RootBloc>(context)
                .add(RootEventSurveyPageOpenEvent());
            // if (surveyUrl != "") {
            //   print("surveyurl" + surveyUrl);
            //   _launchUrl(surveyUrl);
            // }
          }
        } else {
          if (_notificationForeground == true) {
            _notificationForeground = false;

            BlocProvider.of<RootBloc>(context)
                .add(RootEventProfilePageOpenEvent());
          }
        }
      }

      setState(() {
        appInForeground = true;
      });
      print('app resumed');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
