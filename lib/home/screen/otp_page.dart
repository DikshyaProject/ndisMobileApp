import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_styles.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../Helpers/theme/theme.dart';
import '../../bottom_navigation/bloc/bloc.dart';
import '../../components/components.dart';
import '../home.dart';

const double _kVerticalSpaceTopHeartLogo = 5.0;
const double _kEnterCodeTextFontSize = 40.0;
const double _kVerticalSpaceBeforeEnterCodeText = 20.0;

class AuthOtpPage extends StatefulWidget {
  @override
  State<AuthOtpPage> createState() => _AuthOtpPageState();
}

class _AuthOtpPageState extends State<AuthOtpPage> {
  String? email="";
  String? from;
  late String selectedUserType;
  String emailId_str="";
  String mobile_str="";
  String emailOtp="",mobileOtp="";
  late  UserProfileData userProfData;
  String pinMobile = "";
  String pinEmail = "";
  OtpFieldController otpControllerEmail= OtpFieldController();
  OtpFieldController otpControllerMobile= OtpFieldController();

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }


  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeOtpPageState) {
      selectedUserType = homeState.selectedUserType;
      emailId_str=   "${homeState.userProfData.emailId}";
      mobile_str= "${homeState.userProfData.mobileNumber}";
      userProfData= homeState.userProfData;

    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeSignUpPage1State) {
          Navigator.of(context).pop(true);
        }
        if (state is HomeParticipantRegisterPageState) {
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.participantRegisterPage);
        }
        if (state is HomeInitial) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.homePage);
        }
        if (state is HomeSupportCongratulationPageState){
          showHideProgress(false);
          Navigator.of(context)
              .pushNamed(HomeNavigator.supportWorkerCongratulationPage);
        }
        if(state is HomeOtpPageState){
          showHideProgress(false);
        }
        if(state is HomeerrorloadingState){
          showHideProgress(false);
          showSnackBar(state.message, Colors.red, context);
          BlocProvider.of<HomeBloc>(context).add(HomeEventResetOtpPage(selectedUserType,userProfData));
        }
      },
      child: SafeArea(
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                    backgroundColor: kColorThemePurpleColor,
                    centerTitle: true,
                    elevation: 0,
                    title: Text(
                      "Verification",
                      style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                    ),
                    leading: InkWell(
                        onTap: () {
                          BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white, size: 30)
                           )),
                body: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.0.scale()),
                    child: Column(
                        children: [

                      Text(
                        "Hi, ${userProfData.firstName}",
                        style: textStyleBoldCustomColor(25.0.scale(), Colors.black),
                      ).align(Alignment.center),
                      AVerticalSpace(5.0.scale()),
                      Text(
                        "2 Step Verification",
                        style: textStyleBoldCustomColor(25.0.scale(), Colors.black),
                      ).align(Alignment.center),
                      AVerticalSpace(5.0.scale()),

                      Card(
                        child: Column(
                          children: [
                            AVerticalSpace(10.0.scale()),
                            Image(
                              width: 80.0.scale(),
                              height: 80.0.scale(),
                              image: AssetImage('assets/images/ic_email_icon.png'),
                            ).align(Alignment.center),
                            AVerticalSpace(8.0.scale()),

                            Text(
                              "Enter your email verification code",
                              style: textStyleBoldCustomColor(12.0.scale(), Colors.black),
                            ).align(Alignment.center),
                            AVerticalSpace(8.0.scale()),

                            if(otpControllerEmail!=null)
                            OTPTextField(
                              controller: otpControllerEmail,
                              length: 5,
                              width: MediaQuery.of(context).size.width,
                              textFieldAlignment: MainAxisAlignment.spaceEvenly,
                              fieldStyle: FieldStyle.box,
                              outlineBorderRadius: 5,
                              fieldWidth: 40.0.scale(),
                              style: textStyleCustomColor(17.0.scale(), Colors.black),

                              onChanged: (pin) {
                                print("Changed: " + pin);
                              },
                              onCompleted: (pin) {
                                print("Completed: " + pin);
                                setState(() {
                                  pinEmail = pin;
                                });
                                print("pinEmail: " + pinEmail);
                              },
                            ),
                            AVerticalSpace(15.0.scale()),

                            GestureDetector(
                              onTap: (){
                                showHideProgress(true);
                                BlocProvider.of<HomeBloc>(context).add(HomeResendOtp("email",emailId_str,"",selectedUserType,userProfData));
                              },
                              child: Text(
                                "Resend code? Click here",

                                style: TextStyle(
                                    fontSize: 14.0.scale(),
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                    color: kColorThemePurpleColor

                                ),

                              ).align(Alignment.center),
                            ),
                            AVerticalSpace(20.0.scale()),
                          ],
                        ),
                      ),
                      AVerticalSpace(10.0.scale()),
                      Card(
                        child: Column(children: [
                          AVerticalSpace(10.0.scale()),
                          Image(
                            width: 80.0.scale(),
                            height: 80.0.scale(),
                            image: AssetImage('assets/images/ic_auth_top_icon.png'),
                          ).align(Alignment.center),

                          AVerticalSpace(5.0.scale()),
                          Text(
                            "Enter your Mobile Verification Code",
                            style: textStyleCustomColor(12.0.scale(), Colors.black),
                          ).align(Alignment.center),
                          AVerticalSpace(10.0.scale()),

                          OTPTextField(
                            length: 5,
                            width: MediaQuery.of(context).size.width,
                            textFieldAlignment: MainAxisAlignment.spaceEvenly,
                            fieldWidth: 40.0.scale(),
                            fieldStyle: FieldStyle.box,
                            outlineBorderRadius: 5,
                            style: textStyleCustomColor(17.0.scale(), Colors.black),
                            onChanged: (pin) {
                              print("Changed: " + pin);
                            },
                            onCompleted: (pin) {
                              print("Completed: " + pin);
                              setState(() {
                                pinMobile = pin;
                              });
                            },
                          ),
                          AVerticalSpace(15.0.scale()),

                          GestureDetector(
                            onTap: (){
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context).add(HomeResendOtp("mobile","",mobile_str,selectedUserType!,userProfData!));
                            },
                            child: Text(
                              "Resend code? Click here",
                              style: TextStyle(
                                  fontSize: 14.0.scale(),
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  color: kColorThemePurpleColor
                              ),
                            ).align(Alignment.center),
                          ),
                          AVerticalSpace(10.0.scale()),

                        ]).topPadding(20.0.scale()).bottomPadding(20.0.scale()),
                      ),

                      AVerticalSpace(25.0.scale()),

                      ARoundedButton(
                        btnBgColor: kColorThemePurpleColor,
                        btnTextColor: Colors.white,
                        btnOnPressed: () {
                          if (pinMobile.isNotEmpty&&pinEmail.isNotEmpty) {
                            if(selectedUserType=="Support Worker"){
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context).add(
                                  HomeEventOtpVerifyToCongratulationScreenClick(
                                      selectedUserType,userProfData,pinEmail,pinMobile,emailId_str,mobile_str));

                            }
                            else if(selectedUserType=="General"){
                              BlocProvider.of<HomeBloc>(context).add(
                                  HomeGeneralbtnRegisterButtonClick   (
                                      selectedUserType,pinEmail,pinMobile,emailId_str,mobile_str,userProfData));

                            }
                            // else if(selectedUserType=="NDIS service experts"){
                            //   BlocProvider.of<HomeBloc>(context).add(
                            //       HomeGeneralbtnRegisterButtonClick (
                            //           selectedUserType,pinEmail,pinMobile,emailId_str,mobile_str,userProfData));
                            //
                            // }

                            else if(selectedUserType=="Participant"){
                              showHideProgress(true);
                              BlocProvider.of<HomeBloc>(context).add(
                                  HomeEventOtpVerifyToStep2BtnClick(
                                      selectedUserType,pinEmail,pinMobile,emailId_str,mobile_str,userProfData));
                            }

                          }else{
                            showSnackBar("Please insert otp", Colors.black, context);
                          }

                        },
                        btnText: 'Continue',
                        btnHeight: 50.0.scale(),
                        btnFontSize: 14.0.scale(),
                        btnFontWeight: FontWeight.bold,
                        btnElevation: 0,
                        btnBorderSideColor: Colors.transparent,
                      ),
                      AVerticalSpace(5.0.scale()),
                    ]),
                  ),
                ),
              ),
            ],
          )).widgetBgColor(Colors.white),
    );
  }
}
