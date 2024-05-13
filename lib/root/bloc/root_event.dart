
import 'package:equatable/equatable.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object> get props => [];
}

class SplashEventloading extends RootEvent {}

class RootHomeEvent extends RootEvent {}

class BackPressed extends RootEvent {}

class LogoutEvent extends RootEvent {}
class RootEventHomeBackButton extends RootEvent {}
class FtRootEventBackButtonHomeReset extends RootEvent {}
class RootEventSurveyPageOpenEvent extends RootEvent{

}

class RootEventHomeStateSurveyResetEvent extends RootEvent{
}
class RootEventProfilePageOpenEvent extends RootEvent{
}
class RootEventProfilePageOpenResetEvent extends RootEvent{
}

class RootHomeBackEvent extends RootEvent{}
class RootEnquiryToLocationBackEvent extends RootEvent{}
class RootSupportWorker2BackEvent extends RootEvent{}
class RootSupportWorker3BackEvent extends RootEvent{}
class RootLoginToBackEvent extends RootEvent{}
class RootAllService2BackEvent extends RootEvent{}
class RootFilterBackEvent extends RootEvent{}
class RootAllService3BackEvent extends RootEvent{}
class RootJob2BackEvent extends RootEvent{}
class RootJob3BackEvent extends RootEvent{}
class RootSearchToJobBackEvent extends RootEvent{}
class RootSupportCoord2BackEvent extends RootEvent{}
class RootSupportCoord3BackEvent extends RootEvent{}
class RootNdisExpert2BackEvent extends RootEvent{}
class RootNdisExpert3BackEvent extends RootEvent{}
class RootEvents2BackEvent extends RootEvent{}
class RootMpProduct2BackEvent extends RootEvent{}
class RootMpProduct3BackEvent extends RootEvent{}
class RootMpProduct4BackEvent extends RootEvent{}
class RootMpProduct5BackEvent extends RootEvent{}
class RootMpVehicle2BackEvent extends RootEvent{}
class RootMpVehicle3BackEvent extends RootEvent{}
class RootMpVehicle4BackEvent extends RootEvent{}
class RootMpVehicle5BackEvent extends RootEvent{}
class RootMpProperty2BackEvent extends RootEvent{}
class RootMpProperty3BackEvent extends RootEvent{}
class RootPlanManager2BackEvent extends RootEvent{}
class RootAccomodation2BackEvent extends RootEvent{}
class RootAccomodation3BackEvent extends RootEvent{}
class RootBlog2BackEvent extends RootEvent{}
class RootNews2BackEvent extends RootEvent{}
class RootNotiToHomeBackEvent extends RootEvent{}
class RootFsAdvocacyBackEvent extends RootEvent{}
class RootFsPsychoBackEvent extends RootEvent{}
class RootFsPsycho2BackEvent extends RootEvent{}
class RootFsAdvocacy2BackEvent extends RootEvent{}
class RootFsSupWorkBackEvent extends RootEvent{}
class RootFsSupCoordBackEvent extends RootEvent{}
class RootFsPlanManagerEvent extends RootEvent{}
class RootHomeToServiceEvent extends RootEvent{}
class RootLoginToForgotEvent extends RootEvent{}
class RootLoginToSignupEvent extends RootEvent{}
class RootSignupToLocationEvent extends RootEvent{}
class RootSupportCoordinatorRegistrationPage extends RootEvent{}
class RootSignupToOtpEvent extends RootEvent{}
class RootOtpToParticiEvent extends RootEvent{}
class RootParticiToLocationEvent extends RootEvent{}
class RootCongratulationsEvent extends RootEvent{}
class RootCongratsToRegEvent extends RootEvent{}
class RootPartiProToLocationEvent extends RootEvent{}
class RootGeneralToLocationEvent extends RootEvent{}
class RootFilterToLocationEvent extends RootEvent{}
class RootProfileBackEvent extends RootEvent{}
class RootProfileToHomeBackEvent extends RootEvent{}
class RootAllUserBackEvent extends RootEvent{}
class RootOrderDetailBackEvent extends RootEvent{}
class RootBackResetEvent extends RootEvent{}
class RootPricingListingPage extends RootEvent{}