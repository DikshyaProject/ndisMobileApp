class EventListDetailsModel {
  String? message;
  int? status;
  EventDetailsData? data;

  EventListDetailsModel({this.message, this.status, this.data});

  EventListDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new EventDetailsData.fromJson(json['data']) : null;
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

class EventDetailsData {
  Post? post;
  List<EventInformtion>? eventInformtion;
  List<RelatedEvents>? relatedEvents;

  EventDetailsData({this.post, this.eventInformtion, this.relatedEvents});

  EventDetailsData.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
    if (json['event_informtion'] != null) {
      eventInformtion = <EventInformtion>[];
      json['event_informtion'].forEach((v) {
        eventInformtion!.add(new EventInformtion.fromJson(v));
      });
    }
    if (json['related_events'] != null) {
      relatedEvents = <RelatedEvents>[];
      json['related_events'].forEach((v) {
        relatedEvents!.add(new RelatedEvents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    if (this.eventInformtion != null) {
      data['event_informtion'] =
          this.eventInformtion!.map((v) => v.toJson()).toList();
    }
    if (this.relatedEvents != null) {
      data['related_events'] =
          this.relatedEvents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  String? eventId;
  String? userId;
  String? eventName;
  String? eventDescription;
  String? eventStartDate;
  String? eventTime;
  String? eventContactName;
  String? eventEmail;
  String? eventMobile;
  String? eventWebsite;
  String? eventAddress;
  String? categoryId;
  String? eventImage;
  String? eventCdt;
  String? hostedBy;
  String? userCdt;
  String? profileImage;

  Post(
      {this.eventId,
        this.userId,
        this.eventName,
        this.eventDescription,
        this.eventStartDate,
        this.eventTime,
        this.eventContactName,
        this.eventEmail,
        this.eventMobile,
        this.eventWebsite,
        this.eventAddress,
        this.categoryId,
        this.eventImage,
        this.eventCdt,
        this.hostedBy,
        this.userCdt,
        this.profileImage});

  Post.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    userId = json['user_id'];
    eventName = json['event_name'];
    eventDescription = json['event_description'];
    eventStartDate = json['event_start_date'];
    eventTime = json['event_time'];
    eventContactName = json['event_contact_name'];
    eventEmail = json['event_email'];
    eventMobile = json['event_mobile'];
    eventWebsite = json['event_website'];
    eventAddress = json['event_address'];
    categoryId = json['category_id'];
    eventImage = json['event_image'];
    eventCdt = json['event_cdt'];
    hostedBy = json['hosted_by'];
    userCdt = json['user_cdt'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['user_id'] = this.userId;
    data['event_name'] = this.eventName;
    data['event_description'] = this.eventDescription;
    data['event_start_date'] = this.eventStartDate;
    data['event_time'] = this.eventTime;
    data['event_contact_name'] = this.eventContactName;
    data['event_email'] = this.eventEmail;
    data['event_mobile'] = this.eventMobile;
    data['event_website'] = this.eventWebsite;
    data['event_address'] = this.eventAddress;
    data['category_id'] = this.categoryId;
    data['event_image'] = this.eventImage;
    data['event_cdt'] = this.eventCdt;
    data['hosted_by'] = this.hostedBy;
    data['user_cdt'] = this.userCdt;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

class EventInformtion {
  String? eventName;
  String? date;
  String? eventTime;
  String? eventAddress;
  String? eventContactName;
  String? eventMobile;
  String? eventEmail;
  String? eventWebsite;

  EventInformtion(
      {this.eventName,
        this.date,
        this.eventTime,
        this.eventAddress,
        this.eventContactName,
        this.eventMobile,
        this.eventEmail,
        this.eventWebsite});

  EventInformtion.fromJson(Map<String, dynamic> json) {
    eventName = json['event_name'];
    date = json['date'];
    eventTime = json['event_time'];
    eventAddress = json['event_address'];
    eventContactName = json['event_contact_name'];
    eventMobile = json['event_mobile'];
    eventEmail = json['event_email'];
    eventWebsite = json['event_website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_name'] = this.eventName;
    data['date'] = this.date;
    data['event_time'] = this.eventTime;
    data['event_address'] = this.eventAddress;
    data['event_contact_name'] = this.eventContactName;
    data['event_mobile'] = this.eventMobile;
    data['event_email'] = this.eventEmail;
    data['event_website'] = this.eventWebsite;
    return data;
  }
}

class RelatedEvents {
  String? eventId;
  String? eventDate;
  String? eventImage;
  String? eventName;
  String? eventAddress;
  String? eventMobile;
  String? hostedBy;
  String? userCdt;
  String? profileImage;
  String? eventTime;

  RelatedEvents(
      {
        this.eventId,
        this.eventImage,
        this.eventDate,
        this.eventTime,
        this.eventName,
        this.eventAddress,
        this.eventMobile,
        this.hostedBy,
        this.userCdt,
        this.profileImage});

  RelatedEvents.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventDate = json['event_date'];
    eventImage = json['event_image'];
    eventName = json['event_name'];
    eventAddress = json['event_address'];
    eventMobile = json['event_mobile'];
    hostedBy = json['hosted_by'];
    userCdt = json['user_cdt'];
    profileImage = json['profile_image'];
    eventTime = json['event_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['event_date'] = this.eventDate;
    data['event_image'] = this.eventImage;
    data['event_name'] = this.eventName;
    data['event_address'] = this.eventAddress;
    data['event_mobile'] = this.eventMobile;
    data['hosted_by'] = this.hostedBy;
    data['user_cdt'] = this.userCdt;
    data['profile_image'] = this.profileImage;
    data['event_time'] = this.eventTime;
    return data;
  }
}
