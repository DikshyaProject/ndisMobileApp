class DirectQueriesModel {
  String? message;
  DirectQeriesData? data;
  int? status;

  DirectQueriesModel({this.message, this.data, this.status});

  DirectQueriesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new DirectQeriesData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class DirectQeriesData {
  List<DataList>? dataList;

  DirectQeriesData({this.dataList});

  DirectQeriesData.fromJson(Map<String, dynamic> json) {
    if (json['Data List'] != null) {
      dataList = <DataList>[];
      json['Data List'].forEach((v) {
        dataList!.add(new DataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataList != null) {
      data['Data List'] = this.dataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataList {
  String? enquiryId;
  String? leadType;
  String? enquiryMobile;
  String? enquiryMessage;

  DataList(
      {this.enquiryId, this.leadType, this.enquiryMobile, this.enquiryMessage});

  DataList.fromJson(Map<String, dynamic> json) {
    enquiryId = json['enquiry_id'];
    leadType = json['lead type'];
    enquiryMobile = json['enquiry_mobile'];
    enquiryMessage = json['enquiry_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enquiry_id'] = this.enquiryId;
    data['lead type'] = this.leadType;
    data['enquiry_mobile'] = this.enquiryMobile;
    data['enquiry_message'] = this.enquiryMessage;
    return data;
  }
}
