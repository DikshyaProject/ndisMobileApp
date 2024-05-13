import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:ndisparticipant/bottom_navigation/bloc/bottom_navigation_event.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/home_navigator.dart';
import 'package:ndisparticipant/home/model/participant/get_participant_registration_model.dart';
import 'package:ndisparticipant/home/model/support_worker/get_support_worker_registration_model.dart';
import 'package:ndisparticipant/home/model/support_worker/support_available_data_param.dart';
import 'package:ndisparticipant/home/model/support_worker/support_work_location_data.dart';
import 'package:ndisparticipant/home/model/support_worker/support_worker_experience_data.dart';
import 'package:ndisparticipant/home/profile_model/sup_work_pro_drop_model.dart';
import 'package:ndisparticipant/home/screen/support_worker/support_worker_registration_page.dart';
import 'package:ndisparticipant/root/user_repository.dart';
import 'package:time_machine/time_machine.dart';

import '../../../../Helpers/expand_row.dart';
import '../../../../Helpers/theme/theme.dart';
import '../../../../Helpers/utils/network_image_widget.dart';
import '../../../../components/components.dart';
import '../../../model/userprofile/participant_user_profile_data.dart';
import '../../../profile_model/get_user_data_response_model.dart';

class ProfileSupportWorkerPage extends StatefulWidget {
  @override
  State<ProfileSupportWorkerPage> createState() =>
      _ProfileSupportWorkerPageState();
}

class _ProfileSupportWorkerPageState extends State<ProfileSupportWorkerPage> {
  TextEditingController _textFiledQualification = TextEditingController();
  TextEditingController _textFiledOtherCertificate = TextEditingController();
  TextEditingController _textFiledSkills = TextEditingController();
  final FocusNode _focusNodeQualification = FocusNode();
  final FocusNode _focusNodeOtherCertificate = FocusNode();
  final FocusNode _focusNodeOtherSkill = FocusNode();
  GetUserProfileData? userProfileDataModel;
  List<SupportOfferLocal> arraySuppOffered = [];
  List<QualificationLocal> arrayQualifications = [];
  List<QualificationLocal> arraySkills = [];
  List<QualificationLocal> arrayCertificates = [];
  bool isMondayClosed = false;
  bool isTuesdayClosed = false;
  bool isWednesdayClosed = false;
  bool isThursdayClosed = false;
  bool isFridayClosed = false;
  bool isSaturdayClosed = false;
  bool isSundayClosed = false;
  bool isView = false;
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
  String workLocationdata = "";
  TextEditingController passwordCont = TextEditingController();
  TextEditingController mobileCont = TextEditingController();
  TextEditingController cityCont = TextEditingController();
  TextEditingController stateCont = TextEditingController();
  TextEditingController countryCont = TextEditingController();
  TextEditingController latCont = TextEditingController();
  TextEditingController lngCont = TextEditingController();
  TextEditingController postCont = TextEditingController();
  TextEditingController fbCont = TextEditingController();
  TextEditingController twtCont = TextEditingController();
  TextEditingController youtCont = TextEditingController();
  TextEditingController webCont = TextEditingController();
  TextEditingController aboutCont = TextEditingController();
  TextEditingController dobCont = TextEditingController();
  TextEditingController companyNameCont = TextEditingController();
  TextEditingController positionCont = TextEditingController();
  TextEditingController yearMonthCont = TextEditingController();
  final FocusNode _focusNodePass = FocusNode();
  final FocusNode _focusNodeMobile = FocusNode();
  final FocusNode _focusNodeCity = FocusNode();
  final FocusNode _focusNodeState = FocusNode();
  final FocusNode _focusNodeCountry = FocusNode();
  final FocusNode _focusNodePost = FocusNode();
  final FocusNode _focusNodeLat = FocusNode();
  final FocusNode _focusNodeLong = FocusNode();
  final FocusNode _focusNodeFb = FocusNode();
  final FocusNode _focusNodeTwt = FocusNode();
  final FocusNode _focusNodeYou = FocusNode();
  final FocusNode _focusNodeWeb = FocusNode();
  final FocusNode _focusNodeAbout = FocusNode();
  bool isEdit = false;
  File? _userImage;
  String base64ProImage = "";
  File? _coverImage;
  String base64CoverImage = "";
  File? _idProofImage;
  String base64IdImage = "";
  String radius = "";
  List radius_items = [
    "0",
    "5",
    "10",
    "15",
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '100',
    '150',
    '200',
    '250',
    '8000'
  ];
  String availWork = "";
  List avail_items = [
    "Yes",
    "No",
  ];
  String abn = "";
  List abn_items = [
    "Yes",
    "No",
  ];
  String gender = "";
  List gender_items = ["Male", "Female", "No Preference"];
  String happyToTravel = "";
  String happyToTravelId = "";
  String? addressData;
  List<Regions>? regions;
  List<TraDis>? traDis;
  List<PetFri>? petFri;
  List<TypeSuppWorker>? typeSuppWorker;
  List<AboutUs>? aboutUs;
  List<SuppPre>? suppPre;
  List<Lang>? lang;
  var getLocation;
  var getWorkexp;
  var getDaySchedule;
  String selectedRegions = "";
  String selectedRegionId = "";
  String selectedLang = "";
  String selectedLangId = "";
  String selectedPet = "";
  String selectedPetId = "";
  String selectedSupType = "";
  String selectedSupTypeId = "";
  String selectedAbout = "";
  String selectedAboutId = "";
  String selectedSupPre = "";
  String selectedSupPreId = "";
  List<String?> qualiIdArray = [];
  List<String?> certifiArray = [];
  List<String?> skillList = [];
  List<String?> supportOfferedArray = [];
  DateTime? _selected;
  String calculatedAge = "0 Year 0 month";
  String selectedDate = "MM-YYYY";
  List<AvailableTimeData>? monday_data;
  List<AvailableTimeData>? tuesday_data;
  List<AvailableTimeData>? wednesday_data;
  List<AvailableTimeData>? thursday_data;
  List<AvailableTimeData>? friday_data;
  List<AvailableTimeData>? saturday_data;
  List<AvailableTimeData>? sunday_data;

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
      });
    }
  }

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

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
    print("demo---" + workExperArray.length.toString());
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

  timeAvailableTimeSlotDataMonday(List<AvailableTimeData>? data) {
    availableTimeDataMondayArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Monday", data!);
    availableTimeDataMondayArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print("monday_data_________$jsonUser");
  }

  timeAvailableTimeSlotDataTuesday(List<AvailableTimeData>? data) {
    availableTimeDataTueArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Tuesday", data!);
    availableTimeDataTueArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }

  timeAvailableTimeSlotDataWednesday(List<AvailableTimeData>? data) {
    availableTimeDataWednesdayArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Wednesday", data!);
    availableTimeDataWednesdayArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }

  timeAvailableTimeSlotDataThursday(List<AvailableTimeData>? data) {
    availableTimeDataThursdayArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Thursday", data!);
    availableTimeDataThursdayArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }

  timeAvailableTimeSlotDataFriday(List<AvailableTimeData>? data) {
    availableTimeDataFridArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Friday", data!);
    availableTimeDataFridArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }

  timeAvailableTimeSlotDataSaturday(List<AvailableTimeData>? data) {
    availableTimeDataSaturArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Saturday", data!);
    availableTimeDataSaturArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }

  timeAvailableTimeSlotDataSunday(List<AvailableTimeData>? data) {
    availableTimeDataSundayArray.clear();
    SupportAvailableTimeParam timeslot =
        SupportAvailableTimeParam("Sunday", data!);
    availableTimeDataSundayArray.add(timeslot);
    String jsonUser = jsonEncode(timeslot);
    print(jsonUser);
  }

  List<String>? day_schedule;
  Map<String, dynamic>? requestParams;
  String jsonUserAvailable = "";

  void _showPicker(
      {required BuildContext context, required String image_type}) {
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
                            _imgFromGallery(image_type);
                            Navigator.of(context).pop();
                          }),
                      ListTile(
                        leading: new Icon(Icons.photo_camera),
                        title: new Text('Camera'),
                        onTap: () {
                          _imgFromCamera(image_type);
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

  _imgFromGallery(imageType) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        if (imageType == "profile") {
          _userImage = File(pickedFile.path);
          final bytes = File(pickedFile.path).readAsBytesSync();
          base64ProImage = base64Encode(bytes);
        } else if (imageType == "cover") {
          _coverImage = File(pickedFile.path);
          final bytes = File(pickedFile.path).readAsBytesSync();
          base64CoverImage = base64Encode(bytes);
        } else if (imageType == "id") {
          _idProofImage = File(pickedFile.path);
          final bytes = File(pickedFile.path).readAsBytesSync();
          base64IdImage = base64Encode(bytes);
        }
      });
    }
  }

  _imgFromCamera(imageType) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      if (imageType == "profile") {
        _userImage = File(pickedFile!.path);
        final bytes = File(pickedFile.path).readAsBytesSync();
        base64ProImage = "${base64Encode(bytes)}";
      } else if (imageType == "cover") {
        _coverImage = File(pickedFile!.path);
        final bytes = File(pickedFile.path).readAsBytesSync();
        base64CoverImage = "${base64Encode(bytes)}";
      } else if (imageType == "id") {
        _idProofImage = File(pickedFile!.path);
        final bytes = File(pickedFile.path).readAsBytesSync();
        base64IdImage = "${base64Encode(bytes)}";
      }
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
          arrayQualifications.add(QualificationLocal(
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

  storingData() {
    qualiIdArray = [];
    for (int i = 0;
        i <
            int.parse(
                "${userProfileDataModel?.data?.userProfileDetails?.qualifications?.length}");
        i++) {
      if ("${userProfileDataModel?.data?.userProfileDetails?.qualifications?[i].status}" ==
          "1") {
        qualiIdArray.add(
            "${userProfileDataModel?.data?.userProfileDetails?.qualifications?[i].id}");
      }
    }

    certifiArray = [];
    for (int i = 0;
        i <
            int.parse(
                "${userProfileDataModel?.data?.userProfileDetails?.certificates?.length}");
        i++) {
      if ("${userProfileDataModel?.data?.userProfileDetails?.certificates?[i].status}" ==
          "1") {
        certifiArray.add(
            "${userProfileDataModel?.data?.userProfileDetails?.certificates?[i].id}");
      }
    }

    skillList = [];
    for (int i = 0;
        i <
            int.parse(
                "${userProfileDataModel?.data?.userProfileDetails?.skills?.length}");
        i++) {
      if ("${userProfileDataModel?.data?.userProfileDetails?.skills?[i].status}" ==
          "1") {
        skillList.add(
            "${userProfileDataModel?.data?.userProfileDetails?.skills?[i].id}");
      }
    }

    _textFiledQualification.text =
        '${userProfileDataModel?.data?.userProfileDetails?.otherQualifications?.first.otherQualifications}';
    _textFiledOtherCertificate.text =
        '${userProfileDataModel?.data?.userProfileDetails?.otherCertificates?.first.otherCertificates}';
    _textFiledSkills.text =
        '${userProfileDataModel?.data?.userProfileDetails?.otherSkills?.first.otherSkills}';


     var workExperienceData_init = userProfileDataModel?.data?.userProfileDetails?.workExp?.map((e) {
        return {
          "position": e.position,
          "company_name": e.companyName,
          "work_from": e.workFrom,
          "work_to": e.workTo,
          "exp_year_month": e.expYearMonth,
        };
      }).toList();
     workExperienceData = jsonEncode(workExperienceData_init);

    var workLocationmap = userProfileDataModel?.data?.userProfileDetails?.allLocation?.map((e) {
      return {
        "location": e.location,
        "location_city": e.locationCity,
        "location_state": e.locationState,
        "location_country": e.locationCountry,
        "location_zip_code": e.locationZipCode,
        "location_latitude": e.locationLatitude,
        "location_longitude": e.locationLongitude
      };
    }).toList();
    workLocationdata = jsonEncode(workLocationmap);
    workLocationArray = userProfileDataModel?.data?.userProfileDetails?.allLocation??[];


    for (int i = 0; i < int.parse('${userProfileDataModel?.data?.userProfileDetails?.schedule?.length}'); i++) {
      if ('${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].day}'
          .contains("Monday")) {
        isMondayClosed = true;
        monday_data = userProfileDataModel?.data?.userProfileDetails?.schedule?[i].data;
        availableTimeDataMondayArray.add(SupportAvailableTimeParam("Monday", monday_data ?? []));
      } else if ('${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].day}'
          .contains("Tuesday")) {
        isTuesdayClosed = true;
        tuesday_data =
            userProfileDataModel?.data?.userProfileDetails?.schedule?[i].data;
        availableTimeDataTueArray
            .add(SupportAvailableTimeParam("Tuesday", tuesday_data ?? []));
      } else if ('${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].day}'
          .contains("Wednesday")) {
        isWednesdayClosed = true;
        wednesday_data =
            userProfileDataModel?.data?.userProfileDetails?.schedule?[i].data;
        availableTimeDataWednesdayArray
            .add(SupportAvailableTimeParam("Wednesday", wednesday_data ?? []));
      } else if ('${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].day}'
          .contains("Thursday")) {
        isThursdayClosed = true;
        thursday_data =
            userProfileDataModel?.data?.userProfileDetails?.schedule?[i].data;
        availableTimeDataThursdayArray
            .add(SupportAvailableTimeParam("Thursday", thursday_data ?? []));
      } else if ('${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].day}'
          .contains("Friday")) {
        isFridayClosed = true;
        friday_data =
            userProfileDataModel?.data?.userProfileDetails?.schedule?[i].data;
        availableTimeDataFridArray
            .add(SupportAvailableTimeParam("Friday", friday_data ?? []));
      } else if ('${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].day}'
          .contains("Saturday")) {
        isSaturdayClosed = true;
        saturday_data =
            userProfileDataModel?.data?.userProfileDetails?.schedule?[i].data;
        availableTimeDataSaturArray
            .add(SupportAvailableTimeParam("Saturday", saturday_data ?? []));
        print("bhkcgkkl$saturday_data");
      } else if ('${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].day}'
          .contains("Sunday")) {
        isSundayClosed = true;
        sunday_data =
            userProfileDataModel?.data?.userProfileDetails?.schedule?[i].data;
        availableTimeDataSundayArray
            .add(SupportAvailableTimeParam("Sunday", sunday_data ?? []));
      }
    }

    print("in...init..state...........${getDaySchedule}");
  }

  daySchedule() {
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
    jsonUserAvailable = jsonEncode(allAvailableTimeArray);
  }

  dataSend() {
    daySchedule();
    requestParams = {
      "user_id": sharedPrefs.userID,
      "location": workLocationdata != '' ? jsonDecode(workLocationdata.replaceAll('\u0027', ' ')) : '',
      "workexp": workExperienceData != '' ? jsonDecode(workExperienceData) : '',
      "showering": supportOfferedArray,
      "qualifications": {
        'ids': qualiIdArray,
        'other_qualifications': _textFiledQualification.text
      },
      "certificates": {
        'ids': certifiArray,
        'other_certificates': _textFiledOtherCertificate.text
      },
      "skills": {'ids': skillList, 'other_skills': _textFiledSkills.text},
      "happy_to_travel": happyToTravelId,
      "language": selectedLangId,
      "pet_friendly": selectedPetId,
      "type_of_support_work": selectedSupTypeId,
      "how_did_you_hear_about_us": selectedAboutId,
      "support_prefer": selectedSupPreId,
      "work_avail": availWork,
      "days": jsonUserAvailable != '[]' ? jsonDecode(jsonUserAvailable) : [],
      "gender": gender,
      "ABN_number": abn,
      "user_address": addressData,
      "about_me": aboutCont.text,
      "find_in_radius": radius,
      "region": selectedRegionId,
      "user_city": cityCont.text,
      "user_state": stateCont.text,
      "user_country": countryCont.text,
      "user_zip_code": postCont.text,
      "user_latitude": latCont.text,
      "user_longitude": lngCont.text,
      "mobile_number": mobileCont.text,
      "birth_year": selectedDate,
      "user_facebook": fbCont.text,
      "user_twitter": twtCont.text,
      "user_youtube": youtCont.text,
      "user_website": webCont.text,
      "profile_image_old":
          "${userProfileDataModel?.data?.userProfileDetails?.profileImage}",
      "cover_photo_old":
          "${userProfileDataModel?.data?.userProfileDetails?.coverImage}",
      "profile_id_proof_old":
          "${userProfileDataModel?.data?.userProfileDetails?.profileIdProof}",
      "profile_image": base64ProImage,
      "cover_image": base64CoverImage,
      "profile_id_proof": base64IdImage
    };
    log("data sending............${requestParams} ");
    showHideProgress(true);
    BlocProvider.of<HomeBloc>(context)
        .add(SupportWorkerUpdateProfileEvent(requestParams));
  }

  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is ProfileSupportWorkerPageState) {
      userProfileDataModel = profileState.userProfileDataModel;
      regions = profileState.allDropData?.data?.regions;
      traDis = profileState.allDropData?.data?.traDis;
      petFri = profileState.allDropData?.data?.petFri;
      typeSuppWorker = profileState.allDropData?.data?.typeSuppWorker;
      aboutUs = profileState.allDropData?.data?.aboutUs;
      suppPre = profileState.allDropData?.data?.suppPre;
      lang = profileState.allDropData?.data?.lang;
      addQualificationData(profileState
              .supportWorkerInfoData!.getSupportWorkerData?.qualifications ??
          []);
      addSupportOffered(profileState
              .supportWorkerInfoData?.getSupportWorkerData?.supportOffer ??
          []);

      setState(() {
        storingData();

        sharedPrefs.userImage =
            "${userProfileDataModel?.data?.userProfileDetails?.profileImage}";
        selectedRegions =
            "${userProfileDataModel?.data?.userProfileDetails?.australianRegionsName}";
        selectedRegionId =
            "${userProfileDataModel?.data?.userProfileDetails?.australianRegions}";
        selectedLang =
            "${userProfileDataModel?.data?.userProfileDetails?.languageName}";
        selectedLangId =
            "${userProfileDataModel?.data?.userProfileDetails?.language}";
        selectedPet =
            "${userProfileDataModel?.data?.userProfileDetails?.petFriendlyName}";
        selectedPetId =
            "${userProfileDataModel?.data?.userProfileDetails?.petFriendly}";
        selectedSupType =
            "${userProfileDataModel?.data?.userProfileDetails?.typeOfSupportWorkName}";
        selectedSupTypeId =
            "${userProfileDataModel?.data?.userProfileDetails?.typeOfSupportWork}";
        happyToTravel =
            "${userProfileDataModel?.data?.userProfileDetails?.happyToTravelName}";
        happyToTravelId =
            "${userProfileDataModel?.data?.userProfileDetails?.happyToTravel}";
        selectedAbout =
            "${userProfileDataModel?.data?.userProfileDetails?.howDidYouHearAboutUsName}";
        selectedAboutId =
            "${userProfileDataModel?.data?.userProfileDetails?.howDidYouHearAboutUs}";
        selectedSupPre =
            "${userProfileDataModel?.data?.userProfileDetails?.supportPreferName}";
        selectedSupPreId =
            "${userProfileDataModel?.data?.userProfileDetails?.supportPrefer}";
        radius =
            "${userProfileDataModel?.data?.userProfileDetails?.findInRadius}";
        availWork =
            "${userProfileDataModel?.data?.userProfileDetails?.workAvail}";
        abn = "${userProfileDataModel?.data?.userProfileDetails?.aBNNumber}";
        gender = "${userProfileDataModel?.data?.userProfileDetails?.gender}";
        addressData =
            "${userProfileDataModel?.data?.userProfileDetails?.userAddress}";
        mobileCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.mobileNumber}";
        cityCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.userCity}";
        stateCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.userState}";
        countryCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.userCountry}";
        latCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.userLatitude}";
        lngCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.userLongitude}";
        postCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.userZipCode}";
        fbCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.userFacebook}";
        twtCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.userTwitter}";
        youtCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.userYoutube}";
        webCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.userWebsite}";
        selectedDate =
            "${userProfileDataModel?.data?.userProfileDetails?.birthYear}";
        companyNameCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.companyName}";
        positionCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.position}";
        yearMonthCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.expYearMonth}";
        aboutCont.text =
            "${userProfileDataModel?.data?.userProfileDetails?.aboutMe}";
      });
    }
    super.initState();
  }

  getFullAddress() async {
    if (UserRepository.profile_lattitude == '' ||
        UserRepository.profile_longitude == '') {
      UserRepository.profile_lattitude = "0.0";
      UserRepository.profile_longitude = "0.0";
    }

    if ((addressData != "" || addressData != null) &&
        (UserRepository.profile_lattitude != "0.0" ||
            UserRepository.profile_longitude != "0.0")) {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          double.parse(UserRepository.profile_lattitude),
          double.parse(UserRepository.profile_longitude));

      addressData = UserRepository.profile_address!;
      latCont.text = UserRepository.profile_lattitude;
      lngCont.text = UserRepository.profile_longitude;
      cityCont.text = placemarks.first.locality ?? '';
      postCont.text = placemarks.first.postalCode ?? '';
      countryCont.text = placemarks.first.country ?? '';
      stateCont.text = placemarks.first.administrativeArea ?? '';
    } else {
      addressData = "Select Location";
      cityCont.text = "";
      stateCont.text = "";
      countryCont.text = "";
      postCont.text = "";
      latCont.text = "";
      lngCont.text = "";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          if (state is ProfileInitial) {
            showHideProgress(false);
            Navigator.of(context).pop();
          } else if (state is ProfileSearchLocationState) {
            Navigator.of(context)
                .pushNamed(HomeNavigator.hLocationSearch)
                .then((value) => value != null ? getFullAddress() : null);
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
                      isEdit == true ? "Edit User Profile" : "User Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0.scale(),
                          fontWeight: FontWeight.w700),
                    ),
                    leading: InkWell(
                        onTap: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(ProfileEventBackBtnClick(''));
                        },
                        child: Icon(Icons.arrow_back,
                            size: 30, color: Colors.white)),
                    actions: [
                      InkWell(
                        highlightColor: kColorThemePurpleColor,
                        onTap: () {
                          isEdit = true;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0.scale(), vertical: 17.0.scale()),
                          child: Text(
                            isEdit == true ? "" : "Edit Profile",
                            style: textStyleBoldCustomColor(12, Colors.white),
                          ),
                        ),
                      ),
                    ]),
                body: isEdit == true
                    ? update_profile_data()
                    : show_profile_data())));
  }

  Widget update_profile_data() {
    return Padding(
      padding: EdgeInsets.all(15.0.scale()),
      child: SingleChildScrollView(
        child: Column(
          children: [
            structured_row_data(
                leftText: "Name",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.firstName} ${userProfileDataModel?.data?.userProfileDetails?.lastName}"),
            structured_row_data(
                leftText: "Email Id",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.emailId}"),
            // custom_row_data(
            //     leftText: "Profile Password",
            //     rightWidget: customTextField(
            //         textController: passwordCont,
            //         focus: _focusNodePass,
            //         hint: "Change Password")),
            custom_row_data(
                leftText: "Mobile Number",
                rightWidget: customTextField(
                    textController: mobileCont,
                    focus: _focusNodeMobile,
                    keyboardType: TextInputType.phone,
                    hint: "Change Mobile")),
            custom_row_data(
                leftText: "Profile Picture",
                rightWidget: _userImage != null
                    ? SizedBox(
                        width: 190.0.scale(),
                        child: Container(
                          height: 120.0.scale(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.file(
                                _userImage!,
                                fit: BoxFit.cover,
                              )),
                        ))
                    : InkWell(
                        onTap: () {
                          _showPicker(context: context, image_type: 'profile');
                          setState(() {});
                        },
                        child: Container(
                          height: 45.0.scale(),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10.0.scale()),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Upload Image",
                            style: textStyleCustomColor(
                                14.0.scale(), Colors.black),
                          ).topPadding(10.0.scale()),
                        ),
                      )),
            custom_row_data(
                leftText: "Profile Cover Image",
                rightWidget: _coverImage != null
                    ? SizedBox(
                        width: 190.0.scale(),
                        child: Container(
                          height: 120.0.scale(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.file(
                                _coverImage!,
                                fit: BoxFit.cover,
                              )),
                        ))
                    : InkWell(
                        onTap: () {
                          _showPicker(context: context, image_type: 'cover');
                          setState(() {});
                        },
                        child: Container(
                          height: 45.0.scale(),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10.0.scale()),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Upload Image",
                            style: textStyleCustomColor(
                                14.0.scale(), Colors.black),
                          ).topPadding(10.0.scale()),
                        ),
                      )),
            custom_row_data(
                leftText: "Photo ID Proof",
                rightWidget: _idProofImage != null
                    ? SizedBox(
                        width: 190.0.scale(),
                        child: Container(
                          height: 120.0.scale(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.file(
                                _idProofImage!,
                                fit: BoxFit.cover,
                              )),
                        ))
                    : InkWell(
                        onTap: () {
                          _showPicker(context: context, image_type: 'id');
                          setState(() {});
                        },
                        child: Container(
                          height: 45.0.scale(),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10.0.scale()),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Upload Image",
                            style: textStyleCustomColor(
                                14.0.scale(), Colors.black),
                          ).topPadding(10.0.scale()),
                        ),
                      )),

            custom_row_data(
              leftText: "Find In Radius",
              rightWidget: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: ExpandCardOutside(
                  box_color: Colors.transparent,
                  title_color: Colors.black,
                  title: radius,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: radius_items.map((e) {
                      return InkWell(
                        onTap: () {
                          radius = e;
                          setState(() {});
                        },
                        child: Text(
                          "${e}",
                          style: textStyleBoldBlack(14, Colors.black),
                        ).bottomPadding(10.0.scale()),
                      );
                    }).toList(),
                  ).leftPadding(10.0.scale()).bottomPadding(10.0.scale()),
                ),
              ),
            ),
            custom_row_data(
              leftText: "Address",
              rightWidget: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeSearchLocationCityBtnClick('sup_work_profile'));
                },
                child: Container(
                  height: 45.0.scale(),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    addressData ?? "Enter a Location",
                    style: textStyleCustomColor(
                        14.0.scale(), kColorDialogNameTitle),
                  )
                      .leftPadding(10.0.scale())
                      .topPadding(10.0.scale())
                      .bottomPadding(10.0.scale()),
                ),
              ),
            ),
            custom_row_data(
                leftText: "City",
                rightWidget: customTextField(
                    textController: cityCont,
                    focus: _focusNodeCity,
                    hint: "City")),
            custom_row_data(
                leftText: "State",
                rightWidget: customTextField(
                    textController: stateCont,
                    focus: _focusNodeState,
                    hint: "State")),
            custom_row_data(
                leftText: "Country",
                rightWidget: customTextField(
                    textController: countryCont,
                    focus: _focusNodeCountry,
                    hint: "Country")),
            custom_row_data(
                leftText: "Post Code",
                rightWidget: customTextField(
                    textController: postCont,
                    focus: _focusNodePost,
                    hint: "Post Code")),
            custom_row_data(
                leftText: "Latitude",
                rightWidget: customTextField(
                    textController: latCont,
                    focus: _focusNodeLat,
                    hint: "Latitude")),
            custom_row_data(
                leftText: "Longitude",
                rightWidget: customTextField(
                    textController: lngCont,
                    focus: _focusNodeLong,
                    hint: "Longitude")),
            custom_row_data(
              leftText: "Australian Regions",
              rightWidget: Container(
                height: 50.0.scale(),
                padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Regions>(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: regions!
                        .map<DropdownMenuItem<Regions>>((Regions items) {
                      return DropdownMenuItem<Regions>(
                        value: items,
                        child: Text(
                          "${items.regionName}",
                          style: textStyleCustomColor(
                            14.0.scale(),
                            Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (Regions? newValue) {
                      setState(() {
                        selectedRegions = newValue!.regionName!;
                        selectedRegionId = newValue!.id!;
                        print("selectedRegions__${selectedRegions}");
                        print("selectedRegionsSetId ${selectedRegionId}");
                      });
                    },
                    hint: Text(selectedRegions,
                        style:
                            textStyleCustomColor(14.0.scale(), Colors.black)),
                  ),
                ),
              ),
            ),
            structured_row_data(
                leftText: "Join date",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.joinDate}"),
            structured_row_data(
                leftText: "Verified",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.verificationStatus}" ==
                            "1"
                        ? "No"
                        : "Yes"),
            structured_row_data(
                leftText: "Premium service provider",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.preSerPro}"),
            custom_row_data(
                leftText: "Facebook",
                rightWidget: customTextField(
                    textController: fbCont,
                    focus: _focusNodeFb,
                    hint: "Facebook")),
            custom_row_data(
                leftText: "Twitter",
                rightWidget: customTextField(
                    textController: twtCont,
                    focus: _focusNodeTwt,
                    hint: "Twitter")),
            custom_row_data(
                leftText: "Youtube",
                rightWidget: customTextField(
                    textController: youtCont,
                    focus: _focusNodeYou,
                    hint: "Youtube")),
            custom_row_data(
                leftText: "Website",
                rightWidget: customTextField(
                    textController: webCont,
                    focus: _focusNodeWeb,
                    hint: "Website")),
            custom_row_data(
              leftText: "Date of Birth",
              rightWidget: GestureDetector(
                onTap: () {
                  _onPressed(context: context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                  height: 50.0.scale(),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    selectedDate,
                    style: textStyleCustomColor(
                        14.0.scale(), kColorDialogNameTitle),
                  ).align(Alignment.centerLeft),
                ),
              ),
            ),
            structured_row_data(leftText: "Age", rightText: "${calculatedAge}"),
            custom_row_data(
              leftText: "Happy to travel (KM)",
              rightWidget: Container(
                height: 50.0.scale(),
                padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<TraDis>(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items:
                        traDis!.map<DropdownMenuItem<TraDis>>((TraDis items) {
                      return DropdownMenuItem<TraDis>(
                        value: items,
                        child: Text(
                          "${items.swTravelDistance}",
                          style: textStyleCustomColor(
                            14.0.scale(),
                            Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (TraDis? newValue) {
                      setState(() {
                        happyToTravel = newValue!.swTravelDistance!;
                        happyToTravelId = newValue!.swTravelDistanceId!;
                        print("happyToTravel${selectedLang}");
                      });
                    },
                    hint: Text(happyToTravel,
                        style:
                            textStyleCustomColor(14.0.scale(), Colors.black)),
                  ),
                ),
              ),
            ),
            custom_row_data(
              leftText: "Language",
              rightWidget: Container(
                height: 50.0.scale(),
                padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Lang>(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: lang!.map<DropdownMenuItem<Lang>>((Lang items) {
                      return DropdownMenuItem<Lang>(
                        value: items,
                        child: Text(
                          "${items.languageName}",
                          style: textStyleCustomColor(
                            14.0.scale(),
                            Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (Lang? newValue) {
                      setState(() {
                        selectedLang = newValue!.languageName!;
                        selectedLangId = newValue!.id!;
                        print("selectedLang__${selectedLang}");
                        print("selectedReselectedLangId ${selectedLangId}");
                      });
                    },
                    hint: Text(selectedLang,
                        style:
                            textStyleCustomColor(14.0.scale(), Colors.black)),
                  ),
                ),
              ),
            ),
            custom_row_data(
              leftText: "Pet friendly !",
              rightWidget: Container(
                height: 50.0.scale(),
                padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<PetFri>(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items:
                        petFri!.map<DropdownMenuItem<PetFri>>((PetFri items) {
                      return DropdownMenuItem<PetFri>(
                        value: items,
                        child: Text(
                          "${items.petFriName}",
                          style: textStyleCustomColor(
                            14.0.scale(),
                            Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (PetFri? newValue) {
                      setState(() {
                        selectedPet = newValue!.petFriName!;
                        selectedPetId = newValue!.petFriId!;
                        print("selectedPet${selectedPet}");
                      });
                    },
                    hint: Text(selectedPet,
                        style:
                            textStyleCustomColor(14.0.scale(), Colors.black)),
                  ),
                ),
              ),
            ),
            custom_row_data(
              leftText: "Type of Support Work",
              rightWidget: Container(
                height: 50.0.scale(),
                padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<TypeSuppWorker>(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: typeSuppWorker!
                        .map<DropdownMenuItem<TypeSuppWorker>>(
                            (TypeSuppWorker items) {
                      return DropdownMenuItem<TypeSuppWorker>(
                        value: items,
                        child: Text(
                          "${items.typeName}",
                          style: textStyleCustomColor(
                            14.0.scale(),
                            Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (TypeSuppWorker? newValue) {
                      setState(() {
                        selectedSupType = newValue!.typeName!;
                        selectedSupTypeId = newValue!.suppWorkerTypeId!;
                        print("selectedSupType${selectedSupType}");
                      });
                    },
                    hint: Text(selectedSupType,
                        style:
                            textStyleCustomColor(14.0.scale(), Colors.black)),
                  ),
                ),
              ),
            ),
            custom_row_data(
              leftText: "How did you hear about us?",
              rightWidget: Container(
                height: 50.0.scale(),
                padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<AboutUs>(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: aboutUs!
                        .map<DropdownMenuItem<AboutUs>>((AboutUs items) {
                      return DropdownMenuItem<AboutUs>(
                        value: items,
                        child: Text(
                          "${items.swAboutUsName}",
                          style: textStyleCustomColor(
                            14.0.scale(),
                            Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (AboutUs? newValue) {
                      setState(() {
                        selectedAbout = newValue!.swAboutUsName!;
                        selectedAboutId = newValue!.swAboutUsId!;
                      });
                    },
                    hint: Text(selectedAbout,
                        style:
                            textStyleCustomColor(14.0.scale(), Colors.black)),
                  ),
                ),
              ),
            ),
            custom_row_data(
              leftText: "Support Preference",
              rightWidget: Container(
                height: 50.0.scale(),
                padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<SuppPre>(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: suppPre!
                        .map<DropdownMenuItem<SuppPre>>((SuppPre items) {
                      return DropdownMenuItem<SuppPre>(
                        value: items,
                        child: Text(
                          "${items.supportPreferName}",
                          style: textStyleCustomColor(
                            14.0.scale(),
                            Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (SuppPre? newValue) {
                      setState(() {
                        selectedSupPre = newValue!.supportPreferName!;
                        selectedSupPreId = newValue!.suppPreId!;
                      });
                    },
                    hint: Text(selectedSupPre,
                        style:
                            textStyleCustomColor(14.0.scale(), Colors.black)),
                  ),
                ),
              ),
            ),
            custom_row_data(
              leftText: "Available for work",
              rightWidget: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: ExpandCardOutside(
                  box_color: Colors.transparent,
                  title_color: Colors.black,
                  title: availWork,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: avail_items.map((e) {
                      return InkWell(
                        onTap: () {
                          availWork = e;
                          setState(() {});
                        },
                        child: Text(
                          "${e}",
                          style: textStyleBoldBlack(14, Colors.black),
                        ).bottomPadding(10.0.scale()),
                      );
                    }).toList(),
                  ).leftPadding(10.0.scale()).bottomPadding(10.0.scale()),
                ),
              ),
            ),
            custom_row_data(
              leftText: "Gender",
              rightWidget: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: ExpandCardOutside(
                  box_color: Colors.transparent,
                  title_color: Colors.black,
                  title: gender,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: gender_items.map((e) {
                      return InkWell(
                        onTap: () {
                          gender = e;
                          setState(() {});
                        },
                        child: Text(
                          "${e}",
                          style: textStyleBoldBlack(14, Colors.black),
                        ).bottomPadding(10.0.scale()),
                      );
                    }).toList(),
                  ).leftPadding(10.0.scale()).bottomPadding(10.0.scale()),
                ),
              ),
            ),
            custom_row_data(
              leftText: "ABN Number",
              rightWidget: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: ExpandCardOutside(
                  box_color: Colors.transparent,
                  title_color: Colors.black,
                  title: abn,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: abn_items.map((e) {
                      return InkWell(
                        onTap: () {
                          abn = e;
                          setState(() {});
                        },
                        child: Text(
                          "${e}",
                          style: textStyleBoldBlack(14, Colors.black),
                        ).bottomPadding(10.0.scale()),
                      );
                    }).toList(),
                  ).leftPadding(10.0.scale()).bottomPadding(10.0.scale()),
                ),
              ),
            ),
            custom_row_data(
                leftText: "Work Schedule",
                rightWidget: Column(
                  children: [
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        isMondayClosed = !isMondayClosed;
                        userProfileDataModel?.data?.userProfileDetails?.schedule
                            ?.forEach((element) {
                          if ('${element.day}'.contains("Monday")) {
                            isMondayClosed == false
                                ? availableTimeDataMondayArray = []
                                : availableTimeDataMondayArray.add(
                                    SupportAvailableTimeParam(
                                        "Monday", monday_data ?? []));
                          }
                        });
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            isMondayClosed == true
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: Colors.green,
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "Monday",
                            style: textStyleBoldCustomColor(13, Colors.black),
                          ),
                        ],
                      ),
                    ),
                    AVerticalSpace(5.0.scale()),
                    if (isMondayClosed == true)
                      mondayContainerAvailability(
                          timeAvailableTimeSlotDataMonday, monday_data),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        isTuesdayClosed = !isTuesdayClosed;
                        userProfileDataModel?.data?.userProfileDetails?.schedule
                            ?.forEach((element) {
                          if ('${element.day}'.contains("Tuesday")) {
                            isTuesdayClosed == false
                                ? availableTimeDataTueArray = []
                                : availableTimeDataTueArray.add(
                                    SupportAvailableTimeParam(
                                        "Tuesday", tuesday_data ?? []));
                          }
                        });
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            isTuesdayClosed == true
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: Colors.green,
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "Tuesday",
                            style: textStyleBoldCustomColor(13, Colors.black),
                          ),
                        ],
                      ),
                    ),
                    AVerticalSpace(5.0.scale()),
                    if (isTuesdayClosed == true)
                      tuesdayContainerAvailability(
                          timeAvailableTimeSlotDataTuesday, tuesday_data),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        isWednesdayClosed = !isWednesdayClosed;
                        userProfileDataModel?.data?.userProfileDetails?.schedule
                            ?.forEach((element) {
                          if ('${element.day}'.contains("Wednesday")) {
                            isWednesdayClosed == false
                                ? availableTimeDataWednesdayArray = []
                                : availableTimeDataWednesdayArray.add(
                                    SupportAvailableTimeParam(
                                        "Wednesday", wednesday_data ?? []));
                          }
                        });
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          InkWell(
                            child: Icon(
                              isWednesdayClosed == true
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: Colors.green,
                            ),
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "Wednesday",
                            style: textStyleBoldCustomColor(13, Colors.black),
                          ),
                        ],
                      ),
                    ),
                    AVerticalSpace(5.0.scale()),
                    if (isWednesdayClosed == true)
                      wednesdayContainerAvailability(
                          timeAvailableTimeSlotDataWednesday, wednesday_data),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        isThursdayClosed = !isThursdayClosed;
                        userProfileDataModel?.data?.userProfileDetails?.schedule
                            ?.forEach((element) {
                          if ('${element.day}'.contains("Thursday")) {
                            isThursdayClosed == false
                                ? availableTimeDataThursdayArray = []
                                : availableTimeDataThursdayArray.add(
                                    SupportAvailableTimeParam(
                                        "Thursday", thursday_data ?? []));
                          }
                        });
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            isThursdayClosed == true
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: Colors.green,
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "Thursday",
                            style: textStyleBoldCustomColor(13, Colors.black),
                          ),
                        ],
                      ),
                    ),
                    AVerticalSpace(5.0.scale()),
                    if (isThursdayClosed == true)
                      thursdayContainerAvailability(
                          timeAvailableTimeSlotDataThursday, thursday_data),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        isFridayClosed = !isFridayClosed;
                        userProfileDataModel?.data?.userProfileDetails?.schedule
                            ?.forEach((element) {
                          if ('${element.day}'.contains("Friday")) {
                            isFridayClosed == false
                                ? availableTimeDataFridArray = []
                                : availableTimeDataFridArray.add(
                                    SupportAvailableTimeParam(
                                        "Friday", friday_data ?? []));
                          }
                        });
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            isFridayClosed == true
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: Colors.green,
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "Friday",
                            style: textStyleBoldCustomColor(13, Colors.black),
                          ),
                        ],
                      ),
                    ),
                    AVerticalSpace(5.0.scale()),
                    if (isFridayClosed == true)
                      fridayContainerAvailability(
                          timeAvailableTimeSlotDataFriday, friday_data),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        isSaturdayClosed = !isSaturdayClosed;
                        userProfileDataModel?.data?.userProfileDetails?.schedule
                            ?.forEach((element) {
                          if ('${element.day}'.contains("Saturday")) {
                            isSaturdayClosed == false
                                ? availableTimeDataSaturArray = []
                                : availableTimeDataSaturArray.add(
                                    SupportAvailableTimeParam(
                                        "Saturday", saturday_data ?? []));
                          }
                        });
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            isSaturdayClosed == true
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: Colors.green,
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "Saturday",
                            style: textStyleBoldCustomColor(13, Colors.black),
                          ),
                        ],
                      ),
                    ),
                    AVerticalSpace(5.0.scale()),
                    if (isSaturdayClosed == true)
                      saturdayContainerAvailability(
                          timeAvailableTimeSlotDataSaturday, saturday_data),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        isSundayClosed = !isSundayClosed;
                        userProfileDataModel?.data?.userProfileDetails?.schedule
                            ?.forEach((element) {
                          if ('${element.day}'.contains("Sunday")) {
                            isSundayClosed == false
                                ? availableTimeDataSundayArray = []
                                : availableTimeDataSundayArray.add(
                                    SupportAvailableTimeParam(
                                        "Sunday", sunday_data ?? []));
                          }
                        });
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            isSundayClosed == true
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: Colors.green,
                          ),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "Sunday",
                            style: textStyleBoldCustomColor(13, Colors.black),
                          ),
                        ],
                      ),
                    ),
                    AVerticalSpace(5.0.scale()),
                    if (isSundayClosed == true)
                      sundayContainerAvailability(
                          timeAvailableTimeSlotDataSunday, sunday_data),
                  ],
                )),

            custom_row_data(
              leftText: "Work History",
              rightWidget: workHistoryContainer(addSupportWorkerExperience, userProfileDataModel?.data?.userProfileDetails?.workExp),
            ),
            custom_row_data(
                leftText: "About me",
                rightWidget: customTextField(
                  textController: aboutCont,
                  focus: _focusNodeAbout,
                  hint: "About me",
                )),
            custom_row_data(
              leftText: "Service Locations",
              rightWidget: workLocationContainer(
                  context, addWorkLocationData, isView, workLocationArray),
            ),

            custom_row_data(
                leftText: "Qualifications",
                rightWidget: Column(
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.qualifications?.length}");
                        i++)
                      GestureDetector(
                        onTap: () {
                          qualiIdArray = [];
                          setState(() {
                            if ("${userProfileDataModel?.data?.userProfileDetails?.qualifications?[i].status}" ==
                                "1") {
                              userProfileDataModel?.data?.userProfileDetails
                                  ?.qualifications?[i].status = 0;
                            } else {
                              userProfileDataModel?.data?.userProfileDetails
                                  ?.qualifications?[i].status = 1;
                            }
                            userProfileDataModel
                                ?.data?.userProfileDetails?.qualifications
                                ?.forEach((element) {
                              if (element.status.toString() == "1") {
                                qualiIdArray.add(element.id);
                              }
                            });
                            print("qualiIdArraychecking-------$qualiIdArray");
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${userProfileDataModel?.data?.userProfileDetails?.qualifications?[i].name}",
                              style: textStyleCustomColor(13, Colors.black),
                            ).expand(),
                            Icon(
                                "${userProfileDataModel?.data?.userProfileDetails?.qualifications?[i].status}" ==
                                        "1"
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color:
                                    "${userProfileDataModel?.data?.userProfileDetails?.qualifications?[i].status}" ==
                                            "1"
                                        ? Colors.green
                                        : Colors.grey),
                          ],
                        ),
                      ),
                  ],
                )),

            custom_row_data(
                leftText: "Other Qualifications",
                rightWidget: customTextField(
                  textController: _textFiledQualification,
                  focus: _focusNodeQualification,
                  hint: "Other Qualifications",
                )),

            custom_row_data(
                leftText: "Certificates",
                rightWidget: Column(
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.certificates?.length}");
                        i++)
                      GestureDetector(
                        onTap: () {
                          certifiArray = [];
                          setState(() {
                            if ("${userProfileDataModel?.data?.userProfileDetails?.certificates?[i].status}" ==
                                "1") {
                              userProfileDataModel?.data?.userProfileDetails
                                  ?.certificates?[i].status = 0;
                            } else {
                              userProfileDataModel?.data?.userProfileDetails
                                  ?.certificates?[i].status = 1;
                            }
                            userProfileDataModel
                                ?.data?.userProfileDetails?.certificates
                                ?.forEach((element) {
                              if (element.status.toString() == "1") {
                                certifiArray.add(element.id);
                              }
                            });
                            print("certifiArraychecking-------$certifiArray");
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${userProfileDataModel?.data?.userProfileDetails?.certificates?[i].name}",
                              style: textStyleCustomColor(13, Colors.black),
                            ).expand(),
                            Icon(
                                "${userProfileDataModel?.data?.userProfileDetails?.certificates?[i].status}" ==
                                        "1"
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color:
                                    "${userProfileDataModel?.data?.userProfileDetails?.certificates?[i].status}" ==
                                            "1"
                                        ? Colors.green
                                        : Colors.grey),
                          ],
                        ),
                      ),
                  ],
                )),

            custom_row_data(
                leftText: "Other Certificates",
                rightWidget: customTextField(
                  textController: _textFiledOtherCertificate,
                  focus: _focusNodeOtherCertificate,
                  hint: "Other Certificates",
                )),

            custom_row_data(
                leftText: "Skills",
                rightWidget: Column(
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.skills?.length}");
                        i++)
                      GestureDetector(
                        onTap: () {
                          skillList = [];
                          setState(() {
                            if ("${userProfileDataModel?.data?.userProfileDetails?.skills?[i].status}" ==
                                "1") {
                              userProfileDataModel?.data?.userProfileDetails
                                  ?.skills?[i].status = 0;
                            } else {
                              userProfileDataModel?.data?.userProfileDetails
                                  ?.skills?[i].status = 1;
                            }
                            userProfileDataModel
                                ?.data?.userProfileDetails?.skills
                                ?.forEach((element) {
                              if (element.status.toString() == "1") {
                                skillList.add(element.id);
                              }
                            });
                            print("skillchecking-------$skillList");
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${userProfileDataModel?.data?.userProfileDetails?.skills?[i].name}",
                              style: textStyleCustomColor(13, Colors.black),
                            ).expand(),
                            Icon(
                                "${userProfileDataModel?.data?.userProfileDetails?.skills?[i].status}" ==
                                        "1"
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color:
                                    "${userProfileDataModel?.data?.userProfileDetails?.skills?[i].status}" ==
                                            "1"
                                        ? Colors.green
                                        : Colors.grey),
                          ],
                        ),
                      ),
                  ],
                )),

            custom_row_data(
                leftText: "Other Skills",
                rightWidget: customTextField(
                  textController: _textFiledSkills,
                  focus: _focusNodeOtherSkill,
                  hint: "Other Skills",
                )),

            custom_row_data(
                leftText: "Support Offered",
                rightWidget: Column(
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.supportOffers?.length}");
                        i++)
                      GestureDetector(
                        onTap: () {
                          supportOfferedArray = [];
                          setState(() {
                            if ("${userProfileDataModel?.data?.userProfileDetails?.supportOffers?[i].status}" ==
                                "1") {
                              userProfileDataModel?.data?.userProfileDetails
                                  ?.supportOffers?[i].status = 0;
                            } else {
                              userProfileDataModel?.data?.userProfileDetails
                                  ?.supportOffers?[i].status = 1;
                            }
                            userProfileDataModel
                                ?.data?.userProfileDetails?.supportOffers
                                ?.forEach((element) {
                              if (element.status.toString() == "1") {
                                supportOfferedArray.add(element.id);
                              }
                            });
                            print(
                                "supportOfferedArray-------$supportOfferedArray");
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${userProfileDataModel?.data?.userProfileDetails?.supportOffers?[i].name}",
                              style: textStyleCustomColor(13, Colors.black),
                            ).expand(),
                            Icon(
                                "${userProfileDataModel?.data?.userProfileDetails?.supportOffers?[i].status}" ==
                                        "1"
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color:
                                    "${userProfileDataModel?.data?.userProfileDetails?.supportOffers?[i].status}" ==
                                            "1"
                                        ? Colors.green
                                        : Colors.grey),
                          ],
                        ),
                      ),
                  ],
                )),

            ARoundedButton(
              btnBgColor: kColorThemePurpleColor,
              btnTextColor: Colors.white,
              btnOnPressed: () {
                dataSend();
              },
              btnText: 'Update',
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
    );
  }

  Widget show_profile_data() {
    return Padding(
      padding: EdgeInsets.all(15.0.scale()),
      child: SingleChildScrollView(
        child: Column(
          children: [
            structured_row_data(
                leftText: "Profile Expiry(Listing exp)",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.profileExpiry}"),
            structured_row_data(
                leftText: "Name",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.firstName} ${userProfileDataModel?.data?.userProfileDetails?.lastName}"),
            structured_row_data(
                leftText: "Email Id",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.emailId}"),
            // structured_row_data(
            //     leftText: "Profile Password",
            //     rightText:
            //         "${userProfileDataModel?.data?.userProfileDetails?.password}"),
            structured_row_data(
                leftText: "Mobile Number",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.mobileNumber}"),
            structured_row_data(
                leftText: "Profile Picture",
                isImage: true,
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.profileImage}"),
            structured_row_data(
                leftText: "Profile Cover Image",
                isImage: true,
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.coverImage}"),
            structured_row_data(
                leftText: "Photo ID Proof",
                isImage: true,
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.profileIdProof}"),
            // custom_row_data(
            //     leftText: "Mail Facilities",
            //     rightWidget: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("All Service Providers")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "All Service Providers",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("Support Workers")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "Support Workers",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("Jobs")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "Jobs",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("Support Coordinators")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "Support Coordinators",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("NDIS Service Experts")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "NDIS Service Experts",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("Consumables for Sale")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "Consumables for Sale",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("Modified Vehicles for Sale")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "Modified Vehicles for Sale",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ).expand(),
            //           ],
            //         ),
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("Accommodation Housing")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "Accommodation Housing",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ).expand(),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("Holiday Destinations")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "Holiday Destinations",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("NDIS Business for Sale")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "NDIS Business for Sale",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Icon(
            //               userProfileDataModel!
            //                       .data!.userProfileDetails!.mailFac!
            //                       .contains("NDIS Property for Sale")
            //                   ? Icons.check_box_rounded
            //                   : Icons.check_box_outline_blank,
            //               color: Colors.green,
            //               size: 20.0.scale(),
            //             ),
            //             Text(
            //               "NDIS Property for Sale",
            //               style: textStyleBoldCustomColor(13, Colors.black),
            //             ),
            //           ],
            //         ),
            //       ],
            //     )),
            structured_row_data(
                leftText: "Find In Radius",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.findInRadius} (in K.M.)"),
            structured_row_data(
                leftText: "Address",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userAddress}"),
            structured_row_data(
                leftText: "City",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userCity}"),
            structured_row_data(
                leftText: "State",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userState}"),
            structured_row_data(
                leftText: "Country",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userCountry}"),
            structured_row_data(
                leftText: "Post Code",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userZipCode}"),
            structured_row_data(
                leftText: "Latitude",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userLatitude}"),
            structured_row_data(
                leftText: "Longitude",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userLongitude}"),
            structured_row_data(
                leftText: "Australian Regions",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.australianRegionsName}"),
            structured_row_data(
                leftText: "Join date",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.joinDate}"),
            structured_row_data(
                leftText: "Verified",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.verificationStatus}" ==
                            "1"
                        ? "No"
                        : "Yes"),
            structured_row_data(
                leftText: "Premium service provider",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.preSerPro}"),
            structured_row_data(
                leftText: "Profile Link",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.profileLink}",
                textClr: Colors.blue),
            structured_row_data(
                leftText: "Facebook",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userFacebook}"),
            structured_row_data(
                leftText: "Twitter",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userTwitter}"),
            structured_row_data(
                leftText: "Youtube",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userYoutube}"),
            structured_row_data(
                leftText: "Website",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.userWebsite}"),
            structured_row_data(
                leftText: "Gender",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.gender}"),
            structured_row_data(
                leftText: "Language",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.languageName}"),
            structured_row_data(
                leftText: "Birth Year & Month",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.birthYear}"),
            structured_row_data(
                leftText: "Happy to travel (KM)",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.happyToTravelName}"),
            structured_row_data(
                leftText: "Pet friendly !",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.petFriendlyName}"),
            structured_row_data(
                leftText: "ABN Number",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.aBNNumber}"),
            structured_row_data(
                leftText: "Type of Support Work",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.typeOfSupportWorkName}"),
            structured_row_data(
                leftText: "How did you hear about us?",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.howDidYouHearAboutUsName}"),
            structured_row_data(
                leftText: "Support Preference",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.supportPreferName}"),
            structured_row_data(
                leftText: "Work Availability",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.workAvail}"),
            structured_row_data(
                leftText: "About me",
                rightText:
                    "${userProfileDataModel?.data?.userProfileDetails?.aboutMe}"),
            custom_row_data(
                leftText: "Qualifications",
                rightWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.qualifications?.length}");
                        i++)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                              "${userProfileDataModel?.data?.userProfileDetails?.qualifications?[i].status}" ==
                                      "1"
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color:
                                  "${userProfileDataModel?.data?.userProfileDetails?.qualifications?[i].status}" ==
                                          "1"
                                      ? Colors.green
                                      : Colors.grey),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "${userProfileDataModel?.data?.userProfileDetails?.qualifications?[i].name}",
                            style: textStyleCustomColor(12, Colors.black),
                          ).expand()
                        ],
                      ),
                  ],
                )),
            structured_row_data(
                leftText: "Other Qualification",
                rightText: _textFiledQualification.text),

            custom_row_data(
                leftText: "Certificates",
                rightWidget: Column(
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.certificates?.length}");
                        i++)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                              "${userProfileDataModel?.data?.userProfileDetails?.certificates?[i].status}" ==
                                      "1"
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color:
                                  "${userProfileDataModel?.data?.userProfileDetails?.certificates?[i].status}" ==
                                          "1"
                                      ? Colors.green
                                      : Colors.grey),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "${userProfileDataModel?.data?.userProfileDetails?.certificates?[i].name}",
                            style: textStyleCustomColor(12, Colors.black),
                          ).expand()
                        ],
                      ),
                  ],
                )),
            structured_row_data(
                leftText: "Other Certificates",
                rightText: _textFiledOtherCertificate.text),

            custom_row_data(
                leftText: "Skills",
                rightWidget: Column(
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.skills?.length}");
                        i++)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                              "${userProfileDataModel?.data?.userProfileDetails?.skills?[i].status}" ==
                                      "1"
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color:
                                  "${userProfileDataModel?.data?.userProfileDetails?.skills?[i].status}" ==
                                          "1"
                                      ? Colors.green
                                      : Colors.grey),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "${userProfileDataModel?.data?.userProfileDetails?.skills?[i].name}",
                            style: textStyleCustomColor(12, Colors.black),
                          ).expand()
                        ],
                      ),
                  ],
                )),
            structured_row_data(
                leftText: "Other Skills", rightText: _textFiledSkills.text),

            custom_row_data(
                leftText: "Support Offered ",
                rightWidget: Column(
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.supportOffers?.length}");
                        i++)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                              "${userProfileDataModel?.data?.userProfileDetails?.supportOffers?[i].status}" ==
                                      "1"
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color:
                                  "${userProfileDataModel?.data?.userProfileDetails?.supportOffers?[i].status}" ==
                                          "1"
                                      ? Colors.green
                                      : Colors.grey),
                          AHorizontalSpace(5.0.scale()),
                          Text(
                            "${userProfileDataModel?.data?.userProfileDetails?.supportOffers?[i].name}",
                            style: textStyleCustomColor(12, Colors.black),
                          ).expand()
                        ],
                      ),
                  ],
                )),
            custom_row_data(
                leftText: "Work Experience",
                rightWidget: Column(
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.workExp?.length}");
                        i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 65.0.scale(),
                                child: Text(
                                  "Position",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.workExp?[i].position}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 65.0.scale(),
                                child: Text(
                                  "Company",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.workExp?[i].companyName}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 65.0.scale(),
                                child: Text(
                                  "Work From",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.workExp?[i].workFrom} To "
                                "${userProfileDataModel?.data?.userProfileDetails?.workExp?[i].workTo}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 65.0.scale(),
                                child: Text(
                                  "Experience",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.workExp?[i].expYearMonth}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                        ],
                      ).bottomPadding(15.0.scale()),
                  ],
                )),
            custom_row_data(
                leftText: "Schedule",
                rightWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.schedule?.length}");
                        i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].day}",
                            style: textStyleBoldCustomColor(12, Colors.black),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              for (int j = 0;
                                  j <
                                      int.parse(
                                          "${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].data?.length}");
                                  j++)
                                Text(
                                  "${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].data?[j].from} - "
                                  "${userProfileDataModel?.data?.userProfileDetails?.schedule?[i].data?[j].to}",
                                  style: textStyleCustomColor(12, Colors.black),
                                ),
                            ],
                          )
                        ],
                      ).bottomPadding(5.0.scale()),
                  ],
                )),
            custom_row_data(
                leftText: "Locations",
                rightWidget: Column(
                  children: [
                    for (int i = 0;
                        i <
                            int.parse(
                                "${userProfileDataModel?.data?.userProfileDetails?.allLocation?.length}");
                        i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70.0.scale(),
                                child: Text(
                                  "Location ${i + 1}",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.allLocation?[i].location}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70.0.scale(),
                                child: Text(
                                  "City",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.allLocation?[i].locationCity}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70.0.scale(),
                                child: Text(
                                  "State",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.allLocation?[i].locationState}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70.0.scale(),
                                child: Text(
                                  "Country",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.allLocation?[i].locationCountry}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70.0.scale(),
                                child: Text(
                                  "Post Code",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.allLocation?[i].locationZipCode}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70.0.scale(),
                                child: Text(
                                  "Latitude",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.allLocation?[i].locationLatitude}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70.0.scale(),
                                child: Text(
                                  "Longitude",
                                  style: textStyleBoldCustomColor(
                                      12, Colors.black),
                                ),
                              ),
                              Text(
                                ": ${userProfileDataModel?.data?.userProfileDetails?.allLocation?[i].locationLongitude}",
                                style: textStyleCustomColor(12, Colors.black),
                              ).expand()
                            ],
                          ),
                        ],
                      ).bottomPadding(15.0.scale()),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget structured_row_data(
      {required String leftText,
      required String rightText,
      bool? isImage,
      Color? textClr}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130.0.scale(),
              child: Text(
                leftText,
                style: textStyleCustomColor(13, Colors.black),
              ),
            ),
            SizedBox(
              width: 190.0.scale(),
              child: isImage == true
                  ? Container(
                      height: 120.0.scale(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: NetworkImagesWidgets(
                          url: "$rightText",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Text(
                      ": $rightText",
                      style:
                          textStyleBoldCustomColor(13, textClr ?? Colors.black),
                    ),
            ),
          ],
        ),
        AVerticalSpace(10.0.scale()),
        ASeparatorLine(
          height: 0.5,
          color: Colors.black,
        ),
        AVerticalSpace(10.0.scale()),
      ],
    );
  }

  Widget custom_row_data(
      {required String leftText, required Widget rightWidget}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130.0.scale(),
              child: Text(
                leftText,
                style: textStyleCustomColor(13, Colors.black),
              ),
            ),
            SizedBox(width: 190.0.scale(), child: rightWidget),
          ],
        ),
        AVerticalSpace(10.0.scale()),
        if (leftText != "Support Offered")
          ASeparatorLine(
            height: 0.5,
            color: Colors.black,
          ),
        AVerticalSpace(10.0.scale()),
      ],
    );
  }

  Widget customTextField({
    required TextEditingController textController,
    String? hint,
    required FocusNode focus,
    TextInputType? keyboardType,
    bool? isRead,
  }) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focus);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0.scale()),
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
          textInputAction: TextInputAction.done,
          style: textStyleCustomColor(14.0.scale(), Colors.black),
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
  List<SupportWorkerExperienceData>? workExp;

  workHistoryContainer(this.addSupportWorkerExperience, this.workExp);

  @override
  State<workHistoryContainer> createState() => workHistoryContainerState();
}

class workHistoryContainerState extends State<workHistoryContainer> {
  final _formKeydynamic = GlobalKey();
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
  List<String> arraytimeFrom = [];
  List<String> arrayTimeTo = [];
  List<String> arrayTotalExper = [];
  bool isCompanyNameSelect = false;
  bool isPositionSelect = false;
  bool isFromSelect = false;
  bool isToSelect = false;
  bool isTotalExperienceSelect = false;

  @override
  void initState() {
    if (widget.workExp == null) {
      addTime(1);
    }else{
      widget.workExp?.forEach((element) {
        final controllerFrom = TextEditingController(text: element.workFrom);
        final fieldFrom = TextField(
          enabled: false,
          controller: controllerFrom,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerFrom.length + 1}",
          ),
        );

        final controllerFieldTo = TextEditingController(text: element.workTo);
        final fieldTo = TextField(
          controller: controllerFieldTo,
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerTo.length + 1}",
          ),
        );
        final controllerPosition = TextEditingController(text: element.position);
        final fieldPosition = TextField(
          controller: controllerPosition,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerPosition.length + 1}",
          ),
        );
        final controllerCompanyName = TextEditingController(text: element.companyName);
        final fieldCompanyName = TextField(
          controller: controllerCompanyName,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerCompanyName.length + 1}",
          ),
        );
        final controllertotalExperience = TextEditingController(text: element.expYearMonth);
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
      });
    }
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
    _controllerFrom.removeAt(unit);
    _controllerTo.removeAt(unit);
    _controllerPosition.removeAt(unit);
    _controllerCompanyName.removeAt(unit);
    _arrayTextfieldFrom.removeAt(unit);
    _arrayTextfieldTo.removeAt(unit);
    _arrayTextfieldPosition.removeAt(unit);
    _arrayTextfieldCompany.removeAt(unit);
    addData();
  }

  DateTime? _selectedDateFrom, _selectedDateTo;
  String calculatedAge = "0 Year 0 month";
  String selectedDate = "MM-YYYY";
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
          isFromSelect = true;
          if (_selectedDateTo != null) {
            LocalDate a = LocalDate.dateTime(_selectedDateFrom!);
            LocalDate b = LocalDate.dateTime(_selectedDateTo!);

            Period diff = b.periodSince(a);
            if (diff.years > -1) {
              calculatedAge = "${diff.years} year ${diff.months} month";
              print(calculatedAge);
              isTotalExperienceSelect = true;
              _controllerTotalExperience[position].text = calculatedAge;

              _controllerCompanyName[position].text = companyName;
              _controllerPosition[position].text = userPosition;

              addData();
            }
          }
        });
      }, currentTime: DateTime.now(), locale: LocaleType.en);
    } else {
      // selectedto = await showMonthYearPicker(
      //     context: context,
      //     firstDate: DateTime(1801),
      //     initialDate: DateTime(2023),
      //     lastDate: DateTime(2023),
      //     locale: Locale('en', 'US'));
      DatePicker.showDatePicker(context,
          showTitleActions: true,
          minTime: thirtyDaysFromNow,
          maxTime: DateTime(2200, 1, 1),
          onChanged: (date) {}, onConfirm: (date) {
        setState(() {
          _selectedDateTo = date;
          isToSelect = true;
          selectedto = DateFormat('dd/MM/yyyy').format(date);
          _controllerTo[position].text = selectedto;
          LocalDate a = LocalDate.dateTime(_selectedDateFrom!);
          LocalDate b = LocalDate.dateTime(_selectedDateTo!);

          Period diff = b.periodSince(a);
          if (diff.years > -1) {
            calculatedAge = "${diff.years} year ${diff.months} month";
            _controllerTotalExperience[position].text = calculatedAge;
            isTotalExperienceSelect = true;
            _controllerCompanyName[position].text = companyName;
            _controllerPosition[position].text = userPosition;

            print(companyName);
            addData();
          }
        });
      }, currentTime: DateTime.now(), locale: LocaleType.en);
    }

    // setState(() {
    //   if (type == "from") {
    //     _selected = selectedfrom;
    //     print(DateFormat().add_yM().format(_selected!));
    //     String selectedDate = DateFormat().add_yM().format(_selected!);
    //     _controllerFrom[position].text = selectedDate.toString();
    //
    //     if (_controllerTo[position].text.isNotEmpty) {
    //
    //       List<String> dateArray = _controllerTo[position].text.split('/');
    //       LocalDate a = LocalDate.dateTime(
    //           DateTime(int.parse(dateArray[1]), int.parse(dateArray[0])));
    //
    //       List<String> dateArray2 =  _controllerFrom[position].text.toString().split('/');
    //       LocalDate b = LocalDate.dateTime( DateTime(int.parse(dateArray2[1]), int.parse(dateArray2[0])));
    //       Period diff = a.periodSince(b);
    //       calculatedAge = '${diff.years} year ${diff.months} month';
    //       print(calculatedAge);
    //       _controllerTotalExperience[position].text=calculatedAge;
    //     }
    //   } else {
    //
    //     print(DateFormat().add_yM().format(selectedto!));
    //     String selectedDate = DateFormat().add_yM().format(selectedto!);
    //     _controllerTo[position].text = selectedDate.toString();
    //     List<String> dateArray = selectedDate.split('/');
    //
    //     LocalDate a = LocalDate.dateTime(
    //         DateTime(int.parse(dateArray[1]), int.parse(dateArray[0])));
    //
    //     List<String> dateArray2 =
    //         _controllerFrom[position].text.toString().split('/');
    //     LocalDate b = LocalDate.dateTime(
    //         DateTime(int.parse(dateArray2[1]), int.parse(dateArray2[0])));
    //     Period diff = a.periodSince(b);
    //     calculatedAge = '${diff.years} year ${diff.months} month';
    //     print(calculatedAge);
    //     _controllerTotalExperience[position].text = calculatedAge;
    //   }
    // });
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
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        AVerticalSpace(12.0.scale()),
        Row(
          children: [
            Text(
              "My Experience",
              style: textStyleCustomColor(14.0.scale(), Colors.black),
            ).align(Alignment.centerLeft),
            AHorizontalSpace(5.0.scale()),
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
        AVerticalSpace(15.0.scale()),
        Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: _formKeydynamic,
                  child: Column(
                    children: [
                      for (int i = 0; i < _controllerFrom.length; i++)
                        Column(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Company Name",
                                      style: textStyleCustomColor(
                                          14.0.scale(), Colors.black),
                                    )
                                        .align(Alignment.centerLeft)
                                        .bottomPadding(5.0.scale())
                                        .topPadding(5.0.scale()),
                                    AHorizontalSpace(5.0.scale()),
                                    GestureDetector(
                                      onTap: () {
                                        if (i > 0) {
                                          remove(i);
                                          setState(() {});
                                        }else{
                                          showSnackBar("Sorry! you can not remove last one", Colors.black, context);
                                        }
                                      },
                                      child: Image.asset(
                                        "assets/images/ic_delete_icon.png",
                                        height: 20.0.scale(),
                                        color: kColorThemePurpleColor,
                                      ),
                                    ),
                                  ],
                                ),
                                AHorizontalSpace(5.0.scale()),
                                Container(
                                  color: Colors.white,
                                  height: 40.0.scale(),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    controller: _controllerCompanyName[i],
                                    autofocus: false,
                                    onChanged: (v) {
                                      if (v.length > 0) {
                                        setState(() {
                                          isCompanyNameSelect = true;
                                        });
                                      } else {
                                        setState(() {
                                          isCompanyNameSelect = false;
                                        });
                                      }
                                    },
                                    cursorColor: KColorTextFieldCommonHint,
                                    decoration: InputDecoration(
                                      hintText: "",
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10.0.scale(),
                                          left: 5.0.scale()),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                AVerticalSpace(5.0.scale()),
                                Text(
                                  "Position",
                                  style: textStyleCustomColor(
                                      14.0.scale(), Colors.black),
                                ).align(Alignment.centerLeft),
                                AVerticalSpace(5.0.scale()),
                                Container(
                                  color: Colors.white,
                                  height: 40.0.scale(),
                                  child: TextField(
                                    controller: _controllerPosition[i],
                                    autofocus: false,
                                    cursorColor: KColorTextFieldCommonHint,
                                    onChanged: (v) {
                                      setState(() {
                                        if (v.length > 0) {
                                          isPositionSelect = true;
                                        } else {
                                          isPositionSelect = false;
                                        }
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "",
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10.0.scale(),
                                          left: 5.0.scale()),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AVerticalSpace(8.0.scale()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
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
                                  child: Text(
                                    "Joining date ",
                                    style: textStyleCustomColor(
                                        14.0.scale(), Colors.black),
                                  ).align(Alignment.centerLeft),
                                ),
                                AHorizontalSpace(5.0.scale()),
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
                                    color: Colors.white,
                                    height: 40.0.scale(),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: _controllerFrom[i],
                                      onChanged: (value) {},
                                      autofocus: false,
                                      style: textStyleCustomColor(
                                          14.0.scale(), kColorDialogNameTitle),
                                      enabled: false,
                                      cursorColor: KColorTextFieldCommonHint,
                                      decoration: InputDecoration(
                                        hintText: "dd/mm/yyyy",
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.only(
                                          bottom: 10.0.scale(),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ).align(Alignment.center),
                                  ).align(Alignment.center),
                                ).expand(),
                              ],
                            ),
                            AVerticalSpace(10.0.scale()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _onPressed(
                                        context: context,
                                        position: i,
                                        type: "To",
                                        companyName:
                                            _controllerCompanyName[i].text,
                                        userPosition:
                                            _controllerPosition[i].text);
                                  },
                                  child: Text(
                                    "Leaving date",
                                    style: textStyleCustomColor(
                                        14.0.scale(), Colors.black),
                                  ).align(Alignment.centerLeft),
                                ),
                                AHorizontalSpace(5.0.scale()),
                                GestureDetector(
                                  onTap: () {
                                    _onPressed(
                                        context: context,
                                        position: i,
                                        type: "To",
                                        companyName:
                                            _controllerCompanyName[i].text,
                                        userPosition:
                                            _controllerPosition[i].text);
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    height: 40.0.scale(),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: _controllerTo[i],
                                      onChanged: (value) {},
                                      autofocus: false,
                                      style: textStyleCustomColor(
                                          14.0.scale(), kColorDialogNameTitle),
                                      enabled: false,
                                      cursorColor: KColorTextFieldCommonHint,
                                      decoration: InputDecoration(
                                        hintText: "dd/MM/yyyy",
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.only(
                                          bottom: 10.0.scale(),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ).align(Alignment.center),
                                  ).align(Alignment.center),
                                ).expand(),
                              ],
                            ),
                            AVerticalSpace(10.0.scale()),
                            Text(
                              "Total Experience",
                              style: textStyleCustomColor(
                                  14.0.scale(), Colors.black),
                            ).align(Alignment.centerLeft),
                            Container(
                              color: Colors.white,
                              height: 40.0.scale(),
                              child: TextField(
                                controller: _controllerTotalExperience[i],
                                autofocus: false,
                                cursorColor: KColorTextFieldCommonHint,
                                decoration: InputDecoration(
                                  hintText: "",
                                  contentPadding: EdgeInsets.only(
                                      bottom: 10.0.scale(), left: 5.0.scale()),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ).expand(),
          ],
        ),
      ],
    );
  }
}

class workLocationContainer extends StatefulWidget {
  BuildContext context1;
  Function addWorkLocationData;
  bool isView;
  List<SupportWorkLocationData> viewWorkLocationArray;

  workLocationContainer(this.context1, this.addWorkLocationData, this.isView,
      this.viewWorkLocationArray);

  @override
  State<workLocationContainer> createState() => workLocationContainerState();
}

class workLocationContainerState extends State<workLocationContainer> {
  final _formKeydynamic = GlobalKey();

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
  bool isLocationSelect = false;

  // @override
  // void initState() {
  //   workarraylocation = widget.viewWorkLocationArray;
  //   for (int i = 0; i < widget.viewWorkLocationArray.length; i++) {
  //     int j = i;
  //     addTime(j + 1);
  //   }
  //
  //   super.initState();
  // }

  // _addTile(int j) {
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
    // _controllerServiceLocat.text = widget.viewWorkLocationArray[j].location;
    final _controllerServiceCity = TextEditingController();
    final fieldCity = TextField(
      controller: _controllerServiceCity,
      enabled: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerCity.length + 1}",
      ),
    );
    // _controllerServiceCity.text = widget.viewWorkLocationArray[j].locationCity;
    final _controllerServiceState = TextEditingController();
    final fieldState = TextField(
      controller: _controllerServiceState,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerState.length + 1}",
      ),
    );
    // _controllerServiceState.text =
    //     widget.viewWorkLocationArray[j].locationState;
    final _controllerServiceCountry = TextEditingController();
    final fieldCountry = TextField(
      controller: _controllerServiceCountry,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerCountry.length + 1}",
      ),
    );
    // _controllerServiceCountry.text =
    //     widget.viewWorkLocationArray[j].locationCountry;
    final controllerServicePostcode = TextEditingController();
    final fieldPostCode = TextField(
      controller: controllerServicePostcode,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerPostcode.length + 1}",
      ),
    );
    // controllerServicePostcode.text =
    //     widget.viewWorkLocationArray[j].locationZipCode;
    final controllerLatitude = TextEditingController();
    final fieldLatitude = TextField(
      controller: controllerLatitude,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerLatitude.length + 1}",
      ),
    );
    // controllerLatitude.text = widget.viewWorkLocationArray[j].locationLatitude;
    final controllerLongitude = TextEditingController();
    final fieldLongitude = TextField(
      controller: controllerLongitude,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "name${_controllerLongitude.length + 1}",
      ),
    );
    // controllerLatitude.text = widget.viewWorkLocationArray[j].locationLongitude;
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
      // int j = i;
      // _addTile(j);
      _addTile();

    }
  }

  @override
  void initState() {

    if (widget.viewWorkLocationArray == null) {
      // for (int i = 0; i < widget.viewWorkLocationArray.length; i++) {
      //   int j = i;
      //   addTime(j + 1);
        addTime(1);
      // }
    }else{
      widget.viewWorkLocationArray?.forEach((element) {
        final _controllerServiceLocat = TextEditingController(text: element.location);
        final fieldServiceLocation = TextField(
          controller: _controllerServiceLocat,
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerServiceLocation.length + 1}",
          ),
        );
        final _controllerServiceCity = TextEditingController(text: element.locationCity);
        final fieldCity = TextField(
          controller: _controllerServiceCity,
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerCity.length + 1}",
          ),
        );
        final _controllerServiceState = TextEditingController(text: element.locationState);
        final fieldState = TextField(
          controller: _controllerServiceState,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerState.length + 1}",
          ),
        );
        final _controllerServiceCountry = TextEditingController(text: element.locationCountry);
        final fieldCountry = TextField(
          controller: _controllerServiceCountry,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerCountry.length + 1}",
          ),
        );
        final controllerServicePostcode = TextEditingController(text: element.locationZipCode);
        final fieldPostCode = TextField(
          controller: controllerServicePostcode,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerPostcode.length + 1}",
          ),
        );
        final controllerLatitude = TextEditingController(text: element.locationLatitude);
        final fieldLatitude = TextField(
          controller: controllerLatitude,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerLatitude.length + 1}",
          ),
        );
        final controllerLongitude = TextEditingController(text: element.locationLongitude);
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
      });
    }
    super.initState();
  }

  // _addTile() {
  //   final controllerFrom = TextEditingController();
  //   final fieldFrom = TextField(
  //     enabled: false,
  //     controller: controllerFrom,
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(),
  //       labelText: "name${_controllerFrom.length + 1}",
  //     ),
  //   );
  //
  //   final controllerFieldTo = TextEditingController();
  //   final fieldTo = TextField(
  //     controller: controllerFieldTo,
  //     enabled: false,
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(),
  //       labelText: "name${_controllerTo.length + 1}",
  //     ),
  //   );
  //   final controllerPosition = TextEditingController();
  //   final fieldPosition = TextField(
  //     controller: controllerPosition,
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(),
  //       labelText: "name${_controllerPosition.length + 1}",
  //     ),
  //   );
  //   final controllerCompanyName = TextEditingController();
  //   final fieldCompanyName = TextField(
  //     controller: controllerCompanyName,
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(),
  //       labelText: "name${_controllerCompanyName.length + 1}",
  //     ),
  //   );
  //   final controllertotalExperience = TextEditingController();
  //   final fieldTotalExperience = TextField(
  //     controller: controllertotalExperience,
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(),
  //       labelText: "name${_controllerTotalExperience.length + 1}",
  //     ),
  //   );
  //   setState(() {
  //     _controllerFrom.add(controllerFrom);
  //     _controllerTo.add(controllerFieldTo);
  //     _controllerPosition.add(controllerPosition);
  //     _controllerCompanyName.add(controllerCompanyName);
  //     _controllerTotalExperience.add(controllertotalExperience);
  //
  //     _arrayTextfieldFrom.add(fieldFrom);
  //     _arrayTextfieldTo.add(fieldTo);
  //     _arrayTextfieldPosition.add(fieldPosition);
  //     _arrayTextfieldCompany.add(fieldCompanyName);
  //     _arrayTextfieldTotalExperience.add(fieldTotalExperience);
  //   });
  // }
  //
  // addTime(int unit) {
  //   for (int i = 0; i < unit; i++) {
  //     _addTile();
  //   }
  // }

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
      addData();
    });
  }

  String calculatedAge = "0 Year 0 month";
  String selectedDate = "MM-YYYY";
  var thirtyDaysFromNow;

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
      isLocationSelect = true;
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
      children: [
        AVerticalSpace(12.0.scale()),
        Row(
          children: [
            Text(
              "Service Location",
              style: textStyleBoldCustomColor(15.0.scale(), Colors.black),
            ).align(Alignment.centerLeft),
            AHorizontalSpace(5.0.scale()),
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
        AVerticalSpace(15.0.scale()),
        Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: _formKeydynamic,
                  child: Column(
                    children: [
                      for (int i = 0;
                          i < _controllerServiceLocation.length;
                          i++)
                        Column(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "location ${i + 1}",
                                      style: textStyleCustomColor(
                                          14.0.scale(), Colors.black),
                                    )
                                        .align(Alignment.centerLeft)
                                        .bottomPadding(5.0.scale())
                                        .topPadding(5.0.scale()),
                                    AHorizontalSpace(5.0.scale()),
                                    GestureDetector(
                                      onTap: () {
                                        if (i > 0) {
                                          removedata(i);
                                        }else{
                                          showSnackBar("Sorry! you can not remove last one", Colors.black, context);
                                        }
                                      },
                                      child: Image.asset(
                                        "assets/images/ic_delete_icon.png",
                                        height: 20.0.scale(),
                                        color: kColorThemePurpleColor,
                                      ),
                                    ),
                                  ],
                                ),
                                AHorizontalSpace(5.0.scale()),
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
                                    color: Colors.white,
                                    height: 40.0.scale(),
                                    child: TextField(
                                      enabled: false,
                                      controller: _controllerServiceLocation[i],
                                      autofocus: false,
                                      style: textStyleCustomColor(
                                          14.0.scale(), kColorDialogNameTitle),
                                      cursorColor: KColorTextFieldCommonHint,
                                      decoration: InputDecoration(
                                        hintText: "",
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.only(
                                            bottom: 10.0.scale(),
                                            left: 5.0.scale()),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  )
                                      .leftPadding(3.0.scale())
                                      .rightPadding(3.0.scale()),
                                ),
                                AVerticalSpace(5.0.scale()),
                                Text(
                                  "City",
                                  style: textStyleCustomColor(
                                      14.0.scale(), Colors.black),
                                ).align(Alignment.centerLeft),
                                AVerticalSpace(5.0.scale()),
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
                                    color: Colors.white,
                                    height: 40.0.scale(),
                                    child: TextField(
                                      enabled: false,
                                      controller: _controllerCity[i],
                                      autofocus: false,
                                      style: textStyleCustomColor(
                                          14.0.scale(), kColorDialogNameTitle),
                                      cursorColor: KColorTextFieldCommonHint,
                                      decoration: InputDecoration(
                                        hintText: "",
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.only(
                                            bottom: 10.0.scale(),
                                            left: 5.0.scale()),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AVerticalSpace(8.0.scale()),
                            GestureDetector(
                              onTap: () {
                                // _onPressed(
                                //     context: context,
                                //     position: i,
                                //     type: "from");
                              },
                              child: Text(
                                "State ",
                                style: textStyleCustomColor(
                                    14.0.scale(), Colors.black),
                              ).align(Alignment.centerLeft),
                            ),
                            AHorizontalSpace(5.0.scale()),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                color: Colors.white,
                                height: 40.0.scale(),
                                child: TextField(
                                  controller: _controllerState[i],
                                  onChanged: (value) {},
                                  autofocus: false,
                                  style: textStyleCustomColor(
                                      14.0.scale(), kColorDialogNameTitle),
                                  enabled: false,
                                  cursorColor: KColorTextFieldCommonHint,
                                  decoration: InputDecoration(
                                    hintText: "",
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 10.0.scale(),
                                        left: 5.0.scale()),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ).align(Alignment.center),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // _onPressed(
                                //     context: context,
                                //     position: i,
                                //     type: "To");
                              },
                              child: Text(
                                "Country ",
                                style: textStyleCustomColor(
                                    14.0.scale(), Colors.black),
                              ).align(Alignment.centerLeft),
                            ),
                            AHorizontalSpace(5.0.scale()),
                            GestureDetector(
                              onTap: () {
                                // _onPressed(
                                //     context: context,
                                //     position: i,
                                //     type: "To");
                              },
                              child: Container(
                                height: 40.0.scale(),
                                color: Colors.white,
                                child: TextField(
                                  controller: _controllerCountry[i],
                                  onChanged: (value) {},
                                  autofocus: false,
                                  style: textStyleCustomColor(
                                      14.0.scale(), kColorDialogNameTitle),
                                  enabled: false,
                                  cursorColor: KColorTextFieldCommonHint,
                                  decoration: InputDecoration(
                                    hintText: "",
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.only(
                                      bottom: 10.0.scale(),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ).align(Alignment.center),
                              ).align(Alignment.center),
                            ),
                            AVerticalSpace(10.0.scale()),
                            Text(
                              "PostCode",
                              style: textStyleCustomColor(
                                  14.0.scale(), Colors.black),
                            ).align(Alignment.centerLeft),
                            Container(
                              height: 40.0.scale(),
                              color: Colors.white,
                              child: TextField(
                                enabled: false,
                                controller: _controllerPostcode[i],
                                autofocus: false,
                                cursorColor: KColorTextFieldCommonHint,
                                style: textStyleCustomColor(
                                    14.0.scale(), kColorDialogNameTitle),
                                decoration: InputDecoration(
                                  hintText: "",
                                  contentPadding: EdgeInsets.only(
                                      bottom: 10.0.scale(), left: 5.0.scale()),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            AVerticalSpace(10.0.scale()),
                            Text(
                              "Latitude",
                              style: textStyleCustomColor(
                                  14.0.scale(), Colors.black),
                            ).align(Alignment.centerLeft),
                            Container(
                              color: Colors.white,
                              height: 40.0.scale(),
                              child: TextField(
                                enabled: false,
                                controller: _controllerLatitude[i],
                                autofocus: false,
                                cursorColor: KColorTextFieldCommonHint,
                                style: textStyleCustomColor(
                                    14.0.scale(), kColorDialogNameTitle),
                                decoration: InputDecoration(
                                  hintText: "",
                                  contentPadding: EdgeInsets.only(
                                      bottom: 10.0.scale(), left: 5.0.scale()),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            AVerticalSpace(10.0.scale()),
                            Text(
                              "Longitude",
                              style: textStyleCustomColor(
                                  14.0.scale(), Colors.black),
                            ).align(Alignment.centerLeft),
                            Container(
                              color: Colors.white,
                              height: 40.0.scale(),
                              child: TextField(
                                enabled: false,
                                controller: _controllerLongitude[i],
                                autofocus: false,
                                cursorColor: KColorTextFieldCommonHint,
                                style: textStyleCustomColor(
                                    14.0.scale(), kColorDialogNameTitle),
                                decoration: InputDecoration(
                                  hintText: "",
                                  contentPadding: EdgeInsets.only(
                                      bottom: 10.0.scale(), left: 5.0.scale()),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ).expand(),
          ],
        ),
      ],
    );
  }
}

class mondayContainerAvailability extends StatefulWidget {
  Function timeAvailableTimeSlotDataMonday;
  List<AvailableTimeData>? monday_data;

  mondayContainerAvailability(
      this.timeAvailableTimeSlotDataMonday, this.monday_data);

  @override
  State<mondayContainerAvailability> createState() =>
      mondayContainerAvailabilityState();
}

class mondayContainerAvailabilityState
    extends State<mondayContainerAvailability> {
  final _formKeydynamic = GlobalKey();

  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<String> arraytimeFrom = [];
  List<String> arrayTimeTo = [];
  List<AvailableTimeData> availableTimeDataArray = [];
  bool isSelectFrom = false;
  bool isSelectTo = false;

  @override
  void initState() {
    if (widget.monday_data == null) {
      addTime(1);
    } else {
      widget.monday_data?.forEach((element) {
        final controllername = TextEditingController(text: element.from);
        final fieldFirst = TextField(
          controller: controllername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerFrom.length + 1}",
          ),
        );
        final controllerLastname = TextEditingController(text: element.to);
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
      });
    }

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
      addData();
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  Future<void> onPressed(
      String from, String to, String type, int position) async {
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
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          addData();
          isSelectFrom = true;
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          isSelectTo = true;
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
      children: [
        Row(
          children: [
            Text(
              "Add More",
              style: textStyleCustomColor(14.0.scale(), Colors.black),
            ).align(Alignment.centerLeft),
            AHorizontalSpace(8.0.scale()),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
              ),
            ),
          ],
        ),
        AVerticalSpace(15.0.scale()),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: _formKeydynamic,
              child: Column(
                children: [
                  for (int i = 0; i < _controllerFrom.length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "from", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerFrom[i],
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              onEditingComplete: () {
                                print("demo");
                              },
                              onChanged: (v) {
                                print(v.length);
                              },
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        Text(
                          "To ",
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black),
                        ).align(Alignment.centerLeft),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "To", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerTo[i],
                              enabled: false,
                              autofocus: false,
                              cursorColor: KColorTextFieldCommonHint,
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            if (i != 0) {
                              _removeTile(i);
                            }else{
                              showSnackBar("Sorry! you can not remove last one", Colors.black, context);
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
                  AVerticalSpace(10.0.scale()),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class tuesdayContainerAvailability extends StatefulWidget {
  Function timeAvailableTimeSlotDataTuesday;
  List<AvailableTimeData>? tuesday_data;

  tuesdayContainerAvailability(
      this.timeAvailableTimeSlotDataTuesday, this.tuesday_data);

  @override
  State<tuesdayContainerAvailability> createState() =>
      tuesdayContainerAvailabilityState();
}

class tuesdayContainerAvailabilityState
    extends State<tuesdayContainerAvailability> {
  final _formKeydynamic = GlobalKey();
  List<AvailableTimeData> availableTimeDataArray = [];
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<String> arraytimeFrom = [];
  List<String> arrayTimeTo = [];
  bool isSelectFrom = false;
  bool isSelectTo = false;

  @override
  void initState() {
    if (widget.tuesday_data == null) {
      addTime(1);
    } else {
      widget.tuesday_data?.forEach((element) {
        final controllername = TextEditingController(text: element.from);
        final fieldFirst = TextField(
          controller: controllername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerFrom.length + 1}",
          ),
        );
        final controllerLastname = TextEditingController(text: element.to);
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
      });
    }

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
      addData();
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  Future<void> onPressed(
      String from, String to, String type, int position) async {
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
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          isSelectFrom = true;
          addData();

          //set the value of text field.
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          //set the value of text field.
          isSelectTo = true;
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
      children: [
        Row(
          children: [
            Text(
              "Add More",
              style: textStyleCustomColor(14.0.scale(), Colors.black),
            ).align(Alignment.centerLeft),
            AHorizontalSpace(8.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
              ),
            ),
          ],
        ),
        AVerticalSpace(15.0.scale()),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: _formKeydynamic,
              child: Column(
                children: [
                  for (int i = 0; i < _controllerFrom.length; i++)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "from", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerFrom[i],
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              decoration: InputDecoration(
                                hintText: "",
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        Text(
                          "To",
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black),
                        ).align(Alignment.centerLeft),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "to", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerTo[i],
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            if (i != 0) {
                              _removeTile(i);
                            }else{
                              showSnackBar("Sorry! you can not remove last one", Colors.black, context);
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
                  AVerticalSpace(10.0.scale()),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class wednesdayContainerAvailability extends StatefulWidget {
  Function timeAvailableTimeSlotDataWednesday;
  List<AvailableTimeData>? wednesday_data;

  wednesdayContainerAvailability(
      this.timeAvailableTimeSlotDataWednesday, this.wednesday_data);

  @override
  State<wednesdayContainerAvailability> createState() =>
      wednesdayContainerAvailabilityState();
}

class wednesdayContainerAvailabilityState
    extends State<wednesdayContainerAvailability> {
  final _formKeydynamic = GlobalKey();
  List<AvailableTimeData> availableTimeDataArray = [];
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<String> arraytimeFrom = [];
  List<String> arrayTimeTo = [];
  bool isSelectFrom = false;
  bool isSelectTo = false;

  @override
  void initState() {
    if (widget.wednesday_data == null) {
      addTime(1);
    } else {
      widget.wednesday_data?.forEach((element) {
        final controllername = TextEditingController(text: element.from);
        final fieldFirst = TextField(
          controller: controllername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerFrom.length + 1}",
          ),
        );
        final controllerLastname = TextEditingController(text: element.to);
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
      });
    }

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
      addData();
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  Future<void> onPressed(
      String from, String to, String type, int position) async {
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
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          isSelectFrom = true;
          addData();

          //set the value of text field.
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          //set the value of text field.
          isSelectTo = true;
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
      children: [
        Row(
          children: [
            Text(
              "Add More",
              style: textStyleCustomColor(14.0.scale(), Colors.black),
            ).align(Alignment.centerLeft),
            AHorizontalSpace(8.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
              ),
            ),
          ],
        ),
        AVerticalSpace(15.0.scale()),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: _formKeydynamic,
              child: Column(
                children: [
                  for (int i = 0; i < _controllerFrom.length; i++)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "from", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerFrom[i],
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              decoration: InputDecoration(
                                hintText: "",
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        Text(
                          "To",
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black),
                        ).align(Alignment.centerLeft),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "to", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerTo[i],
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            if (i != 0) {
                              _removeTile(i);
                            }else{
                              showSnackBar("Sorry! you can not remove last one", Colors.black, context);
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
                  AVerticalSpace(10.0.scale()),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class thursdayContainerAvailability extends StatefulWidget {
  Function timeAvailableTimeSlotDataThursday;
  List<AvailableTimeData>? thursday_data;

  thursdayContainerAvailability(
      this.timeAvailableTimeSlotDataThursday, this.thursday_data);

  @override
  State<thursdayContainerAvailability> createState() =>
      thursdayContainerAvailabilityState();
}

class thursdayContainerAvailabilityState
    extends State<thursdayContainerAvailability> {
  final _formKeydynamic = GlobalKey();
  List<AvailableTimeData> availableTimeDataArray = [];
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<String> arraytimeFrom = [];
  List<String> arrayTimeTo = [];
  bool isSelectFrom = false;
  bool isSelectTo = false;

  @override
  void initState() {
    if (widget.thursday_data == null) {
      addTime(1);
    } else {
      widget.thursday_data?.forEach((element) {
        final controllername = TextEditingController(text: element.from);
        final fieldFirst = TextField(
          controller: controllername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerFrom.length + 1}",
          ),
        );
        final controllerLastname = TextEditingController(text: element.to);
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
      });
    }

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
      addData();
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  Future<void> onPressed(
      String from, String to, String type, int position) async {
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
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          isSelectFrom = true;
          addData();
          //set the value of text field.
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          //set the value of text field.
          isSelectTo = true;
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
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            addTime(1);
          },
          child: Row(
            children: [
              Text(
                "Add More",
                style: textStyleCustomColor(14.0.scale(), Colors.black),
              ).align(Alignment.centerLeft),
              AHorizontalSpace(8.0.scale()),
              Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
              ),
            ],
          ),
        ),
        AVerticalSpace(15.0.scale()),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: _formKeydynamic,
              child: Column(
                children: [
                  for (int i = 0; i < _controllerFrom.length; i++)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "from", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerFrom[i],
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              decoration: InputDecoration(
                                hintText: "",
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        Text(
                          "To",
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black),
                        ).align(Alignment.centerLeft),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "to", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerTo[i],
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            if (i != 0) {
                              _removeTile(i);
                            }else{
                              showSnackBar("Sorry! you can not remove last one", Colors.black, context);
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
                  AVerticalSpace(10.0.scale()),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class fridayContainerAvailability extends StatefulWidget {
  Function timeAvailableTimeSlotDataFriday;
  List<AvailableTimeData>? friday_data;

  fridayContainerAvailability(
      this.timeAvailableTimeSlotDataFriday, this.friday_data);

  @override
  State<fridayContainerAvailability> createState() =>
      fridayContainerAvailabilityState();
}

class fridayContainerAvailabilityState
    extends State<fridayContainerAvailability> {
  final _formKeydynamic = GlobalKey();

  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<String> arraytimeFrom = [];
  List<String> arrayTimeTo = [];
  List<AvailableTimeData> availableTimeDataArray = [];
  bool isSelectFrom = false;
  bool isSelectTo = false;

  @override
  void initState() {
    if (widget.friday_data == null) {
      addTime(1);
    } else {
      widget.friday_data?.forEach((element) {
        final controllername = TextEditingController(text: element.from);
        final fieldFirst = TextField(
          controller: controllername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerFrom.length + 1}",
          ),
        );
        final controllerLastname = TextEditingController(text: element.to);
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
      });
    }

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
      addData();
    });
  }

  Future<void> onPressed(
      String from, String to, String type, int position) async {
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
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          isSelectFrom = true;
          addData();

          //set the value of text field.
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          //set the value of text field.
          isSelectTo = false;
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
      children: [
        Row(
          children: [
            Text(
              "Add More",
              style: textStyleCustomColor(14.0.scale(), Colors.black),
            ).align(Alignment.centerLeft),
            AHorizontalSpace(8.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
              ),
            ),
          ],
        ),
        AVerticalSpace(15.0.scale()),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: _formKeydynamic,
              child: Column(
                children: [
                  for (int i = 0; i < _controllerFrom.length; i++)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "from", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerFrom[i],
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              decoration: InputDecoration(
                                hintText: "",
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        Text(
                          "To",
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black),
                        ).align(Alignment.centerLeft),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "to", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerTo[i],
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            if (i != 0) {
                              _removeTile(i);
                            }else{
                              showSnackBar("Sorry! you can not remove last one", Colors.black, context);
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
                  AVerticalSpace(10.0.scale()),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class saturdayContainerAvailability extends StatefulWidget {
  Function timeAvailableTimeSlotDataSaturday;
  List<AvailableTimeData>? saturday_data;

  saturdayContainerAvailability(
      this.timeAvailableTimeSlotDataSaturday, this.saturday_data);

  @override
  State<saturdayContainerAvailability> createState() =>
      saturdayContainerAvailabilityState();
}

class saturdayContainerAvailabilityState
    extends State<saturdayContainerAvailability> {
  final _formKeydynamic = GlobalKey();
  List<AvailableTimeData> availableTimeDataArray = [];
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<String> arraytimeFrom = [];
  List<String> arrayTimeTo = [];
  bool isSelectFrom = false;
  bool isSelectTo = false;

  @override
  void initState() {
    if (widget.saturday_data == null) {
      addTime(1);
    } else {
      widget.saturday_data?.forEach((element) {
        final controllername = TextEditingController(text: element.from);
        final fieldFirst = TextField(
          controller: controllername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerFrom.length + 1}",
          ),
        );
        final controllerLastname = TextEditingController(text: element.to);
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
      });
    }

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
      addData();
    });
  }

  Future<void> onPressed(
      String from, String to, String type, int position) async {
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
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          isSelectFrom = true;
          addData();

          //set the value of text field.
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          //set the value of text field.
          isSelectTo = true;
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
      children: [
        Row(
          children: [
            Text(
              "Add More",
              style: textStyleCustomColor(14.0.scale(), Colors.black),
            ).align(Alignment.centerLeft),
            AHorizontalSpace(8.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
              ),
            ),
          ],
        ),
        AVerticalSpace(15.0.scale()),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: _formKeydynamic,
              child: Column(
                children: [
                  for (int i = 0; i < _controllerFrom.length; i++)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "from", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerFrom[i],
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              decoration: InputDecoration(
                                hintText: "",
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        Text(
                          "To",
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black),
                        ).align(Alignment.centerLeft),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "to", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerTo[i],
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            if (i != 0) {
                              _removeTile(i);
                            }else{
                              showSnackBar("Sorry! you can not remove last one", Colors.black, context);
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
                  AVerticalSpace(10.0.scale()),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class sundayContainerAvailability extends StatefulWidget {
  Function timeAvailableTimeSlotDataSunday;
  List<AvailableTimeData>? sunday_data;

  sundayContainerAvailability(
      this.timeAvailableTimeSlotDataSunday, this.sunday_data);

  @override
  State<sundayContainerAvailability> createState() =>
      sundayContainerAvailabilityState();
}

class sundayContainerAvailabilityState
    extends State<sundayContainerAvailability> {
  final _formKeydynamic = GlobalKey();
  List<AvailableTimeData> availableTimeDataArray = [];
  List<TextEditingController> _controllerFrom = [];
  List<TextEditingController> _controllerTo = [];
  List<TextField> _arrayTextfieldFrom = [];
  List<TextField> _arrayTextfieldTo = [];
  List<String> arraytimeFrom = [];
  List<String> arrayTimeTo = [];
  bool isSelectFrom = false;
  bool isSelectTo = false;

  @override
  void initState() {
    if (widget.sunday_data == null) {
      addTime(1);
    } else {
      widget.sunday_data?.forEach((element) {
        final controllername = TextEditingController(text: element.from);
        final fieldFirst = TextField(
          controller: controllername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "name${_controllerFrom.length + 1}",
          ),
        );
        final controllerLastname = TextEditingController(text: element.to);
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
      });
    }

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
      addData();
    });
  }

  addTime(int unit) {
    for (int i = 0; i < unit; i++) {
      _addTile();
    }
  }

  Future<void> onPressed(
      String from, String to, String type, int position) async {
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
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      if (type == "from") {
        setState(() {
          _controllerFrom[position].text = formattedTime;
          isSelectFrom = true;
          addData();

          //set the value of text field.
        });
      } else {
        setState(() {
          _controllerTo[position].text = formattedTime;
          //set the value of text field.
          isSelectTo = true;
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
      children: [
        Row(
          children: [
            Text(
              "Add More",
              style: textStyleCustomColor(14.0.scale(), Colors.black),
            ).align(Alignment.centerLeft),
            AHorizontalSpace(8.0.scale()),
            GestureDetector(
              onTap: () {
                addTime(1);
              },
              child: Image.asset(
                "assets/images/ic_add_icon.png",
                height: 20.0.scale(),
              ),
            ),
          ],
        ),
        AVerticalSpace(15.0.scale()),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: _formKeydynamic,
              child: Column(
                children: [
                  for (int i = 0; i < _controllerFrom.length; i++)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "from", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerFrom[i],
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              decoration: InputDecoration(
                                hintText: "",
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        Text(
                          "To",
                          style:
                              textStyleCustomColor(14.0.scale(), Colors.black),
                        ).align(Alignment.centerLeft),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            onPressed(_controllerFrom[i].text,
                                _controllerTo[i].text, "to", i);
                          },
                          child: Container(
                            color: Colors.white,
                            height: 35.0.scale(),
                            child: TextField(
                              controller: _controllerTo[i],
                              style: textStyleCustomColor(
                                  14.0.scale(), kColorDialogNameTitle),
                              autofocus: false,
                              enabled: false,
                              cursorColor: KColorTextFieldCommonHint,
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.0.scale(),
                                    horizontal: 10.0.scale()),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ).expand(),
                        AHorizontalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {
                            if (i != 0) {
                              _removeTile(i);
                            }else{
                              showSnackBar("Sorry! you can not remove last one", Colors.black, context);
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
                  AVerticalSpace(10.0.scale()),
                ],
              ),
            ),
          ],
        ),
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
    getSuggestion(_controller.text);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "AIzaSyAb1vGO92hZfS0oRzq9X9VhDJzz2BcqV0w";
    String type = '(regions)';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&components=country:AU&key=$kPLACES_API_KEY';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      if (this.mounted)
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

        print(_formattedAddress); //diksha
        //  if(typePage!="SignUp"){

        // }

        List<dynamic> datalist = data["results"][1]["address_components"];
        datalist.forEach((element) {
          if (kDebugMode) {
            print(element);
          }

          Map<dynamic, dynamic> jsonMap = element as Map;

          if (jsonMap["types"].toString() == "[postal_code]") {
            // sharedPrefs.postCode = jsonMap["long_name"];
            postCode = jsonMap["long_name"];
          }
          if (jsonMap["types"].toString() ==
              "[administrative_area_level_2, political]") {
            //  sharedPrefs.City = jsonMap["long_name"];
            strCity = jsonMap["long_name"];
          }
          if (jsonMap["types"].toString() ==
              "[administrative_area_level_1, political]") {
            // sharedPrefs.userState = jsonMap["long_name"];
            strState = jsonMap["long_name"];
          }
          if (jsonMap["types"].toString() == "[country, political]") {
            // sharedPrefs.userCountry = jsonMap["long_name"];
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
