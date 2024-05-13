class SeoListModel {
  String? message;
  SeoData? data;
  int? status;

  SeoListModel({this.message, this.data, this.status});

  SeoListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new SeoData.fromJson(json['data']) : null;
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

class SeoData {
  List<SeoListing>? seoListing;
  List<SeoEvent>? seoEvent;
  List<SeoBlog>? seoBlog;
  List<SeoProduct>? seoProduct;

  SeoData({this.seoListing, this.seoEvent, this.seoBlog, this.seoProduct});

  SeoData.fromJson(Map<String, dynamic> json) {
    if (json['seo_listing'] != null) {
      seoListing = <SeoListing>[];
      json['seo_listing'].forEach((v) {
        seoListing!.add(new SeoListing.fromJson(v));
      });
    }
    if (json['seo_event'] != null) {
      seoEvent = <SeoEvent>[];
      json['seo_event'].forEach((v) {
        seoEvent!.add(new SeoEvent.fromJson(v));
      });
    }
    if (json['seo_blog'] != null) {
      seoBlog = <SeoBlog>[];
      json['seo_blog'].forEach((v) {
        seoBlog!.add(new SeoBlog.fromJson(v));
      });
    }
    if (json['seo_product'] != null) {
      seoProduct = <SeoProduct>[];
      json['seo_product'].forEach((v) {
        seoProduct!.add(new SeoProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seoListing != null) {
      data['seo_listing'] = this.seoListing!.map((v) => v.toJson()).toList();
    }
    if (this.seoEvent != null) {
      data['seo_event'] = this.seoEvent!.map((v) => v.toJson()).toList();
    }
    if (this.seoBlog != null) {
      data['seo_blog'] = this.seoBlog!.map((v) => v.toJson()).toList();
    }
    if (this.seoProduct != null) {
      data['seo_product'] = this.seoProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeoListing {
  String? profileImage;
  String? listingName;
  String? cdt;
  String? type;

  SeoListing({this.profileImage, this.listingName, this.cdt, this.type});

  SeoListing.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    listingName = json['listing_name'];
    cdt = json['cdt'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    data['listing_name'] = this.listingName;
    data['cdt'] = this.cdt;
    data['type'] = this.type;
    return data;
  }
}

class SeoEvent {
  String? profileImage;
  String? listingName;
  String? cdt;
  String? type;

  SeoEvent({this.profileImage, this.listingName, this.cdt, this.type});

  SeoEvent.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    listingName = json['listing_name'];
    cdt = json['cdt'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    data['listing_name'] = this.listingName;
    data['cdt'] = this.cdt;
    data['type'] = this.type;
    return data;
  }
}

class SeoBlog {
  String? profileImage;
  String? listingName;
  String? cdt;
  String? type;

  SeoBlog({this.profileImage, this.listingName, this.cdt, this.type});

  SeoBlog.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    listingName = json['listing_name'];
    cdt = json['cdt'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    data['listing_name'] = this.listingName;
    data['cdt'] = this.cdt;
    data['type'] = this.type;
    return data;
  }
}

class SeoProduct {
  String? profileImage;
  String? listingName;
  String? cdt;
  String? type;

  SeoProduct({this.profileImage, this.listingName, this.cdt, this.type});

  SeoProduct.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    listingName = json['listing_name'];
    cdt = json['cdt'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    data['listing_name'] = this.listingName;
    data['cdt'] = this.cdt;
    data['type'] = this.type;
    return data;
  }
}
