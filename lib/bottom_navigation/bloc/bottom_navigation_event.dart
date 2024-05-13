


import 'package:equatable/equatable.dart';

import '../../Helpers/utils/utils.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationEventLoadingComplete extends BottomNavigationEvent {
  final bool showProfileAfterLoading = true;

  @override
  List<Object> get props => [];
}
class BottomNavigationSurveyOpenEvent extends BottomNavigationEvent {


  @override
  List<Object> get props => [];
}
class BottomNavigationProfileOpenEvent extends BottomNavigationEvent {


  @override
  List<Object> get props => [];
}
class BottomNavigationEventHomeLoading extends BottomNavigationEvent {
  final bool showProfileAfterLoading = true;

  @override
  List<Object> get props => [];
}

class BottomNavigationEventTabChanged extends BottomNavigationEvent {
  final BottomNavigationTab? selectedTab;

  BottomNavigationEventTabChanged({this.selectedTab});

  @override
  List<Object> get props => [selectedTab!];
}

class BottomNavigationEventToggleLoadingAnimation
    extends BottomNavigationEvent {
  final bool? needToShow;

  BottomNavigationEventToggleLoadingAnimation({
    this.needToShow,
  });

  @override
  List<Object> get props => [
        needToShow!,
      ];
}

class BottomNavigationEventToggleBottomBar extends BottomNavigationEvent {
  final bool? needToShow;

  BottomNavigationEventToggleBottomBar({
    this.needToShow,
  });

  @override
  List<Object> get props => [
        needToShow!,
      ];
}
