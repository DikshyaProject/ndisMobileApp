class SupportWorkedCatListModel {
  String? message;
  int? status;
  SupportWorkerCatListData? data;

  SupportWorkedCatListModel({this.message, this.status, this.data});

  SupportWorkedCatListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new SupportWorkerCatListData.fromJson(json['data']) : null;
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

class SupportWorkerCatListData {
  List<SupportWorkerCatList>? supportWorkerCatList;

  SupportWorkerCatListData({this.supportWorkerCatList});

  SupportWorkerCatListData.fromJson(Map<String, dynamic> json) {
    if (json['sw_category_data'] != null) {
      supportWorkerCatList = <SupportWorkerCatList>[];
      json['sw_category_data'].forEach((v) {
        supportWorkerCatList!.add(new SupportWorkerCatList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.supportWorkerCatList != null) {
      data['sw_category_data'] =
          this.supportWorkerCatList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SupportWorkerCatList {
  String? suppOfferId;
  String? offerName;
  String? suppOfferImage;
  String? offerUdt;
  String? offerCdt;
  int? totalExpertsCount;
  String? serviceExperts;

  SupportWorkerCatList(
      {this.suppOfferId,
        this.offerName,
        this.suppOfferImage,
        this.offerUdt,
        this.offerCdt,
        this.totalExpertsCount,
        this.serviceExperts});

  SupportWorkerCatList.fromJson(Map<String, dynamic> json) {
    suppOfferId = json['supp_offer_id'];
    offerName = json['offer_name'];
    suppOfferImage = json['supp_offer_image'];
    offerUdt = json['offer_udt'];
    offerCdt = json['offer_cdt'];
    totalExpertsCount = json['total_experts_count'];
    serviceExperts = json['service_experts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supp_offer_id'] = this.suppOfferId;
    data['offer_name'] = this.offerName;
    data['supp_offer_image'] = this.suppOfferImage;
    data['offer_udt'] = this.offerUdt;
    data['offer_cdt'] = this.offerCdt;
    data['total_experts_count'] = this.totalExpertsCount;
    data['service_experts'] = this.serviceExperts;
    return data;
  }
}
