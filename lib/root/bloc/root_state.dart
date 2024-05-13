import 'package:equatable/equatable.dart';

abstract class RootState extends Equatable {
   RootState();

  List<Object> get props => [];
}

class RootInitial extends RootState {
  @override
  List<Object> get props => [];
}

class RootLoginLoadingComplete extends RootState {}

class RootHomeState extends RootState {
  bool? isBackHome = false;
  bool? isSupWork2Home = false;
  bool? isLocToEnq = false;
  bool? isSupWork3Home = false;
  bool? isFromLogin = false;
  bool? isAllServ2Home = false;
  bool? isFilter = false;
  bool? isAllServ3Home = false;
  bool? isJob2Home = false;
  bool? isJob3Home = false;
  bool? isSearchJob = false;
  bool? isSupCoord2 = false;
  bool? isSupCoord3 = false;
  bool? isExpert2 = false;
  bool? isExpert3 = false;
  bool? isEvent2 = false;
  bool? isMpProd2 = false;
  bool? isMpProd3 = false;
  bool? isMpProd4 = false;
  bool? isMpProd5 = false;
  bool? isMpVehicle2 = false;
  bool? isMpVehicle3 = false;
  bool? isMpVehicle4 = false;
  bool? isMpVehicle5 = false;
  bool? isMpProp2 = false;
  bool? isMpProp3 = false;
  bool? isPlan2 = false;
  bool? isAccomoRent2 = false;
  bool? isAccomoRent3 = false;
  bool? isBlog2 = false;
  bool? isNews2 = false;
  bool? isNotiHome = false;
  bool? isFindSupAdvo = false;
  bool? isFindSupPsycho = false;
  bool? isFindSupPsycho2 = false;
  bool? isFsAdvocacy2 = false;
  bool? isFsSupWork = false;
  bool? isFsSupCoord = false;
  bool? isFsPlanManager = false;
  bool? isHomeToService = false;
  bool? isForgot = false;
  bool? isSignup = false;
  bool? isSignupLocation = false;
  bool? isProfileBack = false;
  bool? isProfileToHomeBack = false;
  bool? isAllUser = false;
  bool? isOrder2 = false;
  bool? isSignupSupport = false;
  bool? isOtp = false;
  bool? isPartic = false;
  bool? isPartiLocation = false;
  bool? isCongrats = false;
  bool? isCongratsToReg = false;
  bool? isPartiProToLoc = false;
  bool? isGenProToLoc = false;
  bool? isFilterToLoc = false;
  bool? isPaymentPageListing = false;
  late bool isSurveyOpen;
  late bool isProfileOpen;

  RootHomeState(
      {required this.isSurveyOpen,
      required this.isProfileOpen,
      this.isBackHome,
      this.isSupWork2Home,
      this.isLocToEnq,
      this.isPartiProToLoc,
      this.isSupWork3Home,
      this.isFilter,
      this.isGenProToLoc,
      this.isFilterToLoc,
      this.isCongratsToReg,
      this.isFromLogin,
      this.isAllServ2Home,
      this.isAllServ3Home,
      this.isJob2Home,
      this.isJob3Home,
      this.isSearchJob,
      this.isSupCoord2,
      this.isSupCoord3,
      this.isExpert2,
      this.isExpert3,
      this.isEvent2,
      this.isMpProd2,
      this.isMpProd3,
      this.isMpProd4,
      this.isMpProd5,
      this.isMpVehicle2,
      this.isMpVehicle3,
      this.isMpVehicle4,
      this.isMpVehicle5,
      this.isMpProp2,
      this.isMpProp3,
      this.isPlan2,
      this.isAccomoRent2,
      this.isAccomoRent3,
      this.isBlog2,
      this.isNews2,
      this.isNotiHome,
      this.isFindSupAdvo,
      this.isFindSupPsycho,
      this.isFindSupPsycho2,
      this.isFsAdvocacy2,
      this.isFsSupWork,
      this.isFsSupCoord,
      this.isFsPlanManager,
      this.isHomeToService,
      this.isForgot,
      this.isSignup,
      this.isSignupLocation,
      this.isProfileBack,
      this.isProfileToHomeBack,
      this.isCongrats,
      this.isAllUser,
      this.isOrder2,
      this.isSignupSupport,
      this.isOtp,
      this.isPartic,
      this.isPartiLocation,
      this.isPaymentPageListing,
      });

  @override
  List<Object> get props => [
    isSurveyOpen,
    isProfileOpen,
    isBackHome ?? false,
    isSupWork2Home ?? false,
    isLocToEnq ?? false,
    isFilter ?? false,
    isSupWork3Home ?? false,
    isFromLogin ?? false,
    isAllServ2Home ?? false,
    isCongrats ?? false,
    isPartiProToLoc ?? false,
    isAllServ3Home ?? false,
    isCongratsToReg ?? false,
    isGenProToLoc ?? false,
    isFilterToLoc ?? false,
    isJob2Home ?? false,
    isJob3Home ?? false,
    isSearchJob ?? false,
    isSupCoord2 ?? false,
    isSupCoord3 ?? false,
    isExpert2 ?? false,
    isExpert3 ?? false,
    isEvent2 ?? false,
    isMpProd2 ?? false,
    isMpProd3 ?? false,
    isMpProd4 ?? false,
    isMpProd5 ?? false,
    isMpVehicle2 ?? false,
    isMpVehicle3 ?? false,
    isMpVehicle4 ?? false,
    isMpVehicle5 ?? false,
    isMpProp2 ?? false,
    isMpProp3 ?? false,
    isPlan2 ?? false,
    isAccomoRent2 ?? false,
    isAccomoRent3 ?? false,
    isBlog2 ?? false,
    isNews2 ?? false,
    isNotiHome ?? false,
    isFindSupAdvo ?? false,
    isFindSupPsycho ?? false,
    isFindSupPsycho2 ?? false,
    isFsAdvocacy2 ?? false,
    isFsSupWork ?? false,
    isFsSupCoord ?? false,
    isFsPlanManager ?? false,
    isHomeToService ?? false,
    isForgot ?? false,
    isSignup ?? false,
    isProfileBack ?? false,
    isSignupLocation ?? false,
    isProfileToHomeBack ?? false,
    isAllUser ?? false,
    isOrder2 ?? false,
    isSignupSupport ?? false,
    isPaymentPageListing ?? false,
    isPartic ?? false,
    isPartiLocation ?? false,
    isOtp ?? false,
  ];
}

class RootSurveyPageOpen extends RootState {
  @override
  List<Object> get props => [];
}
