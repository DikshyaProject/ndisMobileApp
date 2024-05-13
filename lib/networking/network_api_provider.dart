import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;

import '../Helpers/services/services.dart';
import '../Helpers/utils/utils.dart';
import 'custom_network_exceptions.dart';

class NetworkApiProvider {
  String? _baseUrl;
  String? accessToken;

  NetworkApiProvider(String baseUrl) {
    _baseUrl = baseUrl;
  }

  Future<dynamic> get(String url) async {
    var model;
    try {
      var headers = <String, String>{
        'Content-Type': 'application/json',
        'ndisone':'Votive@2023'

      };
      print('url = $url');
      print('headers = $headers');

      final response = await http
          .get(Uri.parse(url),headers: headers)
          .timeout(Duration(seconds: 180));
      model = _response(response);
      // if (response.statusCode == 200){
      //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
      //   model = ResponseModel(error: false, data: decodedResponse);
      // }else{
      //   model = ResponseModel(error: true, errorMessage: "data not found");
      // }
    } on SocketException {
      throw NoInternetNetworkException();
    }
    return model;
  }
  Future<dynamic> getWithParam(String url) async {
    var model;
    try {
      var headers = <String, String>{
        'accept': 'application/json',


      };
      print('url = $url');
      print('headers = $headers');
      final queryParameters = {
        'device_type': 'phone'
      };
      final uri = Uri.http("https://www.daedalusonline.eu/daeapp/invites","" , queryParameters);
      final response = await http
          .get(uri, headers: headers,)
          .timeout(Duration(seconds: 180));
      model = _response(response);
      // if (response.statusCode == 200){
      //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
      //   model = ResponseModel(error: false, data: decodedResponse);
      // }else{
      //   model = ResponseModel(error: true, errorMessage: "data not found");
      // }
    } on SocketException {
      throw NoInternetNetworkException();
    }
    return model;
  }

  Future<dynamic> postWithoutParam(String url,
      [bool addToken = false, Map<String, String>?  jsonMap]) async {
    var responseJson;

    var model;
    try {
      var headers = <String, String>{
        'Content-Type': 'application/json',
        'ndisone':'Votive@2023'
      };
      print('url = $url');
      print('headers = $headers');

      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonMap)
          .timeout(Duration(seconds: 80));
      responseJson = _response(response);

    } on SocketException {
      throw NoInternetNetworkException();
    }
    return responseJson;
  }
  Future<dynamic> getstaticContent(String url,
      [bool addToken = false, Map<String, String>? additionalHeaders]) async {
    var responseJson;
    try {
      String Username = "mild";
      String Password = "mild";
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$Username:$Password'));
      var headers = <String, String>{
        'accept': 'application/json',
        'Authorization': basicAuth,
      };
      if (additionalHeaders != null) {
        headers.addAll(additionalHeaders);
      }
      print('url = $url');
      print('headers = $headers');
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(Duration(seconds: 140));
      responseJson = _response(response);
    } on SocketException {
      throw NoInternetNetworkException();
    }
    return responseJson;
  }

  Future<dynamic> delete(String url,
      [bool addToken = false, Map<String, String>? additionalHeaders]) async {
    var responseJson;
    try {
      var headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json',
        if (addToken && accessToken != null)
          'Authorization': 'Bearer $accessToken'
      };
      if (additionalHeaders != null) {
        headers.addAll(additionalHeaders);
      }
      print('url = $url');
      print('headers = $headers');
      final response = await http
          .delete(Uri.parse(_baseUrl! + url), headers: headers)
          .timeout(Duration(seconds: 90));
      responseJson = _response(response);
    } on SocketException {
      throw NoInternetNetworkException();
    }
    return responseJson;
  }

  Future<dynamic> post(String url,Map<String, dynamic> jsonMap,
      ) async {
    var responseJson;
    try {
      var headers = <String, String>{
        'Content-Type': 'application/json',
        'ndisone':'Votive@2023'
      };
      String jsonStr = jsonEncode(jsonMap);
      print('jsonStr = $jsonStr');
      print('jsonMap = $jsonMap');
      print('urlfull = ${url}');

      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonStr)
          .timeout(Duration(seconds: 70));

      responseJson = _response(response);
    } on SocketException {
      throw NoInternetNetworkException();
    }
    return responseJson;
  }

  Future<dynamic> postWithUrl(String url, Map<String, dynamic> jsonMap) async {
    var responseJson;
    var model;
    try {
      var headers = <String, String>{
        'Content-Type': 'application/json',
        'ndisone':'Votive@2023'
      };
      print('url = $url');
      print('headers = $headers');
      String jsonStr = jsonEncode(jsonMap);
      print(jsonStr);
      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonStr)
          .timeout(Duration(seconds: 120));
      model = _response(response);

      // if (response.statusCode == 200){
      //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
      //   model = ResponseModel(error: false, data: decodedResponse);
      // }else{
      //   model = ResponseModel(error: true, errorMessage: "data not found");
      // }
    } on SocketException {
      throw NoInternetNetworkException();
    }
    return model;
  }


  Future<dynamic> patch(String url, Map<String, dynamic> jsonMap,
      [bool addToken = false, Map<String, String>? additionalHeaders]) async {
    var responseJson;
    try {
      var headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json',
        if (addToken && accessToken != null)
          'Authorization': 'Bearer $accessToken'
      };
      if (additionalHeaders != null) {
        headers.addAll(additionalHeaders);
      }
      print('url = $url');
      print('headers = $headers');
      print('jsonMap = $jsonMap');
      final response = await http
          .patch(Uri.parse(url), headers: headers, body: jsonEncode(jsonMap))
          .timeout(Duration(seconds: 120));
      responseJson = _response(response);
    } on SocketException {
      throw NoInternetNetworkException();
    }
    return responseJson;
  }

  Future<dynamic> postMultipartImage(String url, String filePath,
      [bool addToken = false, Map<String, String>? additionalHeaders]) async {
    var responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(_baseUrl! + url));

      request.headers['accept'] = 'application/json';
      if (addToken && accessToken != null) {
        request.headers['Authorization'] = 'Bearer $accessToken';
      }
      if (additionalHeaders != null) {
        request.headers.addAll(additionalHeaders);
      }
      request.files
          .add(await http.MultipartFile.fromPath('userImage', filePath));
      print(request.headers);
      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(streamedResponse)
          .timeout(Duration(seconds: 90));
      print(response.body);
      responseJson = await _response(response);
    } on SocketException {
      throw NoInternetNetworkException();
    }
    return responseJson;
  }

  dynamic _response(http.BaseResponse response) async {
    String? responsePhrase = response is http.Response
        ? response.body
        : response is http.StreamedResponse
        ? await response.stream.bytesToString()
        : null;
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(responsePhrase!);
        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestNetworkException(
            responsePhrase, NetworkErrorType.BAD_REQUEST);
      case 401:

      case 403:
        throw UnauthorisedNetworkException(
            responsePhrase, NetworkErrorType.UNAUTHORIZED);
      case 500:
      case 204:
        var responseJson = "";
        if (responsePhrase == "") {
          responseJson = "[]";
        } else {
          responseJson = json.decode(responsePhrase!);
        }
        // print(responseJson);
        return responseJson;
      case 201:
        var responseJson = json.decode(responsePhrase!);
        //  print(responseJson);
        return responseJson;
      case 409:
        var responseJson = json.decode(responsePhrase!);
        //  print(responseJson);
        return responseJson;

      default:
        throw FetchDataNetworkException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
            NetworkErrorType.OTHER);
    }
  }

// dynamic _response1(http.BaseResponse response) async {
//   String? responsePhrase = response is http.Response
//       ? response.body
//       : response is http.StreamedResponse
//       ? await response.stream.bytesToString()
//       : null;
//
//   switch (response.statusCode) {
//     case 200:
//       if(responsePhrase.toString()==""||responsePhrase.toString()=="OK"){
//         return "successfully";
//
//       }
//       else{
//         var responseJson = json.decode(responsePhrase!);
//         // print(responseJson);
//         if(responseJson==null){
//           return "succesfully";
//         }else{
//           return responseJson;
//         }
//       }
//     case 400:
//
//         return "succesfully";
//
//     case 401:
//     case 404:
//
//     // print(responseJson);
//       if(responsePhrase=="Not found"){
//         return "Incorrect email or password";
//       }else{
//         throw UnauthorisedNetworkException(
//             responsePhrase, NetworkErrorType.UNAUTHORIZED);
//       }
//     case 403:
//       throw UnauthorisedNetworkException(
//           responsePhrase, NetworkErrorType.UNAUTHORIZED);
//     case 500:
//     case 204:
//       var responseJson = "";
//       if (responsePhrase == "") {
//         responseJson = "[]";
//       } else {
//         responseJson = json.decode(responsePhrase!);
//       }
//       // print(responseJson);
//       return responseJson;
//     case 201:
//       var responseJson = json.decode(responsePhrase!);
//       //  print(responseJson);
//       return responseJson;
//     case 409:
//       var responseJson = json.decode(responsePhrase!);
//       //  print(responseJson);
//       return responseJson;
//
//     default:
//       throw FetchDataNetworkException(
//           'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
//           NetworkErrorType.OTHER);
//   }
// }


}
