import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:ndisparticipant/Helpers/utils/ui_utils.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';
import 'package:ndisparticipant/root/root.dart';

import '../../../../Helpers/services/shared_preferences.dart';
import '../../../../Helpers/theme/ft_theme_colors.dart';
import '../../../../Helpers/theme/ft_theme_styles.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../../bottom_navigation/bloc/bottom_navigation_event.dart';
import '../../../../components/a_vertical_space.dart';
import '../../../bloc/home_bloc.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/home_state.dart';
import '../../../model/participant/get_participant_registration_model.dart';
import '../../../model/userprofile/participant_user_profile_data.dart';

class LocationSearchCity extends StatefulWidget {
  @override
  State<LocationSearchCity> createState() => _LocationSearchCityState();
}

class _LocationSearchCityState extends State<LocationSearchCity> {
  var _controller = TextEditingController();
  final FocusNode _focusNodeController = FocusNode();
  late String _sessionToken;

  List<dynamic> _placeList = [];
  String typePage = "";
  String page = "";
  String latData = "";
  String lngData = "";
  String addressData = "";

  late UserProfileData userProfData;
  late String selectedUserType;
  late ParticipantRegistrationData? participateInfoData;

  @override
  void initState() {
    super.initState();

    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is JobSearchLocationState) {
      page = homeState.screen!;
      print("page_name____$page");
    } if (homeState is FilterSearchLocationState) {
      page = homeState.screen!;
      print("page_name____$page");
    }if (homeState is ProfileSearchLocationState) {
      page = homeState.screen!;
      print("page_name____$page");
    }if (homeState is ProfileSearchLocationPageState) {
      page = homeState.screen!;
      print("page_name____$page");
    }if (homeState is ParticipantSearchLocationState) {
      page = homeState.screen!;
      print("page_name____$page");
    }if (homeState is ServiceEnquiryAddressbtnClickState) {
      page = homeState.typePage!;
      print("page_name____$page");
    }
    if (homeState is HomeAddressSearchPageState) {
      typePage = homeState.typePage;
      selectedUserType = homeState.selectedUserType;
      userProfData = homeState.userProfData;
      participateInfoData = homeState.participateInfoData;
    }
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
      if(this.mounted)
      setState(() {
        _placeList = json.decode(response.body)['predictions'];
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  Future<void> searchLatLong(String location) async {
    try {
      List<Location> address =
          await locationFromAddress(location).then((value) async {
        var first = value.first;

        if (page == "Jobs") {
          UserRepository.job_lattitude = first.latitude.toString();
          UserRepository.job_longitude = first.longitude.toString();
          UserRepository.job_address = location;
          getAddressFromLatLng(first.latitude, first.longitude);
          BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
        }else if (page == "filter") {
          UserRepository.filter_lat = first.latitude.toString();
          UserRepository.filter_lng = first.longitude.toString();
          UserRepository.filter_address = location;
          getAddressFromLatLng(first.latitude, first.longitude);
          BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
        }else if (page == "sup_work_profile"|| page == "participant"|| page == "general") {
          UserRepository.profile_lattitude = first.latitude.toString();
          UserRepository.profile_longitude = first.longitude.toString();
          UserRepository.profile_address = location;
          getAddressFromLatLng(first.latitude, first.longitude);
          BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
        } else if ( page == "participant_service") {
          UserRepository.parti_service_lattitude = first.latitude.toString();
          UserRepository.parti_service_longitude = first.longitude.toString();
          UserRepository.parti_service_location = location;
          getAddressFromLatLng(first.latitude, first.longitude);
          BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
        }else if ( page == "service_enquiry") {
          UserRepository.enquiry_lat = first.latitude.toString();
          UserRepository.enquiry_lng = first.longitude.toString();
          UserRepository.enquiry_location = location;
          getAddressFromLatLng(first.latitude, first.longitude);
          BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(''));
        } else {
          print(first.latitude);
          sharedPrefs.keyLatitude = first.latitude.toString();
          sharedPrefs.keyLongitude = first.longitude.toString();
          sharedPrefs.searchLocation = location;
          print(first.longitude);
          showHideProgress(true);
          getAddressFromLatLng(first.latitude, first.longitude);
          BlocProvider.of<HomeBloc>(context)
              .add(HomeEventBackLocationToSearch());
        }

        // Address address = await geoCode.reverseGeocoding(
        //     latitude: first.latitude, longitude: first.longitude);

        return value;
      });
    } catch (e) {
      showHideProgress(false);
      print(e.toString());
    }
    //  print(location);
  }

  getAddressFromLatLng(double lat, double lng) async {
    String _host = 'https://maps.google.com/maps/api/geocode/json';
    final url =
        '$_host?key=AIzaSyAb1vGO92hZfS0oRzq9X9VhDJzz2BcqV0w&language=en&latlng=$lat,$lng';
    print(url);
    if (lat != null && lng != null) {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String _formattedAddress = data["results"][0]["formatted_address"];
        print(_formattedAddress);
        sharedPrefs.serviceLocation = _formattedAddress;

        List<dynamic> datalist = data["results"][1]["address_components"];
        if(this.mounted)
        datalist.forEach((element) {
          if (kDebugMode) {
            print(element);
          }
          Map<dynamic, dynamic> jsonMap = element as Map;

          if (jsonMap["types"].toString() == "[postal_code]") {
            if (page == "sup_work_profile" || page == "general" || page == "participant"|| page == "participant_service"){
            }else{
              sharedPrefs.postCode = jsonMap["long_name"];
            }
          }
          if (jsonMap["types"].toString() == "[administrative_area_level_2, political]") {
            if (page == "sup_work_profile" || page == "general"|| page == "participant"|| page == "participant_service"){
            }else{
              sharedPrefs.City = jsonMap["long_name"];
            }
          }
          if (jsonMap["types"].toString() == "[administrative_area_level_1, political]") {
            if (page == "sup_work_profile" || page == "general"|| page == "participant"|| page == "participant_service"){
            }else{
              sharedPrefs.userState = jsonMap["long_name"];
            }
          }
          if (jsonMap["types"].toString() == "[country, political]") {
            if (page == "sup_work_profile" || page == "general"|| page == "participant"|| page == "participant_service"){
            }else{
              sharedPrefs.userCountry = jsonMap["long_name"];
            }
          }
          showHideProgress(false);
          BlocProvider.of<HomeBloc>(context)
              .add(HomeEventBackLocationToSearch());

        });

        return _formattedAddress;
      } else
        return null;
    } else
      return null;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          print("state_is_3__$state");
          if (state is HomeSearchState) {
            showHideProgress(false);
            Navigator.of(context).pop();
          }
          if (state is HomeJobsPageState) {
            showHideProgress(false);
            Navigator.of(context).pop();
          }
          if (state is FilterClickState) {
            showHideProgress(false);
            Navigator.of(context).pop();
          }
          if (state is ProfileSupportWorkerPageState) {
            showHideProgress(false);
            Navigator.of(context).pop(true);
          }
          if (state is ProfileViewGeneralPageState) {
            showHideProgress(false);
            Navigator.of(context).pop(true);
          }
          if (state is ProfileViewParticipantPageState) {
            showHideProgress(false);
            Navigator.of(context).pop(true);
          }if (state is ServiceEnquiryState) {
            showHideProgress(false);
            Navigator.of(context).pop(true);
          }
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "Search Place",
                  style: TextStyle(color: Colors.white, fontSize:17.0.scale(), fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeEventBackBtnClick(''));
                    },
                    child:
                        Icon(Icons.arrow_back, size: 30, color: Colors.white))),
            body: Column(
              children: [
                AVerticalSpace(5.0.scale()),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(_focusNodeController);
                  },
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNodeController,
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
                ),
                for (int i = 0; i < _placeList.length; i++)
                  GestureDetector(
                    onTap: () {
                      print(" tap tap");
                      searchLatLong(_placeList[i]["description"]);
                    },
                    child: Column(
                      children: [
                        Text(
                          _placeList[i]["description"],
                          style:
                              textStyleCustomColor(15.0.scale(), Colors.black),
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
            ),
          ),
        )).pageBgColor(Colors.white);
  }
}

class Uuid {
  static Random _random = Random();

  static String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final int special = 8 + _random.nextInt(4);

    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  static String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  static int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  static String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');
}
