class EventListModel {
  String? message;
  int? status;
  EventListData? data;

  EventListModel({this.message, this.status, this.data});

  EventListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new EventListData.fromJson(json['data']) : null;
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

class EventListData {
  List<Topevents>? topevents;
  List<Eventlist>? eventlist;

  EventListData({this.topevents, this.eventlist});

  EventListData.fromJson(Map<String, dynamic> json) {
    if (json['topevents'] != null) {
      topevents = <Topevents>[];
      json['topevents'].forEach((v) {
        topevents!.add(new Topevents.fromJson(v));
      });
    }
    if (json['eventlist'] != null) {
      eventlist = <Eventlist>[];
      json['eventlist'].forEach((v) {
        eventlist!.add(new Eventlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topevents != null) {
      data['topevents'] = this.topevents!.map((v) => v.toJson()).toList();
    }
    if (this.eventlist != null) {
      data['eventlist'] = this.eventlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Topevents {
  String? eventId;
  String? userId;
  String? eventName;
  String? eventDescription;
  String? eventImage;
  String? categoryId;
  String? cityId;
  String? eventAddress;
  String? firstName;
  String? lastName;
  String? profileImage;
  String? eventCdt;
  String? cOUNT;
  String? hostedBy;
  String? eventDate;
  String? eventTime;

  Topevents(
      {this.eventId,
        this.userId,
        this.eventName,
        this.eventDescription,
        this.eventImage,
        this.categoryId,
        this.cityId,
        this.eventAddress,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.eventCdt,
        this.cOUNT,
        this.hostedBy,
        this.eventDate,
        this.eventTime});

  Topevents.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    userId = json['user_id'];
    eventName = json['event_name'];
    eventDescription = json['event_description'];
    eventImage = json['event_image'];
    categoryId = json['category_id'];
    cityId = json['city_id'];
    eventAddress = json['event_address'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
    eventCdt = json['event_cdt'];
    cOUNT = json['COUNT(*)'];
    hostedBy = json['hosted_by'];
    eventDate = json['event_date'];
    eventTime = json['event_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['user_id'] = this.userId;
    data['event_name'] = this.eventName;
    data['event_description'] = this.eventDescription;
    data['event_image'] = this.eventImage;
    data['category_id'] = this.categoryId;
    data['city_id'] = this.cityId;
    data['event_address'] = this.eventAddress;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['event_cdt'] = this.eventCdt;
    data['COUNT(*)'] = this.cOUNT;
    data['hosted_by'] = this.hostedBy;
    data['event_date'] = this.eventDate;
    data['event_time'] = this.eventTime;
    return data;
  }
}

class Eventlist {
  String? eventId;
  String? userId;
  String? eventName;
  String? eventCdt;
  String? cId;
  String? eventImage;
  String? eventAddress;
  String? eventMobile;
  String? categoryName;
  String? hostedBy;
  String? profileImage;
  String? eventDate;
  String? eventTime;

  Eventlist(
      {this.eventId,
        this.userId,
        this.eventName,
        this.eventCdt,
        this.cId,
        this.eventImage,
        this.eventAddress,
        this.eventMobile,
        this.categoryName,
        this.hostedBy,
        this.profileImage,
        this.eventDate,
        this.eventTime});

  Eventlist.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    userId = json['user_id'];
    eventName = json['event_name'];
    eventCdt = json['event_cdt'];
    cId = json['c_id'];
    eventImage = json['event_image'];
    eventAddress = json['event_address'];
    eventMobile = json['event_mobile'];
    categoryName = json['category_name'];
    hostedBy = json['hosted_by'];
    profileImage = json['profile_image'];
    eventDate = json['event_date'];
    eventTime = json['event_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['user_id'] = this.userId;
    data['event_name'] = this.eventName;
    data['event_cdt'] = this.eventCdt;
    data['c_id'] = this.cId;
    data['event_image'] = this.eventImage;
    data['event_address'] = this.eventAddress;
    data['event_mobile'] = this.eventMobile;
    data['category_name'] = this.categoryName;
    data['hosted_by'] = this.hostedBy;
    data['profile_image'] = this.profileImage;
    data['event_date'] = this.eventDate;
    data['event_time'] = this.eventTime;
    return data;
  }
}
