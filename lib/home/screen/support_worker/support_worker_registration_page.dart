import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:time_machine/time_machine.dart';

import '../../../Helpers/services/services.dart';
import '../../../Helpers/theme/theme.dart';
import '../../../components/components.dart';
import '../../home.dart';
import '../../model/participant/language_model.dart';

class SupportWorkerPage extends StatefulWidget {
  @override
  State<SupportWorkerPage> createState() => _SupportWorkerPageState();
}
class _SupportWorkerPageState extends State<SupportWorkerPage> {
  List<String> supportOfferedArray = [];
  List<String> qualiIdArray = [];
  List<String> certifiArray = [];
  List<String> skillList = [];
  String _strType = "Select";
  String _strPetFriendly = "Select";
  String _strAboutUs = "Select";
  String _strTravel = "Select";
  late TextEditingController _textFiledAddress;
  late TextEditingController _textFiledCity;
  late TextEditingController _textFiledCountry;
  late TextEditingController _textFiledState;
  late TextEditingController _textFiledPostCode;
  late TextEditingController _textFiledFirstName;
  late TextEditingController _textFiledLastName;
  late TextEditingController _textFiledAboutMe;
  late TextEditingController _textFiledEmail;
  late TextEditingController _textFiledUserLat;
  late TextEditingController _textFiledUserLong;
  late TextEditingController _textFiledQualification;
  late TextEditingController _textFiledOtherCertificate;
  late TextEditingController _textFiledSkills;
  late TextEditingController _textFiledABNnumber;
  late TextEditingController _textFiledMobileNumber;
  late List<Languages> languageArrayData;
  String _strABNType = "Yes";
  GetSupportWorkerRegistrationModel? supportWorkerInfoData;

  final FocusNode _focusNodeAddress = FocusNode();
  final FocusNode _focusNodecity = FocusNode();
  final FocusNode _focusNodeState = FocusNode();
  final FocusNode _focusNodeCountry = FocusNode();
  final FocusNode _focusNodePostCode = FocusNode();
  final FocusNode _focusNodeABNNumber = FocusNode();
  final FocusNode _focusNodeQualification = FocusNode();
  final FocusNode _focusNodeOtherCertificate = FocusNode();
  final FocusNode _focusNodeOtherSkill = FocusNode();
  final FocusNode _focusNodeFirst = FocusNode();
  final FocusNode _focusNodeLast = FocusNode();
  final FocusNode _focusNodeAboutMe = FocusNode();
  final FocusNode _focusLatitude = FocusNode();
  final FocusNode _focusLongitude = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodeLocation = FocusNode();
  final FocusNode _focusMobileNumber = FocusNode();
  bool isfirstNameSelect = true;
  bool isLastNameSelect = true;
  bool isAboutme = false;
  bool isBirthDateSelect = true;
  bool isMobileSelect = true;
  bool isLatitudeSelect = true;
  bool isLongitudeSelect = true;
  bool isAgeSelect = false;
  bool isEmailSelect = true;
  bool isLocationSelect = false;
  bool isGenderSelect = true;
  bool isAddressSelect = true;
  bool isCitySelect = true;
  bool isStateSelect = true;
  bool isCountrySelect = true;
  bool isPostCodeSelect = true;
  bool isAbnNumberSelect = false;
  bool isQualificationSelect = false;
  bool isCertificateSelect = false;
  bool isSkillsSelect = false;
  bool isSupportPreference = false;
  String supportPreferenceData = "Select";
  String selectedUserType = "";
  String selectGender = "Male";
  String selectedLang = "Select";

  final List<Type> abnType = <Type>[
    Type(1, "Yes"),
    Type(2, "No"),
  ];
  bool selectAbnNumber = false;

  List<PetFriendly> arraypetFriendly = [];
  List<SupportOfferLocal> arraySuppOffered = [];
  List<QualificationLocal> arrayQualifications = [];
  List<QualificationLocal> arraySkills = [];
  List<QualificationLocal> arrayCertificates = [];
  List<SuppWorkerType> arraySupportWorkerType = [];
  List<SwAboutUs> arrayAboutUs = [];
  List<SwTravelDistance> arrayTravelDistance = [];
  var genderArray = ['Male', 'Female', 'No Preference'];
  bool isMondayClosed = false;
  bool isTuesdayClosed = false;
  bool isWednesdayClosed = false;
  bool isThursdayClosed = false;
  bool isFridayClosed = false;
  bool isSaturdayClosed = false;
  bool isSundayClosed = false;
  late UserProfileData userProfData;
  List<SupportWorkLocationData> workLocationArray = [];
  List<SupportWorkerExperienceData> workExperienceArray = [];
  List<SupportAvailableTimeParam> availableTimeDataMondayArray = [];
  List<SupportAvailableTimeParam> availableTimeDataTueArray = [];
  List<SupportAvailableTimeParam> availableTimeDataWednesdayArray = [];
  List<SupportAvailableTimeParam> availableTimeDataThursdayArray = [];
  List<SupportAvailableTimeParam> availableTimeDataFridArray = [];
  List<SupportAvailableTimeParam> availableTimeDataSundayArray = [];
  List<SupportAvailableTimeParam> availableTimeDataSaturArray = [];
  List<SupportAvailableTimeParam> allAvailableTimeArray = [];
  List<SupportPreference> allSupportPreferenceArray = [];
  String workLocationdata = "";
  String strPassword = "";

  addWorkLocationData(List<SupportWorkLocationData> workLocationArray) {
    this.workLocationArray = workLocationArray;
    var workLocationmap = this.workLocationArray.map((e) {
      return {
        "location": e.location,
        "location_city": e.locationCity,
        "location_state": e.locationState,
        "location_country": e.locationCountry,
        "location_zip_code": e.locationZipCode,
        "location_latitude": e.locationLatitude,
        "location_longitude": e.locationLongitude
      };
    }).toList(); //convert to map
    workLocationdata = json.encode(workLocationmap);
    print(workLocationdata);
  }

  String workExperienceData = "";

  addSupportWorkerExperience(List<SupportWorkerExperienceData> workExperArray) {
    this.workExperienceArray = workExperArray;
    var workExperience = this.workExperienceArray.map((e) {
      return {
        "position": e.position,
        "company_name": e.companyName,
        "work_from": e.workFrom,
        "work_to": e.workTo,
        "exp_year_month": e.expYearMonth,
      };
    }).toList(); //convert to map
    workExperienceData = json.encode(workExperience);
    print(workExperienceData);
  }

  @override
  void initState() {
    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeSupportRegisterPageState) {
      selectedUserType = homeState.userType ?? "";
      supportWorkerInfoData = homeState.supportWorkerInfoData;

      addSupportOffered(homeState.supportWorkerInfoData?.getSupportWorkerData?.supportOffer ?? []);
      addQualificationData(homeState.supportWorkerInfoData!.getSupportWorkerData?.qualifications ?? []);
      arraypetFriendly =
          homeState.supportWorkerInfoData!.getSupportWorkerData?.petFriendly ??
              [];
      arraySupportWorkerType = homeState
              .supportWorkerInfoData!.getSupportWorkerData?.suppWorkerType ??
          [];

      arrayAboutUs =
          homeState.supportWorkerInfoData!.getSupportWorkerData?.swAboutUs ??
              [];
      arrayTravelDistance = homeState
              .supportWorkerInfoData!.getSupportWorkerData?.swTravelDistance ??
          [];
      languageArrayData = homeState.languageArrayData!;

      userProfData = homeState.userProfData ?? UserProfileData();
      strPassword = userProfData.password!;
      allSupportPreferenceArray = homeState
              .supportWorkerInfoData!.getSupportWorkerData?.supportPreference ??
          [];

    }
    _textFiledAboutMe = TextEditingController();
    _textFiledUserLat = TextEditingController();
    _textFiledUserLong = TextEditingController();
    _textFiledAddress = TextEditingController();
    _textFiledABNnumber = TextEditingController();
    _textFiledCity = TextEditingController();
    _textFiledCountry = TextEditingController();
    _textFiledState = TextEditingController();
    _textFiledPostCode = TextEditingController();
    _textFiledFirstName = TextEditingController();
    _textFiledLastName = TextEditingController();
    _textFiledEmail = TextEditingController();
    _textFiledSkills = TextEditingController();
    _textFiledMobileNumber = TextEditingController();
    _textFiledQualification = TextEditingController();
    _textFiledOtherCertificate = TextEditingController();
    _textFiledAddress.text = sharedPrefs.serviceLocation;
    _textFiledCountry.text = sharedPrefs.userCountry;
    _textFiledCity.text = sharedPrefs.City;
    _textFiledPostCode.text = sharedPrefs.postCode;
    _textFiledFirstName.text = userProfData.firstName!;
    _textFiledLastName.text = userProfData.lastName!;
    _textFiledEmail.text = userProfData.emailId!;
    _textFiledMobileNumber.text = userProfData.mobileNumber!;
    _textFiledState.text = sharedPrefs.userState;
    _textFiledUserLat.text = sharedPrefs.userLatitude;
    _textFiledUserLong.text = sharedPrefs.userLongitude;
    super.initState();
  }

  addSupportOffered(List<SupportOffer> supportOffer) {
    supportOffer.forEach((element) {
      arraySuppOffered.add(new SupportOfferLocal(
          suppOfferId: element.suppOfferId,
          offerTitle: element.offerTitle,
          offerName: element.offerName,
          offerUdt: element.offerUdt,
          offerCdt: element.offerCdt,
          IsSelected: false));
    });
  }

  addQualificationData(List<Qualifications> qualifications) {
    if (qualifications.length > 0) {
      qualifications.forEach((element) {
        if (element.type == "Skills") {
          arraySkills.add(QualificationLocal(
              qualificationsId: element.qualificationsId,
              qualificationsName: element.qualificationsName,
              status: element.status,
              createdAt: element.createdAt,
              updatedAt: element.updatedAt,
              IsSelected: false,
              type: element.type));
        } else if (element.type == "Certificates") {
          arrayCertificates.add(new QualificationLocal(
              qualificationsId: element.qualificationsId,
              qualificationsName: element.qualificationsName,
              status: element.status,
              createdAt: element.createdAt,
              updatedAt: element.updatedAt,
              IsSelected: false,
              type: element.type));
        } else {
          arrayQualifications.add( QualificationLocal(
              qualificationsId: element.qualificationsId,
              qualificationsName: element.qualificationsName,
              status: element.status,
              createdAt: element.createdAt,
              updatedAt: element.updatedAt,
              IsSelected: false,
              type: element.type));
        }
      });
    }
  }

  String strCertificate = "";
  bool isAvailableForWorker = false;
  String qualification = "";
  String skills = "";

  String strsupport_prefer = "";

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  functionIsTimeSlotVisible(bool monday, bool tuesday, bool wednesday,
      bool thursday, bool friday, bool saturday, bool sunday) {
    setState(() {
      isMondayClosed = monday;
      isTuesdayClosed = tuesday;
      isWednesdayClosed = wednesday;
      isThursdayClosed = thursday;
      isFridayClosed = friday;
      isSaturdayClosed = saturday;
      isSundayClosed = sunday;

      print(isMondayClosed);
    });
  }

  timeAvailableTimeSlotDataMonday(List<AvailableTimeData> data) {
    availableTimeDataMondayArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Monday", data);
    availableTimeDataMondayArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }
  timeAvailableTimeSlotDataTuesday(List<AvailableTimeData> data) {
    availableTimeDataTueArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Tuesday", data);
    availableTimeDataTueArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }
  timeAvailableTimeSlotDataWednesday(List<AvailableTimeData> data) {
    availableTimeDataWednesdayArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Wednesday", data);
    availableTimeDataWednesdayArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }
  timeAvailableTimeSlotDataThursday(List<AvailableTimeData> data) {
    availableTimeDataThursdayArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Thursday", data);
    availableTimeDataThursdayArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }
  timeAvailableTimeSlotDataFriday(List<AvailableTimeData> data) {
    availableTimeDataFridArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Friday", data);
    availableTimeDataFridArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }
  timeAvailableTimeSlotDataSaturday(List<AvailableTimeData> data) {
    availableTimeDataSaturArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Saturday", data);
    availableTimeDataSaturArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }
  timeAvailableTimeSlotDataSunday(List<AvailableTimeData> data) {
    availableTimeDataSundayArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Sunday", data);
    availableTimeDataSundayArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }

  Map<String, dynamic>? requestParams;
  dataSend() {
    allAvailableTimeArray.clear();
    if (availableTimeDataMondayArray.length > 0) {
      allAvailableTimeArray.addAll(availableTimeDataMondayArray);
    }
    if (availableTimeDataTueArray.length > 0) {
      allAvailableTimeArray.addAll(availableTimeDataTueArray);
    }
    if (availableTimeDataWednesdayArray.length > 0) {
      allAvailableTimeArray.addAll(availableTimeDataWednesdayArray);
    }
    if (availableTimeDataThursdayArray.length > 0) {
      allAvailableTimeArray.addAll(availableTimeDataThursdayArray);
    }
    if (availableTimeDataFridArray.length > 0) {
      allAvailableTimeArray.addAll(availableTimeDataFridArray);
    }
    if (availableTimeDataSaturArray.length > 0) {
      allAvailableTimeArray.addAll(availableTimeDataSaturArray);
    }
    if (availableTimeDataSundayArray.length > 0) {
      allAvailableTimeArray.addAll(availableTimeDataSundayArray);
    }
    String jsonUserAvailable = jsonEncode(allAvailableTimeArray);
    print(" jsonUserAvailablea............${workLocationdata.runtimeType} ");

    requestParams = {
      "profile_image": base64ProImage.toString(),
      "first_name": _textFiledFirstName.text,
      "last_name": _textFiledLastName.text,
      "email_id": _textFiledEmail.text,
      "mobile_number": _textFiledMobileNumber.text,
      "password": strPassword,
      "user_type": "Support Worker",
      "user_address": _textFiledAddress.text,
      "user_city": _textFiledCity.text,
      "user_country": _textFiledCountry.text,
      "user_zip_code": _textFiledPostCode.text,
      "region": userProfData.regionId,
      "type_of_support_work": suppWorkerId,
      "ABN_number": _strABNType,
      "how_did_you_hear_about_us": hearAboutUsId,
      "birth_year": selectedDate,
      "age": calculatedAge,
      "happy_to_travel": happyTotravelId,
      "language": strLanguageId,
      "about_me": _textFiledAboutMe.text,
      "pet_friendly": petFriendlyId,
      "gender": selectGender,
      "support_prefer": suppPreferenceId,
      "work_avail": isAvailableForWorker == true ? "Yes" : "No",
      "availability_time": jsonDecode(jsonUserAvailable),
      "location": workLocationdata != '' ? jsonDecode(workLocationdata):'',
      "position": workExperienceData != '' ? jsonDecode(workExperienceData) : '',
      "showering": supportOfferedArray,
      "qualifications": {'ids': qualiIdArray,'other_qualifications': _textFiledQualification.text},
      "certificates": {'ids': certifiArray,'other_certificates': _textFiledOtherCertificate.text},
      "skills": {'ids': skillList,'other_skills': _textFiledSkills.text},
    };
    log("data sending............${requestParams}");
    showHideProgress(true);
    BlocProvider.of<HomeBloc>(context).add(
        HomeEventSupportWorkerToPricingPlanPage(languageArrayData, userProfData,
            selectedUserType, supportWorkerInfoData, requestParams));
  }

  bool checkoutdate = false;
  DateTime? _selected;
  String calculatedAge = "0 Year 0 month";
  String selectedDate = "MM-YYYY";
  String strPathProfile = "";
  File? _userImage;
  String? base64ProImage = "";
  var bytes;

  Future<void> _onPressed({
    required BuildContext context,
  }) async {
    final selected = await showMonthYearPicker(
        context: context,
        firstDate: DateTime(1801),
        initialDate: DateTime(2023),
        lastDate: DateTime(2023),
        locale: Locale('en', 'US'));

    if (selected != null) {
      setState(() {
        _selected = selected;
        print(DateFormat().add_yM().format(_selected!));
        selectedDate = DateFormat().add_yM().format(_selected!);
        List<String> dateArray = selectedDate.split('/');
        dateArray[0];
        dateArray[1];
        LocalDate a = LocalDate.dateTime(
            DateTime(int.parse(dateArray[1]), int.parse(dateArray[0])));
        LocalDate b = LocalDate.today();
        Period diff = b.periodSince(a);
        calculatedAge = '${diff.years} year ${diff.months} month';
        isAgeSelect = true;
      });
    }
  }


  void _showPicker(
    context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Stack(
            children: [
              SafeArea(
                child: Container(
                  child: Wrap(
                    children: [
                      ListTile(
                          leading: new Icon(Icons.photo_library),
                          title: new Text('Photo Library'),
                          onTap: () {
                            _imgFromGallery();
                            Navigator.of(context).pop();
                          }),
                      ListTile(
                        leading: new Icon(Icons.photo_camera),
                        title: new Text('Camera'),
                        onTap: () {
                          _imgFromCamera();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
  _imgFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _userImage = File(pickedFile.path);

        final bytes = File(pickedFile.path).readAsBytesSync();
        // base64ProImage = "data:image/png;base64," + base64Encode(bytes);
        base64ProImage =  base64Encode(bytes);
        print(base64ProImage.toString());
        strPathProfile = pickedFile.path;
        print(pickedFile.path);
      });
    }
  }
  _imgFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      _userImage = File(pickedFile!.path);
      final bytes = File(pickedFile.path).readAsBytesSync();
      // base64ProImage = "data:image/jpeg;base64," + base64Encode(bytes);
      base64ProImage =  base64Encode(bytes);

      strPathProfile = pickedFile.path;
    });
  }

  String suppWorkerId = "";
  String suppPreferenceId = "";
  String abnNumberValue = "";
  String hearAboutUsId = "";
  String happyTotravelId = "";
  String petFriendlyId = "";
  String strGender = "";
  String strLanguageId = "";

  supportWorkerTypeId(String Id) {
    setState(() {
      suppWorkerId = Id;
    });
  }

  getAbnNumber(String abnNumber) {
    abnNumberValue = abnNumber;
  }

  getHowDidYouHearAboutUs(String hearabout) {
    hearAboutUsId = hearabout;
  }

  gethappytravel(String happyTotravel) {
    happyTotravelId = happyTotravel;
  }

  getPetFriendly(String petFriendly) {
    petFriendlyId = petFriendly;
  }

  getGender(String strGender1) {
    strGender = strGender1;
  }

  getLanguage(String strLanguage) {
    strLanguageId = strLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {

          if (state is HomeSupportCongratulationPageState) {
            Navigator.of(context).pop();
          }
          if (state is HomePricingPlanState) {
            showHideProgress(false);
            Navigator.of(context).pushNamed(HomeNavigator.pricingPlanPage);
          }
          if (state is HomeerrorloadingState) {
            showHideProgress(false);
            showSnackBar(state.message, Colors.red, context);
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AVerticalSpace(20.0.scale()),

                  if (_userImage == null)
                    Center(
                      child: CircleAvatar(
                        radius: 55.0.scale(),
                        backgroundColor: kColorAppBgColor,
                        child: sharedPrefs.getUserProfileImage != ""
                            ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kColorThemePurpleColor, width: 2),
                            borderRadius: BorderRadius.circular(100.0.scale())
                          ),
                              child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                              imageUrl: sharedPrefs.getUserProfileImage,
                              width: 100.0.scale(),
                              fit: BoxFit.cover,
                          ),
                        ),
                            )
                            : Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kColorThemePurpleColor, width: 2),
                              borderRadius: BorderRadius.circular(100.0.scale())
                          ),
                              child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                              "${imgPathGeneral}ic_profile_icon.png",
                              color: kColorThemePurpleColor.withOpacity(0.5),
                              fit: BoxFit.fill,
                              width: 100.0.scale(),
                              height: 100.0.scale(),
                          ),
                        ),
                            ),
                      ),
                    )
                  else
                    Center(
                      child: CircleAvatar(
                        radius: 55.0.scale(),
                        backgroundColor: kColorAppBgColor,
                        child:  Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kColorThemePurpleColor, width: 2),
                              borderRadius: BorderRadius.circular(100.0.scale())
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              height: 100.0,
                              width: 100.0,
                              fit: BoxFit.cover,
                              image: FileImage(_userImage!),
                            ),
                          ),
                        ),
                      ),
                    ),

                  Center(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Image.asset(
                        "${imgPathGeneral}ic_gallery_icon.png",
                        color: kColorThemePurpleColor,
                        width: 25.0.scale(),
                        height: 25.0.scale(),
                      ),
                    ),
                  ),

                  AVerticalSpace(20.0.scale()),


                  Text(
                    'First Name',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledFirstName, focus: _focusNodeFirst),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Last Name',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledLastName, focus: _focusNodeLast),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Email Id',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledEmail, focus: _focusNodeEmail, keyboardType: TextInputType.emailAddress),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Mobile Number',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledMobileNumber, focus: _focusMobileNumber,
                      keyboardType: TextInputType.phone),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Gender',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
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
                        value: selectGender,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: genderArray.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectGender = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Language',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
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
                      child: DropdownButton<Languages>(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: languageArrayData.map<DropdownMenuItem<Languages>>((Languages items) {
                          return DropdownMenuItem<Languages>(
                            value: items,
                            child: Text(
                              items.languageName,
                              style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                            ),
                          );
                        }).toList(),
                        onChanged: (Languages? newValue) {
                          setState(() {
                            selectedLang = newValue!.languageName;
                            strLanguageId = newValue!.id;
                            print("selectedLanguage_is_____${selectedLang} and_id_is_____${newValue!.id}");
                          });
                        },
                        hint: Text(selectedLang,
                            style: textStyleCustomColor(
                                14.0.scale(), Colors.black)),
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Birth Month &Year',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _onPressed(context: context);
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
                      child: Text(
                        selectedDate,
                        style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                      ).align(Alignment.centerLeft),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Age',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _onPressed(context: context);
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
                      child: Text(
                        calculatedAge,
                        style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                      ).align(Alignment.centerLeft),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Address',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledAddress, focus: _focusNodeAddress),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'City',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledCity, focus: _focusNodecity),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'State',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledState, focus: _focusNodeState),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Country',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledCountry, focus: _focusNodeCountry),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'PostCode',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledPostCode, focus: _focusNodePostCode),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Latitude',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledUserLat, focus: _focusLatitude),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Longitude',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledUserLong, focus: _focusLongitude),
                  AVerticalSpace(10.0.scale()),

                  workLocationContainer(context, addWorkLocationData),


                  Text(
                    "Personal Details",
                    style: textStyleBoldCustomColor(14.0.scale(), Colors.black),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    "Happy to travel",
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
                      child: DropdownButton<SwTravelDistance>(
                        isExpanded: true,
                        items: arrayTravelDistance
                            .map<DropdownMenuItem<SwTravelDistance>>(
                                (SwTravelDistance item) {
                              return DropdownMenuItem<SwTravelDistance>(
                                value: item,
                                child: Text(item.swTravelDistance,
                                  style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                                ),
                              );
                            }).toList(),
                        onChanged: (SwTravelDistance? value) {
                          setState(() {
                            _strTravel = value!.swTravelDistance;
                            gethappytravel(value.swTravelDistanceId);
                          });
                        },
                        hint: Text(_strTravel,
                            style: textStyleCustomColor(14.0.scale(), Colors.black))
                     ,
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Pet Friendly',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
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
                      child: DropdownButton<PetFriendly>(
                        isExpanded: true,
                        items: arraypetFriendly
                            .map<DropdownMenuItem<PetFriendly>>((PetFriendly item) {
                          return DropdownMenuItem<PetFriendly>(
                            value: item,
                            child: Text(
                              item.petFriName,
                              style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                            ).leftPadding(8.0.scale()),
                          );
                        }).toList(),
                        onChanged: (PetFriendly? value) {
                          setState(() {
                            _strPetFriendly = value!.petFriName;
                            getPetFriendly(value.petFriId);
                          });
                        },
                        hint: Text(_strPetFriendly,
                            style: textStyleCustomColor(14.0.scale(), Colors.black))

                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'ABN Number',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
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
                      child: DropdownButton<Type>(
                        isExpanded: true,
                        items: abnType.map<DropdownMenuItem<Type>>((Type item) {
                          return DropdownMenuItem<Type>(
                            value: item,
                            child: Text(item.strType, style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),),
                          );
                        }).toList(),
                        onChanged: (Type? value) {
                          setState(() {
                            _strABNType = value!.strType;
                            getAbnNumber(_strABNType);
                          });
                        },
                        hint: Text(_strABNType,
                            style: textStyleCustomColor(
                                14.0.scale(), Colors.black))
                      ),
                    )
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Types of Support Work',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
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
                      child: DropdownButton<SuppWorkerType>(
                        isExpanded: true,
                        items: arraySupportWorkerType
                            .map<DropdownMenuItem<SuppWorkerType>>((SuppWorkerType item) {
                          return DropdownMenuItem<SuppWorkerType>(
                            value: item,
                            child: Text(
                              item.typeName,
                              style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                            ),
                          );
                        }).toList(),
                        onChanged: (SuppWorkerType? value) {
                          setState(() {
                            supportWorkerTypeId(value!.suppWorkerTypeId);
                            _strType = value.typeName;
                          });
                        },
                        hint: Text(_strType,
                            style: textStyleCustomColor(14.0.scale(), Colors.black)),
                      )
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'How did you hear about us?',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
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
                        child: DropdownButton<SwAboutUs>(
                          isExpanded: true,
                          items: arrayAboutUs
                              .map<DropdownMenuItem<SwAboutUs>>((SwAboutUs item) {
                            return DropdownMenuItem<SwAboutUs>(
                              value: item,
                              child: Text(item.swAboutUsName, style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),),
                            );
                          }).toList(),
                          onChanged: (SwAboutUs? value) {
                            setState(() {
                              _strAboutUs = value!.swAboutUsName;
                              getHowDidYouHearAboutUs(value.swAboutUsId);
                            });
                          },
                          hint: Text(_strAboutUs,
                              style: textStyleCustomColor(14.0.scale(), Colors.black))
                        ),
                      )),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'Support Preference',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
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
                      child: DropdownButton<SupportPreference>(
                        isExpanded: true,
                        items: allSupportPreferenceArray
                            .map<DropdownMenuItem<SupportPreference>>(
                                (SupportPreference item) {
                              return DropdownMenuItem<SupportPreference>(
                                value: item,
                                child: Text(item.supportPreferName, style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),),
                              );
                            }).toList(),
                        onChanged: (SupportPreference? value) {
                          setState(() {
                            supportPreferenceData = value!.supportPreferName;
                            suppPreferenceId = value.suppPreId;
                          });
                        },
                        hint: Text(supportPreferenceData,
                            style: textStyleCustomColor(
                                14.0.scale(), Colors.black))
                      ),
                    ),
                  ),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    'About Us',
                    style: textStyleBoldCustomColor(
                      12.0.scale(),
                      Colors.black,
                    ),
                  ),
                  customTextField(textController: _textFiledAboutMe, focus: _focusNodeAboutMe,  hint: 'Enter About You'),
                  AVerticalSpace(10.0.scale()),

                  Text(
                    "Availability Time Details",
                    style: textStyleBoldCustomColor(14.0.scale(), Colors.black),
                  ),
                  AVerticalSpace(10.0.scale()),

                  if (isMondayClosed == false)
                    InkWell(
                     highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          if (isMondayClosed) {
                            isMondayClosed = false;
                          } else {
                            isMondayClosed = true;
                          }
                        });
                      },
                      child:  Row(
                        children: [
                          Icon(isMondayClosed == true ?   Icons.check_box :Icons.check_box_outline_blank,
                              color: isMondayClosed == true ? Colors.green: Colors.grey) ,

                          AHorizontalSpace(15.0.scale()),
                          Text(
                            "Monday",
                            style: textStyleCustomColor(
                                13.0.scale(), Colors.black),
                          ),
                        ],
                      ),
                    ),
                  if (isMondayClosed == true)
                    mondayContainerAvailability(
                        functionIsTimeSlotVisible,
                        timeAvailableTimeSlotDataMonday,
                        isMondayClosed,
                        isTuesdayClosed,
                        isWednesdayClosed,
                        isThursdayClosed,
                        isFridayClosed,
                        isSaturdayClosed,
                        isSundayClosed),
                  AVerticalSpace(10.0.scale()),

                  if (isTuesdayClosed == false)
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          if (isTuesdayClosed) {
                            isTuesdayClosed = false;
                          } else {
                            isTuesdayClosed = true;
                          }
                        });
                      },
                      child:  Row(
                        children: [
                          Icon(isTuesdayClosed == true ?   Icons.check_box :Icons.check_box_outline_blank,
                              color: isTuesdayClosed == true ? Colors.green: Colors.grey) ,

                          AHorizontalSpace(15.0.scale()),
                          Text(
                            "Tuesday",
                            style: textStyleCustomColor(
                                13.0.scale(), Colors.black),
                          ),
                        ],
                      ),
                    ),
                  if (isTuesdayClosed == true)
                    tuesdayContainerAvailability(
                        functionIsTimeSlotVisible,
                        timeAvailableTimeSlotDataTuesday,
                        isMondayClosed,
                        isTuesdayClosed,
                        isWednesdayClosed,
                        isThursdayClosed,
                        isFridayClosed,
                        isSaturdayClosed,
                        isSundayClosed),
                  AVerticalSpace(10.0.scale()),

                  if (isWednesdayClosed == false)
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          if (isWednesdayClosed) {
                            isWednesdayClosed = false;
                          } else {
                            isWednesdayClosed = true;
                          }
                        });
                      },
                      child:  Row(
                        children: [
                          Icon(isWednesdayClosed == true ?   Icons.check_box :Icons.check_box_outline_blank,
                              color: isWednesdayClosed == true ? Colors.green: Colors.grey) ,

                          AHorizontalSpace(15.0.scale()),
                          Text(
                            "Wednesday",
                            style: textStyleCustomColor(
                                13.0.scale(), Colors.black),
                          ),
                        ],
                      ),
                    ),
                  if (isWednesdayClosed == true)
                    wednesdayContainerAvailability(
                        functionIsTimeSlotVisible,
                        timeAvailableTimeSlotDataWednesday,
                        isMondayClosed,
                        isTuesdayClosed,
                        isWednesdayClosed,
                        isThursdayClosed,
                        isFridayClosed,
                        isSaturdayClosed,
                        isSundayClosed),
                  AVerticalSpace(10.0.scale()),

                  if (isThursdayClosed == false)
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          if (isThursdayClosed) {
                            isThursdayClosed = false;
                          } else {
                            isThursdayClosed = true;
                          }
                        });
                      },
                      child:  Row(
                        children: [
                          Icon(isThursdayClosed == true ?   Icons.check_box :Icons.check_box_outline_blank,
                              color: isThursdayClosed == true ? Colors.green: Colors.grey) ,

                          AHorizontalSpace(15.0.scale()),
                          Text(
                            "Thursday",
                            style: textStyleCustomColor(
                                13.0.scale(), Colors.black),
                          ),
                        ],
                      ),
                    ),
                  if (isThursdayClosed == true)
                    thursdayContainerAvailability(
                        functionIsTimeSlotVisible,
                        timeAvailableTimeSlotDataThursday,
                        isMondayClosed,
                        isTuesdayClosed,
                        isWednesdayClosed,
                        isThursdayClosed,
                        isFridayClosed,
                        isSaturdayClosed,
                        isSundayClosed),
                  AVerticalSpace(10.0.scale()),

                  if (isFridayClosed == false)
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          if (isFridayClosed) {
                            isFridayClosed = false;
                          } else {
                            isFridayClosed = true;
                          }
                        });
                      },
                      child:  Row(
                        children: [
                          Icon(isFridayClosed == true ?   Icons.check_box :Icons.check_box_outline_blank,
                              color: isFridayClosed == true ? Colors.green: Colors.grey) ,

                          AHorizontalSpace(15.0.scale()),
                          Text(
                            "Friday",
                            style: textStyleCustomColor(
                                13.0.scale(), Colors.black),
                          ),
                        ],
                      ),
                    ),
                  if (isFridayClosed == true)
                    fridayContainerAvailability(
                        functionIsTimeSlotVisible,
                        timeAvailableTimeSlotDataFriday,
                        isMondayClosed,
                        isTuesdayClosed,
                        isWednesdayClosed,
                        isThursdayClosed,
                        isFridayClosed,
                        isSaturdayClosed,
                        isSundayClosed),
                  AVerticalSpace(10.0.scale()),

                  if (isSaturdayClosed == false)
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          if (isSaturdayClosed) {
                            isSaturdayClosed = false;
                          } else {
                            isSaturdayClosed = true;
                          }
                        });
                      },
                      child:  Row(
                        children: [
                          Icon(isSaturdayClosed == true ?   Icons.check_box :Icons.check_box_outline_blank,
                              color: isSaturdayClosed == true ? Colors.green: Colors.grey) ,

                          AHorizontalSpace(15.0.scale()),
                          Text(
                            "Saturday",
                            style: textStyleCustomColor(
                                13.0.scale(), Colors.black),
                          ),
                        ],
                      ),
                    ),
                  if (isSaturdayClosed == true)
                    saturdayContainerAvailability(
                        functionIsTimeSlotVisible,
                        timeAvailableTimeSlotDataSaturday,
                        isMondayClosed,
                        isTuesdayClosed,
                        isWednesdayClosed,
                        isThursdayClosed,
                        isFridayClosed,
                        isSaturdayClosed,
                        isSundayClosed),
                  AVerticalSpace(10.0.scale()),

                  if (isSundayClosed == false)
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          if (isSundayClosed) {
                            isSundayClosed = false;
                          } else {
                            isSundayClosed = true;
                          }
                        });
                      },
                      child:  Row(
                        children: [
                          Icon(isSundayClosed == true ?   Icons.check_box :Icons.check_box_outline_blank,
                              color: isSundayClosed == true ? Colors.green: Colors.grey) ,

                          AHorizontalSpace(15.0.scale()),
                          Text(
                            "Sunday",
                            style: textStyleCustomColor(
                                13.0.scale(), Colors.black),
                          ),
                        ],
                      ),
                    ),
                  if (isSundayClosed == true)
                    sundayContainerAvailability(
                        functionIsTimeSlotVisible,
                        timeAvailableTimeSlotDataSunday,
                        isMondayClosed,
                        isTuesdayClosed,
                        isWednesdayClosed,
                        isThursdayClosed,
                        isFridayClosed,
                        isSaturdayClosed,
                        isSundayClosed),
                  AVerticalSpace(20.0.scale()),

                  Text("Support Offered ", style: textStyleBoldCustomColor(14.0.scale(), Colors.black),),
                  for (int i = 0; i < arraySuppOffered.length; i++)
                    GestureDetector(
                      onTap: () {
                        supportOfferedArray = [];
                        setState(() {
                          if (arraySuppOffered[i].IsSelected == true) {
                            arraySuppOffered[i].IsSelected = false;
                          } else {
                            arraySuppOffered[i].IsSelected = true;
                          }
                          arraySuppOffered.forEach((element) {
                            if (element.IsSelected == true) {
                              supportOfferedArray.add(element.suppOfferId);
                            }
                          });
                          print("supportOfferedArray_checking-------$supportOfferedArray");
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(arraySuppOffered[i].offerName, style: textStyleCustomColor(13, Colors.black),),

                          Icon(arraySuppOffered[i].IsSelected == true ? Icons.check_box : Icons.check_box_outline_blank,
                            color: arraySuppOffered[i].IsSelected == true ? Colors.green : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  AVerticalSpace(20.0.scale()),

                  Text("Qualifications", style: textStyleBoldCustomColor(14.0.scale(), Colors.black),),
                  for (int i = 0; i < arrayQualifications.length; i++)
                    GestureDetector(
                      onTap: () {
                        qualiIdArray = [];
                        setState(() {
                          if (arrayQualifications[i].IsSelected == true) {
                            arrayQualifications[i].IsSelected = false;
                          } else {
                            arrayQualifications[i].IsSelected = true;
                          }
                          arrayQualifications.forEach((element) {
                            if (element.IsSelected == true) {
                              qualiIdArray.add(element.qualificationsId);
                            }
                          });
                          print("qualiIdArraychecking-------$qualiIdArray");
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(arrayQualifications[i].qualificationsName,
                            style: textStyleCustomColor(13, Colors.black),).expand(),

                          Icon(arrayQualifications[i].IsSelected == true ? Icons.check_box : Icons.check_box_outline_blank,
                            color: arrayQualifications[i].IsSelected == true ? Colors.green : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  AVerticalSpace(10.0.scale()),
                  customTextField(textController: _textFiledQualification, focus: _focusNodeQualification, hint: "Other Qualification"),
                  AVerticalSpace(20.0.scale()),

                  Text("Certificate", style: textStyleBoldCustomColor(14.0.scale(), Colors.black),),
                  for (int i = 0; i < arrayCertificates.length; i++)
                    GestureDetector(
                      onTap: () {
                        certifiArray = [];
                        setState(() {
                          if (arrayCertificates[i].IsSelected == true) {
                            arrayCertificates[i].IsSelected = false;
                          } else {
                            arrayCertificates[i].IsSelected = true;
                          }
                          arrayCertificates.forEach((element) {
                            if (element.IsSelected == true) {
                              certifiArray.add(element.qualificationsId);
                            }
                          });
                          print("qcertifiArraychecking-------$certifiArray");
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(arrayCertificates[i].qualificationsName,
                            style: textStyleCustomColor(13, Colors.black),).expand(),

                          Icon(arrayCertificates[i].IsSelected == true ? Icons.check_box : Icons.check_box_outline_blank,
                            color: arrayCertificates[i].IsSelected == true ? Colors.green : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  AVerticalSpace(10.0.scale()),
                  customTextField(textController: _textFiledOtherCertificate, focus: _focusNodeOtherCertificate,
                      hint: "Other Certificates"),
                  AVerticalSpace(20.0.scale()),

                  Text("Skills", style: textStyleBoldCustomColor(14.0.scale(), Colors.black),),
                  for (int i = 0; i < arraySkills.length; i++)
                    GestureDetector(
                      onTap: () {
                        skillList = [];
                        setState(() {
                          if (arraySkills[i].IsSelected == true) {
                            arraySkills[i].IsSelected = false;
                          } else {
                            arraySkills[i].IsSelected = true;
                          }
                          arraySkills.forEach((element) {
                            if (element.IsSelected == true) {
                              skillList.add(element.qualificationsId);
                            }
                          });
                          print("skillListychecking-------$skillList");
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(arraySkills[i].qualificationsName,
                            style: textStyleCustomColor(13, Colors.black),).expand(),

                          Icon(arraySkills[i].IsSelected == true ? Icons.check_box : Icons.check_box_outline_blank,
                            color: arraySkills[i].IsSelected == true ? Colors.green : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  AVerticalSpace(10.0.scale()),
                  customTextField(textController: _textFiledSkills, focus: _focusNodeOtherSkill,
                      hint: "Other Skills"),
                  AVerticalSpace(20.0.scale()),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Available for work ",
                        style: textStyleBoldCustomColor(
                          14.0.scale(),
                          Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (isAvailableForWorker == true) {
                            setState(() {
                              isAvailableForWorker = !isAvailableForWorker;
                            });
                          } else {
                            setState(() {
                              isAvailableForWorker = !isAvailableForWorker;
                            });
                          }
                        },
                        child:Image.asset( isAvailableForWorker ? "${imgPathGeneral}ic_on_image.png":"${imgPathGeneral}ic_off_image.png",
                          height: 40.0.scale(),
                          width: 60.0.scale(),
                          color:isAvailableForWorker ? Colors.green : Colors.grey,
                        )

                      ),
                    ],
                  ),
                  AVerticalSpace(20.0.scale()),

                  Text(
                    "Work History",
                    style: textStyleBoldCustomColor(
                      14.0.scale(),
                      Colors.black,
                    ),
                  ),
                  workHistoryContainer(addSupportWorkerExperience),
                  AVerticalSpace(10.0.scale()),

                  ARoundedButton(
                    btnBgColor: kColorThemePurpleColor,
                    btnTextColor: Colors.white,
                    btnOnPressed: () {
                      if (selectedDate == "MM-YYYY") {
                        showSnackBar("Please select your birth year", Colors.black, context);
                      } else {
                        dataSend();
                      }
                    },
                    btnText: 'Submit',
                    btnHeight: 50.0.scale(),
                    btnFontSize: 12.0.scale(),
                    btnFontWeight: FontWeight.bold,
                    btnElevation: 0,
                    btnBorderSideColor: Colors.transparent,
                  ),
                  AVerticalSpace(10.0.scale())
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

class Type {
  final int id;
  final String strType;

  Type(this.id, this.strType);
}

class SupportOfferLocal {
  late final String suppOfferId;
  late final String offerTitle;
  late final String offerName;
  late final String offerUdt;
  late final String offerCdt;
  late bool IsSelected;

  SupportOfferLocal({
    required this.suppOfferId,
    required this.offerTitle,
    required this.offerName,
    required this.offerUdt,
    required this.offerCdt,
    required this.IsSelected,
  });
}

class QualificationLocal {
  late bool IsSelected;
  late final String qualificationsId;
  late final String type;
  late final String qualificationsName;
  late final String status;
  late final String createdAt;
  late final String updatedAt;

  QualificationLocal({
    required this.qualificationsId,
    required this.qualificationsName,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.IsSelected,
  });
}

class workHistoryContainer extends StatefulWidget {
  Function addSupportWorkerExperience;

  workHistoryContainer(this.addSupportWorkerExperience);

  @override
  State<workHistoryContainer> createState() => workHistoryContainerState();
}
class workHistoryContainerState extends State<workHistoryContainer> {
  List<SupportWorkerExperienceData> workExperArray = [];
  List<TextEditingController> _controllerPosition = [];
  List<TextEditingController> _controllerCompanyName = [];
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextEditingController> _controllerTotalExperience = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<TextField> _arrayTextfieldPosition = [];
  List<TextField> _arrayTextfieldCompany = [];
  List<TextField> _arrayTextfieldTotalExperience = [];


  @override
  void initState() {
    addTime(1);
    super.initState();
  }

  _addTile() {
    final controllerFrom = TextEditingController();
    final fieldFrom = TextField(
      enabled: false,
      controller: controllerFrom,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerFrom.length + 1}",
      ),
    );

    final controllerFieldTo = TextEditingController();
    final fieldTo = TextField(
      controller: controllerFieldTo,
      enabled: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerTo.length + 1}",
      ),
    );
    final controllerPosition = TextEditingController();
    final fieldPosition = TextField(
      controller: controllerPosition,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerPosition.length + 1}",
      ),
    );
    final controllerCompanyName = TextEditingController();
    final fieldCompanyName = TextField(
      controller: controllerCompanyName,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerCompanyName.length + 1}",
      ),
    );
    final controllertotalExperience = TextEditingController();
    final fieldTotalExperience = TextField(
      controller: controllertotalExperience,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerTotalExperience.length + 1}",
      ),
    );
    setState(() {
      _controllerFrom.add(controllerFrom);
      _controllerTo.add(controllerFieldTo);
      _controllerPosition.add(controllerPosition);
      _controllerCompanyName.add(controllerCompanyName);
      _controllerTotalExperience.add(controllertotalExperience);

      _arrayTextfieldFrom.add(fieldFrom);
      _arrayTextfieldTo.add(fieldTo);
      _arrayTextfieldPosition.add(fieldPosition);
      _arrayTextfieldCompany.add(fieldCompanyName);
      _arrayTextfieldTotalExperience.add(fieldTotalExperience);
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  remove(int unit) {
    setState(() {
      _controllerFrom.removeAt(unit);
      _controllerTo.removeAt(unit);
      _controllerPosition.removeAt(unit);
      _controllerCompanyName.removeAt(unit);
      _arrayTextfieldFrom.removeAt(unit);
      _arrayTextfieldTo.removeAt(unit);
      _arrayTextfieldPosition.removeAt(unit);
      _arrayTextfieldCompany.removeAt(unit);
    });
  }

  DateTime? _selectedDateFrom, _selectedDateTo;
  String calculatedAge = "0 Year 0 month";
  var thirtyDaysFromNow;

  Future<void> _onPressed(
      {required BuildContext context,
      required int position,
      required String type,
      required String companyName,
      required String userPosition}) async {
    var selectedfrom = null, selectedto = null;
    if (type == "from") {
      DatePicker.showDatePicker(context,
          showTitleActions: true,
          minTime: thirtyDaysFromNow,
          maxTime: DateTime(2200, 1, 1),
          onChanged: (date) {}, onConfirm: (date) {
        setState(() {
          _selectedDateFrom = date;
          selectedfrom = DateFormat('dd/MM/yyyy').format(date);
          _controllerFrom[position].text = selectedfrom;
          if (_selectedDateTo != null) {
            LocalDate a = LocalDate.dateTime(_selectedDateFrom!);
            LocalDate b = LocalDate.dateTime(_selectedDateTo!);
            Period diff = b.periodSince(a);
            if (diff.years > -1) {
              calculatedAge = "${diff.years} year ${diff.months} month";
              print(calculatedAge+"jeeeeeeeee");
              _controllerTotalExperience[position].text = calculatedAge;
              _controllerCompanyName[position].text = companyName;
              _controllerPosition[position].text = userPosition;
              addData();
            }
          }
        });
      }, currentTime: DateTime.now(), locale: LocaleType.en);
    } else {
      DatePicker.showDatePicker(context,
          showTitleActions: true,
          minTime: thirtyDaysFromNow,
          maxTime: DateTime(2200, 1, 1),
          onChanged: (date) {}, onConfirm: (date) {
        setState(() {
          _selectedDateTo = date;
          selectedto = DateFormat('dd/MM/yyyy').format(date);
          _controllerTo[position].text = selectedto;
          LocalDate a = LocalDate.dateTime(_selectedDateFrom!);
          LocalDate b = LocalDate.dateTime(_selectedDateTo!);

          Period diff = b.periodSince(a);
          if (diff.years > -1) {
            calculatedAge = "${diff.years} year ${diff.months} month";
            _controllerTotalExperience[position].text = calculatedAge;
            _controllerCompanyName[position].text = companyName;
            _controllerPosition[position].text = userPosition;
            print(companyName);
            addData();
          }
        });
      }, currentTime: DateTime.now(), locale: LocaleType.en);
    }
  }

  addData() {
    workExperArray.clear();
    for (int i = 0; i < _controllerPosition.length; i++) {
      SupportWorkerExperienceData workLocationData =
          SupportWorkerExperienceData(
              companyName: _controllerCompanyName[i].text,
              position: _controllerPosition[i].text,
              expYearMonth: _controllerTotalExperience[i].text,
              workFrom: _controllerFrom[i].text,
              workTo: _controllerTo[i].text);
      workExperArray.add(workLocationData);
    }

    setState(() {
      widget.addSupportWorkerExperience(workExperArray);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AVerticalSpace(10.0.scale()),
        Row(
          children: [
            Text(
              "My Experience",
              style: textStyleBoldBlack(12.0.scale(), Colors.black),
            ),
            AHorizontalSpace(5.0.scale()),
            InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
                color: kColorThemePurpleColor,
              ),
            ),
          ],
        ),
        AVerticalSpace(10.0.scale()),
        for (int i = 0; i < _controllerFrom.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Company Name",
                    style: textStyleBoldCustomColor(
                        12.0.scale(), Colors.black),
                  ).bottomPadding(5.0.scale()),
                  AHorizontalSpace(5.0.scale()),
                  InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (i > 0) remove(i);
                    },
                    child: Image.asset(
                      "assets/images/ic_delete_icon.png",
                      height: 20.0.scale(),
                      color: kColorThemePurpleColor,
                    ),
                  ),
                ],
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
                child: TextField(
                  textAlign: TextAlign.start,
                  controller: _controllerCompanyName[i],
                  autofocus: false,
                  cursorColor: KColorTextFieldCommonHint,
                  style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          bottom: 5.0.scale(),
                         ),
                      border: InputBorder.none,
                    hintText: 'Enter Company Name'
                  ),
                ),
              ),
              AVerticalSpace(5.0.scale()),

              Text(
                "Position",
                style: textStyleBoldCustomColor(
                    12.0.scale(), Colors.black),
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
                child: TextField(
                  textAlign: TextAlign.start,
                  style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                  controller:  _controllerPosition[i],
                  autofocus: false,
                  cursorColor: KColorTextFieldCommonHint,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          bottom: 5.0.scale(),
                         ),
                      hintText: 'Enter Position',
                      border: InputBorder.none
                  ),
                ),
              ),
              AVerticalSpace(5.0.scale()),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Joining Date",
                        style: textStyleBoldCustomColor(
                            12.0.scale(), Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          _onPressed(
                              context: context,
                              position: i,
                              type: "from",
                              companyName:
                              _controllerCompanyName[i].text,
                              userPosition:
                              _controllerPosition[i].text);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                          height: 50.0.scale(),
                          width: MediaQuery.of(context).size.width/2.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextField(
                            textAlign: TextAlign.start,
                            controller:  _controllerFrom[i],
                            autofocus: false,
                            enabled: false,
                            cursorColor: KColorTextFieldCommonHint,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    bottom: 5.0.scale(),
                                    left: 5.0.scale()),
                                border: InputBorder.none,
                              hintText: "dd/mm/yyyy",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Leaving date",
                        style: textStyleBoldCustomColor(
                            12.0.scale(), Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          _onPressed(
                              context: context,
                              position: i,
                              type: "To",
                              companyName: _controllerCompanyName[i].text,
                              userPosition: _controllerPosition[i].text);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                          height: 50.0.scale(),
                          width: MediaQuery.of(context).size.width/2.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextField(
                            textAlign: TextAlign.start,
                            controller:  _controllerTo[i],
                            autofocus: false,
                            enabled: false,
                            cursorColor: KColorTextFieldCommonHint,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    bottom: 5.0.scale(),
                                    left: 5.0.scale()),
                                border: InputBorder.none,
                              hintText: "dd/mm/yyyy",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AVerticalSpace(5.0.scale()),

              Text(
                "Total Experience",
                style: textStyleBoldCustomColor(
                    12.0.scale(), Colors.black),
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
                child: TextField(
                  textAlign: TextAlign.start,
                  controller:  _controllerTotalExperience[i],
                  autofocus: false,
                  cursorColor: KColorTextFieldCommonHint,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          bottom: 5.0.scale(),
                          left: 5.0.scale()),
                      hintText: "Total Experience",
                      border: InputBorder.none
                  ),
                ),
              ),

            ],
          ).bottomPadding(10.0.scale()),
      ],
    );
  }
}

class workLocationContainer extends StatefulWidget {
  BuildContext context1;
  Function addWorkLocationData;

  workLocationContainer(this.context1, this.addWorkLocationData);

  @override
  State<workLocationContainer> createState() => workLocationContainerState();
}
class workLocationContainerState extends State<workLocationContainer> {
  List<TextEditingController> _controllerServiceLocation = [];
  List<TextEditingController> _controllerCity = [];
  List<TextEditingController> _controllerState = [];
  List<TextEditingController> _controllerCountry = [];
  List<TextEditingController> _controllerPostcode = [];
  List<TextEditingController> _controllerLatitude = [];
  List<TextEditingController> _controllerLongitude = [];
  List<TextField> _arrayTextfieldServiceLocation = [];
  List<TextField> _arrayTextfieldCity = [];
  List<TextField> _arrayTextfieldState = [];
  List<TextField> _arrayTextfieldCountry = [];
  List<TextField> _arrayTextfieldPostcode = [];
  List<TextField> _arrayTextfieldLatitude = [];
  List<TextField> _arrayTextfieldLongitude = [];
  List<String> arrayServiceLocation = [];
  List<String> arrayCity = [];
  List<String> arrayState = [];
  List<String> arrayCountry = [];
  List<String> arrayPostcode = [];
  List<String> arrayLatitude = [];
  List<String> arrayLongitude = [];
  List<SupportWorkLocationData> workarraylocation = [];

  @override
  void initState() {
    addTime(1);
    super.initState();
  }

  _addTile() {
    final _controllerServiceLocat = TextEditingController();
    final fieldServiceLocation = TextField(
      controller: _controllerServiceLocat,
      enabled: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerServiceLocation.length + 1}",
      ),
    );

    final _controllerServiceCity = TextEditingController();
    final fieldCity = TextField(
      controller: _controllerServiceCity,
      enabled: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerCity.length + 1}",
      ),
    );
    final _controllerServiceState = TextEditingController();
    final fieldState = TextField(
      controller: _controllerServiceState,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerState.length + 1}",
      ),
    );
    final _controllerServiceCountry = TextEditingController();
    final fieldCountry = TextField(
      controller: _controllerServiceCountry,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerCountry.length + 1}",
      ),
    );
    final controllerServicePostcode = TextEditingController();
    final fieldPostCode = TextField(
      controller: controllerServicePostcode,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerPostcode.length + 1}",
      ),
    );
    final controllerLatitude = TextEditingController();
    final fieldLatitude = TextField(
      controller: controllerLatitude,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerLatitude.length + 1}",
      ),
    );
    final controllerLongitude = TextEditingController();
    final fieldLongitude = TextField(
      controller: controllerLongitude,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerLongitude.length + 1}",
      ),
    );

    setState(() {
      _controllerServiceLocation.add(_controllerServiceLocat);
      _controllerCity.add(_controllerServiceCity);
      _controllerState.add(_controllerServiceState);
      _controllerCountry.add(_controllerServiceCountry);
      _controllerPostcode.add(controllerServicePostcode);
      _controllerLatitude.add(controllerLatitude);
      _controllerLongitude.add(controllerLongitude);

      _arrayTextfieldServiceLocation.add(fieldServiceLocation);
      _arrayTextfieldCity.add(fieldCity);
      _arrayTextfieldState.add(fieldState);
      _arrayTextfieldCountry.add(fieldCountry);
      _arrayTextfieldPostcode.add(fieldPostCode);
      _arrayTextfieldLatitude.add(fieldLatitude);
      _arrayTextfieldLongitude.add(fieldLongitude);
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  removedata(int unit) {
    setState(() {
      _controllerServiceLocation.removeAt(unit);
      _controllerCity.removeAt(unit);
      _controllerState.removeAt(unit);
      _controllerCountry.removeAt(unit);
      _controllerPostcode.removeAt(unit);
      _controllerLatitude.removeAt(unit);
      _controllerLongitude.removeAt(unit);
      _arrayTextfieldServiceLocation.removeAt(unit);
      _arrayTextfieldCity.removeAt(unit);
      _arrayTextfieldState.removeAt(unit);
      _arrayTextfieldCountry.removeAt(unit);
      _arrayTextfieldPostcode.removeAt(unit);
      _arrayTextfieldLatitude.removeAt(unit);
      _arrayTextfieldLongitude.removeAt(unit);
    });
  }

  _onPressed(int position, String location, String city, String state,
      String country, String postcode, String lat, String lng) {
    print("======" + location + " " + city + "" + state + "" + country);
    setState(() {
      _controllerServiceLocation[position].text = location;
      _controllerCity[position].text = city;
      _controllerState[position].text = state;
      _controllerCountry[position].text = country;
      _controllerPostcode[position].text = postcode;
      _controllerLatitude[position].text = lat;
      _controllerLongitude[position].text = lng;
    });
    addData();
  }

  addData() {
    workarraylocation.clear();
    for (int i = 0; i < _controllerServiceLocation.length; i++) {
      SupportWorkLocationData workLocationData = SupportWorkLocationData(
          location: _controllerServiceLocation[i].text,
          locationCity: _controllerCity[i].text,
          locationState: _controllerState[i].text,
          locationCountry: _controllerCountry[i].text,
          locationZipCode: _controllerPostcode[i].text,
          locationLatitude: _controllerLatitude[i].text,
          locationLongitude: _controllerLongitude[i].text);
      workarraylocation.add(workLocationData);
    }
    setState(() {
      widget.addWorkLocationData(workarraylocation);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AVerticalSpace(10.0.scale()),
        Row(
          children: [
            Text(
              "Service Location",
              style: textStyleBoldCustomColor(15.0.scale(), Colors.black),
            ),
            AHorizontalSpace(5.0.scale()),
            InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
                  color: kColorThemePurpleColor,
              ),
            ),
          ],
        ),
        AVerticalSpace(15.0.scale()),

        for (int i = 0; i < _controllerServiceLocation.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Location ${i + 1}",
                    style: textStyleBoldCustomColor(
                        12.0.scale(), Colors.black),
                  ),

                  AHorizontalSpace(5.0.scale()),

                  InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (i > 0) removedata(i);
                    },
                    child: Image.asset(
                      "assets/images/ic_delete_icon.png",
                      height: 20.0.scale(),
                      color: kColorThemePurpleColor,
                    ),
                  ),
                ],
              ).bottomPadding(5.0.scale()),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: widget.context1,
                      barrierColor: Colors.black26,
                      barrierDismissible: true,
                      builder: (context) {
                        return _getTwoButtonDialog(
                            context: widget.context1,
                            titleText: "",
                            descText: "",
                            position: i,
                            onPressed: _onPressed);
                      });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale(),vertical: 5.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    enabled: false,
                    controller: _controllerServiceLocation[i],
                    autofocus: false,
                    cursorColor: KColorTextFieldCommonHint,
                    style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                    decoration: InputDecoration(
                        hintText: "Enter Location ${i+1}",
                        contentPadding: EdgeInsets.only(
                            bottom: 10.0.scale(),),

                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AVerticalSpace(10.0.scale()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "City",
                        style: textStyleBoldCustomColor(
                            12.0.scale(), Colors.black),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0.scale(),vertical: 5.0.scale()),
                        height: 50.0.scale(),
                        width: MediaQuery.of(context).size.width/2.3,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          enabled: false,
                          controller: _controllerCity[i],
                          autofocus: false,
                          cursorColor: KColorTextFieldCommonHint,
                          style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                          decoration: InputDecoration(
                              hintText: "Enter City",
                              contentPadding: EdgeInsets.only(
                                  bottom: 10.0.scale(),
                                  left: 5.0.scale()),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "State",
                        style: textStyleBoldCustomColor(
                            12.0.scale(), Colors.black),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0.scale(),vertical: 5.0.scale()),
                        height: 50.0.scale(),
                        width: MediaQuery.of(context).size.width/2.3,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          enabled: false,
                          controller: _controllerState[i],
                          autofocus: false,
                          style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                          cursorColor: KColorTextFieldCommonHint,
                          decoration: InputDecoration(
                              hintText: "Enter State",
                              contentPadding: EdgeInsets.only(
                                  bottom: 10.0.scale(),
                                  left: 5.0.scale()),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AVerticalSpace(10.0.scale()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Country",
                        style: textStyleBoldCustomColor(
                            12.0.scale(), Colors.black),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0.scale(),vertical: 5.0.scale()),
                        height: 50.0.scale(),
                        width: MediaQuery.of(context).size.width/2.3,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          enabled: false,
                          controller: _controllerCountry[i],
                          autofocus: false,
                          style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                          cursorColor: KColorTextFieldCommonHint,
                          decoration: InputDecoration(
                              hintText: "Enter Country",
                              contentPadding: EdgeInsets.only(
                                  bottom: 10.0.scale(),
                                  left: 5.0.scale()),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PostCode",
                        style: textStyleBoldCustomColor(
                            12.0.scale(), Colors.black),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0.scale(),vertical: 5.0.scale()),
                        height: 50.0.scale(),
                        width: MediaQuery.of(context).size.width/2.3,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          enabled: false,
                          controller: _controllerPostcode[i],
                          autofocus: false,
                          style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                          cursorColor: KColorTextFieldCommonHint,
                          decoration: InputDecoration(
                              hintText: "Enter Post Code",
                              contentPadding: EdgeInsets.only(
                                  bottom: 10.0.scale(),
                                  left: 5.0.scale()),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AVerticalSpace(10.0.scale()),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Latitude",
                        style: textStyleBoldCustomColor(
                            12.0.scale(), Colors.black),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0.scale(),vertical: 5.0.scale()),
                        height: 50.0.scale(),
                        width: MediaQuery.of(context).size.width/2.3,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          enabled: false,
                          controller: _controllerLatitude[i],
                          autofocus: false,
                          style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                          cursorColor: KColorTextFieldCommonHint,
                          decoration: InputDecoration(
                              hintText: "Enter Latitude",
                              contentPadding: EdgeInsets.only(
                                  bottom: 10.0.scale(),
                                  left: 5.0.scale()),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Longitude",
                        style: textStyleBoldCustomColor(
                            12.0.scale(), Colors.black),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0.scale(),vertical: 5.0.scale()),
                        height: 50.0.scale(),
                        width: MediaQuery.of(context).size.width/2.3,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          enabled: false,
                          controller: _controllerLongitude[i],
                          autofocus: false,
                          style: textStyleCustomColor(14.0.scale(), kColorDialogNameTitle),
                          cursorColor: KColorTextFieldCommonHint,
                          decoration: InputDecoration(
                              hintText: "Enter Longitude",
                              contentPadding: EdgeInsets.only(
                                  bottom: 10.0.scale(),
                                  left: 5.0.scale()),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ).bottomPadding(10.0.scale()),
      ],
    );
  }
}

class mondayContainerAvailability extends StatefulWidget {
  Function functionIsTimeSlotVisible;
  Function timeAvailableTimeSlotDataMonday;
  bool mon, tu, wed, thu, fri, sat, sun;

  mondayContainerAvailability(
      this.functionIsTimeSlotVisible,
      this.timeAvailableTimeSlotDataMonday,
      this.mon,
      this.tu,
      this.wed,
      this.thu,
      this.fri,
      this.sat,
      this.sun);

  @override
  State<mondayContainerAvailability> createState() =>
      mondayContainerAvailabilityState();
}
class mondayContainerAvailabilityState extends State<mondayContainerAvailability> {
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<AvailableTimeData> availableTimeDataArray = [];

  @override
  void initState() {
    addTime(1);
    super.initState();
  }

  _addTile() {
    final controllername = TextEditingController();
    final fieldFirst = TextField(
      controller: controllername,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerFrom.length + 1}",
      ),
    );
    final controllerLastname = TextEditingController();
    final fieldLastName = TextField(
      controller: controllerLastname,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerTo.length + 1}",
      ),
    );
    setState(() {
      _controllerFrom.add(controllername);
      _controllerTo.add(controllerLastname);

      _arrayTextfieldFrom.add(fieldFirst);
      _arrayTextfieldTo.add(fieldLastName);
    });
  }

  _removeTile(int i) {
    setState(() {
      _controllerFrom.removeAt(i);
      _controllerTo.removeAt(i);

      _arrayTextfieldFrom.removeAt(i);
      _arrayTextfieldTo.removeAt(i);
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  Future<void> onPressed(String from, String to, String type, int position) async {

    TimeOfDay? pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Cancel",
        confirmText: "Save",
        helpText: "Select time",
        builder: (context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedTime != null) {
      String formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          addData();
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          addData();
        });
      }
    }
  }

  addData() {
    availableTimeDataArray.clear();
    for (int i = 0; i < _controllerFrom.length; i++) {
      AvailableTimeData datatime =
          AvailableTimeData(_controllerFrom[i].text, _controllerTo[i].text);
      availableTimeDataArray.add(datatime);
    }
    setState(() {
      widget.timeAvailableTimeSlotDataMonday(availableTimeDataArray);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.functionIsTimeSlotVisible(
                      false,
                      widget.tu,
                      widget.wed,
                      widget.thu,
                      widget.fri,
                      widget.sat,
                      widget.sun);
                });
              },
              child: Row(
                children: [
                  Icon(
                      color: Colors.green,
                      Icons.check_box
                  ),
                ],
              ),
            ),
            AHorizontalSpace(10.0.scale()),
            Text(
              "Monday",
              style: textStyleCustomColor(13.0.scale(), Colors.black),
            ),
            AHorizontalSpace(10.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
                color: kColorThemePurpleColor,
              ),
            ),
          ],
        ),
        AVerticalSpace(10.0.scale()),

        for (int i = 0; i < _controllerFrom.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "from", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerFrom[i],
                    autofocus: false,
                    enabled: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              Text(
                "To ",
                style: textStyleBoldCustomColor(
                    14.0.scale(), Colors.black),
              ),
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "To", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerTo[i],
                    enabled: false,
                    autofocus: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              if (i != 0)
                GestureDetector(
                  onTap: () {
                    if (i != 0) {
                      _removeTile(i);
                    }
                  },
                  child: Image(
                      color: kColorThemePurpleColor,
                      width: 23.0.scale(),
                      height: 23.0.scale(),
                      image: AssetImage(
                          '${imgPathGeneral}ic_delete_icon.png')),
                ),
            ],
          ).bottomPadding(5.0.scale()),
      ],
    );
  }
}

class tuesdayContainerAvailability extends StatefulWidget {
  Function functionIsTimeSlotVisible;
  Function timeAvailableTimeSlotDataTuesday;
  bool mon, tu, wed, thu, fri, sat, sun;
  tuesdayContainerAvailability(
      this.functionIsTimeSlotVisible,
      this.timeAvailableTimeSlotDataTuesday,
      this.mon,
      this.tu,
      this.wed,
      this.thu,
      this.fri,
      this.sat,
      this.sun);

  @override
  State<tuesdayContainerAvailability> createState() =>
      tuesdayContainerAvailabilityState();
}
class tuesdayContainerAvailabilityState extends State<tuesdayContainerAvailability> {
  List<AvailableTimeData> availableTimeDataArray = [];
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];

  @override
  void initState() {
    addTime(1);
    super.initState();
  }

  _addTile() {
    final controllername = TextEditingController();
    final fieldFirst = TextField(
      controller: controllername,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerFrom.length + 1}",
      ),
    );
    final controllerLastname = TextEditingController();
    final fieldLastName = TextField(
      controller: controllerLastname,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerTo.length + 1}",
      ),
    );
    setState(() {
      _controllerFrom.add(controllername);
      _controllerTo.add(controllerLastname);
      _arrayTextfieldFrom.add(fieldFirst);
      _arrayTextfieldTo.add(fieldLastName);
    });
  }

  _removeTile(int i) {
    setState(() {
      _controllerFrom.removeAt(i);
      _controllerTo.removeAt(i);
      _arrayTextfieldFrom.removeAt(i);
      _arrayTextfieldTo.removeAt(i);
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  Future<void> onPressed(String from, String to, String type, int position) async {

    TimeOfDay? pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Cancel",
        confirmText: "Save",
        helpText: "Select time",
        builder: (context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedTime != null) {
      String formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          addData();
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          addData();
        });
      }
    }
  }


  addData() {
    availableTimeDataArray.clear();
    for (int i = 0; i < _controllerFrom.length; i++) {
      AvailableTimeData datatime =
          AvailableTimeData(_controllerFrom[i].text, _controllerTo[i].text);
      availableTimeDataArray.add(datatime);
    }
    setState(() {
      widget.timeAvailableTimeSlotDataTuesday(availableTimeDataArray);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.functionIsTimeSlotVisible(
                      widget.mon,
                      false,
                      widget.wed,
                      widget.thu,
                      widget.fri,
                      widget.sat,
                      widget.sun);
                });
              },
              child: Row(
                children: [
                  Icon(
                      color: Colors.green,
                      Icons.check_box
                  ),
                ],
              ),
            ),
            AHorizontalSpace(10.0.scale()),
            Text(
              "Tuesday",
              style: textStyleCustomColor(13.0.scale(), Colors.black),
            ),
            AHorizontalSpace(10.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
                color: kColorThemePurpleColor,
              ),
            ),
          ],
        ),
        AVerticalSpace(10.0.scale()),

        for (int i = 0; i < _controllerFrom.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "from", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerFrom[i],
                    autofocus: false,
                    enabled: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              Text(
                "To ",
                style: textStyleBoldCustomColor(
                    14.0.scale(), Colors.black),
              ),
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "To", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerTo[i],
                    enabled: false,
                    autofocus: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              if (i != 0)
                GestureDetector(
                  onTap: () {
                    if (i != 0) {
                      _removeTile(i);
                    }
                  },
                  child: Image(
                      color: kColorThemePurpleColor,
                      width: 23.0.scale(),
                      height: 23.0.scale(),
                      image: AssetImage(
                          '${imgPathGeneral}ic_delete_icon.png')),
                ),
            ],
          ).bottomPadding(5.0.scale()),
      ],
    );
  }
}

class wednesdayContainerAvailability extends StatefulWidget {
  Function functionIsTimeSlotVisible;
  Function timeAvailableTimeSlotDataWednesday;
  bool mon, tu, wed, thu, fri, sat, sun;
  wednesdayContainerAvailability(
      this.functionIsTimeSlotVisible,
      this.timeAvailableTimeSlotDataWednesday,
      this.mon,
      this.tu,
      this.wed,
      this.thu,
      this.fri,
      this.sat,
      this.sun);

  @override
  State<wednesdayContainerAvailability> createState() =>
      wednesdayContainerAvailabilityState();
}
class wednesdayContainerAvailabilityState extends State<wednesdayContainerAvailability> {
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<AvailableTimeData> availableTimeDataArray = [];


  @override
  void initState() {
    addTime(1);
    super.initState();
  }

  _removeTile(int i) {
    setState(() {
      _controllerFrom.removeAt(i);
      _controllerTo.removeAt(i);
      _arrayTextfieldFrom.removeAt(i);
      _arrayTextfieldTo.removeAt(i);
    });
  }

  _addTile() {
    final controllername = TextEditingController();
    final fieldFirst = TextField(
      controller: controllername,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerFrom.length + 1}",
      ),
    );
    final controllerLastname = TextEditingController();
    final fieldLastName = TextField(
      controller: controllerLastname,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerTo.length + 1}",
      ),
    );
    setState(() {
      _controllerFrom.add(controllername);
      _controllerTo.add(controllerLastname);
      _arrayTextfieldFrom.add(fieldFirst);
      _arrayTextfieldTo.add(fieldLastName);
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  Future<void> onPressed(String from, String to, String type, int position) async {

    TimeOfDay? pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Cancel",
        confirmText: "Save",
        helpText: "Select time",
        builder: (context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedTime != null) {
      String formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          addData();
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          addData();
        });
      }
    }
  }

  addData() {
    availableTimeDataArray.clear();
    for (int i = 0; i < _controllerFrom.length; i++) {
      AvailableTimeData datatime =
          AvailableTimeData(_controllerFrom[i].text, _controllerTo[i].text);
      availableTimeDataArray.add(datatime);
    }
    setState(() {
      widget.timeAvailableTimeSlotDataWednesday(availableTimeDataArray);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.functionIsTimeSlotVisible(
                      widget.mon,
                      widget.tu,
                      false,
                      widget.thu,
                      widget.fri,
                      widget.sat,
                      widget.sun);
                });
              },
              child: Row(
                children: [
                  Icon(
                      color: Colors.green,
                      Icons.check_box
                  ),
                ],
              ),
            ),
            AHorizontalSpace(10.0.scale()),
            Text(
              "Wednesday",
              style: textStyleCustomColor(13.0.scale(), Colors.black),
            ),
            AHorizontalSpace(10.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
                color: kColorThemePurpleColor,
              ),
            ),
          ],
        ),
        AVerticalSpace(10.0.scale()),

        for (int i = 0; i < _controllerFrom.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "from", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerFrom[i],
                    autofocus: false,
                    enabled: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              Text(
                "To ",
                style: textStyleBoldCustomColor(
                    14.0.scale(), Colors.black),
              ),
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "To", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerTo[i],
                    enabled: false,
                    autofocus: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              if (i != 0)
                GestureDetector(
                  onTap: () {
                    if (i != 0) {
                      _removeTile(i);
                    }
                  },
                  child: Image(
                      color: kColorThemePurpleColor,
                      width: 23.0.scale(),
                      height: 23.0.scale(),
                      image: AssetImage(
                          '${imgPathGeneral}ic_delete_icon.png')),
                ),
            ],
          ).bottomPadding(5.0.scale()),
      ],
    );
  }
}

class thursdayContainerAvailability extends StatefulWidget {
  Function functionIsTimeSlotVisible;
  Function timeAvailableTimeSlotDataThursday;
  bool mon, tu, wed, thu, fri, sat, sun;
  thursdayContainerAvailability(
      this.functionIsTimeSlotVisible,
      this.timeAvailableTimeSlotDataThursday,
      this.mon,
      this.tu,
      this.wed,
      this.thu,
      this.fri,
      this.sat,
      this.sun);

  @override
  State<thursdayContainerAvailability> createState() =>
      thursdayContainerAvailabilityState();
}
class thursdayContainerAvailabilityState extends State<thursdayContainerAvailability> {
  List<AvailableTimeData> availableTimeDataArray = [];
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];

  @override
  void initState() {
    addTime(1);
    super.initState();
  }

  _addTile() {
    final controllername = TextEditingController();
    final fieldFirst = TextField(
      controller: controllername,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerFrom.length + 1}",
      ),
    );
    final controllerLastname = TextEditingController();
    final fieldLastName = TextField(
      controller: controllerLastname,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerTo.length + 1}",
      ),
    );
    setState(() {
      _controllerFrom.add(controllername);
      _controllerTo.add(controllerLastname);
      _arrayTextfieldFrom.add(fieldFirst);
      _arrayTextfieldTo.add(fieldLastName);
    });
  }

  _removeTile(int i) {
    setState(() {
      _controllerFrom.removeAt(i);
      _controllerTo.removeAt(i);
      _arrayTextfieldFrom.removeAt(i);
      _arrayTextfieldTo.removeAt(i);
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  Future<void> onPressed(String from, String to, String type, int position) async {

    TimeOfDay? pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Cancel",
        confirmText: "Save",
        helpText: "Select time",
        builder: (context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedTime != null) {
      String formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          addData();
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          addData();
        });
      }
    }
  }

  addData() {
    availableTimeDataArray.clear();
    for (int i = 0; i < _controllerFrom.length; i++) {
      AvailableTimeData datatime =
          AvailableTimeData(_controllerFrom[i].text, _controllerTo[i].text);
      availableTimeDataArray.add(datatime);
    }
    setState(() {
      widget.timeAvailableTimeSlotDataThursday(availableTimeDataArray);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.functionIsTimeSlotVisible(
                      widget.mon,
                      widget.tu,
                      widget.wed,
                      false,
                      widget.fri,
                      widget.sat,
                      widget.sun);
                });
              },
              child: Row(
                children: [
                  Icon(
                      color: Colors.green,
                      Icons.check_box
                  ),
                ],
              ),
            ),
            AHorizontalSpace(10.0.scale()),
            Text(
              "Thursday",
              style: textStyleCustomColor(13.0.scale(), Colors.black),
            ),
            AHorizontalSpace(10.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
                color: kColorThemePurpleColor,
              ),
            ),
          ],
        ),
        AVerticalSpace(10.0.scale()),

        for (int i = 0; i < _controllerFrom.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "from", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerFrom[i],
                    autofocus: false,
                    enabled: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              Text(
                "To ",
                style: textStyleBoldCustomColor(
                    14.0.scale(), Colors.black),
              ),
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "To", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerTo[i],
                    enabled: false,
                    autofocus: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              if (i != 0)
                GestureDetector(
                  onTap: () {
                    if (i != 0) {
                      _removeTile(i);
                    }
                  },
                  child: Image(
                      color: kColorThemePurpleColor,
                      width: 23.0.scale(),
                      height: 23.0.scale(),
                      image: AssetImage(
                          '${imgPathGeneral}ic_delete_icon.png')),
                ),
            ],
          ).bottomPadding(5.0.scale()),
      ],
    );
  }
}

class fridayContainerAvailability extends StatefulWidget {
  Function functionIsTimeSlotVisible;
  Function timeAvailableTimeSlotDataFriday;
  bool mon, tu, wed, thu, fri, sat, sun;
  fridayContainerAvailability(
      this.functionIsTimeSlotVisible,
      this.timeAvailableTimeSlotDataFriday,
      this.mon,
      this.tu,
      this.wed,
      this.thu,
      this.fri,
      this.sat,
      this.sun);

  @override
  State<fridayContainerAvailability> createState() =>
      fridayContainerAvailabilityState();
}
class fridayContainerAvailabilityState extends State<fridayContainerAvailability> {
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<AvailableTimeData> availableTimeDataArray = [];


  @override
  void initState() {
    addTime(1);
    super.initState();
  }

  _addTile() {
    final controllername = TextEditingController();
    final fieldFirst = TextField(
      controller: controllername,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerFrom.length + 1}",
      ),
    );
    final controllerLastname = TextEditingController();
    final fieldLastName = TextField(
      controller: controllerLastname,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerTo.length + 1}",
      ),
    );
    setState(() {
      _controllerFrom.add(controllername);
      _controllerTo.add(controllerLastname);
      _arrayTextfieldFrom.add(fieldFirst);
      _arrayTextfieldTo.add(fieldLastName);
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  _removeTile(int i) {
    setState(() {
      _controllerFrom.removeAt(i);
      _controllerTo.removeAt(i);
      _arrayTextfieldFrom.removeAt(i);
      _arrayTextfieldTo.removeAt(i);
    });
  }

  Future<void> onPressed(String from, String to, String type, int position) async {

    TimeOfDay? pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Cancel",
        confirmText: "Save",
        helpText: "Select time",
        builder: (context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedTime != null) {
      String formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          addData();
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          addData();
        });
      }
    }
  }

  addData() {
    availableTimeDataArray.clear();
    for (int i = 0; i < _controllerFrom.length; i++) {
      AvailableTimeData datatime =
          AvailableTimeData(_controllerFrom[i].text, _controllerTo[i].text);
      availableTimeDataArray.add(datatime);
    }
    setState(() {
      widget.timeAvailableTimeSlotDataFriday(availableTimeDataArray);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.functionIsTimeSlotVisible(
                      widget.mon,
                      widget.tu,
                      widget.wed,
                      widget.thu,
                      false,
                      widget.sat,
                      widget.sun);
                });
              },
              child: Row(
                children: [
                  Icon(
                      color: Colors.green,
                      Icons.check_box
                  ),
                ],
              ),
            ),
            AHorizontalSpace(10.0.scale()),
            Text(
              "Friday",
              style: textStyleCustomColor(13.0.scale(), Colors.black),
            ),
            AHorizontalSpace(10.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
                color: kColorThemePurpleColor,
              ),
            ),
          ],
        ),
        AVerticalSpace(10.0.scale()),

        for (int i = 0; i < _controllerFrom.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "from", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerFrom[i],
                    autofocus: false,
                    enabled: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              Text(
                "To ",
                style: textStyleBoldCustomColor(
                    14.0.scale(), Colors.black),
              ),
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "To", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerTo[i],
                    enabled: false,
                    autofocus: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              if (i != 0)
                GestureDetector(
                  onTap: () {
                    if (i != 0) {
                      _removeTile(i);
                    }
                  },
                  child: Image(
                      color: kColorThemePurpleColor,
                      width: 23.0.scale(),
                      height: 23.0.scale(),
                      image: AssetImage(
                          '${imgPathGeneral}ic_delete_icon.png')),
                ),
            ],
          ).bottomPadding(5.0.scale()),
      ],
    );
  }
}

class saturdayContainerAvailability extends StatefulWidget {
  Function functionIsTimeSlotVisible;
  Function timeAvailableTimeSlotDataSaturday;
  bool mon, tu, wed, thu, fri, sat, sun;
  saturdayContainerAvailability(
      this.functionIsTimeSlotVisible,
      this.timeAvailableTimeSlotDataSaturday,
      this.mon,
      this.tu,
      this.wed,
      this.thu,
      this.fri,
      this.sat,
      this.sun);

  @override
  State<saturdayContainerAvailability> createState() =>
      saturdayContainerAvailabilityState();
}
class saturdayContainerAvailabilityState extends State<saturdayContainerAvailability> {
  List<AvailableTimeData> availableTimeDataArray = [];
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];

  @override
  void initState() {
    addTime(1);
    super.initState();
  }

  _addTile() {
    final controllername = TextEditingController();
    final fieldFirst = TextField(
      controller: controllername,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerFrom.length + 1}",
      ),
    );
    final controllerLastname = TextEditingController();
    final fieldLastName = TextField(
      controller: controllerLastname,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerTo.length + 1}",
      ),
    );
    setState(() {
      _controllerFrom.add(controllername);
      _controllerTo.add(controllerLastname);
      _arrayTextfieldFrom.add(fieldFirst);
      _arrayTextfieldTo.add(fieldLastName);
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  _removeTile(int i) {
    setState(() {
      _controllerFrom.removeAt(i);
      _controllerTo.removeAt(i);
      _arrayTextfieldFrom.removeAt(i);
      _arrayTextfieldTo.removeAt(i);
    });
  }

  Future<void> onPressed(String from, String to, String type, int position) async {

    TimeOfDay? pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Cancel",
        confirmText: "Save",
        helpText: "Select time",
        builder: (context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedTime != null) {
      String formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          addData();
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          addData();
        });
      }
    }
  }

  addData() {
    availableTimeDataArray.clear();
    for (int i = 0; i < _controllerFrom.length; i++) {
      AvailableTimeData datatime =
          AvailableTimeData(_controllerFrom[i].text, _controllerTo[i].text);
      availableTimeDataArray.add(datatime);
    }
    setState(() {
      widget.timeAvailableTimeSlotDataSaturday(availableTimeDataArray);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.functionIsTimeSlotVisible(
                      widget.mon,
                      widget.tu,
                      widget.wed,
                      widget.thu,
                      widget.fri,
                      false,
                      widget.sun);
                });
              },
              child: Row(
                children: [
                  Icon(
                      color: Colors.green,
                      Icons.check_box
                  ),
                ],
              ),
            ),
            AHorizontalSpace(10.0.scale()),
            Text(
              "Saturday",
              style: textStyleCustomColor(13.0.scale(), Colors.black),
            ),
            AHorizontalSpace(10.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
                color: kColorThemePurpleColor,
              ),
            ),
          ],
        ),
        AVerticalSpace(10.0.scale()),

        for (int i = 0; i < _controllerFrom.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "from", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerFrom[i],
                    autofocus: false,
                    enabled: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              Text(
                "To ",
                style: textStyleBoldCustomColor(
                    14.0.scale(), Colors.black),
              ),
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "To", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerTo[i],
                    enabled: false,
                    autofocus: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              if (i != 0)
                GestureDetector(
                  onTap: () {
                    if (i != 0) {
                      _removeTile(i);
                    }
                  },
                  child: Image(
                      color: kColorThemePurpleColor,
                      width: 23.0.scale(),
                      height: 23.0.scale(),
                      image: AssetImage(
                          '${imgPathGeneral}ic_delete_icon.png')),
                ),
            ],
          ).bottomPadding(5.0.scale()),
      ],
    );

  }
}

class sundayContainerAvailability extends StatefulWidget {
  Function functionIsTimeSlotVisible;
  Function timeAvailableTimeSlotDataSunday;
  bool mon, tu, wed, thu, fri, sat, sun;
  sundayContainerAvailability(
      this.functionIsTimeSlotVisible,
      this.timeAvailableTimeSlotDataSunday,
      this.mon,
      this.tu,
      this.wed,
      this.thu,
      this.fri,
      this.sat,
      this.sun);

  @override
  State<sundayContainerAvailability> createState() =>
      sundayContainerAvailabilityState();
}
class sundayContainerAvailabilityState extends State<sundayContainerAvailability> {
  List<AvailableTimeData> availableTimeDataArray = [];
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];

  @override
  void initState() {
    addTime(1);
    super.initState();
  }

  _addTile() {
    final controllername = TextEditingController();
    final fieldFirst = TextField(
      controller: controllername,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerFrom.length + 1}",
      ),
    );
    final controllerLastname = TextEditingController();
    final fieldLastName = TextField(
      controller: controllerLastname,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerTo.length + 1}",
      ),
    );
    setState(() {
      _controllerFrom.add(controllername);
      _controllerTo.add(controllerLastname);
      _arrayTextfieldFrom.add(fieldFirst);
      _arrayTextfieldTo.add(fieldLastName);
    });
  }

  _removeTile(int i) {
    setState(() {
      _controllerFrom.removeAt(i);
      _controllerTo.removeAt(i);
      _arrayTextfieldFrom.removeAt(i);
      _arrayTextfieldTo.removeAt(i);
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  Future<void> onPressed(String from, String to, String type, int position) async {

    TimeOfDay? pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Cancel",
        confirmText: "Save",
        helpText: "Select time",
        builder: (context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedTime != null) {
      String formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          addData();
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          addData();
        });
      }
    }
  }

  addData() {
    availableTimeDataArray.clear();
    for (int i = 0; i < _controllerFrom.length; i++) {
      AvailableTimeData datatime =
          AvailableTimeData(_controllerFrom[i].text, _controllerTo[i].text);
      availableTimeDataArray.add(datatime);
    }
    setState(() {
      widget.timeAvailableTimeSlotDataSunday(availableTimeDataArray);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.functionIsTimeSlotVisible(
                      widget.mon,
                      widget.tu,
                      widget.wed,
                      widget.thu,
                      widget.fri,
                      widget.sat,
                      false);
                });
              },
              child: Row(
                children: [
                  Icon(
                      color: Colors.green,
                      Icons.check_box
                  ),
                ],
              ),
            ),
            AHorizontalSpace(10.0.scale()),
            Text(
              "Sunday",
              style: textStyleCustomColor(13.0.scale(), Colors.black),
            ),
            AHorizontalSpace(10.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
                color: kColorThemePurpleColor,
              ),
            ),
          ],
        ),
        AVerticalSpace(10.0.scale()),

        for (int i = 0; i < _controllerFrom.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "from", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerFrom[i],
                    autofocus: false,
                    enabled: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              Text(
                "To ",
                style: textStyleBoldCustomColor(
                    14.0.scale(), Colors.black),
              ),
              AHorizontalSpace(5.0.scale()),
              GestureDetector(
                onTap: () {
                  onPressed(_controllerFrom[i].text,
                      _controllerTo[i].text, "To", i);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  width: MediaQuery.of(context).size.width/3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerTo[i],
                    enabled: false,
                    autofocus: false,
                    cursorColor: KColorTextFieldCommonHint,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              AHorizontalSpace(5.0.scale()),
              if (i != 0)
                GestureDetector(
                  onTap: () {
                    if (i != 0) {
                      _removeTile(i);
                    }
                  },
                  child: Image(
                      color: kColorThemePurpleColor,
                      width: 23.0.scale(),
                      height: 23.0.scale(),
                      image: AssetImage(
                          '${imgPathGeneral}ic_delete_icon.png')),
                ),
            ],
          ).bottomPadding(5.0.scale()),
      ],
    );
  }
}

Dialog _getTwoButtonDialog(
    {required BuildContext context,
    required String titleText,
    required descText,
    required int position,
    required Function onPressed}) {
  return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusDialog.scale())),
      elevation: 8,
      insetAnimationDuration: Duration(milliseconds: 30),
      insetPadding: EdgeInsets.all(kDialogInsetPadding.scale()),
      child: Container(
        child: LocationSupportworkerPage(onPressed, position),
      ));
}

class LocationSupportworkerPage extends StatefulWidget {
  Function onPressed;
  int position;

  LocationSupportworkerPage(this.onPressed, this.position);

  @override
  State<LocationSupportworkerPage> createState() =>
      _LocationSupportworkerPageState();
}
class _LocationSupportworkerPageState extends State<LocationSupportworkerPage> {
  var _controller = TextEditingController();

  late String _sessionToken;

  List<dynamic> _placeList = [];
  String typePage = "";

  late UserProfileData userProfData;
  late String selectedUserType;
  late GetParticipantRegistrationModel? participateInfoData;
  String postCode = "";
  String strCity = "";
  String strState = "";
  String lat = "";
  String Lng = "";
  String country = "";

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      _onChanged();
    });
  }

  _onChanged() {
    // if (_sessionToken == null) {
    //   setState(() {
    //     _sessionToken = Uuid.generateV4();
    //   });
    // }
    getSuggestion(_controller.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void getSuggestion(String input) async {
    // String kPLACES_API_KEY = "AIzaSyB6jpjQRZn8vu59ElER36Q2LaxptdAghaA";
    String kPLACES_API_KEY = "AIzaSyAb1vGO92hZfS0oRzq9X9VhDJzz2BcqV0w";
    String type = '(regions)';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&components=country:AU&key=$kPLACES_API_KEY';
    var response = await http.get(Uri.parse(request));
    //  print(response.body.toString());
    if (response.statusCode == 200) {
      setState(() {
        _placeList = json.decode(response.body)['predictions'];
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  Future<void> searchLatLong(String location, BuildContext ctx) async {
    try {
      List<Location> address =
          await locationFromAddress(location).then((value) async {
        var first = value.first;

        print(first.latitude);
        sharedPrefs.keyLatitude = first.latitude.toString();
        sharedPrefs.keyLongitude = first.longitude.toString();
        print(first.longitude);
        // Address address = await geoCode.reverseGeocoding(
        //     latitude: first.latitude, longitude: first.longitude);
        lat = first.latitude.toString();
        Lng = first.longitude.toString();
        getAddressFromLatLng(first.latitude, first.longitude, ctx);

        return value;
      });
    } catch (e) {
      print(e.toString());
    }
    //  print(location);
  }

  getAddressFromLatLng(double lat, double lng, BuildContext ctx) async {
    String _host = 'https://maps.google.com/maps/api/geocode/json';
    final url =
        '$_host?key=AIzaSyAb1vGO92hZfS0oRzq9X9VhDJzz2BcqV0w&language=en&latlng=$lat,$lng';
    print(url);
    if (lat != null && lng != null) {
      var response = await http.get(Uri.parse(url));
      // print(response.toString());
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String _formattedAddress = data["results"][0]["formatted_address"];
        print(_formattedAddress);
        //  if(typePage!="SignUp"){

        // }

        List<dynamic> datalist = data["results"][1]["address_components"];
        datalist.forEach((element) {
          if (kDebugMode) {
            print(element);
          }

          Map<dynamic, dynamic> jsonMap = element as Map;

          if (jsonMap["types"].toString() == "[postal_code]") {
            postCode = jsonMap["long_name"];
          }
          if (jsonMap["types"].toString() ==
              "[administrative_area_level_2, political]") {
            strCity = jsonMap["long_name"];
          }
          if (jsonMap["types"].toString() ==
              "[administrative_area_level_1, political]") {
            strState = jsonMap["long_name"];
          }
          if (jsonMap["types"].toString() == "[country, political]") {
            country = jsonMap["long_name"];
          }

        });
        getData(ctx, _formattedAddress, strCity, strState, country, postCode,
            lat.toString(), lng.toString());

        return _formattedAddress;
      } else
        return null;
    } else
      return null;
  }

  getData(BuildContext ctx, String location, String city, String state,
      String Country, String postCode, String lat, String long) {
    setState(() {
      print(city +
          " State ====" +
          state +
          "" +
          Country +
          "" +
          postCode +
          "" +
          lat.toString() +
          "" +
          long.toString());
      widget.onPressed(widget.position, location, city, state, Country,
          postCode, lat.toString(), long.toString());
      Navigator.of(ctx).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        AVerticalSpace(5.0.scale()),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Seek your location here",
            focusColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(Icons.map),
            suffixIcon: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                _controller.clear();
              },
            ),
          ),
        ),
        for (int i = 0; i < _placeList.length; i++)
          GestureDetector(
            onTap: () {
              print(" tap tap");
              searchLatLong(_placeList[i]["description"], context);
            },
            child: Column(
              children: [
                Text(
                  _placeList[i]["description"],
                  style: textStyleCustomColor(15.0.scale(), Colors.black),
                ).align(Alignment.centerLeft)
              ],
            ).topPadding(8.0.scale()).bottomPadding(8.0.scale()),
          )

        // ListView.builder(
        //   physics: NeverScrollableScrollPhysics(),
        //   shrinkWrap: false,
        //   itemCount: _placeList.length,
        //   itemBuilder: (context, index) {
        //     return ;
        //   },
        // ),
      ],
    ).pageBgColor(Colors.white);
  }
}
