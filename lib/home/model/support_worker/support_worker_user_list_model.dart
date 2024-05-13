class SupportWUserListModel {
  String? message;
  int? status;
  SupportWorkerUserData? data;

  SupportWUserListModel({this.message, this.status, this.data});

  SupportWUserListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new SupportWorkerUserData.fromJson(json['data']) : null;
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

class SupportWorkerUserData {
  List<SupportWorkerUserList>? supportWorkerUserList;

  SupportWorkerUserData({this.supportWorkerUserList});

  SupportWorkerUserData.fromJson(Map<String, dynamic> json) {
    if (json['sw_user_list'] != null) {
      supportWorkerUserList = <SupportWorkerUserList>[];
      json['sw_user_list'].forEach((v) {
        supportWorkerUserList!.add(new SupportWorkerUserList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.supportWorkerUserList != null) {
      data['sw_user_list'] = this.supportWorkerUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SupportWorkerUserList {
  String? userId;
  String? userName;
  String? mobileNumber;
  String? profileImage;
  String? userCode;
  String? happyToTravel;
  String? lastActive;
  String? aboutMe;
  int? serviceDone;
  String? yearsExp;

  SupportWorkerUserList(
      {this.userId, this.userName, this.mobileNumber, this.profileImage,
      this.userCode, this.happyToTravel, this.lastActive, this.aboutMe, this.serviceDone, this.yearsExp
      });

  SupportWorkerUserList.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    mobileNumber = json['mobile_number'];
    profileImage = json['profile_image'];
    userCode = json['user_code'];
    happyToTravel = json['happy_to_travel'];
    lastActive = json['last_active'];
    aboutMe = json['about_me'];
    serviceDone = json['service_done'];
    yearsExp = json['years_exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['mobile_number'] = this.mobileNumber;
    data['profile_image'] = this.profileImage;
    data['user_code'] = this.userCode;
    data['happy_to_travel'] = this.happyToTravel;
    data['last_active'] = this.lastActive;
    data['about_me'] = this.aboutMe;
    data['service_done'] = this.serviceDone;
    data['years_exp'] = this.yearsExp;
    return data;
  }
}
