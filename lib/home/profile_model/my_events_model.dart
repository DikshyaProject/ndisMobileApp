class MyEventsModel {
  String? message;
  MyEventData? data;
  int? status;

  MyEventsModel({this.message, this.data, this.status});

  MyEventsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new MyEventData.fromJson(json['data']) : null;
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

class MyEventData {
  List<MyEventsList>? myEventsList;

  MyEventData({this.myEventsList});

  MyEventData.fromJson(Map<String, dynamic> json) {
    if (json['my_events_list'] != null) {
      myEventsList = <MyEventsList>[];
      json['my_events_list'].forEach((v) {
        myEventsList!.add(new MyEventsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myEventsList != null) {
      data['my_events_list'] =
          this.myEventsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyEventsList {
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
  List<EventLocation>? eventLocation;
  String? generalAdmission;
  String? eventTicketPrice;
  String? eventRegion;
  String? eventCdt;

  MyEventsList(
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
        this.eventLocation,
        this.generalAdmission,
        this.eventTicketPrice,
        this.eventRegion,
        this.eventCdt});

  MyEventsList.fromJson(Map<String, dynamic> json) {
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
    if (json['event_location'] != null) {
      eventLocation = <EventLocation>[];
      json['event_location'].forEach((v) {
        eventLocation!.add(new EventLocation.fromJson(v));
      });
    }
    generalAdmission = json['general_admission'];
    eventTicketPrice = json['event_ticket_price'];
    eventRegion = json['event_region'];
    eventCdt = json['event_cdt'];
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
    if (this.eventLocation != null) {
      data['event_location'] =
          this.eventLocation!.map((v) => v.toJson()).toList();
    }
    data['general_admission'] = this.generalAdmission;
    data['event_ticket_price'] = this.eventTicketPrice;
    data['event_region'] = this.eventRegion;
    data['event_cdt'] = this.eventCdt;
    return data;
  }
}

class EventLocation {
  String? location;
  String? locationCity;
  String? locationState;
  String? locationCountry;
  String? locationZipCode;
  String? locationLatitude;
  String? locationLongitude;

  EventLocation(
      {this.location,
        this.locationCity,
        this.locationState,
        this.locationCountry,
        this.locationZipCode,
        this.locationLatitude,
        this.locationLongitude});

  EventLocation.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    locationCity = json['location_city'];
    locationState = json['location_state'];
    locationCountry = json['location_country'];
    locationZipCode = json['location_zip_code'];
    locationLatitude = json['location_latitude'];
    locationLongitude = json['location_longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['location_city'] = this.locationCity;
    data['location_state'] = this.locationState;
    data['location_country'] = this.locationCountry;
    data['location_zip_code'] = this.locationZipCode;
    data['location_latitude'] = this.locationLatitude;
    data['location_longitude'] = this.locationLongitude;
    return data;
  }
}
