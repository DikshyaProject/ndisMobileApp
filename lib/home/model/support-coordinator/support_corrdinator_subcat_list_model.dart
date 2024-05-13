class SupportCorrdinatorSubcatListModel {
  String? message;
  int? status;
  SupCorrdinatoreSubCatData? data;

  SupportCorrdinatorSubcatListModel({this.message, this.status, this.data});

  SupportCorrdinatorSubcatListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new SupCorrdinatoreSubCatData.fromJson(json['data']) : null;
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

class SupCorrdinatoreSubCatData {
  List<SupportListingsData>? supportListingsData;

  SupCorrdinatoreSubCatData({this.supportListingsData});

  SupCorrdinatoreSubCatData.fromJson(Map<String, dynamic> json) {
    if (json['support_listings_data'] != null) {
      supportListingsData = <SupportListingsData>[];
      json['support_listings_data'].forEach((v) {
        supportListingsData!.add(new SupportListingsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.supportListingsData != null) {
      data['support_listings_data'] =
          this.supportListingsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SupportListingsData {
  String? listingId;
  String? listingName;
  String? listingAddress;
  String? eneEffRating;
  String? listingStatus;
  String? listingApprove;
  String? emailId;
  String? mobileNumber;
  String? profileImage;
  List<String>? subCategoryName;
  String? subCategoryId;

  SupportListingsData(
      {this.listingId,
        this.listingName,
        this.listingAddress,
        this.eneEffRating,
        this.listingStatus,
        this.listingApprove,
        this.emailId,
        this.mobileNumber,
        this.profileImage,
        this.subCategoryName,
        this.subCategoryId});

  SupportListingsData.fromJson(Map<String, dynamic> json) {
    listingId = json['listing_id'];
    listingName = json['listing_name'];
    listingAddress = json['listing_address'];
    eneEffRating = json['ene_eff_rating'];
    listingStatus = json['listing_status'];
    listingApprove = json['listing_approve'];
    emailId = json['email_id'];
    mobileNumber = json['mobile_number'];
    profileImage = json['profile_image'];
    subCategoryName = json['sub_category_name'].cast<String>();
    subCategoryId = json['sub_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listing_id'] = this.listingId;
    data['listing_name'] = this.listingName;
    data['listing_address'] = this.listingAddress;
    data['ene_eff_rating'] = this.eneEffRating;
    data['listing_status'] = this.listingStatus;
    data['listing_approve'] = this.listingApprove;
    data['email_id'] = this.emailId;
    data['mobile_number'] = this.mobileNumber;
    data['profile_image'] = this.profileImage;
    data['sub_category_name'] = this.subCategoryName;
    data['sub_category_id'] = this.subCategoryId;
    return data;
  }
}
