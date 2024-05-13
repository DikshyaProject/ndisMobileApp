
import 'package:equatable/equatable.dart';

import '../../Helpers/utils/utils.dart';

abstract class BottomNavigationState extends Equatable {
  @override
  List<Object> get props => [];
}

class BottomNavigationDefaultState extends BottomNavigationState {
  final BottomNavigationTab? selectedTab;
  final bool? showLoadingAnimation;
  final bool? goToHomePageFindClinic;
  final bool? showBottomNavigation;

  BottomNavigationDefaultState({
    this.selectedTab,
    this.showLoadingAnimation = false,
    this.showBottomNavigation = true,
    this.goToHomePageFindClinic = false,
  });

  @override
  List<Object> get props => [
        selectedTab!,
        showLoadingAnimation!,
        showBottomNavigation!,
        goToHomePageFindClinic!,
      ];

  BottomNavigationDefaultState copyWith(
      {
      BottomNavigationTab? selectedTab,
      bool? showLoadingAnimation,
      bool? showBottomNavigation,
      bool? goToVaccinationHistory,
      bool? goToVaccinationHistoryDetail,
      bool? goToAppointmentHistoryDetail,
      bool? goToBookingDropinTab,
      bool? goToBookingDropinTabSelection,
      bool? goToHomePageFindClinic,
      int? appointmentId,
      bool? isFromNotification,
      int? doseId,
      bool? isCancelBooking,
      String? externalLink,
      bool? ishomeSurvey,
      bool? isForegroundNotificationRecieved})
  {
    return new BottomNavigationDefaultState(
      selectedTab: selectedTab ?? this.selectedTab,
      showLoadingAnimation: showLoadingAnimation ?? this.showLoadingAnimation,
      showBottomNavigation: showBottomNavigation ?? this.showBottomNavigation,
      goToHomePageFindClinic:
          goToHomePageFindClinic ?? this.goToHomePageFindClinic,
    );
  }
}
