import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/components.dart';

import '../../../Helpers/theme/theme.dart';
import '../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../home.dart';

class SupportWorkerCongratulationPage extends StatefulWidget {
  @override
  State<SupportWorkerCongratulationPage> createState() =>
      _SupportWorkerCongratulationPageState();
}

class _SupportWorkerCongratulationPageState
    extends State<SupportWorkerCongratulationPage> {
  String selectedUserType = "";
  UserProfileData? userProfData;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeSupportCongratulationPageState) {
      selectedUserType = homeState.userType;
      userProfData = homeState.userProfData;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeSupportRegisterPageState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.supportWorkerRegisterPage);
        }
        if (state is HomeerrorloadingState) {
          showHideProgress(false);
          showSnackBar(state.message, Colors.red, context);
        }
        if (state is HomeOtpPageState) {
          Navigator.of(context).pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(HomeEventBackBtnClick(''));
                  },
                  child:
                      Icon(Icons.arrow_back, color: Colors.black, size: 30))),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.scale()),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Congratulation',
                    style: textStyleBoldCustomColor(
                      30.0.scale(),
                      kColorLoginBtn,
                    ),
                  ),
                  Image(
                    width: 300.0.scale(),
                    height: 170.0.scale(),
                    image: AssetImage('assets/images/ic_congratulation_bg.png'),
                  ),
                  AVerticalSpace(25.0.scale()),
                  Text(
                    'We are offering two years free subscription plan for all Support Workers whether you are working as a Sole Trader or Under the agency.',
                    style: textStyleCustomColor(
                      16.0.scale(),
                      Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  AVerticalSpace(25.0.scale()),
                  ARoundedButton(
                    btnBgColor: kColorThemePurpleColor,
                    btnTextColor: Colors.white,
                    btnOnPressed: () {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeEventSupportWorkerCongratToSupportPageClick(
                              selectedUserType, userProfData!));
                    },
                    btnText: 'Next',
                    btnHeight: 50.0.scale(),
                    btnFontSize: 12.0.scale(),
                    btnFontWeight: FontWeight.bold,
                    btnElevation: 0,
                    btnBorderSideColor: Colors.transparent,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
