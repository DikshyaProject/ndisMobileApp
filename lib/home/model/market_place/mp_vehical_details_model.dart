class MPVehicalDetailsModel {
  String? message;
  int? status;
  VehicalDetailsData? data;

  MPVehicalDetailsModel({this.message, this.status, this.data});

  MPVehicalDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new VehicalDetailsData.fromJson(json['data']) : null;
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

class VehicalDetailsData {
  VehicleDetail? vehicleDetail;

  VehicalDetailsData({this.vehicleDetail});

  VehicalDetailsData.fromJson(Map<String, dynamic> json) {
    vehicleDetail = json['vehicle_detail'] != null
        ? new VehicleDetail.fromJson(json['vehicle_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vehicleDetail != null) {
      data['vehicle_detail'] = this.vehicleDetail!.toJson();
    }
    return data;
  }
}

class VehicleDetail {
  String? productId;
  String? productCode;
  String? userId;
  String? categoryId;
  String? subCategoryId;
  String? serviceId;
  String? serviceImage;
  String? productName;
  String? productDescription;
  String? productInfoQuestion;
  String? productInfoAnswer;
  String? productPrice;
  String? productPriceOffer;
  List<String>? galleryImage;
  String? productPaymentLink;
  String? productHighlights;
  String? productTags;
  String? seoTitle;
  String? seoDescription;
  String? seoKeywords;
  String? productStatus;
  String? paymentStatus;
  String? productSlug;
  String? productIsDelete;
  String? productDeleteCdt;
  String? productCdt;
  String? joinOn;
  UserDetail? userDetail;
  List<Category>? category;

  VehicleDetail(
      {this.productId,
        this.productCode,
        this.userId,
        this.categoryId,
        this.subCategoryId,
        this.serviceId,
        this.serviceImage,
        this.productName,
        this.productDescription,
        this.productInfoQuestion,
        this.productInfoAnswer,
        this.productPrice,
        this.productPriceOffer,
        this.galleryImage,
        this.productPaymentLink,
        this.productHighlights,
        this.productTags,
        this.seoTitle,
        this.seoDescription,
        this.seoKeywords,
        this.productStatus,
        this.paymentStatus,
        this.productSlug,
        this.productIsDelete,
        this.productDeleteCdt,
        this.productCdt,
        this.joinOn,
        this.userDetail,
        this.category});

  VehicleDetail.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productCode = json['product_code'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    serviceId = json['service_id'];
    serviceImage = json['service_image'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productInfoQuestion = json['product_info_question'];
    productInfoAnswer = json['product_info_answer'];
    productPrice = json['product_price'];
    productPriceOffer = json['product_price_offer'];
    galleryImage = json['gallery_image'].cast<String>();
    productPaymentLink = json['product_payment_link'];
    productHighlights = json['product_highlights'];
    productTags = json['product_tags'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeywords = json['seo_keywords'];
    productStatus = json['product_status'];
    paymentStatus = json['payment_status'];
    productSlug = json['product_slug'];
    productIsDelete = json['product_is_delete'];
    productDeleteCdt = json['product_delete_cdt'];
    productCdt = json['product_cdt'];
    joinOn = json['join_on'];
    userDetail = json['user_detail'] != null
        ? new UserDetail.fromJson(json['user_detail'])
        : null;
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_code'] = this.productCode;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['service_id'] = this.serviceId;
    data['service_image'] = this.serviceImage;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['product_info_question'] = this.productInfoQuestion;
    data['product_info_answer'] = this.productInfoAnswer;
    data['product_price'] = this.productPrice;
    data['product_price_offer'] = this.productPriceOffer;
    data['gallery_image'] = this.galleryImage;
    data['product_payment_link'] = this.productPaymentLink;
    data['product_highlights'] = this.productHighlights;
    data['product_tags'] = this.productTags;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['product_status'] = this.productStatus;
    data['payment_status'] = this.paymentStatus;
    data['product_slug'] = this.productSlug;
    data['product_is_delete'] = this.productIsDelete;
    data['product_delete_cdt'] = this.productDeleteCdt;
    data['product_cdt'] = this.productCdt;
    data['join_on'] = this.joinOn;
    if (this.userDetail != null) {
      data['user_detail'] = this.userDetail!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetail {
  String? userId;
  String? settingProfileShow;
  String? userSlug;
  String? profileImage;
  String? userCode;
  String? userName;
  String? mobileNumber;
  String? userPlan;

  UserDetail(
      {this.userId,
        this.settingProfileShow,
        this.userSlug,
        this.profileImage,
        this.userCode,
        this.userName,
        this.mobileNumber,
        this.userPlan});

  UserDetail.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    settingProfileShow = json['setting_profile_show'];
    userSlug = json['user_slug'];
    profileImage = json['profile_image'];
    userCode = json['user_code'];
    userName = json['user_name'];
    mobileNumber = json['mobile_number'];
    userPlan = json['user_plan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['setting_profile_show'] = this.settingProfileShow;
    data['user_slug'] = this.userSlug;
    data['profile_image'] = this.profileImage;
    data['user_code'] = this.userCode;
    data['user_name'] = this.userName;
    data['mobile_number'] = this.mobileNumber;
    data['user_plan'] = this.userPlan;
    return data;
  }
}

class Category {
  String? categoryId;
  String? categoryName;

  Category({this.categoryId, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    return data;
  }
}
