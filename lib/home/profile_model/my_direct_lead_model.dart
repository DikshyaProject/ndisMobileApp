class DirectLeadsModel {
  String? message;
  DirectLeadsData? data;
  int? status;

  DirectLeadsModel({this.message, this.data, this.status});

  DirectLeadsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new DirectLeadsData.fromJson(json['data']) : null;
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

class DirectLeadsData {
  List<VehiclesEnquiryDetailList>? vehiclesEnquiryDetailList;

  DirectLeadsData({this.vehiclesEnquiryDetailList});

  DirectLeadsData.fromJson(Map<String, dynamic> json) {
    if (json['vehicles_enquiry_detail_list'] != null) {
      vehiclesEnquiryDetailList = <VehiclesEnquiryDetailList>[];
      json['vehicles_enquiry_detail_list'].forEach((v) {
        vehiclesEnquiryDetailList!
            .add(new VehiclesEnquiryDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vehiclesEnquiryDetailList != null) {
      data['vehicles_enquiry_detail_list'] =
          this.vehiclesEnquiryDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehiclesEnquiryDetailList {
  int? sNo;
  String? name;
  String? phone;
  String? emailId;
  String? userType;
  String? enquiryMessage;
  String? companyUrl;
  String? enquirySource;
  String? leadType;

  VehiclesEnquiryDetailList(
      {this.sNo,
        this.name,
        this.phone,
        this.emailId,
        this.userType,
        this.enquiryMessage,
        this.companyUrl,
        this.enquirySource,
        this.leadType});

  VehiclesEnquiryDetailList.fromJson(Map<String, dynamic> json) {
    sNo = json['s_no'];
    name = json['name'];
    phone = json['phone'];
    emailId = json['email_id'];
    userType = json['user_type'];
    enquiryMessage = json['enquiry_message'];
    companyUrl = json['company_url'];
    enquirySource = json['enquiry_source'];
    leadType = json['lead_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s_no'] = this.sNo;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email_id'] = this.emailId;
    data['user_type'] = this.userType;
    data['enquiry_message'] = this.enquiryMessage;
    data['company_url'] = this.companyUrl;
    data['enquiry_source'] = this.enquirySource;
    data['lead_type'] = this.leadType;
    return data;
  }
}
