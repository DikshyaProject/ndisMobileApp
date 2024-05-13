class NotificationsModel {
  String? message;
  int? status;
  NotificationsData? data;

  NotificationsModel({this.message, this.status, this.data});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new NotificationsData.fromJson(json['data']) : null;
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

class NotificationsData {
  List<Notifictionata>? notifictionata;

  NotificationsData({this.notifictionata});

  NotificationsData.fromJson(Map<String, dynamic> json) {
    if (json['notifictionata'] != null) {
      notifictionata = <Notifictionata>[];
      json['notifictionata'].forEach((v) {
        notifictionata!.add(new Notifictionata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifictionata != null) {
      data['notifictionata'] =
          this.notifictionata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifictionata {
  String? enquirySenderId;
  String? listingId;
  String? enquiryMessage;
  String? enquiryCdt;
  String? reviewUserId;
  String? reviewMessage;
  String? reviewCdt;
  String? listingLikesId;
  String? userId;
  String? listingLikesCdt;
  String? enquiryUsername;
  String? reviewUsername;
  String? likeUsername;
  String? listingName;

  Notifictionata(
      {this.enquirySenderId,
        this.listingId,
        this.enquiryMessage,
        this.enquiryCdt,
        this.reviewUserId,
        this.reviewMessage,
        this.reviewCdt,
        this.listingLikesId,
        this.userId,
        this.listingLikesCdt,
        this.enquiryUsername,
        this.reviewUsername,
        this.likeUsername,
        this.listingName});

  Notifictionata.fromJson(Map<String, dynamic> json) {
    enquirySenderId = json['enquiry_sender_id'];
    listingId = json['listing_id'];
    enquiryMessage = json['enquiry_message'];
    enquiryCdt = json['enquiry_cdt'];
    reviewUserId = json['review_user_id'];
    reviewMessage = json['review_message'];
    reviewCdt = json['review_cdt'];
    listingLikesId = json['listing_likes_id'];
    userId = json['user_id'];
    listingLikesCdt = json['listing_likes_cdt'];
    enquiryUsername = json['enquiry_username'];
    reviewUsername = json['review_username'];
    likeUsername = json['like_username'];
    listingName = json['listing_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enquiry_sender_id'] = this.enquirySenderId;
    data['listing_id'] = this.listingId;
    data['enquiry_message'] = this.enquiryMessage;
    data['enquiry_cdt'] = this.enquiryCdt;
    data['review_user_id'] = this.reviewUserId;
    data['review_message'] = this.reviewMessage;
    data['review_cdt'] = this.reviewCdt;
    data['listing_likes_id'] = this.listingLikesId;
    data['user_id'] = this.userId;
    data['listing_likes_cdt'] = this.listingLikesCdt;
    data['enquiry_username'] = this.enquiryUsername;
    data['review_username'] = this.reviewUsername;
    data['like_username'] = this.likeUsername;
    data['listing_name'] = this.listingName;
    return data;
  }
}
