class GetSettingModel {
  String? message;
  GetSettingData? data;
  int? status;

  GetSettingModel({this.message, this.data, this.status});

  GetSettingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new GetSettingData.fromJson(json['data']) : null;
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

class GetSettingData {
  Deatils? deatils;

  GetSettingData({this.deatils});

  GetSettingData.fromJson(Map<String, dynamic> json) {
    deatils =
    json['deatils'] != null ? new Deatils.fromJson(json['deatils']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deatils != null) {
      data['deatils'] = this.deatils!.toJson();
    }
    return data;
  }
}

class Deatils {
  String? accountStatus;
  String? listingReview;
  String? listingShare;
  String? profileShow;

  Deatils(
      {this.accountStatus,
        this.listingReview,
        this.listingShare,
        this.profileShow});

  Deatils.fromJson(Map<String, dynamic> json) {
    accountStatus = json['account_status'];
    listingReview = json['listing_review'];
    listingShare = json['listing_share'];
    profileShow = json['profile_show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_status'] = this.accountStatus;
    data['listing_review'] = this.listingReview;
    data['listing_share'] = this.listingShare;
    data['profile_show'] = this.profileShow;
    return data;
  }
}
