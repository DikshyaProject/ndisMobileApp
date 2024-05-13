import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';

import '../../Helpers/services/services.dart';
import '../../Helpers/theme/theme.dart';
import '../../bottom_navigation/bloc/bloc.dart';
import '../../components/components.dart';
import '../home.dart';

class SignUpPageStep1 extends StatefulWidget {
  @override
  State<SignUpPageStep1> createState() => _SignUpPageStep1State();
}

class _SignUpPageStep1State extends State<SignUpPageStep1> {
  TextEditingController _textFiledUserName = TextEditingController();
  TextEditingController _textFiledLastName = TextEditingController();
  TextEditingController _textFiledEmailId = TextEditingController();
  TextEditingController _textFiledPassword = TextEditingController();
  TextEditingController _textFiledMobileNumber = TextEditingController();
  ParticipantRegistrationData? userInfoData;
  final focusUserName = FocusNode();
  final focusLastName = FocusNode();
  final focusEmailId = FocusNode();
  final focusPassword = FocusNode();
  final focusMobileNumber = FocusNode();
  late String location = "";
  bool isCheck = false;
  String selectedUserType = "Participant";
  List<ParticipantUserType> items = [];
  RegionModelList? regionModelData;
  List<Regionlist> regionsList = [];
  bool _obscureText = true;
  String regionId = "";

  getSelectedRegionId(String id) {
    regionId = id;
  }

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {

    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeSignUpPage1State) {
      regionModelData = homeState.regionModelData;
      if (regionModelData != null) {
        regionsList = regionModelData!.data.regions;
      } else {
        regionsList = [];
      }
      userInfoData = homeState.userInfoData;
      items = userInfoData!.userType;
      sharedPrefs.postCode = "";
      sharedPrefs.City = "";
      sharedPrefs.userState = "";
      sharedPrefs.userCountry = "";
      sharedPrefs.userName = "";
      sharedPrefs.serviceLocation = "";
      sharedPrefs.keyLatitude = "";
      sharedPrefs.keyLongitude = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    setState(() {
      if (location == "") {
        location = "Select";
      }else if (sharedPrefs.postCode == "" && sharedPrefs.City == "" &&
          sharedPrefs.userState == "" && sharedPrefs.userCountry == "" ) {
        location = "Select";
      } else {
        location = sharedPrefs.postCode +
            " " +
            sharedPrefs.City +
            " " +
            sharedPrefs.userState +
            " " +
            sharedPrefs.userCountry;
      }
      print("location-------$location");
    });

    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          if (state is HomeLoginPageState) {
            Navigator.pop(context);
          }
          if (state is HomeOtpPageState) {
            showHideProgress(false);
            Navigator.of(context).pushNamed(HomeNavigator.otpPage);
          }
          if (state is HomeerrorloadingState) {
            showHideProgress(false);
            showSnackBar(state.message, Colors.red, context);
            BlocProvider.of<HomeBloc>(context).add(HomeEventSignupReset());
          }
          if (state is HomeLocationSearchPageState) {
            Navigator.of(context).pushNamed(HomeNavigator.locationSearchPage);
          }
        },
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorThemePurpleColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Create Account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 30))),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.0.scale()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AVerticalSpace(25.0.scale()),
                  Text(
                    "Don't have an account ? Create your account. it's takes less than a minute.",
                    style: textStyleBoldCustomColor(
                        12.0.scale(), Colors.green),
                    textAlign: TextAlign.center,
                  ),
                  AVerticalSpace(25.0.scale()),
                  Text(
                    'First Name',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(
                    textController: _textFiledUserName,
                    focus: focusUserName,
                      hint: 'Enter First Name'
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Last Name',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(
                    textController: _textFiledLastName,
                    focus: focusLastName,
                      hint: 'Enter Last Name'
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Email Id',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(
                    textController: _textFiledEmailId,
                    focus: focusEmailId,
                    keyboardType: TextInputType.emailAddress,
                      hint: 'Enter Email Address'
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Mobile Number',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(
                    textController: _textFiledMobileNumber,
                    focus: focusMobileNumber,
                    keyboardType: TextInputType.phone,
                      hint: 'Enter Mobile Number'
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Password',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(
                    textController: _textFiledPassword,
                    focus: focusPassword,
                    obscure: _obscureText,
                      hint: 'Enter Password'
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    "Suburb / PostCode / City",
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventLocationbtnClick("SignUp"));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                      height: 50.0.scale(),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Text(
                            location,
                            style: textStyleCustomColor(
                              12.0.scale(),
                              Colors.black,
                            ),
                          ).expand(),
                          Image.asset(
                            "assets/images/ic_location_icon.png",
                            height: 20.0.scale(),
                            width: 20.0.scale(),
                            color: kColorThemePurpleColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  _SelectRegionListContainer(regionsList, getSelectedRegionId),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'User Type',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  if (items.length > 1)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                      height: 50.0.scale(),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<ParticipantUserType>(
                          isExpanded: true,
                          items: items
                              .map<DropdownMenuItem<ParticipantUserType>>(
                                  (ParticipantUserType item) {
                            return DropdownMenuItem<ParticipantUserType>(
                              value: item,
                              child: item.type != "NDIS service experts" ? Text(item.type): Text(""),
                            );
                          }).toList(),
                          onChanged: (ParticipantUserType? value) {
                            setState(() {
                              selectedUserType = value!.type;
                            });
                          },
                          hint: Text(selectedUserType,
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black)),
                        ),
                      ),
                    ),
                  AVerticalSpace(10.0.scale()),

                  InkWell(
                      onTap: () {
                        setState(() {
                          if (isCheck == false) {
                            isCheck = true;
                          } else {
                            isCheck = false;
                          }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            isCheck == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            size: 20.0.scale(),
                            color: isCheck == true? Colors.green: Colors.black,
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text("By signing up, you agree to our\n"
                              "Terms & conditions and privacy policy",
                              style: textStyleBoldCustomColor(
                                14.0.scale(),
                                Colors.green,
                              )),
                        ],
                      )),
                  AVerticalSpace(20.0.scale()),

                  ARoundedButton(
                    btnBgColor: kColorThemePurpleColor,
                    btnTextColor: Colors.white,
                    btnOnPressed: () {
                      if (_textFiledUserName!.text.isEmpty) {
                        showSnackBar("Please enter first name!", Colors.black, context);
                      } else if (_textFiledLastName!.text.isEmpty) {
                        showSnackBar("Please enter last name!", Colors.black, context);
                      } else if (_textFiledEmailId!.text.isEmpty) {
                        showSnackBar("Please enter Email Id!", Colors.black, context);
                      } else if (validateEmail(_textFiledEmailId!.text.toString()) == false) {
                        showSnackBar("Please enter valid Email Id!", Colors.black, context);
                      } else if (_textFiledMobileNumber!.text.isEmpty) {
                        showSnackBar("Please enter mobile number!", Colors.black, context);
                      } else if (_textFiledMobileNumber!.text.length > 10) {
                        showSnackBar("Please enter valid mobile number!", Colors.black, context);
                      } else if (_textFiledPassword!.text.isEmpty) {
                        showSnackBar("Please enter password!", Colors.black, context);
                      } else if (location.isEmpty) {
                        showSnackBar("Please select Location!", Colors.black, context);
                      } else {
                        if (isCheck == true) {
                          showHideProgress(true);

                          UserProfileData userProfData = UserProfileData(
                              firstName: _textFiledUserName!.text.toString(),
                              lastName: _textFiledLastName!.text.toString(),
                              emailId: _textFiledEmailId!.text.toString(),
                              mobileNumber: _textFiledMobileNumber!.text.toString(),
                              password: _textFiledPassword!.text.toString(),
                              userType: selectedUserType,
                              location: location,
                              latitude: sharedPrefs.userLatitude,
                              longitude: sharedPrefs.userLongitude,
                              regionId: regionId);

                          BlocProvider.of<HomeBloc>(context).add(HomeEventSigupStep1ContinueBtnClick(selectedUserType, userProfData));
                        } else {
                          showSnackBar("Please accept terms and condition!", Colors.black, context);
                        }
                      }
                    },
                    btnText: 'Continue',
                    btnHeight: 50.0.scale(),
                    btnFontSize: 14.0.scale(),
                    btnFontWeight: FontWeight.bold,
                    btnElevation: 0,
                    btnBorderSideColor: Colors.transparent,
                  ),
                  AVerticalSpace(25.0.scale()),
                ],
              ),
            ),
          ),
        )));
  }


  Widget customTextField({
    required TextEditingController textController,
    String? hint,
    required FocusNode focus,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool? isRead,
    bool? obscure,
  }) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focus);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
        height: 50.0.scale(),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: TextField(
          controller: textController,
          focusNode: focus,
          readOnly: isRead == true ? true : false,
          maxLines: 1,
          textInputAction: textInputAction?? TextInputAction.done,
          style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: obscure?? false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint ?? '',
            suffixIcon: obscure != null?
            InkWell(
              highlightColor: Colors.transparent,
                onTap: (){
                  _toggle();
                },
                child: Icon(obscure == true? CupertinoIcons.eye_fill: CupertinoIcons.eye_slash_fill)): Text(""),
            hintStyle: textStyleCustomColor(14.0.scale(), Colors.grey),
          ),
        ),
      ),
    );
  }
}

class _SelectRegionListContainer extends StatefulWidget {
  Function getSelectedRegionId;
  List<Regionlist> regionsList;

  _SelectRegionListContainer(this.regionsList, this.getSelectedRegionId);

  @override
  State<_SelectRegionListContainer> createState() =>
      _SelectRegionListContainerState();
}

class _SelectRegionListContainerState
    extends State<_SelectRegionListContainer> {
  String _strLanguage = "Select";
  bool isLanguage = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Australian Regions",
          style: textStyleBoldCustomColor(12.0.scale(), Colors.black),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
          height: 50.0.scale(),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Regionlist>(
              isExpanded: true,
              items: widget.regionsList
                  .map<DropdownMenuItem<Regionlist>>((Regionlist item) {
                return DropdownMenuItem<Regionlist>(
                  value: item,
                  child: Text(item.regionName),
                );
              }).toList(),
              onChanged: (Regionlist? value) {
                setState(() {
                  isLanguage = true;
                  _strLanguage = value!.regionName;
                  widget.getSelectedRegionId(value.id);
                  //  widget.getLanguage(value.id);
                });
              },
              hint: Text(_strLanguage,
                  style: textStyleCustomColor(12.0.scale(), Colors.black)),
            ),
          ),
        ),
      ],
    );
  }
}
