import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndisparticipant/Helpers/services/services.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/components/components.dart';
import '../../../Helpers/theme/theme.dart';
import '../../../bottom_navigation/bottom_navigation.dart';
import '../../home.dart';

class ParticipantPage extends StatefulWidget {
  @override
  State<ParticipantPage> createState() => _ParticipantPageState();
}

class _ParticipantPageState extends State<ParticipantPage> {
  String selectedServices = "MySelf";
  String? selectedParticipateAgeRange ;
  String? selectedRelationParticipant ;
  String? selectedContactMethod ;
  String? selectedParticipantIdentify ;
  String? selectedInterpreted ;
  String? selectedAccesMethod ;
  String? selectedNDISPlanManaged ;
  String? selectLocation ;
  String selectedUserType = "";
  late List<WNServices> arrayServices;
  late final List<PlanManaged> planArrayManaged;
  late final List<ParAgeRange> parArrayAgeRange;
  late final List<PaIdentifyAs> parArrayIdentifyAs;
  late final List<RelationWiPar> parArrayrelationWiPar;
  late final List<ContactMethod> parArrayContactMethod;
  TextEditingController _textFiledParticipantFirstName= TextEditingController();
  TextEditingController _textFiledParticipantLastName= TextEditingController();
  TextEditingController _textFiledUserLanguage= TextEditingController();
  TextEditingController _textFiledUserNDISNumber= TextEditingController();
  TextEditingController _textFiledUserName1= TextEditingController();
  TextEditingController _textFiledUserName2= TextEditingController();
  TextEditingController _textFiledUserEmail= TextEditingController();
  TextEditingController _textFiledUserMobile= TextEditingController();
  late UserProfileData userProfData;
  var nodeParticipateFName = FocusNode();
  var nodeParticipateLName = FocusNode();
  var nodeUserFName = FocusNode();
  var nodeUserLName = FocusNode();
  var nodeUserEmail = FocusNode();
  var nodeUserMobile = FocusNode();
  var languageNode = FocusNode();
  var ndisNode = FocusNode();
  var enterpreterRequired = [
    'Yes',
    'No',
  ];

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeParticipantRegisterPageState) {
      selectedUserType = homeState.userType;
      planArrayManaged = homeState.userInfoData!.planManaged;
      parArrayAgeRange = homeState.userInfoData!.parAgeRange;
      parArrayIdentifyAs = homeState.userInfoData!.paIdentifyAs;
      parArrayrelationWiPar = homeState.userInfoData!.relationWiPar;
      arrayServices = homeState.userInfoData!.wNServices;
      parArrayContactMethod = homeState.userInfoData!.contactMethod;
      userProfData = homeState.userProfData!;
      _textFiledUserName1.text = homeState.userProfData!.firstName!;
      _textFiledUserName2.text = homeState.userProfData!.lastName!;
      _textFiledUserEmail.text = homeState.userProfData!.emailId!;
      _textFiledUserMobile.text = homeState.userProfData!.mobileNumber!;

      sharedPrefs.postCode = "" ;
      sharedPrefs.City = "" ;
      sharedPrefs.userState = "" ;
      sharedPrefs.userCountry = "" ;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (selectLocation == null) {
        selectLocation = "Select";
      }else if (sharedPrefs.postCode == "" && sharedPrefs.City == "" &&
          sharedPrefs.userState == "" && sharedPrefs.userCountry == "" ) {
        selectLocation = "Select";
      } else {
        selectLocation = sharedPrefs.postCode +
            " " +
            sharedPrefs.City +
            " " +
            sharedPrefs.userState +
            " " +
            sharedPrefs.userCountry;
      }
      print("selectLocation-------$selectLocation");
    });

    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
      listener: (context, state) {
        if (state is HomeOtpPageState) {
          Navigator.of(context).pop(true);
        }
        if (state is HomeInitial) {
          showHideProgress(false);
          Navigator.of(context).pushNamed(HomeNavigator.homePage);
        }
        if (state is HomeerrorloadingState) {
          showHideProgress(false);
        }
        if (state is HomeAddressSearchPageState) {
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
                "Registration",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0.scale(),
                    fontWeight: FontWeight.w700),
              ),
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));

                    // BlocProvider.of<HomeBloc>(context).add(HomeEventParticipantBackBtnClick(selectedUserType, userProfData));
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 30)
                      )),
          body:  SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.0.scale()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AVerticalSpace(10.0.scale()),
                  Text(
                    'Few steps to go!',
                    style: textStyleBoldCustomColor(
                      18.0.scale(),
                      kColorLoginBtn,
                    ),
                    textAlign: TextAlign.center,
                  ).align(Alignment.center),
                  Text(
                    'Fill in the below information. This will help to connect with the right service provider. ',
                    style: textStyleBoldCustomColor(
                      14.0.scale(),
                      kColorLoginBtn,
                    ),
                    textAlign: TextAlign.center,
                  ).align(Alignment.center),

                  AVerticalSpace(20.0.scale()),

                  Text(
                    'Who need services!',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      kColorLoginBtn,
                    ),
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
                      child: DropdownButton<WNServices>(
                        isExpanded: true,
                        items: arrayServices.map<DropdownMenuItem<WNServices>>(
                                (WNServices item) {
                              return DropdownMenuItem<WNServices>(
                                value: item,
                                child: Text(item.wNServicesName),
                              );
                            }).toList(),
                        onChanged: (WNServices? value) {
                          setState(() {
                            if (selectedServices != value!.wNServicesName) {
                              selectedParticipateAgeRange = "";
                              selectedRelationParticipant = "";
                              selectedContactMethod = "";
                              selectedParticipantIdentify = "";
                              selectedInterpreted = "";
                              selectedAccesMethod = "";
                              selectedNDISPlanManaged = "";
                              selectLocation = "";
                              sharedPrefs.serviceLocation = "";
                              selectedUserType = "";
                              _textFiledUserLanguage.text = "";
                              _textFiledUserNDISNumber.text = "";
                              sharedPrefs.postCode = "" ;
                              sharedPrefs.City = "" ;
                              sharedPrefs.userState = "" ;
                              sharedPrefs.userCountry = "" ;
                            }
                            selectedServices = value.wNServicesName;
                          });
                        },
                        hint: Text(selectedServices??'MySelf',
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.black)),
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  if (selectedServices.toLowerCase() == "Someone I care for".toLowerCase() ||
                      selectedServices.toLowerCase() == "My Client".toLowerCase())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Participant Name',
                          style: textStyleBoldCustomColor(
                            12.0.scale(),
                            kColorLoginBtn,
                          ),
                        ),
                        customTextField(
                            textController: _textFiledParticipantFirstName,
                            focus: nodeParticipateFName,
                            hint: 'Enter Participant First Name',
                        ),
                        AVerticalSpace(10.0.scale()),

                        Text(
                          'Participant Last Name.',
                          style: textStyleBoldCustomColor(
                            12.0.scale(),
                            kColorLoginBtn,
                          ),
                        ),
                        customTextField(
                            textController: _textFiledParticipantLastName,
                            hint: 'Enter Participant Last Name',
                            focus: nodeParticipateLName),

                      ],
                    ),


                  if (selectedServices.toLowerCase() == "My Client".toLowerCase())
                    Text(
                      'If you are Support Coordinator, you can also open your indiviual account.',
                      style: textStyleBoldCustomColor(
                        12.0.scale(),
                        kColorThemePurpleColor,
                      ),
                    ).bottomPadding(10.0.scale()),

                  if (selectedServices.toLowerCase() == "MySelf".toLowerCase())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: textStyleBoldCustomColor(
                            12.0.scale(),
                            kColorLoginBtn,
                          ),
                        ),
                        customTextField(
                            textController: _textFiledUserName1,
                            hint: 'Enter Your First Name',
                            focus: nodeUserFName),
                        AVerticalSpace(10.0.scale()),

                        Text(
                          'Last Name',
                          style: textStyleBoldCustomColor(
                            12.0.scale(),
                            kColorLoginBtn,
                          ),
                        ),
                        customTextField(
                            textController: _textFiledUserName2,
                            hint: 'Enter Your Last Name',
                            focus: nodeUserLName),
                        AVerticalSpace(10.0.scale()),

                        Text(
                          'Email Id',
                          style: textStyleBoldCustomColor(
                            12.0.scale(),
                            kColorLoginBtn,
                          ),
                        ),
                        customTextField(
                            textController: _textFiledUserEmail,
                            hint: 'Enter Your Email Id',
                            focus: nodeUserEmail),
                        AVerticalSpace(10.0.scale()),

                        Text(
                          'Mobile Number',
                          style: textStyleBoldCustomColor(
                            12.0.scale(),
                            kColorLoginBtn,
                          ),
                        ),
                        customTextField(
                            textController: _textFiledUserMobile,
                            hint: 'Enter Your Mobile Number',
                            focus: nodeUserMobile),

                      ],
                    ),

                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Participant age range!',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      kColorLoginBtn,
                    ),
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
                        child: DropdownButton<ParAgeRange>(
                          isExpanded: true,
                          items: parArrayAgeRange
                              .map<DropdownMenuItem<ParAgeRange>>(
                                  (ParAgeRange item) {
                                return DropdownMenuItem<ParAgeRange>(
                                  value: item,
                                  child: Text(item.ageRangeName),
                                );
                              }).toList(),
                          onChanged: (ParAgeRange? value) {
                            setState(() {
                              selectedParticipateAgeRange = value!.ageRangeName;
                            });
                          },
                          hint: Text(selectedParticipateAgeRange??"Early Childhood(0-7 years)",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black)),
                        ),
                      )),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'How is your NDIS plan managed?',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      kColorLoginBtn,
                    ),
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
                        child: DropdownButton<PlanManaged>(
                          isExpanded: true,
                          items: planArrayManaged
                              .map<DropdownMenuItem<PlanManaged>>(
                                  (PlanManaged item) {
                                return DropdownMenuItem<PlanManaged>(
                                  value: item,
                                  child: Text(item.planManName),
                                );
                              }).toList(),
                          onChanged: (PlanManaged? value) {
                            setState(() {
                              selectedNDISPlanManaged = value!.planManName;
                            });
                          },
                          hint: Text(selectedNDISPlanManaged??"Select",
                              style: textStyleCustomColor(
                                  12.0.scale(), Colors.black)),
                        ),
                      )),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Enter your service location?',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      kColorLoginBtn,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context).add(
                          HomeEventAddressbtnClick(
                              "participant", selectedUserType, userProfData));
                    },
                    child: Container(
                      padding: EdgeInsets.all( 10.0.scale()),
                      height: 50.0.scale(),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        selectLocation??"Select",
                        style: textStyleCustomColor(12.0.scale(), Colors.black),
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  if (selectedServices.toLowerCase() == "Someone i care for".toLowerCase())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Relationship with the participant?',
                          style: textStyleBoldCustomColor(
                            12.0.scale(),
                            kColorLoginBtn,
                          ),
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
                            child: DropdownButton<RelationWiPar>(
                              isExpanded: true,
                              items: parArrayrelationWiPar
                                  .map<DropdownMenuItem<RelationWiPar>>(
                                      (RelationWiPar item) {
                                return DropdownMenuItem<RelationWiPar>(
                                  value: item,
                                  child: Text(item.relationWiParName),
                                );
                              }).toList(),
                              onChanged: (RelationWiPar? value) {
                                setState(() {
                                  selectedRelationParticipant =
                                      value!.relationWiParName;
                                });
                              },
                              hint: Text(selectedRelationParticipant??"Parent",
                                  style: textStyleCustomColor(
                                      12.0.scale(), Colors.black)),
                            ),
                          ),
                        ),
                        AVerticalSpace(10.0.scale()),
                      ],
                    ),

                  Text(
                    'Prefer Contact Method?',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      kColorLoginBtn,
                    ),
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
                      child: DropdownButton<ContactMethod>(
                        isExpanded: true,
                        items: parArrayContactMethod
                            .map<DropdownMenuItem<ContactMethod>>(
                                (ContactMethod item) {
                              return DropdownMenuItem<ContactMethod>(
                                value: item,
                                child: Text(item.contactMethodName),
                              );
                            }).toList(),
                        onChanged: (ContactMethod? value) {
                          setState(() {
                            selectedContactMethod = value!.contactMethodName;
                          });
                        },
                        hint: Text(selectedContactMethod??"Select",
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.black)),
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Participant Identify as',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      kColorLoginBtn,
                    ),
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
                      child: DropdownButton<PaIdentifyAs>(
                        isExpanded: true,
                        items: parArrayIdentifyAs
                            .map<DropdownMenuItem<PaIdentifyAs>>(
                                (PaIdentifyAs item) {
                              return DropdownMenuItem<PaIdentifyAs>(
                                value: item,
                                child: Text(item.paIdentifyAsName),
                              );
                            }).toList(),
                        onChanged: (PaIdentifyAs? value) {
                          setState(() {
                            selectedParticipantIdentify =
                                value!.paIdentifyAsName;
                          });
                        },
                        hint: Text(selectedParticipantIdentify??"Select",
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.black)),
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'What language is spoken at home?',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      kColorLoginBtn,
                    ),
                  ),
                  customTextField(
                      textController: _textFiledUserLanguage,
                      hint: 'Enter Language',
                      focus: languageNode),

                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Is an interpreter required?',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      kColorLoginBtn,
                    ),
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
                      child: DropdownButton(
                        isExpanded: true,
                        items: enterpreterRequired.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: textStyleCustomColor(
                                12.0.scale(),
                                kColorLoginBtn,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedInterpreted = newValue!;
                          });
                        },
                        hint: Text(selectedInterpreted??"Select",
                            style: textStyleCustomColor(
                                12.0.scale(), Colors.black)),
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'NDIS Number (If Applicable)',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      kColorLoginBtn,
                    ),
                  ),
                  customTextField(
                    textController: _textFiledUserNDISNumber,
                    focus: ndisNode,
                    hint: 'Enter NDIS Number',
                    keyboardType: TextInputType.number,
                  ),
                  AVerticalSpace(10.0.scale()),


                  ARoundedButton(
                    btnBgColor: kColorThemePurpleColor,
                    btnTextColor: Colors.white,
                    btnOnPressed: () {
                      print("selectedParticipateAgeRange====$selectedInterpreted ${selectedInterpreted.runtimeType}");
                        if ((selectedServices.toLowerCase() == "Someone I care for".toLowerCase() || selectedServices.toLowerCase() == "My Client".toLowerCase()) &&
                            (_textFiledParticipantFirstName.text == '' || _textFiledParticipantLastName.text == '')){
                      showSnackBar("Please enter participant first & last name", Colors.black, context);
                      }else if (selectedParticipateAgeRange == null || selectedParticipateAgeRange == '') {
                        showSnackBar("Please select participant age range", Colors.black, context);
                      }else if (selectedNDISPlanManaged == null || selectedNDISPlanManaged == '') {
                        showSnackBar("Please select NDIS plan managed", Colors.black, context);
                      }else if (selectLocation == null || selectLocation == '') {
                        showSnackBar("Please select your service location", Colors.black, context);
                      }else if (selectedServices.toLowerCase() == "Someone I care for".toLowerCase()  &&
                         ( selectedRelationParticipant == null || selectedRelationParticipant == '')){
                          showSnackBar("Please select relationship with participant", Colors.black, context);
                        }
                        else if (selectedContactMethod == null || selectedContactMethod == '') {
                        showSnackBar("Please select contact method", Colors.black, context);
                      }else if (selectedParticipantIdentify == null || selectedParticipantIdentify == '') {
                        showSnackBar("Please select participant indentity", Colors.black, context);
                      }else if (_textFiledUserLanguage.text == '') {
                        showSnackBar("Please enter your preferred language", Colors.black, context);
                      }else if (selectedInterpreted == null || selectedInterpreted == '') {
                        showSnackBar("Please select interpreter requirement", Colors.black, context);
                      }
                      else{
                        showHideProgress(true);
                        BlocProvider.of<HomeBloc>(context)
                            .add(HomeEventSubmitBtnClick(
                            first_name: userProfData.firstName??'',
                            last_name: userProfData.lastName??'',
                            password: userProfData.password??'',
                            emailId: userProfData.emailId??'',
                            mobile_number: userProfData.mobileNumber??'',
                            user_type: userProfData.userType??'',
                            service_location: selectLocation??'',
                            age_range: selectedParticipateAgeRange??'',
                            wnServices: selectedServices,
                            language_spoken: _textFiledUserLanguage.text,
                            parti_first_name: _textFiledParticipantFirstName.text,
                            parti_last_name: _textFiledParticipantLastName.text,
                            interpreter_requi: selectedInterpreted??'',
                            relation_w_parti: selectedRelationParticipant??'',
                            ndisp_managed: selectedNDISPlanManaged??'',
                            ndisNumber: _textFiledUserNDISNumber.text,
                            part_identify_as: selectedParticipantIdentify??'',
                            parti_contact_method: selectedContactMethod??'',
                            serviceLatitude: sharedPrefs.userLatitude,
                            serviceLongitude: sharedPrefs.userLongitude
                        ));
                      }
                    },
                    btnText: 'Submit',
                    btnHeight: 50.0.scale(),
                    btnFontSize: 12.0.scale(),
                    btnFontWeight: FontWeight.bold,
                    btnElevation: 0,
                    btnBorderSideColor: Colors.transparent,
                  ),
                  AVerticalSpace(20.0.scale()),

                  ARoundedButton(
                    btnBgColor: kColorThemePurpleColor,
                    btnTextColor: Colors.white,
                    btnOnPressed: () {
                      showHideProgress(true);
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventSubmitBtnClick(
                          first_name: userProfData.firstName??'',
                          last_name: userProfData.lastName??'',
                          password: userProfData.password??'',
                          emailId: userProfData.emailId??'',
                          mobile_number: userProfData.mobileNumber??'',
                          user_type: userProfData.userType??'',
                          service_location: selectLocation??'',
                          age_range: selectedParticipateAgeRange??'',
                          wnServices: selectedServices,
                          language_spoken: _textFiledUserLanguage.text,
                          parti_first_name: _textFiledParticipantFirstName.text,
                          parti_last_name: _textFiledParticipantLastName.text,
                          interpreter_requi: selectedInterpreted??'',
                          relation_w_parti: selectedRelationParticipant??'',
                          ndisp_managed: selectedNDISPlanManaged??'',
                          ndisNumber: _textFiledUserNDISNumber.text,
                          part_identify_as: selectedParticipantIdentify??'',
                          parti_contact_method: selectedContactMethod??'',
                          serviceLongitude: "",
                          serviceLatitude: ""
                      ));
                    },
                    btnText: 'Skip! Submit later',
                    btnHeight: 50.0.scale(),
                    btnFontSize: 12.0.scale(),
                    btnFontWeight: FontWeight.bold,
                    btnElevation: 0,
                    btnBorderSideColor: Colors.transparent,
                  ),
                  AVerticalSpace(20.0.scale()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField({
    required TextEditingController textController,
    String? hint,
    required FocusNode focus,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool? isRead,
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
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint ?? '',
            hintStyle: textStyleCustomColor(14.0.scale(), Colors.grey),
          ),
        ),
      ),
    );
  }

}
