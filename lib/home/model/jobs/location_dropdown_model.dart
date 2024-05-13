class LocationDropdownModel {
  String? message;
  String? status;
  LocDropData? data;

  LocationDropdownModel({this.message, this.status, this.data});

  LocationDropdownModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new LocDropData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LocDropData {
  List<locationData>? data;

  LocDropData({this.data});

  LocDropData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <locationData>[];
      json['data'].forEach((v) {
        data!.add(new locationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class locationData {
  String? cityId;
  String? cityName;

  locationData({this.cityId, this.cityName});

  locationData.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    return data;
  }
}
