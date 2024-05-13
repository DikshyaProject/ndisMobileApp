import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:ndisparticipant/Helpers/services/services.dart';
import 'package:ndisparticipant/Helpers/utils/utils.dart';
import '../../../Helpers/theme/theme.dart';
import '../../../bottom_navigation/bloc/bloc.dart';
import '../../../components/components.dart';
import '../../home.dart';


class LocationSearchPage extends StatefulWidget {
  @override
  State<LocationSearchPage> createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  var _controller = TextEditingController();
  late String _sessionToken;
  final focus_controller = FocusNode();

  List<dynamic> _placeList = [];
  String typePage = "";

  late UserProfileData userProfData;
  late String selectedUserType;
  late ParticipantRegistrationData? participateInfoData;

  @override
  void initState() {
    super.initState();

    HomeState homeState = BlocProvider.of<HomeBloc>(context).state;
    if (homeState is HomeLocationSearchPageState) {
      typePage = homeState.typePage;
      print("typePage_1_$typePage");
    }

    if (homeState is HomeAddressSearchPageState)
    {
      typePage = homeState.typePage;
      selectedUserType = homeState.selectedUserType;
      userProfData = homeState.userProfData;
      participateInfoData = homeState.participateInfoData;
      print("typePage_2_$typePage");
    }
    _controller.addListener(() {
      _onChanged();
    });
  }

  _onChanged() {

    getSuggestion(_controller.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void getSuggestion(String input) async {
    if (kDebugMode) {
      print(input);
    }
   //  String kPLACES_API_KEY = "AIzaSyB6jpjQRZn8vu59ElER36Q2LaxptdAghaA";
    String kPLACES_API_KEY = "AIzaSyAb1vGO92hZfS0oRzq9X9VhDJzz2BcqV0w";

    String type = '(regions)';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&components=country:AU&key=$kPLACES_API_KEY';
    if (kDebugMode) {
      print(request);
    }
    var response = await http.get(Uri.parse(request));
    //  print(response.body.toString());
    if (response.statusCode == 200) {
      if(this.mounted)
      setState(() {
        _placeList = json.decode(response.body)['predictions'];
      });
    }
    else {
      throw Exception('Failed to load predictions');
    }
  }

  void showHideProgress(bool show) {
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(BottomNavigationEventToggleLoadingAnimation(needToShow: show));
  }

  Future<void> searchLatLong(String location) async
  {
    try {
      List<Location> address =
          await locationFromAddress(location).then((value) async {
        var first = value.first;

        print(first.latitude);
        sharedPrefs.userLatitude = first.latitude.toString();
        sharedPrefs.userLongitude = first.longitude.toString();
        print(first.longitude);
        // Address address = await geoCode.reverseGeocoding(
        //     latitude: first.latitude, longitude: first.longitude);
        showHideProgress(true);
        getAddressFromLatLng(first.latitude, first.longitude);

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
      // print(response.toString());
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String _formattedAddress = data["results"][0]["formatted_address"];
        print(_formattedAddress);
        //  if(typePage!="SignUp"){
        sharedPrefs.serviceLocation = _formattedAddress;
        sharedPrefs.addressLocation = _formattedAddress;
        // }

        List<dynamic> datalist = data["results"][1]["address_components"];
        datalist.forEach((element)
        {
          if (kDebugMode) {
            print(element);
          }

          Map<dynamic, dynamic> jsonMap = element as Map;

          if (jsonMap["types"].toString() == "[postal_code]") {
            sharedPrefs.postCode = jsonMap["long_name"];
          }
          if (jsonMap["types"].toString().contains(
              "[administrative_area_level_2, political]")) {
            sharedPrefs.City = jsonMap["long_name"];
          }
          if (jsonMap["types"].toString().contains(
              "[administrative_area_level_1, political]")){
            sharedPrefs.userState = jsonMap["long_name"];
          }
          if (jsonMap["types"].toString() == "[country, political]") {
            sharedPrefs.userCountry = jsonMap["long_name"];
          }
          showHideProgress(false);
          if (typePage == "SignUp") {
            BlocProvider.of<HomeBloc>(context)
                .add(HomeEventBackLocationToSignUp(typePage));
          } else if (typePage == "participant") {
            // BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(typePage));
            BlocProvider.of<HomeBloc>(context).add(
                HomeEventBackLocationToParticipant(typePage, selectedUserType,
                    userProfData, participateInfoData));
          }
        });

        return _formattedAddress;
      } else
        return null;
    } else
      return null;
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listenWhen: (prevState, curState) => ModalRoute.of(context)!.isCurrent,
        listener: (context, state) {
          print("state_in locat______$state");
          if (state is HomeSignUpPage1State)
          {
            Navigator.of(context).pop();
          }
          if (state is HomeParticipantRegisterPageState)
          {
            Navigator.of(context).pop();
          }
        },
        child: SafeArea(
          bottom: true,
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: kColorThemePurpleColor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "Search Location",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0.scale(),
                      fontWeight: FontWeight.w700),
                ),
                leading: InkWell(
                    onTap: () {
                      if (typePage == "SignUp") {
                        BlocProvider.of<HomeBloc>(context)
                            .add(HomeEventBackLocationToSignUp(typePage));
                      } else if (typePage == "participant") {
                        // BlocProvider.of<HomeBloc>(context).add(HomeEventBackBtnClick(typePage));
                        BlocProvider.of<HomeBloc>(context).add(HomeEventBackLocationToParticipant(typePage, selectedUserType, userProfData, participateInfoData));
                      }
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 30.0.scale(),))),
            body: SingleChildScrollView(
              
              child: Column(
                children: [
                  AVerticalSpace(5.0.scale()),

                  GestureDetector(
                    onTap: () {
                      focus_controller.unfocus();
                    },
                    child: TextField(
                      controller: _controller,
                      focusNode:focus_controller,
                      autofocus:true,
                      decoration: InputDecoration(
                        hintText: "Seek your location here",
                        focusColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixIcon: Icon(Icons.map),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: ()
                          {
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
                      ).topPadding(8.0.scale()).bottomPadding(8.0.scale()).leftPadding(10.0.scale()).rightPadding(10.0.scale()),
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
