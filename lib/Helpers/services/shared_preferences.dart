import 'package:shared_preferences/shared_preferences.dart';





const String _keyLatitude = "_keyLatitude";
const String _keyLongitude = "_keyLongitude";
const String _keyUserLatitude = "_keyUserLatitude";
const String _keyUserLongitude = "_keyUserLongitude";
const String _keyParticipantUserResponse = "_keyParticipantResponse";
const String _keydeviceId = "_keydeviceId";
const String _keyIsLogin = "_keyIsLogin";
const String _keyUserID = "_keyUserID";

const String _keyUserEmail = "_keyUserEmail";
const String _keyUserMobile = "_keyUserMobile";
const String _keyPostCode="_keyPostCode";
const String _keyCity="_keyCity";
const String _keyState="_keyState";
const String _keyCountry="_keyCountry";
const String _keyAddress="_keyAddress";
const String _keyLocation="_keyLocation";
const String _keyUserName="_keyUserName";
const String _keyUserImage="_keyUserImage";
const String _keyUserRegisterData="_keyUserRegisterData";
const String _keyUserProfile="_keyUserProfile";
const String _keyUserType="_keyUserType";
const String _keyUserPwd="_keyUserPwd";
const String _keyLocationHome="_keyLocationHome";


final sharedPrefs = SharedPreference();

class SharedPreference {
  static SharedPreferences? _sharedPrefs;

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  bool get IsLogin => _sharedPrefs!.getBool(_keyIsLogin) ?? false;

  set IsLogin(bool isLogin) {
    _sharedPrefs!.setBool(_keyIsLogin, isLogin);
  }

  String get uniqueDeviceId => _sharedPrefs!.getString(_keydeviceId) ?? "";

  set uniqueDeviceId(String uniquedeviceId) {
    _sharedPrefs!.setString(_keydeviceId, uniquedeviceId);
  }


  String get userType => _sharedPrefs!.getString(_keyUserType) ?? "";

  set userType(String uniquedeviceId) {
    _sharedPrefs!.setString(_keyUserType, uniquedeviceId);
  }

  String get getUserProfileImage => _sharedPrefs!.getString(_keyUserProfile) ?? "";

  set setUserProfileImage(String userProfile) {
    _sharedPrefs!.setString(_keyUserProfile, userProfile);
  }

  String get addressLocation => _sharedPrefs!.getString(_keyAddress) ?? "";

  set addressLocation(String location) {
    _sharedPrefs!.setString(_keyAddress, location);
  }
 String get serviceLocation => _sharedPrefs!.getString(_keyLocation) ?? "";

  set serviceLocation(String location) {
    _sharedPrefs!.setString(_keyLocation, location);
  }



  // String get userName => _sharedPrefs!.getString(_keyuserName) ?? "";
  //
  // set userNameSet(String userName) {
  //   _sharedPrefs!.setString(_keyuserName, userName);
  // }



  String get userID => _sharedPrefs!.getString(_keyUserID) ?? "";

  set userID(String id) {
    _sharedPrefs!.setString(_keyUserID, id);
  }

  String get userName => _sharedPrefs!.getString(_keyUserName) ?? "";

  set userName(String name) {
    _sharedPrefs!.setString(_keyUserName, name);
  }
  String get userImage => _sharedPrefs!.getString(_keyUserImage) ?? "";

  set userImage(String name) {
    _sharedPrefs!.setString(_keyUserImage, name);
  }
  String get userPwd => _sharedPrefs!.getString(_keyUserPwd) ?? "";

  set userPwd(String name) {
    _sharedPrefs!.setString(_keyUserPwd, name);
  }

  String get userRegisterDate => _sharedPrefs!.getString(_keyUserRegisterData) ?? "";

  set userRegisterDate(String name) {
    _sharedPrefs!.setString(_keyUserRegisterData, name);
  }

  String get userEmail => _sharedPrefs!.getString(_keyUserEmail) ?? "";

  set userEmail(String email) {
    _sharedPrefs!.setString(_keyUserEmail, email);
  }

  set userMobile(String mobile) {
    _sharedPrefs!.setString(_keyUserMobile, mobile);
  }

  String get userMobile => _sharedPrefs!.getString(_keyUserMobile) ?? "";




  set postCode(String postCode) {
    _sharedPrefs!.setString(_keyPostCode, postCode);
  }

  String get postCode => _sharedPrefs!.getString(_keyPostCode) ?? "";

  set City(String city) {
    _sharedPrefs!.setString(_keyCity, city);
  }

  String get City => _sharedPrefs!.getString(_keyCity) ?? "";

  set userState(String state) {
    _sharedPrefs!.setString(_keyState, state);
  }

  String get userState => _sharedPrefs!.getString(_keyState) ?? "";
  set userCountry(String country) {
    _sharedPrefs!.setString(_keyCountry, country);
  }

  String get userCountry => _sharedPrefs!.getString(_keyCountry) ?? "";

  set keyLatitude(String latitude) {
    _sharedPrefs!.setString(_keyLatitude, latitude);
  }

  set keyLongitude(String longitude) {
    _sharedPrefs!.setString(_keyLongitude, longitude);
  }
  String get keyLatitude => _sharedPrefs!.getString(_keyLatitude) ?? "";

  String get keyLongitude => _sharedPrefs!.getString(_keyLongitude) ?? "";


  set userLatitude(String latitude) {
    _sharedPrefs!.setString(_keyUserLatitude, latitude);
  }

  set userLongitude(String longitude) {
    _sharedPrefs!.setString(_keyUserLongitude, longitude);
  }
  String get searchLocation =>
      _sharedPrefs?.getString(_keyLocationHome) ?? "Search";

  set searchLocation(String location) {
    _sharedPrefs?.setString(_keyLocationHome, location);
  }
  String get userLatitude => _sharedPrefs!.getString(_keyUserLatitude) ?? "";

  String get userLongitude => _sharedPrefs!.getString(_keyUserLongitude) ?? "";


set participantUserResponseData(String response){
  _sharedPrefs!.setString(_keyParticipantUserResponse, response);
}
  String get participantUserResponseData => _sharedPrefs!.getString(_keyParticipantUserResponse) ?? "";

  //List<LoginType> get loggedInAccountTypes {
  //   String loginTypesStr = _sharedPrefs!.get(_keyLoggedInAccountTypes);
  //   List<LoginType> loginTypes = List<LoginType>();
  //   if (loginTypesStr != null) {
  //     List<String> loginTypeStrList = loginTypesStr.split(",");
  //     for (String loginTypeStr in loginTypeStrList) {
  //       loginTypes.add(
  //           LoginType.values.firstWhere((e) => e.toString() == loginTypeStr));
  //     }
  //   }
  //   return loginTypes;
  // }
  //
  // set loggedInAccountTypes(List<LoginType> accountTypes) {
  //   if (accountTypes == null) {
  //     _sharedPrefs!.remove(_keyLoggedInAccountTypes);
  //   } else {
  //     String loginTypesStr = accountTypes.join(",");
  //     _sharedPrefs!.setString(_keyLoggedInAccountTypes, loginTypesStr);
  //   }
  // }

  void resetPreferences() {
    //  loggedInAccountTypes = null;
    _sharedPrefs!.remove(_keyUserID);
    _sharedPrefs!.remove(_keyUserName);
    _sharedPrefs!.remove(_keyUserEmail);

  }
}
