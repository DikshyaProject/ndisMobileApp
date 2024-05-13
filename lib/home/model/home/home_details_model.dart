class HomePageDetailsModel {
  String? message;
  int? status;
  HomeDetailsData? data;

  HomePageDetailsModel({this.message, this.status, this.data});

  HomePageDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? new HomeDetailsData.fromJson(json['data'])
        : null;
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

class HomeDetailsData {
  List<PopularServicesNearYou>? popularServicesNearYou;
  List<NewsSliderData>? newsSliderData;
  List<FeatureEventsInCity>? featureEventsInCity;
  String? url;

  HomeDetailsData(
      {this.popularServicesNearYou,
      this.newsSliderData,
      this.featureEventsInCity,
      this.url});

  HomeDetailsData.fromJson(Map<String, dynamic> json) {
    if (json['popular_services_near_you'] != null) {
      popularServicesNearYou = <PopularServicesNearYou>[];
      json['popular_services_near_you'].forEach((v) {
        popularServicesNearYou!.add(new PopularServicesNearYou.fromJson(v));
      });
    }
    if (json['news_slider_data'] != null) {
      newsSliderData = <NewsSliderData>[];
      json['news_slider_data'].forEach((v) {
        newsSliderData!.add(new NewsSliderData.fromJson(v));
      });
    }
    if (json['feature_events_in_city'] != null) {
      featureEventsInCity = <FeatureEventsInCity>[];
      json['feature_events_in_city'].forEach((v) {
        featureEventsInCity!.add(new FeatureEventsInCity.fromJson(v));
      });
    }
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.popularServicesNearYou != null) {
      data['popular_services_near_you'] =
          this.popularServicesNearYou!.map((v) => v.toJson()).toList();
    }
    if (this.newsSliderData != null) {
      data['news_slider_data'] =
          this.newsSliderData!.map((v) => v.toJson()).toList();
    }
    if (this.featureEventsInCity != null) {
      data['feature_events_in_city'] =
          this.featureEventsInCity!.map((v) => v.toJson()).toList();
    }
    data['url'] = this.url;
    return data;
  }
}

class PopularServicesNearYou {
  String? categoryId;
  String? categoryCode;
  String? categoryName;
  String? categoryImage;
  String? categoryDescription;
  String? categorySeoTitle;
  String? categorySeoDescription;
  String? categorySeoKeywords;
  String? categoryFaq1Ques;
  String? categoryFaq1Ans;
  String? categoryFaq2Ques;
  String? categoryFaq2Ans;
  String? categoryFaq3Ques;
  String? categoryFaq3Ans;
  String? categoryFaq4Ques;
  String? categoryFaq4Ans;
  String? categoryFaq5Ques;
  String? categoryFaq5Ans;
  String? categoryFaq6Ques;
  String? categoryFaq6Ans;
  String? categoryFaq7Ques;
  String? categoryFaq7Ans;
  String? categoryFaq8Ques;
  String? categoryFaq8Ans;
  String? categoryGoogleSchema;
  String? categoryFilter;
  String? categoryFilterPosId;
  String? categoryStatus;
  String? categorySlug;
  String? categoryViews;
  String? categoryEditCdt;
  String? categoryCdt;
  dynamic? listingsCount;

  PopularServicesNearYou(
      {this.categoryId,
      this.categoryCode,
      this.categoryName,
      this.categoryImage,
      this.categoryDescription,
      this.categorySeoTitle,
      this.categorySeoDescription,
      this.categorySeoKeywords,
      this.categoryFaq1Ques,
      this.categoryFaq1Ans,
      this.categoryFaq2Ques,
      this.categoryFaq2Ans,
      this.categoryFaq3Ques,
      this.categoryFaq3Ans,
      this.categoryFaq4Ques,
      this.categoryFaq4Ans,
      this.categoryFaq5Ques,
      this.categoryFaq5Ans,
      this.categoryFaq6Ques,
      this.categoryFaq6Ans,
      this.categoryFaq7Ques,
      this.categoryFaq7Ans,
      this.categoryFaq8Ques,
      this.categoryFaq8Ans,
      this.categoryGoogleSchema,
      this.categoryFilter,
      this.categoryFilterPosId,
      this.categoryStatus,
      this.categorySlug,
      this.categoryViews,
      this.categoryEditCdt,
      this.categoryCdt,
      this.listingsCount});

  PopularServicesNearYou.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryCode = json['category_code'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    categoryDescription = json['category_description'];
    categorySeoTitle = json['category_seo_title'];
    categorySeoDescription = json['category_seo_description'];
    categorySeoKeywords = json['category_seo_keywords'];
    categoryFaq1Ques = json['category_faq_1_ques'];
    categoryFaq1Ans = json['category_faq_1_ans'];
    categoryFaq2Ques = json['category_faq_2_ques'];
    categoryFaq2Ans = json['category_faq_2_ans'];
    categoryFaq3Ques = json['category_faq_3_ques'];
    categoryFaq3Ans = json['category_faq_3_ans'];
    categoryFaq4Ques = json['category_faq_4_ques'];
    categoryFaq4Ans = json['category_faq_4_ans'];
    categoryFaq5Ques = json['category_faq_5_ques'];
    categoryFaq5Ans = json['category_faq_5_ans'];
    categoryFaq6Ques = json['category_faq_6_ques'];
    categoryFaq6Ans = json['category_faq_6_ans'];
    categoryFaq7Ques = json['category_faq_7_ques'];
    categoryFaq7Ans = json['category_faq_7_ans'];
    categoryFaq8Ques = json['category_faq_8_ques'];
    categoryFaq8Ans = json['category_faq_8_ans'];
    categoryGoogleSchema = json['category_google_schema'];
    categoryFilter = json['category_filter'];
    categoryFilterPosId = json['category_filter_pos_id'];
    categoryStatus = json['category_status'];
    categorySlug = json['category_slug'];
    categoryViews = json['category_views'];
    categoryEditCdt = json['category_edit_cdt'];
    categoryCdt = json['category_cdt'];
    listingsCount = json['listings_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_code'] = this.categoryCode;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    data['category_description'] = this.categoryDescription;
    data['category_seo_title'] = this.categorySeoTitle;
    data['category_seo_description'] = this.categorySeoDescription;
    data['category_seo_keywords'] = this.categorySeoKeywords;
    data['category_faq_1_ques'] = this.categoryFaq1Ques;
    data['category_faq_1_ans'] = this.categoryFaq1Ans;
    data['category_faq_2_ques'] = this.categoryFaq2Ques;
    data['category_faq_2_ans'] = this.categoryFaq2Ans;
    data['category_faq_3_ques'] = this.categoryFaq3Ques;
    data['category_faq_3_ans'] = this.categoryFaq3Ans;
    data['category_faq_4_ques'] = this.categoryFaq4Ques;
    data['category_faq_4_ans'] = this.categoryFaq4Ans;
    data['category_faq_5_ques'] = this.categoryFaq5Ques;
    data['category_faq_5_ans'] = this.categoryFaq5Ans;
    data['category_faq_6_ques'] = this.categoryFaq6Ques;
    data['category_faq_6_ans'] = this.categoryFaq6Ans;
    data['category_faq_7_ques'] = this.categoryFaq7Ques;
    data['category_faq_7_ans'] = this.categoryFaq7Ans;
    data['category_faq_8_ques'] = this.categoryFaq8Ques;
    data['category_faq_8_ans'] = this.categoryFaq8Ans;
    data['category_google_schema'] = this.categoryGoogleSchema;
    data['category_filter'] = this.categoryFilter;
    data['category_filter_pos_id'] = this.categoryFilterPosId;
    data['category_status'] = this.categoryStatus;
    data['category_slug'] = this.categorySlug;
    data['category_views'] = this.categoryViews;
    data['category_edit_cdt'] = this.categoryEditCdt;
    data['category_cdt'] = this.categoryCdt;
    data['listings_count'] = this.listingsCount;
    return data;
  }
}

class NewsSliderData {
  String? newsSliderId;
  String? newsId;
  String? newsSliderPosId;
  String? newsSliderCdt;

  NewsSliderData(
      {this.newsSliderId,
      this.newsId,
      this.newsSliderPosId,
      this.newsSliderCdt});

  NewsSliderData.fromJson(Map<String, dynamic> json) {
    newsSliderId = json['news_slider_id'];
    newsId = json['news_id'];
    newsSliderPosId = json['news_slider_pos_id'];
    newsSliderCdt = json['news_slider_cdt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_slider_id'] = this.newsSliderId;
    data['news_id'] = this.newsId;
    data['news_slider_pos_id'] = this.newsSliderPosId;
    data['news_slider_cdt'] = this.newsSliderCdt;
    return data;
  }
}

class FeatureEventsInCity {
  String? eventId;
  String? userId;
  String? eventName;
  String? eventDescription;
  String? categoryId;
  String? eventImage;
  String? eventStartDate;
  String? eventEndDate;
  String? eventTime;
  String? eventContactName;
  String? eventEmail;
  String? eventMobile;
  String? eventWebsite;
  String? eventAddress;
  String? eventMap;
  String? cityId;
  String? stateId;
  String? seoTitle;
  String? seoDescription;
  String? seoKeywords;
  String? eventStatus;
  String? eventSlug;
  String? eventType;
  String? isenquiry;
  String? eventCdt;
  String? event_ticket_price;

  FeatureEventsInCity(
      {this.eventId,
      this.userId,
      this.eventName,
      this.eventDescription,
      this.categoryId,
      this.eventImage,
      this.eventStartDate,
      this.eventEndDate,
      this.eventTime,
      this.eventContactName,
      this.eventEmail,
      this.eventMobile,
      this.eventWebsite,
      this.eventAddress,
      this.eventMap,
      this.cityId,
      this.stateId,
      this.seoTitle,
      this.seoDescription,
      this.seoKeywords,
      this.eventStatus,
      this.eventSlug,
      this.eventType,
      this.isenquiry,
      this.eventCdt,
      this.event_ticket_price});

  FeatureEventsInCity.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    userId = json['user_id'];
    eventName = json['event_name'];
    eventDescription = json['event_description'];
    categoryId = json['category_id'];
    eventImage = json['event_image'];
    eventStartDate = json['event_start_date'];
    eventEndDate = json['event_end_date'];
    eventTime = json['event_time'];
    eventContactName = json['event_contact_name'];
    eventEmail = json['event_email'];
    eventMobile = json['event_mobile'];
    eventWebsite = json['event_website'];
    eventAddress = json['event_address'];
    eventMap = json['event_map'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeywords = json['seo_keywords'];
    eventStatus = json['event_status'];
    eventSlug = json['event_slug'];
    eventType = json['event_type'];
    isenquiry = json['isenquiry'];
    eventCdt = json['event_cdt'];
    event_ticket_price = json['event_ticket_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['user_id'] = this.userId;
    data['event_name'] = this.eventName;
    data['event_description'] = this.eventDescription;
    data['category_id'] = this.categoryId;
    data['event_image'] = this.eventImage;
    data['event_start_date'] = this.eventStartDate;
    data['event_end_date'] = this.eventEndDate;
    data['event_time'] = this.eventTime;
    data['event_contact_name'] = this.eventContactName;
    data['event_email'] = this.eventEmail;
    data['event_mobile'] = this.eventMobile;
    data['event_website'] = this.eventWebsite;
    data['event_address'] = this.eventAddress;
    data['event_map'] = this.eventMap;
    data['city_id'] = this.cityId;
    data['state_id'] = this.stateId;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['event_status'] = this.eventStatus;
    data['event_slug'] = this.eventSlug;
    data['event_type'] = this.eventType;
    data['isenquiry'] = this.isenquiry;
    data['event_cdt'] = this.eventCdt;
    data['event_ticket_price'] = this.event_ticket_price;
    return data;
  }
}
