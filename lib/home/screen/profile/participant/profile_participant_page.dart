import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/bloc/bloc.dart';
import 'package:ndisparticipant/home/home_navigator.dart';
import 'package:ndisparticipant/home/profile_model/get_user_data_response_model.dart';
import 'package:ndisparticipant/home/profile_model/sup_work_pro_drop_model.dart';
import 'package:ndisparticipant/root/user_repository.dart';
import '../../../../Helpers/theme/theme.dart';
import '../../../../Helpers/utils/network_image_widget.dart';
import '../../../../bottom_navigation/bottom_navigation.dart';
import '../../../model/participant/get_participant_registration_model.dart';

class ProfileParticipantPage extends StatefulWidget {
  @override
  State<ProfileParticipantPage> createState() => _ProfileParticipantPageState();
}

class _ProfileParticipantPageState extends State<ProfileParticipantPage> {
  String selectedServices = "";
  String selectedPlan = "";
  String selectedPlanId = "";
  String selectedRelation = "";
  String selectedRelationId = "";
  String selectedAge = "";
  String selectedpAge = "";
  String selectedAgeId = "";
  String selectedPAgeId = "";
  String selectedContact = "";
  String selectedIdentity = "";
  String selectedIdentityId = "";
  String selectedInterpreted = "Yes";
  late List<WNServices> arrayServices;
  late final List<PlanManaged> planArrayManaged;
  late final List<ParAgeRange> parArrayAgeRange;
  late final List<PaIdentifyAs> parArrayIdentifyAs;
  late final List<RelationWiPar> parArrayrelationWiPar;
  late final List<ContactMethod> parArrayContactMethod;
  var enterpreterRequired = [
    'Yes',
    'No',
  ];
  String responseParticipant = '';
  GetUserProfileData? userProfileDataModel;
  List<Regions>? regions;
  File? _userImage;
  String base64ProImage = "";
  String base64IdProofImage = "";
  String base64CoverImage = "";
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
  TextEditingController pFNameCont = TextEditingController();
  TextEditingController pLNameCont = TextEditingController();
  TextEditingController languageCont = TextEditingController();
  TextEditingController ndisNumberCont = TextEditingController();
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
  final FocusNode _focusNodepFName = FocusNode();
  final FocusNode _focusNodepLName = FocusNode();
  final FocusNode _focusNodepLang = FocusNode();
  final FocusNode _focusNodepNdisNum = FocusNode();
  File? _coverImage;
  File? _idProofImage;
  String addressData='';
  String serviceaddressData='';
  String serviceCity='';
  String serviceState='';
  String serviceCountry='';
  String servicePostal='';
  String serviceLat='';
  String serviceLng='';
  String selectedRegions = "";
  String selectedRegionId = "";
  bool isEdit = false;

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  dataSend(){
    showHideProgress(true);

    BlocProvider.of<HomeBloc>(context).add
      (ProfileParticipantUpdateBtnClick(
      mobileNumber: mobileCont.text,
      user_address: addressData,
      user_city: cityCont.text,
      userState: stateCont.text,
      user_country: countryCont.text,
      user_zip_code: postCont.text,
      user_latitude: latCont.text,
      user_longitude: lngCont.text,
      // password: passwordCont.text,
      password_old: "${userProfileDataModel?.data?.userProfileDetails?.password}",
      user_facebook: fbCont.text,
      user_twitter: twtCont.text,
      user_youtube: youtCont.text,
      user_website: webCont.text,
      profile_image_old: "${userProfileDataModel?.data?.userProfileDetails?.profileImage}",
      cover_photo_old: "${userProfileDataModel?.data?.userProfileDetails?.coverImage}",
      profile_id_proof_old: "${userProfileDataModel?.data?.userProfileDetails?.profileIdProof}",
      profile_image: base64ProImage,
      cover_image: base64CoverImage,
      profile_id_proof: base64IdProofImage,
      w_n_services: selectedServices,
      p_age_range: selectedPAgeId,
      n_p_managed: selectedPlanId,
      service_location: serviceaddressData,
      participant_city: serviceCity,
      participant_state: serviceState,
      participant_country: serviceCountry,
      participant_zip_code: servicePostal,
      participant_latitude: serviceLat,
      participant_longitude: serviceLng,
      relation_w_p: selectedRelationId,
      age_range: selectedAgeId,
      p_contact_method: selectedContact,
      p_identify_as: selectedIdentityId,
      language_spoken: languageCont.text,
      interpreter_r: selectedInterpreted,
      ndis_number: ndisNumberCont.text,
      p_first_name: pFNameCont.text,
      p_last_name: pLNameCont.text,
      aus_region: selectedRegionId,
    ));
  }

  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is ProfileViewParticipantPageState) {

      userProfileDataModel = profileState.userProfileDataModel;
      regions = profileState.allDropData?.data?.regions;

      print("selectedInterpreted_____$selectedInterpreted _____ $enterpreterRequired");
      sharedPrefs.userImage =
      "${userProfileDataModel?.data?.userProfileDetails?.profileImage}";
      addressData = "${userProfileDataModel?.data?.userProfileDetails?.userAddress}";
      selectedInterpreted = "${userProfileDataModel?.data?.userProfileDetails?.interpreterR}";
      serviceaddressData = "${userProfileDataModel?.data?.userProfileDetails?.serviceLocation}";
      cityCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userCity}";
      pFNameCont.text = "${userProfileDataModel?.data?.userProfileDetails?.pFirstName}";
      pLNameCont.text = "${userProfileDataModel?.data?.userProfileDetails?.pLastName}";
      stateCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userState}";
      countryCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userCountry}";
      postCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userZipCode}";
      latCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userLatitude}";
      lngCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userLongitude}";
      mobileCont.text = "${userProfileDataModel?.data?.userProfileDetails?.mobileNumber}";
      fbCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userFacebook}";
      twtCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userTwitter}";
      youtCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userYoutube}";
      webCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userWebsite}";
      pFNameCont.text = "${userProfileDataModel?.data?.userProfileDetails?.pFirstName}";
      pLNameCont.text = "${userProfileDataModel?.data?.userProfileDetails?.pLastName}";
      languageCont.text = "${userProfileDataModel?.data?.userProfileDetails?.languageSpoken}";
      ndisNumberCont.text = "${userProfileDataModel?.data?.userProfileDetails?.ndisNumber}";
      selectedRegions = "${userProfileDataModel?.data?.userProfileDetails?.australianRegionsName}";
      selectedRegionId = "${userProfileDataModel?.data?.userProfileDetails?.australianRegions}";
      selectedServices = "${userProfileDataModel?.data?.userProfileDetails?.wNServices}";
      selectedPlan = "${userProfileDataModel?.data?.userProfileDetails?.nPManaged}";
      selectedPlanId = "${userProfileDataModel?.data?.userProfileDetails?.nPManagedId}";
      selectedRelation = "${userProfileDataModel?.data?.userProfileDetails?.relationWP}";
      selectedRelationId = "${userProfileDataModel?.data?.userProfileDetails?.relationWPId}";
      selectedAge = "${userProfileDataModel?.data?.userProfileDetails?.ageRange}";
      selectedpAge = "${userProfileDataModel?.data?.userProfileDetails?.pAgeRange}";
      selectedAgeId = "${userProfileDataModel?.data?.userProfileDetails?.ageRangeId}";
      selectedPAgeId = "${userProfileDataModel?.data?.userProfileDetails?.pAgeRangeId}";
      selectedContact = "${userProfileDataModel?.data?.userProfileDetails?.pContactMethod}";
      selectedIdentity = "${userProfileDataModel?.data?.userProfileDetails?.pIdentifyAs}";
      selectedIdentityId = "${userProfileDataModel?.data?.userProfileDetails?.pIdentifyAsId}";
      planArrayManaged = profileState.participateInfoData!.planManaged;
      parArrayAgeRange = profileState.participateInfoData!.parAgeRange;
      parArrayIdentifyAs = profileState.participateInfoData!.paIdentifyAs;
      parArrayrelationWiPar = profileState.participateInfoData!.relationWiPar;
      arrayServices = profileState.participateInfoData!.wNServices;
      parArrayContactMethod = profileState.participateInfoData!.contactMethod;
    }

    super.initState();
  }

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
          // base64ProImage = "data:image/png;base64," + base64Encode(bytes);
          base64ProImage =  base64Encode(bytes);
          log("base64ProImage=====$base64ProImage");

        } else if (imageType == "cover") {
          _coverImage = File(pickedFile.path);
          final bytes = File(pickedFile.path).readAsBytesSync();
          // base64CoverImage = "data:image/png;base64," + base64Encode(bytes);
          base64CoverImage =  base64Encode(bytes);
        } else if (imageType == "id") {
          _idProofImage = File(pickedFile.path);
          final bytes = File(pickedFile.path).readAsBytesSync();
          // base64IdProofImage = "data:image/png;base64," + base64Encode(bytes);
          base64IdProofImage =  base64Encode(bytes);
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
        base64IdProofImage = "${base64Encode(bytes)}";
      }
    });
  }

  getFullAddress(screen) async{
    if(screen == "participant"){
      if(UserRepository.profile_lattitude =='' || UserRepository.profile_longitude ==''){
        UserRepository.profile_lattitude= "0.0";
        UserRepository.profile_longitude= "0.0";
      }

      if ((addressData != "" || addressData != null)
          && (UserRepository.profile_lattitude!= "0.0" || UserRepository.profile_longitude!= "0.0")
      ) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            double.parse(UserRepository.profile_lattitude),
            double.parse(UserRepository.profile_longitude));

        addressData = UserRepository.profile_address!;
        latCont.text = UserRepository.profile_lattitude;
        lngCont.text = UserRepository.profile_longitude;
        cityCont.text = placemarks.first.locality??'';
        postCont.text = placemarks.first.postalCode??'';
        countryCont.text = placemarks.first.country??'';
        stateCont.text = placemarks.first.administrativeArea??'';
      }else{
        addressData = "Select Location";
        cityCont.text = "";
        stateCont.text = "";
        countryCont.text = "";
        postCont.text = "";
        latCont.text = "";
        lngCont.text = "";
      }
    }
    else if(screen == "participant_service"){
      if(UserRepository.parti_service_lattitude =='' || UserRepository.parti_service_longitude ==''){
        UserRepository.parti_service_lattitude= "0.0";
        UserRepository.parti_service_longitude= "0.0";
      }

      if ((serviceaddressData != "" || serviceaddressData != null)
          && (UserRepository.parti_service_lattitude != "0.0" ||
              UserRepository.parti_service_longitude != "0.0")
      ) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            double.parse(UserRepository.parti_service_lattitude),
            double.parse(UserRepository.parti_service_longitude));

        serviceaddressData = UserRepository.parti_service_location!;
        serviceLat = UserRepository.parti_service_lattitude;
        serviceLng = UserRepository.parti_service_longitude;
        serviceCity = placemarks.first.locality??'';
        servicePostal = placemarks.first.postalCode??'';
        serviceCountry = placemarks.first.country??'';
        serviceState = placemarks.first.administrativeArea??'';
        print("service_location_is_______$serviceCity $serviceState $serviceCountry $servicePostal "
            "$serviceLat $serviceLng");
      }else{
        serviceaddressData = "Select Location";
      }

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
        }
        if (state is HomeerrorloadingState) {
          showHideProgress(false);
          showSnackBar(state.message, Colors.red, context);
        }
        if (state is ParticipantSearchLocationState) {
          Navigator.of(context).pushNamed(HomeNavigator.hLocationSearch).then((value) => value != null ?
          getFullAddress(state.screen) : null);
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
              actions: [
                InkWell(
                  highlightColor: kColorThemePurpleColor,
                  onTap: () {
                    setState(() {
                      isEdit = true;
                    });
                  },
                  child: Text(
                    isEdit == true ? "" : "Edit Profile",
                    style: textStyleBoldCustomColor(12, Colors.white),
                  ).rightPadding(10.0.scale()).topPadding(15.0.scale()),
                ),
              ],
              leading: InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(ProfileParticipantEventBackBtnClick());
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white)
                      .leftPadding(25.0.scale()))),
            body: isEdit == true ? update_profile_data() : show_profile_data()
        ),
      ),
    );
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
                leftText: "Address",
                rightWidget: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(HomeSearchLocationCityBtnClick('participant'));
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
                      addressData ==''? "Select Location": addressData,
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
                          selectedRegionId = newValue.id!;
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
                leftText: "Who needs services",
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
                    child: DropdownButton<WNServices>(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: arrayServices
                          .map<DropdownMenuItem<WNServices>>((WNServices items) {
                        return DropdownMenuItem<WNServices>(
                          value: items,
                          child: Text(
                            "${items.wNServicesName}",
                            style: textStyleCustomColor(
                              14.0.scale(),
                              Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (WNServices? newValue) {
                        setState(() {
                          selectedServices = newValue!.wNServicesName!;
                          print("selectedServices__${selectedServices}");
                        });
                      },
                      hint: Text(selectedServices,
                          style:
                          textStyleCustomColor(14.0.scale(), Colors.black)),
                    ),
                  ),
                ),
              ),

              if(selectedServices != 'Myself')
             Column(
               children: [
                 custom_row_data(
                     leftText: "Participant First Name",
                     rightWidget: customTextField(
                         textController: pFNameCont,
                         focus: _focusNodepFName,
                         hint: "Participant First Name")),
                 custom_row_data(
                     leftText: "Participant Last Name",
                     rightWidget: customTextField(
                         textController: pLNameCont,
                         focus: _focusNodepLName,
                         hint: "Participant Last Name")),
                 custom_row_data(
                   leftText: "Relationship with the participant",
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
                       child: DropdownButton<RelationWiPar>(
                         isExpanded: true,
                         icon: Icon(Icons.keyboard_arrow_down),
                         items: parArrayrelationWiPar
                             .map<DropdownMenuItem<RelationWiPar>>((RelationWiPar items) {
                           return DropdownMenuItem<RelationWiPar>(
                             value: items,
                             child: Text(
                               "${items.relationWiParName}",
                               style: textStyleCustomColor(
                                 14.0.scale(),
                                 Colors.black,
                               ),
                             ),
                           );
                         }).toList(),
                         onChanged: (RelationWiPar? newValue) {
                           setState(() {
                             selectedRelation = newValue!.relationWiParName!;
                             selectedRelationId = newValue.relationWiParId!;
                             print("selectedRelation__${selectedRelation}");
                             print("selectedRelationId...... ${selectedRelationId}");
                           });
                         },
                         hint: Text(selectedRelation,
                             style:
                             textStyleCustomColor(14.0.scale(), Colors.black)),
                       ),
                     ),
                   ),
                 ),
               ],
             ),

              if(selectedServices == 'Myself')
               Column(
                 children: [
                   structured_row_data(
                       leftText: "First Name",
                       rightText:
                       "${userProfileDataModel?.data?.userProfileDetails?.firstName}"),
                   structured_row_data(
                       leftText: "Last Name",
                       rightText:
                       "${userProfileDataModel?.data?.userProfileDetails?.lastName}"),
                   structured_row_data(
                       leftText: "Email Address",
                       rightText:
                       "${userProfileDataModel?.data?.userProfileDetails?.emailId}"),
                   structured_row_data(
                       leftText: "Mobile Number",
                       rightText:
                       "${userProfileDataModel?.data?.userProfileDetails?.mobileNumber}"),
                 ],
               ),

              custom_row_data(
                leftText: "How is your NDIS plan managed?",
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
                    child: DropdownButton<PlanManaged>(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: planArrayManaged
                          .map<DropdownMenuItem<PlanManaged>>((PlanManaged items) {
                        return DropdownMenuItem<PlanManaged>(
                          value: items,
                          child: Text(
                            "${items.planManName}",
                            style: textStyleCustomColor(
                              14.0.scale(),
                              Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (PlanManaged? newValue) {
                        setState(() {
                          selectedPlan = newValue!.planManName!;
                          selectedPlanId = newValue.planManagedId!;
                          print("selectedPlan__${selectedPlan}");
                          print("selectedPlan ${selectedPlanId}");
                        });
                      },
                      hint: Text(selectedPlan,
                          style:
                          textStyleCustomColor(14.0.scale(), Colors.black)),
                    ),
                  ),
                ),
              ),
              custom_row_data(
                leftText: "Your Service location",
                rightWidget: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(HomeSearchLocationCityBtnClick('participant_service'));
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
                      serviceaddressData ==''? "Select Location": serviceaddressData,
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
                leftText: "Age Range",
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
                    child: DropdownButton<ParAgeRange>(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: parArrayAgeRange
                          .map<DropdownMenuItem<ParAgeRange>>((ParAgeRange items) {
                        return DropdownMenuItem<ParAgeRange>(
                          value: items,
                          child: Text(
                            "${items.ageRangeName}",
                            style: textStyleCustomColor(
                              14.0.scale(),
                              Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (ParAgeRange? newValue) {
                        setState(() {

                          if(selectedServices == 'Myself'){
                            selectedpAge = newValue!.ageRangeName!;
                            selectedPAgeId = newValue.ageRangeId!;
                          }else{
                            selectedAge = newValue!.ageRangeName!;
                            selectedAgeId = newValue.ageRangeId!;
                          }

                          print("selectedAge......${selectedAge}");
                          print("selectedAgeid...... ${selectedAgeId}");
                        });
                      },
                      hint: Text(selectedServices == 'Myself'? selectedpAge: selectedAge,
                          style:
                          textStyleCustomColor(14.0.scale(), Colors.black)),
                    ),
                  ),
                ),
              ),
              custom_row_data(
                leftText: "Prefer Contact Method",
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
                    child: DropdownButton<ContactMethod>(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: parArrayContactMethod
                          .map<DropdownMenuItem<ContactMethod>>((ContactMethod items) {
                        return DropdownMenuItem<ContactMethod>(
                          value: items,
                          child: Text(
                            "${items.contactMethodName}",
                            style: textStyleCustomColor(
                              14.0.scale(),
                              Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (ContactMethod? newValue) {
                        setState(() {
                          selectedContact = newValue!.contactMethodName!;
                          print("selectedContact......${selectedContact}");
                        });
                      },
                      hint: Text(selectedContact,
                          style:
                          textStyleCustomColor(14.0.scale(), Colors.black)),
                    ),
                  ),
                ),
              ),
              custom_row_data(
                leftText: "Participant Identify as",
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
                    child: DropdownButton<PaIdentifyAs>(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: parArrayIdentifyAs
                          .map<DropdownMenuItem<PaIdentifyAs>>((PaIdentifyAs items) {
                        return DropdownMenuItem<PaIdentifyAs>(
                          value: items,
                          child: Text(
                            "${items.paIdentifyAsName}",
                            style: textStyleCustomColor(
                              14.0.scale(),
                              Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (PaIdentifyAs? newValue) {
                        setState(() {
                          selectedIdentity = newValue!.paIdentifyAsName!;
                          selectedIdentityId = newValue.paIdentifyAsId!;
                          print("selectedIdentity......${selectedIdentity}");
                          print("selectedIdentityid...... ${selectedIdentityId}");
                        });
                      },
                      hint: Text(selectedIdentity,
                          style:
                          textStyleCustomColor(14.0.scale(), Colors.black)),
                    ),
                  ),
                ),
              ),
              custom_row_data(
                  leftText: "language is spoken at home",
                  rightWidget: customTextField(
                      textController: languageCont,
                      focus: _focusNodepLang,
                      hint: "Enter Language")),

              custom_row_data(
                leftText: "Interpreter required",
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
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: enterpreterRequired
                          .map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            "${items}",
                            style: textStyleCustomColor(
                              14.0.scale(),
                              Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedInterpreted = newValue!;
                        });
                      },
                      hint: Text(selectedInterpreted,
                          style:
                          textStyleCustomColor(14.0.scale(), Colors.black)),
                    ),
                  ),
                ),
              ),
              custom_row_data(
                  leftText: "NDIS Number",
                  rightWidget: customTextField(
                      textController: ndisNumberCont,
                      focus: _focusNodepNdisNum,
                      hint: "Enter Ndis number (If applicable)")),

              ARoundedButton(
                btnBgColor: kColorThemePurpleColor,
                btnTextColor: Colors.white,
                btnOnPressed: () {
                  dataSend();
                  ///need to work on it
                  // BlocProvider.of<HomeBloc>(context).add
                  //   (ProfileParticipantUpdateBtnClick(
                  //               user_id: userProfData!.data.participantUser.userId,
                  //               password: "",
                  //               language_spoken: _textFiledUserLanguage!.text,
                  //               interpreter_r: selectedInterpreted,
                  //               p_identify_as: selectedParticipantIdentify,
                  //               ndis_number: _textFiledUserNDISNumber!.text,
                  //               p_contact_method: selectedContactMethod,
                  //               relation_w_p: selectedRelationParticipant,
                  //               n_p_managed: selectedNDISPlanManaged,
                  //               w_n_services: selectedServices,
                  //               p_age_range: selectedParticipateAgeRange,
                  //               mobileNumber: mobileNumber!,
                  //               service_location: "",
                  //               cover_image: base64CoverImage.toString(),
                  //               age_range: "",
                  //               participant_city: "",
                  //               user_zip_code: "",
                  //               participant_country: "",
                  //               participant_latitude: "",
                  //               participant_longitude: "",
                  //               participant_state: "",
                  //               participant_zip_code: "",
                  //               password_old: "",
                  //               profile_id_proof: base64IdProofImage.toString(),
                  //               profile_image: base64ProImage.toString(),
                  //               user_address: "",
                  //               user_city: "",
                  //               user_country: "",
                  //               user_facebook: "",
                  //               user_latitude: "",
                  //               user_longitude: "",
                  //               user_twitter: "",
                  //               user_website: "",
                  //               user_youtube: "",
                  //               userState: "",
                  //             ));
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
          )
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
            //     "${userProfileDataModel?.data?.userProfileDetails?.password}"),
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
                leftText: "Website ",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.userWebsite}"),

            structured_row_data(
                leftText: "Who needs services",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.wNServices}"),
            structured_row_data(
                leftText: "Participant First Name",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.pFirstName}"),
            structured_row_data(
                leftText: "Participant Last Name",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.pLastName}"),
            structured_row_data(
                leftText: "How is your NDIS plan managed?",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.nPManaged}"),
            structured_row_data(
                leftText: "Your Service location",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.serviceLocation}"),
            structured_row_data(
                leftText: "Relationship with the participant",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.relationWP}"),

            "${userProfileDataModel?.data?.userProfileDetails?.wNServices}" != "Myself"?
            structured_row_data(
                leftText: "Age Range",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.ageRange}"):
            structured_row_data(
                leftText: "Participant Age Range",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.pAgeRange}"),

            structured_row_data(
                leftText: "Prefer Contact Method",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.pContactMethod}"),
            structured_row_data(
                leftText: "Participant Identify as",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.pIdentifyAs}"),
            structured_row_data(
                leftText: "language is spoken at home",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.languageSpoken}"),
            structured_row_data(
                leftText: "Interpreter required",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.interpreterR}"),
            structured_row_data(
                leftText: "NDIS Number",
                rightText:
                "${userProfileDataModel?.data?.userProfileDetails?.ndisNumber}"),

          ],
        ),
      ),
    );
  }

  Widget structured_row_data(
      {required String leftText, required String rightText, bool? isImage, Color? textClr}) {
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
                style: textStyleBoldCustomColor(13, textClr??Colors.black),
              ),
            ),
          ],
        ),
        AVerticalSpace(10.0.scale()),
        if(leftText != "NDIS Number")
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
        if(leftText != "NDIS Number")
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
