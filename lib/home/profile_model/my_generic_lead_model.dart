class GenericLeadsModel {
  String? message;
  GenericLeadData? data;
  int? status;

  GenericLeadsModel({this.message, this.data, this.status});

  GenericLeadsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new GenericLeadData.fromJson(json['data']) : null;
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

class GenericLeadData {
  List<DbEnquiryData>? dbEnquiryData;

  GenericLeadData({this.dbEnquiryData});

  GenericLeadData.fromJson(Map<String, dynamic> json) {
    if (json['db enquiry data'] != null) {
      dbEnquiryData = <DbEnquiryData>[];
      json['db enquiry data'].forEach((v) {
        dbEnquiryData!.add(new DbEnquiryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dbEnquiryData != null) {
      data['db enquiry data'] =
          this.dbEnquiryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DbEnquiryData {
  String? srId;
  String? singleUserName;
  String? enquiryCdt;
  String? mobileNumber;
  String? emailId;
  String? singleUserUserType;
  String? mainCategory;
  String? subCategory;
  String? enquiryMessage;
  String? userAddress;
  String? userSendAccess;

  DbEnquiryData(
      {this.srId,
        this.singleUserName,
        this.enquiryCdt,
        this.mobileNumber,
        this.emailId,
        this.singleUserUserType,
        this.mainCategory,
        this.subCategory,
        this.enquiryMessage,
        this.userAddress,
        this.userSendAccess});

  DbEnquiryData.fromJson(Map<String, dynamic> json) {
    srId = json['sr_id'];
    singleUserName = json['single_user_name'];
    enquiryCdt = json['enquiry_cdt'];
    mobileNumber = json['mobile_number'];
    emailId = json['email_id'];
    singleUserUserType = json['single_user_user_type'];
    mainCategory = json['main_category'];
    subCategory = json['sub_category'];
    enquiryMessage = json['enquiry_message'];
    userAddress = json['user_address'];
    userSendAccess = json['user_send_access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sr_id'] = this.srId;
    data['single_user_name'] = this.singleUserName;
    data['enquiry_cdt'] = this.enquiryCdt;
    data['mobile_number'] = this.mobileNumber;
    data['email_id'] = this.emailId;
    data['single_user_user_type'] = this.singleUserUserType;
    data['main_category'] = this.mainCategory;
    data['sub_category'] = this.subCategory;
    data['enquiry_message'] = this.enquiryMessage;
    data['user_address'] = this.userAddress;
    data['user_send_access'] = this.userSendAccess;
    return data;
  }
}
