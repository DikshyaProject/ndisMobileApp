import 'dart:async';

import 'package:bloc/bloc.dart';


import '../../Helpers/services/services.dart';
import '../root.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final UserRepository? _userRepository;

  RootBloc({UserRepository? userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(RootInitial()) {
    on<RootEvent>((event, emit) {
      if (event is SplashEventloading) {
        mapLoadingCompletedEvent(event);
      } else if (event is BackPressed) {
        mapEventFtBackPressed(event);
      } else if (event is RootHomeEvent) {
        mapHomeEvent(event);
      } else if (event is RootEventHomeBackButton) {
        mapRootHomeEventBack(event);
      } else if (event is FtRootEventBackButtonHomeReset) {
        mapHmRootEventBackButtonHomeReset(event);
      } else if (event is LogoutEvent) {
        mapFtLogoutEvent(event);
      }
      else if (event is RootEventSurveyPageOpenEvent) {
        mapEventSurveyPageOpenEvent(event);
      }
      else if (event is RootEventHomeStateSurveyResetEvent) {
        mapEventHomeStateSurveyResetEvent(event);
      }
      else if (event is RootEventProfilePageOpenEvent) {
        mapEventProfilePageOpenEvent(event);
      }
      else if (event is RootEventProfilePageOpenResetEvent) {
        mapRootEventProfilePageOpenResetEvent(event);
      }
      ///android back managing
      else if (event is RootHomeBackEvent) {
        emit(RootHomeState(isBackHome: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isBackHome: false, isSurveyOpen: false,isProfileOpen: false));
      } else if (event is RootSupportWorker2BackEvent) {
        emit(RootHomeState(isSupWork2Home: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isSupWork2Home: false, isSurveyOpen: false,isProfileOpen: false));
      } else if (event is RootEnquiryToLocationBackEvent) {
        emit(RootHomeState(isLocToEnq: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isLocToEnq: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootSupportWorker3BackEvent) {
        emit(RootHomeState(isSupWork3Home: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isSupWork3Home: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootLoginToBackEvent) {
        emit(RootHomeState(isFromLogin: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isFromLogin: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootAllService2BackEvent) {
        emit(RootHomeState(isAllServ2Home: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isAllServ2Home: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootFilterBackEvent) {
        emit(RootHomeState(isFilter: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isFilter: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootAllService3BackEvent) {
        emit(RootHomeState(isAllServ3Home: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isAllServ3Home: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootJob2BackEvent) {
        emit(RootHomeState(isJob2Home: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isJob2Home: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootJob3BackEvent) {
        emit(RootHomeState(isJob3Home: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isJob3Home: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootSearchToJobBackEvent) {
        emit(RootHomeState(isSearchJob: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isSearchJob: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootSupportCoord2BackEvent) {
        emit(RootHomeState(isSupCoord2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isSupCoord2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootSupportCoord3BackEvent) {
        emit(RootHomeState(isSupCoord3: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isSupCoord3: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootNdisExpert2BackEvent) {
        emit(RootHomeState(isExpert2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isExpert2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootNdisExpert3BackEvent) {
        emit(RootHomeState(isExpert3: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isExpert3: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootEvents2BackEvent) {
        emit(RootHomeState(isEvent2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isEvent2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootMpProduct2BackEvent) {
        emit(RootHomeState(isMpProd2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isMpProd2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootMpProduct3BackEvent) {
        emit(RootHomeState(isMpProd3: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isMpProd3: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootMpProduct4BackEvent) {
        emit(RootHomeState(isMpProd4: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isMpProd4: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootMpProduct5BackEvent) {
        emit(RootHomeState(isMpProd5: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isMpProd5: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootMpVehicle2BackEvent) {
        emit(RootHomeState(isMpVehicle2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isMpVehicle2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootMpVehicle3BackEvent) {
        emit(RootHomeState(isMpVehicle3: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isMpVehicle3: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootMpVehicle4BackEvent) {
        emit(RootHomeState(isMpVehicle4: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isMpVehicle4: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootMpVehicle5BackEvent) {
        emit(RootHomeState(isMpVehicle5: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isMpVehicle5: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootMpProperty2BackEvent) {
        emit(RootHomeState(isMpProp2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isMpProp2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootMpProperty3BackEvent) {
        emit(RootHomeState(isMpProp3: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isMpProp3: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootPlanManager2BackEvent) {
        emit(RootHomeState(isPlan2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isPlan2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootAccomodation2BackEvent) {
        emit(RootHomeState(isAccomoRent2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootAccomodation3BackEvent) {
        emit(RootHomeState(isAccomoRent3: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isAccomoRent3: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBlog2BackEvent) {
        emit(RootHomeState(isBlog2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isBlog2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootNews2BackEvent) {
        emit(RootHomeState(isNews2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isNews2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootNotiToHomeBackEvent) {
        emit(RootHomeState(isNotiHome: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isNotiHome: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootFsAdvocacyBackEvent) {
        emit(RootHomeState(isFindSupAdvo: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isFindSupAdvo: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootFsPsychoBackEvent) {
        emit(RootHomeState(isFindSupPsycho: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isFindSupPsycho: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootFsPsycho2BackEvent) {
        emit(RootHomeState(isFindSupPsycho2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isFindSupPsycho2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootFsAdvocacy2BackEvent) {
        emit(RootHomeState(isFsAdvocacy2: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isFsAdvocacy2: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootFsSupWorkBackEvent) {
        emit(RootHomeState(isFsSupWork: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isFsSupWork: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootFsSupCoordBackEvent) {
        emit(RootHomeState(isFsSupCoord: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isFsSupCoord: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootFsPlanManagerEvent) {
        emit(RootHomeState(isFsPlanManager: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isFsPlanManager: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootHomeToServiceEvent) {
        emit(RootHomeState(isHomeToService: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isHomeToService: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootLoginToForgotEvent) {
        emit(RootHomeState(isForgot: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isForgot: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootLoginToSignupEvent) {
        emit(RootHomeState(isSignup: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isSignup: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootSignupToLocationEvent) {
        emit(RootHomeState(isSignupLocation: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootBackResetEvent) {
        emit(RootHomeState(isSignupLocation: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootProfileBackEvent)
      {
        emit(RootHomeState(isProfileBack: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isProfileBack: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootProfileToHomeBackEvent)
      {
        emit(RootHomeState(isProfileToHomeBack: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isProfileToHomeBack: false, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootAllUserBackEvent)
      {
        emit(RootHomeState(isAllUser: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isAllUser: false, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootOrderDetailBackEvent)
      {
        emit(RootHomeState(isOrder2: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isOrder2: false, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootSupportCoordinatorRegistrationPage)
      {
        emit(RootHomeState(isSignupSupport: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isSignupSupport: false, isSurveyOpen: false,isProfileOpen: false));
      } else if (event is RootSignupToOtpEvent)
      {
        emit(RootHomeState(isOtp: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isOtp: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootOtpToParticiEvent)
      {
        emit(RootHomeState(isPartic: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isPartic: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootParticiToLocationEvent)
      {
        emit(RootHomeState(isPartiLocation: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isPartiLocation: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootCongratulationsEvent)
      {
        emit(RootHomeState(isCongrats: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isCongrats: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootCongratsToRegEvent)
      {
        emit(RootHomeState(isCongratsToReg: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isCongratsToReg: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootPartiProToLocationEvent)
      {
        emit(RootHomeState(isPartiProToLoc: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isPartiProToLoc: false, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootGeneralToLocationEvent)
      {
        emit(RootHomeState(isGenProToLoc: true, isSurveyOpen: false,isProfileOpen: false));
      }else if (event is RootFilterToLocationEvent)
      {
        emit(RootHomeState(isFilterToLoc: true, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isGenProToLoc: false, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isFilterToLoc: false, isSurveyOpen: false,isProfileOpen: false));
      }
      else if (event is RootPricingListingPage)
      {
        emit(RootHomeState(isPaymentPageListing: true, isSurveyOpen: false,isProfileOpen: false));
      }

      else if (event is RootBackResetEvent)
      {
        emit(RootHomeState(isPaymentPageListing: false, isSurveyOpen: false,isProfileOpen: false));
      }

      ///-------------------------------------------------------------------------------------
    });
  }
  Future<void> mapEventHomeStateSurveyResetEvent(RootEventHomeStateSurveyResetEvent event) async {

    emit(RootHomeState(isSurveyOpen: false,isProfileOpen: false)); //(isB
  }
  Future<void> mapEventSurveyPageOpenEvent(RootEventSurveyPageOpenEvent event) async {

    emit(RootHomeState(isSurveyOpen: true,isProfileOpen: false)); //(isB
  }
  Future<void> mapEventProfilePageOpenEvent(RootEventProfilePageOpenEvent event) async {

    emit(RootHomeState(isSurveyOpen: false,isProfileOpen: true)); //(isB
  }
  Future<void> mapRootEventProfilePageOpenResetEvent(RootEventProfilePageOpenResetEvent event) async {

    emit(RootHomeState(isSurveyOpen: false,isProfileOpen: false)); //(isB
  }

  Future<void> mapFtLogoutEvent(LogoutEvent event) async {
    sharedPrefs.IsLogin = false;
    sharedPrefs.resetPreferences();
    emit(RootLoginLoadingComplete());
  }

  Future<void> mapHomeEvent(RootHomeEvent event) async {
    sharedPrefs.IsLogin = true;
    emit(RootHomeState(isSurveyOpen: false,isProfileOpen: false)); //(isBackHome: false));
  }

  Future<void> mapRootHomeEventBack(RootEventHomeBackButton event) async {
    sharedPrefs.IsLogin = true;
    emit(RootHomeState(isSurveyOpen: false,isProfileOpen: false)); //(isBackHome: true));
  }

  Future<void> mapHmRootEventBackButtonHomeReset(
      FtRootEventBackButtonHomeReset event) async {
    sharedPrefs.IsLogin = true;
    //emit(RootHomeState(isBackHome: false));
  }

  Future<void> mapLoadingCompletedEvent(SplashEventloading event) async {
    //if (sharedPrefs.IsLogin == true) {
    emit(RootHomeState(isSurveyOpen: false,isProfileOpen: false)); //(isBackHome: false));
    // } else {
    //   print("===========>");
    //   emit(RootLoginLoadingComplete());
    // }
  }

  Future<void> mapEventFtBackPressed(BackPressed event) async {
    print("call Root");
    // emit(FtRootLoginLoadingComplete());
  }

}
