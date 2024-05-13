

class SubCategoryListDetailsModel {
  String? message;
  int? status;
  SubCatDetailsData? data;

  SubCategoryListDetailsModel({this.message, this.status, this.data});

  SubCategoryListDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new SubCatDetailsData.fromJson(json['data']) : null;
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

class SubCatDetailsData {
  List<AllListingsData>? allListingsData;
  SubCatDetailsData({this.allListingsData});

  SubCatDetailsData.fromJson(Map<String, dynamic> json) {
    if (json['all_listings_data'] != null) {
      allListingsData = <AllListingsData>[];
      json['all_listings_data'].forEach((v) {
        allListingsData!.add(new AllListingsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allListingsData != null) {
      data['all_listings_data'] =
          this.allListingsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllListingsData {
  String? listingId;
  String? listingName;
  String? listingAddress;
  String? eneEffRating;
  String? listingStatus;
  String? listingApprove;
  String? listingToday;
  String? noOfStarRating;
  dynamic? noOfReviews;
  String? emailId;
  String? mobileNumber;
  String? profileImage;
  String? subCategoryId;
  String? listingUserId;
  List<String>? subCategoryName;
  bool isLike = false;
  int? statusOfWl;


  AllListingsData(
      {this.listingId,
        this.listingName,
        this.listingAddress,
        this.eneEffRating,
        this.listingStatus,
        this.listingApprove,
        this.listingToday,
        this.noOfStarRating,
        this.noOfReviews,
        this.emailId,
        this.mobileNumber,
        this.profileImage,
        this.subCategoryName,
        this.listingUserId,
        this.statusOfWl,
        required this.isLike,
        this.subCategoryId});

  AllListingsData.fromJson(Map<String, dynamic> json)
  {
    listingId = json['listing_id'];
    listingName = json['listing_name'];
    listingAddress = json['listing_address'];
    eneEffRating = json['ene_eff_rating'];
    listingStatus = json['listing_status'];
    listingApprove = json['listing_approve'];
    listingToday = json['listing_today'];
    noOfStarRating = json['no_of_star_rating'];
    noOfReviews = json['no_of_reviews'];
    emailId = json['email_id'];
    mobileNumber = json['mobile_number'];
    profileImage = json['profile_image'];
    subCategoryId = json['sub_category_id'];
    listingUserId = json['listing_user_id'];
    statusOfWl = json['status_of_wl'];
    subCategoryName = json['sub_category_name'].cast<String>();
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listing_id'] = this.listingId;
    data['listing_name'] = this.listingName;
    data['listing_address'] = this.listingAddress;
    data['ene_eff_rating'] = this.eneEffRating;
    data['listing_status'] = this.listingStatus;
    data['listing_approve'] = this.listingApprove;
    data['listing_today'] = this.listingToday;
    data['no_of_star_rating'] = this.noOfStarRating;
    data['no_of_reviews'] = this.noOfReviews;
    data['email_id'] = this.emailId;
    data['mobile_number'] = this.mobileNumber;
    data['profile_image'] = this.profileImage;
    data['sub_category_id'] = this.subCategoryId;
    data['listing_user_id'] = this.listingUserId;
    data['sub_category_name'] = this.subCategoryName;
    data['status_of_wl'] = this.statusOfWl;
    return data;
  }

}
