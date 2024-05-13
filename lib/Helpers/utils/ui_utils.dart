import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';

import '../theme/theme.dart';

import 'dart:ui' as ui;

double _deviceWidth = 0.0;
double _deviceHeight = 0.0;
double _devicePixelRatio = 0.0;
double _deviceSafeAreaBottomInset = 0.0;
const double referenceWidth = 360;
const double referenceHeight = 640;
GlobalKey<NavigatorState> navigatorKey = new GlobalKey();

setDeviceMetrics(double width, double height, double pixelRatio) {
  _deviceWidth = width;
  _deviceHeight = height;
  _devicePixelRatio = pixelRatio;
  print(
      "deviceWidth = $_deviceWidth deviceHeight = $_deviceHeight devicePixelRatio = $_devicePixelRatio");
}

double? getDeviceWidth() {
  return _deviceWidth;
}

double? getDeviceHeight() {
  return _deviceHeight;
}

setDarkStatusBarOverlay() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

// showAlertDialog(BuildContext context, String text) {
//   // set up the button
//   Widget okButton = TextButton(
//     child: Text(Strings.current.txtCancel),
//     onPressed: () {
//       Navigator.of(context, rootNavigator: true).pop();
//     },
//   );
//
//
//   Widget logoutButton = TextButton(
//       child: Text(Strings.current.txtLogout),
//       onPressed: () {
//         Navigator.of(context, rootNavigator: true).pop();
//
//         BlocProvider.of<RootBloc>(context).add(LogoutEvent());
//       });
//
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(Strings.current.txtLogoutMsg),
//     content: Container(
//         height: 20.0.scale(),
//         child: Column(
//           children: const [Text("")],
//         )),
//     actions: [
//       okButton,
//       logoutButton,
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
// String? isDevice;

// String getDeviceType() {
//   final double devicePixelRatio = ui.window.devicePixelRatio;
//   final ui.Size size = ui.window.physicalSize;
//   final double width = size.width;
//   final double height = size.height;
//
//   if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
//     return isDevice = "tablet";
//     // isTablet = true;
//     // isPhone = false;
//   } else if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
//     return isDevice = "tablet";
//     // isTablet = true;
//     // isPhone = false;
//   } else {
//     return isDevice = "phone";
//   }
// }
setSafeAreaBottomInset(double bottomInset) {
  if (_deviceSafeAreaBottomInset == null) {
    print('safe area bottom inset = $bottomInset');
    _deviceSafeAreaBottomInset = bottomInset;
  }
}
Uint8List convertBase64Image(String base64String) {
  return Base64Decoder().convert(base64String.split(',').last);
}
void showSnackBar(String text, Color color, BuildContext context) {
  Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        webPosition: "center",
        webBgColor: "linear-gradient(to right, #000000, #000000)",
        timeInSecForIosWeb: 2,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 15.0);

  // Flushbar(
  //   title: "",
  //   message: text,
  //   duration: Duration(seconds: 3),
  //   isDismissible: false,
  // ).show(context);

  // Flushbar(
  //   duration: Duration(seconds: 2),
  //   backgroundColor: color,
  //   // backgroundGradient: LinearGradient(
  //   //   colors: [
  //   //     color,
  //   //     kColorThemeLightGreenColor,
  //   //     kColorThemeLightGreenColor
  //   //   ],
  //   //   stops: [0.4, 0.7, 1],
  //   // ),
  //   boxShadows: [
  //     BoxShadow(
  //       color: Colors.black45,
  //       offset: Offset(3, 3),
  //       blurRadius: 3,
  //     ),
  //   ],
  //   flushbarPosition: FlushbarPosition.TOP,
  //   dismissDirection: FlushbarDismissDirection.HORIZONTAL,
  //   forwardAnimationCurve: Curves.easeOutCirc,
  //   reverseAnimationCurve: Curves.bounceIn,
  //   messageText: SizedBox(
  //     child: Text(
  //       text,
  //       style: textStyleCustomColor(14.0.scale(), Colors.white),
  //     ),
  //   ).align(Alignment.centerLeft),
  //
  // )..show(context);
}

// class TooltipShapeBorder extends ShapeBorder {
//   final double arrowWidth;
//   final double arrowHeight;
//   final double arrowArc;
//   final double radius;
//
//   TooltipShapeBorder({
//     this.radius = 16.0,
//     this.arrowWidth = 20.0,
//     this.arrowHeight = 10.0,
//     this.arrowArc = 0.0,
//   }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);
//
//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);
//
//   @override
//   Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;
//
//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//     rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, arrowHeight));
//     double x = arrowWidth, y = arrowHeight, r = 1 - arrowArc;
//     return Path()
//       ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
//       ..moveTo(rect.bottomCenter.dx + x / 2, rect.bottomCenter.dy)
//       ..relativeLineTo(-x / 2 * r, y * r)
//       ..relativeQuadraticBezierTo(-x / 2 * (1 - r), y * (1 - r), -x * (1 - r), 0)
//       ..relativeLineTo(-x / 2 * r, -y * r);
//   }
//
//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}
//
//   @override
//   ShapeBorder scale(double t) => this;
// }
double getSafeAreaBottomInset() {
  return _deviceSafeAreaBottomInset;
}

extension UIExtension on double {
  double scale() {
    return this * _deviceWidth / referenceWidth;
  }

  double scaleRespectiveToHeight([double heightOffset = 0]) {
    return this *
        (_deviceHeight - heightOffset.scale()) /
        (referenceHeight - heightOffset);
  }

  double scaleForDimension(double currentDimension, double referenceDimension) {
    return this * currentDimension / referenceDimension;
  }

  double multiplyPixelRatio() {
    return this * effectivePixelRatio();
  }
}

extension UIStringExtension on String {
  String densitySuffix() {
    return "${this}${densityAwareImageVariant()}";
  }
}

double effectivePixelRatio() {
  double effectiveRatio = 1.0;

  if (_devicePixelRatio > 1.25 && _devicePixelRatio < 1.75) {
    effectiveRatio = 1.5;
  } else if (_devicePixelRatio < 2.5) {
    effectiveRatio = 2.0;
  } else {
    effectiveRatio = 3.0;
  }
  return effectiveRatio;
}

String densityAwareImageVariant() {
  return effectivePixelRatio() == 1.0 ? "" : "${effectivePixelRatio()}x/";
}

double densityAwareImageScale() {
  return referenceWidth / _deviceWidth * effectivePixelRatio();
}

keyBoardHideFocusChange(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern.toString());
  return (!regex.hasMatch(value)) ? false : true;
}
// Future<void> getLocation() async {
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);
//   //  aPrint(position.latitude);
//   //  aPrint(position.longitude);
//
//   LatLng pinPosition = LatLng(position.latitude, position.longitude);
//
//   double lat = pinPosition.latitude;
//   double lng = pinPosition.longitude;
//   sharedPrefs.keyLatitude = lat;
//   sharedPrefs.keyLongitude = lng;
// }

String removeLastCharacter(String str) {
  String result = "";
  if ((str != null) && (str.length > 0)) {
    result = str.substring(0, str.length - 3);
  }

  return result;
}
