class AdSummaryModel {
  String? message;
  AdData? data;
  int? status;

  AdSummaryModel({this.message, this.data, this.status});

  AdSummaryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new AdData.fromJson(json['data']) : null;
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

class AdData {
  List<PaidAdsList>? paidAdsList;

  AdData({this.paidAdsList});

  AdData.fromJson(Map<String, dynamic> json) {
    if (json['paid_ads_list'] != null) {
      paidAdsList = <PaidAdsList>[];
      json['paid_ads_list'].forEach((v) {
        paidAdsList!.add(new PaidAdsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paidAdsList != null) {
      data['paid_ads_list'] = this.paidAdsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaidAdsList {
  int? no;
  String? adPosition;
  String? startDate;
  String? endDate;
  String? duration;
  String? status;
  String? views;
  String? clicks;

  PaidAdsList(
      {this.no,
        this.adPosition,
        this.startDate,
        this.endDate,
        this.duration,
        this.status,
        this.views,
        this.clicks});

  PaidAdsList.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    adPosition = json['ad_position'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    duration = json['duration'];
    status = json['status'];
    views = json['views'];
    clicks = json['clicks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['ad_position'] = this.adPosition;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['views'] = this.views;
    data['clicks'] = this.clicks;
    return data;
  }
}
