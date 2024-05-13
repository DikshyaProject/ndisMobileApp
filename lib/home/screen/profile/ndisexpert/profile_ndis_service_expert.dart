import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndisparticipant/Helpers/utils/network_image_widget.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import 'package:ndisparticipant/components/components.dart';
import 'package:ndisparticipant/home/home.dart';

import '../../../../Helpers/services/shared_preferences.dart';
import '../../../../Helpers/theme/theme.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_event.dart';
import '../../../profile_model/get_user_data_response_model.dart';

class ProfileNdisServiceExpert extends StatefulWidget {
  @override
  State<ProfileNdisServiceExpert> createState() =>
      _ProfileNdisServiceExpertState();
}

class _ProfileNdisServiceExpertState extends State<ProfileNdisServiceExpert> {
  TextEditingController? _textFiledUserName;

  TextEditingController? _textFiledLastName;

  TextEditingController? _textFiledEmailId;

  TextEditingController? _textFiledPassword;

  TextEditingController? _textFiledMobileNumber;
  TextEditingController? _textFiledLocation;

  TextEditingController? _textFiledFacebook;
  TextEditingController? _textFiledTwitter;
  TextEditingController? _textFiledYoutube;
  TextEditingController? _textFiledWebsite;

  final focusUserName = FocusNode();
  final focusLastName = FocusNode();
  final focusEmailId = FocusNode();
  final focusPassword = FocusNode();
  final focusfiledFacebook = FocusNode();
  final focusfiledTwitter = FocusNode();
  final focusfiledYouTube = FocusNode();
  final focusfiledWebsite = FocusNode();
  final focusLocation = FocusNode();
  final focusMobileNumber = FocusNode();
  String strPathProfile = "Select";
  String strIdProof = "Select";
  String strCoverImage = "Select";
  File? _userImage;
  File? _userIdProofImage;
  File? _userCoverImage;
  String? base64ProImage = "";
  String? base64IdProofImage = "";
  String? base64CoverImage = "";
  var bytes;
  GetUserProfileData? userProfileDataModel;
  NdisRegistrationResponseModel? ndisExpertRegisterResponseModel;
  String? strJoindate;
  String? strVerified;
  String? strPremium;


  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  @override
  void initState() {
    _textFiledUserName = TextEditingController();
    _textFiledLastName = TextEditingController();
    _textFiledEmailId = TextEditingController();
    _textFiledMobileNumber = TextEditingController();
    _textFiledPassword = TextEditingController();
    _textFiledLocation = TextEditingController();

    _textFiledFacebook = TextEditingController();
    _textFiledTwitter = TextEditingController();
    _textFiledWebsite = TextEditingController();
    _textFiledYoutube = TextEditingController();

    HomeState profileState = BlocProvider.of<HomeBloc>(context).state;
    if (profileState is ProfileViewServiceExpertPageState) {
      userProfileDataModel = profileState.userProfileDataModel;

      _textFiledUserName!.text =
          "${userProfileDataModel?.data?.userProfileDetails?.firstName}";
      _textFiledEmailId!.text =
          "${userProfileDataModel?.data?.userProfileDetails?.emailId}";
      _textFiledMobileNumber!.text =
          "${userProfileDataModel?.data?.userProfileDetails?.mobileNumber}";
      _textFiledLocation!.text =
          "${userProfileDataModel?.data?.userProfileDetails?.serviceLocation}";
      _textFiledFacebook!.text =
          "${userProfileDataModel?.data?.userProfileDetails?.userFacebook}";
      _textFiledTwitter!.text =
          "${userProfileDataModel?.data?.userProfileDetails?.userTwitter}";
      _textFiledWebsite!.text =
          "${userProfileDataModel?.data?.userProfileDetails?.userWebsite}";
      _textFiledYoutube!.text =
          "${userProfileDataModel?.data?.userProfileDetails?.userYoutube}";
      strJoindate =
          "${userProfileDataModel?.data?.userProfileDetails?.userCdt}";

      if ("${userProfileDataModel?.data?.userProfileDetails?.verificationStatus}" ==
          "1") {
        strVerified = "Yes";
      } else {
        strVerified = "No";
      }
    }
    super.initState();
  }

  void _showPicker(context, String imageType) {
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
                            _imgFromGallery(imageType);
                            Navigator.of(context).pop();
                          }),
                      ListTile(
                        leading: new Icon(Icons.photo_camera),
                        title: new Text('Camera'),
                        onTap: () {
                          _imgFromCamera(imageType);
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

  _imgFromGallery(String type) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        // sharedPrefs.setUserProfileImage = "";
        if (type == "profile") {
          _userImage = File(pickedFile.path);

          final bytes = File(pickedFile.path).readAsBytesSync();
          base64ProImage = "data:image/png;base64," + base64Encode(bytes);
          print(base64ProImage.toString());
          strPathProfile = pickedFile.path;
        } else if (type == "profile_id_proof") {
          _userIdProofImage = File(pickedFile.path);

          final bytes = File(pickedFile.path).readAsBytesSync();
          base64IdProofImage = "data:image/png;base64," + base64Encode(bytes);
          print(base64IdProofImage.toString());
          strIdProof = pickedFile.path;
        } else if (type == "coverimage") {
          _userCoverImage = File(pickedFile.path);

          final bytes = File(pickedFile.path).readAsBytesSync();
          base64CoverImage = "data:image/png;base64," + base64Encode(bytes);
          print(base64IdProofImage.toString());
          strCoverImage = pickedFile.path;
        }

        print(pickedFile.path);
      });
    }
  }

  _imgFromCamera(String type) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      // sharedPrefs.setUserProfileImage = "";
      if (type == "profile") {
        _userImage = File(pickedFile!.path);
        final bytes = File(pickedFile.path).readAsBytesSync();
        base64ProImage = "data:image/jpeg;base64," + base64Encode(bytes);

        strPathProfile = pickedFile.path;
      } else if (type == "profile_id_proof") {
        _userIdProofImage = File(pickedFile!.path);
        final bytes = File(pickedFile.path).readAsBytesSync();
        base64IdProofImage = "data:image/jpeg;base64," + base64Encode(bytes);

        strIdProof = pickedFile.path;
      } else if (type == "coverimage") {
        _userCoverImage = File(pickedFile!.path);

        final bytes = File(pickedFile.path).readAsBytesSync();
        base64CoverImage = "data:image/png;base64," + base64Encode(bytes);
        print(base64IdProofImage.toString());
        strCoverImage = pickedFile.path;
      }
    });
  }

  String? address;
  String? city;
  String? state;
  String? country;
  String? postCode;

  @override
  Widget build(BuildContext context) {
    setState(() {
      address = sharedPrefs.addressLocation;
      if (address == "") {
        address = "Select";
        city = "";
        state = "";
        country = "";
        postCode = "";
      } else {
        address = sharedPrefs.addressLocation;
        city = sharedPrefs.City;
        state = sharedPrefs.userState;
        country = sharedPrefs.userCountry;
        postCode = sharedPrefs.postCode;
      }
    });
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          if (state is ProfileSearchLocationPageState) {
            Navigator.of(context)
                .pushNamed(HomeNavigator.locationSearchProfilePage);
          }
          if (state is ProfileUserDataPageErrorState) {
            showSnackBar(state.message!, Colors.red, context);
            BlocProvider.of<HomeBloc>(context)
                .add(ProfileEventDashboardPageBack());
          }
          if (state is ProfileInitial) {
             
            Navigator.of(context).pop();
          }
        },
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: false,
                elevation: 0,
                leading: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(ProfileEventBackBtnClick(""));
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black)
                        .leftPadding(25.0.scale()))),
            body: Column(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        if (_userImage == null)
                          CircleAvatar(
                            radius: 55.0.scale(),
                            backgroundColor: kColorAppBgColor,
                            child: sharedPrefs.getUserProfileImage != ""
                                ? Container(
                                    width: 100.0.scale(),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: NetworkImagesWidgets(
                                        url: sharedPrefs.getUserProfileImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      "${imgPathGeneral}ic_profile_icon.png",
                                      color: kColorThemeDarkGreenColor,
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                          ).align(Alignment.center)
                        else
                          CircleAvatar(
                            radius: 55.0.scale(),
                            backgroundColor: kColorAppBgColor,
                            child: sharedPrefs.getUserProfileImage != ""
                                ? Container(
                                    width: 100.0.scale(),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: NetworkImagesWidgets(
                                        url: sharedPrefs.getUserProfileImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image(
                                      height: 100.0,
                                      width: 100.0,
                                      fit: BoxFit.cover,
                                      image: FileImage(_userImage!),
                                    ),
                                  ),
                          ).align(Alignment.center),
                        GestureDetector(
                          onTap: () {
                            _showPicker(context, "profile");
                          },
                          child: Image.asset(
                            "${imgPathGeneral}ic_gallery_icon.png",
                            color: kColorThemeDarkGreenColor,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        Text(
                          "First name",
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(focusUserName);
                          },
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              focusNode: focusUserName,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                              textInputAction: TextInputAction.next,
                              controller: _textFiledUserName,
                              keyboardType: TextInputType.emailAddress,
                              onEditingComplete: () {},
                              onChanged: (value) {},
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(focusUserName);
                              },
                              autofocus: true,
                              cursorColor: kColorDialogNameTitle,
                            ),
                          ),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Email Id',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(focusEmailId);
                          },
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              focusNode: focusEmailId,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                              textInputAction: TextInputAction.next,
                              controller: _textFiledEmailId,
                              keyboardType: TextInputType.emailAddress,
                              onEditingComplete: () {},
                              onChanged: (value) {},
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(focusEmailId);
                              },
                              autofocus: true,
                              cursorColor: kColorDialogNameTitle,
                            ),
                          ),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Mobile Number',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(focusMobileNumber);
                          },
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              focusNode: focusMobileNumber,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                                contentPadding: EdgeInsets.only(
                                    top: 10.0.scale(), left: 5.0.scale()),
                              ),
                              textInputAction: TextInputAction.next,
                              controller: _textFiledMobileNumber,
                              maxLines: 1,
                              maxLength: 12,
                              keyboardType: TextInputType.phone,
                              onEditingComplete: () {},
                              onChanged: (value) {},
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(focusMobileNumber);
                              },
                              autofocus: true,
                              cursorColor: kColorDialogNameTitle,
                            ),
                          ),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Password',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              obscureText: true,
                              focusNode: focusPassword,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                              textInputAction: TextInputAction.next,
                              controller: _textFiledPassword,
                              keyboardType: TextInputType.visiblePassword,
                              onEditingComplete: () {},
                              onChanged: (value) {},
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(focusPassword);
                              },
                              autofocus: true,
                              cursorColor: kColorDialogNameTitle,
                            ),
                          ),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Address',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.centerLeft),
                        AVerticalSpace(10.0.scale()),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<HomeBloc>(context)
                                .add(ProfileLocationSearchEventBtnClick());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.0.scale(),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  address!,
                                  style: textStyleCustomColor(
                                    12.0.scale(),
                                    Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ).align(Alignment.center).expand(),
                            ],
                          ).align(Alignment.centerLeft),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'City',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.centerLeft),
                        AVerticalSpace(10.0.scale()),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.0.scale(),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  sharedPrefs.City,
                                  style: textStyleCustomColor(
                                    12.0.scale(),
                                    Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ).align(Alignment.center).expand(),
                            ],
                          ).align(Alignment.centerLeft),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'State',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.centerLeft),
                        AVerticalSpace(10.0.scale()),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.0.scale(),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  sharedPrefs.userState,
                                  style: textStyleCustomColor(
                                    12.0.scale(),
                                    Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ).align(Alignment.center).expand(),
                            ],
                          ).align(Alignment.centerLeft),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Country',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.centerLeft),
                        AVerticalSpace(10.0.scale()),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.0.scale(),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  sharedPrefs.userCountry,
                                  style: textStyleCustomColor(
                                    12.0.scale(),
                                    Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ).align(Alignment.center).expand(),
                            ],
                          ).align(Alignment.centerLeft),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Post Code',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.centerLeft),
                        AVerticalSpace(10.0.scale()),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.0.scale(),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  sharedPrefs.postCode,
                                  style: textStyleCustomColor(
                                    12.0.scale(),
                                    Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ).align(Alignment.center).expand(),
                            ],
                          ).align(Alignment.centerLeft),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Latitude',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.centerLeft),
                        AVerticalSpace(10.0.scale()),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.0.scale(),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  sharedPrefs.userLatitude,
                                  style: textStyleCustomColor(
                                    12.0.scale(),
                                    Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ).align(Alignment.center).expand(),
                            ],
                          ).align(Alignment.centerLeft),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Longitude',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.centerLeft),
                        AVerticalSpace(10.0.scale()),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.0.scale(),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  sharedPrefs.userLongitude,
                                  style: textStyleCustomColor(
                                    12.0.scale(),
                                    Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ).align(Alignment.center).expand(),
                            ],
                          ).align(Alignment.centerLeft),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Join date',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        AVerticalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              strJoindate!,
                              style: textStyleCustomColor(
                                  14.0.scale(), Colors.black),
                            ),
                          ),
                        ),
                        Text(
                          'Verified',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        AVerticalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              strVerified!,
                              style: textStyleCustomColor(
                                  14.0.scale(), Colors.black),
                            ),
                          ),
                        ),
                        Text(
                          'Premium service Provideer',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        AVerticalSpace(5.0.scale()),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "NO",
                              style: textStyleCustomColor(
                                  14.0.scale(), Colors.black),
                            ),
                          ),
                        ),
                        Text(
                          'Facebook',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              focusNode: focusfiledFacebook,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                              textInputAction: TextInputAction.next,
                              controller: _textFiledFacebook,
                              keyboardType: TextInputType.text,
                              onEditingComplete: () {},
                              onChanged: (value) {},
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(focusfiledFacebook);
                              },
                              autofocus: true,
                              cursorColor: kColorDialogNameTitle,
                            ),
                          ),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Twitter',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              focusNode: focusfiledTwitter,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                              textInputAction: TextInputAction.next,
                              controller: _textFiledTwitter,
                              keyboardType: TextInputType.text,
                              onEditingComplete: () {},
                              onChanged: (value) {},
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(focusfiledTwitter);
                              },
                              autofocus: true,
                              cursorColor: kColorDialogNameTitle,
                            ),
                          ),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Youtube',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              focusNode: focusfiledYouTube,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                              textInputAction: TextInputAction.next,
                              controller: _textFiledYoutube,
                              keyboardType: TextInputType.text,
                              onEditingComplete: () {},
                              onChanged: (value) {},
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(focusfiledYouTube);
                              },
                              autofocus: true,
                              cursorColor: kColorDialogNameTitle,
                            ),
                          ),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        Text(
                          'Website',
                          style: textStyleCustomColor(
                            12.0.scale(),
                            Colors.black,
                          ),
                        ).align(Alignment.topLeft),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.0.scale(),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              focusNode: focusfiledWebsite,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                              textInputAction: TextInputAction.next,
                              controller: _textFiledWebsite,
                              keyboardType: TextInputType.text,
                              onEditingComplete: () {},
                              onChanged: (value) {},
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(focusfiledWebsite);
                              },
                              autofocus: true,
                              cursorColor: kColorDialogNameTitle,
                            ),
                          ),
                        ),
                        ASeparatorLine(
                          height: 1.0.scale(),
                          color: Colors.grey,
                        ),
                        AVerticalSpace(10.0.scale()),
                        ARoundedButton(
                          btnBgColor: kColorThemeDarkGreenColor,
                          btnTextColor: Colors.white,
                          btnOnPressed: () {
                            BlocProvider.of<HomeBloc>(context).add(
                                ProfileNdisExpertUpdateBtnClick(
                                    userId:
                                        "${userProfileDataModel?.data?.userProfileDetails?.userId}",
                                    mobileNumber: _textFiledMobileNumber!.text,
                                    userLongitude: sharedPrefs.userLatitude,
                                    userLatitude: sharedPrefs.userLatitude,
                                    userCity: sharedPrefs.City,
                                    userState: sharedPrefs.userState,
                                    userAddress: sharedPrefs.addressLocation,
                                    password: "123456",
                                    passwordOld: "123456",
                                    coverImage: base64CoverImage.toString(),
                                    profileIdProof:
                                        base64IdProofImage.toString(),
                                    profileImage: base64ProImage.toString(),
                                    userCountry: sharedPrefs.userCountry,
                                    userFacebook: _textFiledFacebook!.text,
                                    userTwitter: _textFiledFacebook!.text,
                                    userWebsite: _textFiledWebsite!.text,
                                    userYoutube: _textFiledYoutube!.text,
                                    userzipCode: sharedPrefs.postCode,
                                    dateOfBirth: ""));
                          },
                          btnText: 'Update Profile',
                          btnHeight: 45.0.scale(),
                          btnWidth: 260.0.scale(),
                          btnFontSize: 14.0.scale(),
                          btnFontWeight: FontWeight.bold,
                          btnElevation: 0,
                          btnBorderSideColor: Colors.transparent,
                        ),
                        AVerticalSpace(25.0.scale()),
                      ],
                    ).leftPadding(40.0.scale()).rightPadding(40.0.scale()),
                  ],
                )
              ],
            ).scroll(),
          ),
        ));
  }
}
