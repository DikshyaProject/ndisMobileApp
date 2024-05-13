class ProfileCountsModel {
  String? message;
  ProfileCountsData? data;
  int? status;

  ProfileCountsModel({this.message, this.data, this.status});

  ProfileCountsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new ProfileCountsData.fromJson(json['data']) : null;
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

class ProfileCountsData {
  int? reviews;
  int? allLikes;
  int? followings;

  ProfileCountsData({this.reviews, this.allLikes, this.followings});

  ProfileCountsData.fromJson(Map<String, dynamic> json) {
    reviews = json['reviews'];
    allLikes = json['all_likes'];
    followings = json['followings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviews'] = this.reviews;
    data['all_likes'] = this.allLikes;
    data['followings'] = this.followings;
    return data;
  }
}
