class AllReviewsModel {
  String? message;
  AllReviewsData? data;
  int? status;

  AllReviewsModel({this.message, this.data, this.status});

  AllReviewsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new AllReviewsData.fromJson(json['data']) : null;
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

class AllReviewsData {
  List<SentReviewsList>? sentReviewsList;

  AllReviewsData({this.sentReviewsList});

  AllReviewsData.fromJson(Map<String, dynamic> json) {
    if (json['sent_reviews_list'] != null) {
      sentReviewsList = <SentReviewsList>[];
      json['sent_reviews_list'].forEach((v) {
        sentReviewsList!.add(new SentReviewsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sentReviewsList != null) {
      data['sent_reviews_list'] =
          this.sentReviewsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SentReviewsList {
  String? reviewId;
  String? listingId;
  String? listingUserId;
  String? reviewUserId;
  String? priceRating;
  String? customerServiceRating;
  String? staffRating;
  String? overallRating;
  String? reviewName;
  String? reviewMobile;
  String? reviewEmail;
  String? reviewCity;
  String? reviewMessage;
  String? reviewStatus;
  String? reviewSave;
  String? reviewCdt;
  String? listingName;

  SentReviewsList(
      {this.reviewId,
        this.listingId,
        this.listingUserId,
        this.reviewUserId,
        this.priceRating,
        this.customerServiceRating,
        this.staffRating,
        this.overallRating,
        this.reviewName,
        this.reviewMobile,
        this.reviewEmail,
        this.reviewCity,
        this.reviewMessage,
        this.reviewStatus,
        this.reviewSave,
        this.reviewCdt,
        this.listingName});

  SentReviewsList.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    listingId = json['listing_id'];
    listingUserId = json['listing_user_id'];
    reviewUserId = json['review_user_id'];
    priceRating = json['price_rating'];
    customerServiceRating = json['customer_service_rating'];
    staffRating = json['staff_rating'];
    overallRating = json['overall_rating'];
    reviewName = json['review_name'];
    reviewMobile = json['review_mobile'];
    reviewEmail = json['review_email'];
    reviewCity = json['review_city'];
    reviewMessage = json['review_message'];
    reviewStatus = json['review_status'];
    reviewSave = json['review_save'];
    reviewCdt = json['review_cdt'];
    listingName = json['listing_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this.reviewId;
    data['listing_id'] = this.listingId;
    data['listing_user_id'] = this.listingUserId;
    data['review_user_id'] = this.reviewUserId;
    data['price_rating'] = this.priceRating;
    data['customer_service_rating'] = this.customerServiceRating;
    data['staff_rating'] = this.staffRating;
    data['overall_rating'] = this.overallRating;
    data['review_name'] = this.reviewName;
    data['review_mobile'] = this.reviewMobile;
    data['review_email'] = this.reviewEmail;
    data['review_city'] = this.reviewCity;
    data['review_message'] = this.reviewMessage;
    data['review_status'] = this.reviewStatus;
    data['review_save'] = this.reviewSave;
    data['review_cdt'] = this.reviewCdt;
    data['listing_name'] = this.listingName;
    return data;
  }
}
