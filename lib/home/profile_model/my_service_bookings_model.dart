class ServiceBookingsModel {
  String? message;
  ServiceBookingsData? data;
  int? status;

  ServiceBookingsModel({this.message, this.data, this.status});

  ServiceBookingsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new ServiceBookingsData.fromJson(json['data']) : null;
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

class ServiceBookingsData {
  List<BookingList>? bookingList;

  ServiceBookingsData({this.bookingList});

  ServiceBookingsData.fromJson(Map<String, dynamic> json) {
    if (json['Booking List'] != null) {
      bookingList = <BookingList>[];
      json['Booking List'].forEach((v) {
        bookingList!.add(new BookingList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bookingList != null) {
      data['Booking List'] = this.bookingList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingList {
  String? leadId;
  String? mainCategory;
  String? subCategory;
  String? enquiryMessage;
  String? userAddress;
  String? howManyUsersCanSendAccess;
  String? leadStatus;

  BookingList(
      {this.leadId,
        this.mainCategory,
        this.subCategory,
        this.enquiryMessage,
        this.userAddress,
        this.howManyUsersCanSendAccess,
        this.leadStatus});

  BookingList.fromJson(Map<String, dynamic> json) {
    leadId = json['lead_id'];
    mainCategory = json['main_category'];
    subCategory = json['sub_category'];
    enquiryMessage = json['enquiry_message'];
    userAddress = json['user_address'];
    howManyUsersCanSendAccess = json['how_many_users_can_send_access'];
    leadStatus = json['lead_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lead_id'] = this.leadId;
    data['main_category'] = this.mainCategory;
    data['sub_category'] = this.subCategory;
    data['enquiry_message'] = this.enquiryMessage;
    data['user_address'] = this.userAddress;
    data['how_many_users_can_send_access'] = this.howManyUsersCanSendAccess;
    data['lead_status'] = this.leadStatus;
    return data;
  }
}
