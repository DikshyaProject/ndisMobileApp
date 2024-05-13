import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../Helpers/utils/utils.dart';
import '../../root/root.dart';
import '../bottom_navigation.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final UserRepository? _userRepository;

  BottomNavigationBloc(UserRepository userRepository)
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(BottomNavigationDefaultState(
            selectedTab: BottomNavigationTab.HOME)) {
    on<BottomNavigationEvent>((event, emit) {
      if (event is BottomNavigationEventLoadingComplete) {
        mapLoadingCompletedToState(event);
      } else if (event is BottomNavigationEventTabChanged) {
        mapTabChangedToState(event);
      } else if (event is BottomNavigationEventToggleLoadingAnimation) {
        mapToggleLoadingAnimation(event);
      } else if (event is BottomNavigationEventToggleBottomBar) {
        mapToggleBottomNavigation(event);
      } else if (event is BottomNavigationSurveyOpenEvent) {
        mapSurveyOpenState(event);
      } else if (event is BottomNavigationProfileOpenEvent) {
        mapProfileOpenState(event);
      }
    });
  }

  Future<void> mapNewForegroundNotificationHandled() async {
    emit((state as BottomNavigationDefaultState)
        .copyWith(isForegroundNotificationRecieved: false));
  }

  Future<void> mapNewForegroundNotification() async {
    emit((state as BottomNavigationDefaultState)
        .copyWith(isForegroundNotificationRecieved: true));
  }

  Future<void> mapLoadingCompletedToState(
      BottomNavigationEventLoadingComplete event) async {
    // _userRepository!.ScreenName = ScreenNavigation.HomeMainPageScreen;
    // print("Screen_name__0_______${_userRepository!.ScreenName}");

    emit((state as BottomNavigationDefaultState).copyWith(
      selectedTab: BottomNavigationTab.HOME,
    ));
  }

  Future<void> mapSurveyOpenState(BottomNavigationSurveyOpenEvent event) async {
    emit((state as BottomNavigationDefaultState).copyWith(
        // selectedTab: BottomNavigationTab.Profile,
        ));
  }

  Future<void> mapProfileOpenState(
      BottomNavigationProfileOpenEvent event) async {
    emit((state as BottomNavigationDefaultState).copyWith(
        // selectedTab: BottomNavigationTab.AddBussiness,
        ));
  }

  Future<void> mapTabChangedToState(
      BottomNavigationEventTabChanged event) async {
    emit((state as BottomNavigationDefaultState)
        .copyWith(selectedTab: event.selectedTab));
  }

  Future<void> mapToggleLoadingAnimation(
      BottomNavigationEventToggleLoadingAnimation event) async {
    emit((state as BottomNavigationDefaultState)
        .copyWith(showLoadingAnimation: event.needToShow));
  }

  Future<void> mapToggleBottomNavigation(
      BottomNavigationEventToggleBottomBar event) async {
    emit((state as BottomNavigationDefaultState)
        .copyWith(showBottomNavigation: event.needToShow));
  }
}
