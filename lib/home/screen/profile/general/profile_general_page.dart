import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndisparticipant/Helpers/services/shared_preferences.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/home.dart';
import 'package:ndisparticipant/root/user_repository.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_event.dart';
import '../../../profile_model/get_user_data_response_model.dart';
import '../../../profile_model/sup_work_pro_drop_model.dart';

class ProfileGeneralUserPage extends StatefulWidget {
  @override
  State<ProfileGeneralUserPage> createState() => _ProfileGeneralUserPageState();
}
class _ProfileGeneralUserPageState extends State<ProfileGeneralUserPage> {

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  File? _userImage;
  File? _coverImage;
  String base64CoverImage = "";
  File? _idProofImage;
  String base64IdImage = "";
  String addressData='';
  String base64ProImage = "";
  String selectedRegions = "";
  String selectedRegionId = "";
  var bytes;
  GetUserProfileData? userProfileDataModel;
  String? address;
  bool isEdit = false;
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
  List<Regions>? regions;

  dataSend(){
    showHideProgress(true);
    BlocProvider.of<HomeBloc>(context).add(ProfileGeneralUpdateBtnClick(
      mobileNumber: mobileCont.text,
      userLongitude: lngCont.text,
      userLatitude: latCont.text,
      userCity: cityCont.text,
      userState: stateCont.text,
      userAddress: addressData,
      passwordOld: "${userProfileDataModel?.data?.userProfileDetails?.password}",
      coverImage: base64CoverImage,
      profileIdProof: base64IdImage,
      profileImage: base64ProImage,
      userCountry: countryCont.text,
      userFacebook: fbCont.text,
      userTwitter: twtCont.text,
      userWebsite: webCont.text,
      userYoutube: youtCont.text,
      userzipCode: postCont.text,
      region: selectedRegionId,
      profileImageId: "${userProfileDataModel?.data?.userProfileDetails?.profileImage}",
      coverImageId: "${userProfileDataModel?.data?.userProfileDetails?.coverImage}",
      profileIdProofId: "${userProfileDataModel?.data?.userProfileDetails?.profileIdProof}",
    ));
  }

  @override
  void initState() {
    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is ProfileViewGeneralPageState) {

      userProfileDataModel = profileState.userProfileDataModel;
      regions = profileState.allDropData?.data?.regions;
      sharedPrefs.userImage =
      "${userProfileDataModel?.data?.userProfileDetails?.profileImage}";
      addressData = "${userProfileDataModel?.data?.userProfileDetails?.userAddress}";
      cityCont.text = "${userProfileDataModel?.data?.userProfileDetails?.userCity}";
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
      selectedRegions = "${userProfileDataModel?.data?.userProfileDetails?.australianRegionsName}";
      selectedRegionId = "${userProfileDataModel?.data?.userProfileDetails?.australianRegions}";
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
          base64ProImage = base64Encode(bytes);
        } else if (imageType == "cover") {
          _coverImage = File(pickedFile.path);
          final bytes = File(pickedFile.path).readAsBytesSync();
          base64CoverImage =  base64Encode(bytes);
        } else if (imageType == "id") {
          _idProofImage = File(pickedFile.path);
          final bytes = File(pickedFile.path).readAsBytesSync();
          base64IdImage =  base64Encode(bytes);
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

  getFullAddress() async{
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          if (state is ProfileSearchLocationPageState) {
            Navigator.of(context).pushNamed(HomeNavigator.hLocationSearch).then((value) => value != null ?
            getFullAddress() : null);
          }

          if (state is ProfileInitial) {
            showHideProgress(false);
            Navigator.of(context).pop();
          }
          if (state is HomeerrorloadingState) {
            showHideProgress(false);
            showSnackBar(state.message, Colors.red, context);
          }
        },
        child: SafeArea(
          bottom: false,
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
                          .add(ProfileEventBackBtnClick(""));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30.0.scale(),
                    ))
            ),
            body: isEdit == true ? update_profile_data() : show_profile_data()

          ),
        ));
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
                  BlocProvider.of<HomeBloc>(context).add(HomeSearchLocationCityBtnClick('general'));
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
            structured_row_data(leftText: "Profile Link", rightText:
            "${userProfileDataModel?.data?.userProfileDetails?.profileLink}",
                textClr: Colors.blue
            ),
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
        if(leftText != "Website")
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
          if(leftText != "Website")
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
