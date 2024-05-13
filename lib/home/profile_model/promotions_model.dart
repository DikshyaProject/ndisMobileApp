class PromotionsModel {
  String? message;
  PromotionsData? data;
  int? status;

  PromotionsModel({this.message, this.data, this.status});

  PromotionsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new PromotionsData.fromJson(json['data']) : null;
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

class PromotionsData {
  List<PromoteList>? promoteList;

  PromotionsData({this.promoteList});

  PromotionsData.fromJson(Map<String, dynamic> json) {
    if (json['promote_list'] != null) {
      promoteList = <PromoteList>[];
      json['promote_list'].forEach((v) {
        promoteList!.add(new PromoteList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.promoteList != null) {
      data['promote_list'] = this.promoteList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PromoteList {
  String? allPromoteEnquiryId;
  String? userId;
  String? promoteTypeId;
  String? promoteTypeValue;
  String? allPromotePriceId;
  String? promoteStartDate;
  String? promoteEndDate;
  String? promoteTotalDays;
  String? promoteCostPerDay;
  String? promoteTotalCost;
  String? promoteEnquiryStatus;
  String? promoteEnquiryCdt;
  String? image;
  String? listingName;

  PromoteList(
      {this.allPromoteEnquiryId,
        this.userId,
        this.promoteTypeId,
        this.promoteTypeValue,
        this.allPromotePriceId,
        this.promoteStartDate,
        this.promoteEndDate,
        this.promoteTotalDays,
        this.promoteCostPerDay,
        this.promoteTotalCost,
        this.promoteEnquiryStatus,
        this.promoteEnquiryCdt,
        this.image,
        this.listingName});

  PromoteList.fromJson(Map<String, dynamic> json) {
    allPromoteEnquiryId = json['all_promote_enquiry_id'];
    userId = json['user_id'];
    promoteTypeId = json['promote_type_id'];
    promoteTypeValue = json['promote_type_value'];
    allPromotePriceId = json['all_promote_price_id'];
    promoteStartDate = json['promote_start_date'];
    promoteEndDate = json['promote_end_date'];
    promoteTotalDays = json['promote_total_days'];
    promoteCostPerDay = json['promote_cost_per_day'];
    promoteTotalCost = json['promote_total_cost'];
    promoteEnquiryStatus = json['promote_enquiry_status'];
    promoteEnquiryCdt = json['promote_enquiry_cdt'];
    image = json['image'];
    listingName = json['listing_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_promote_enquiry_id'] = this.allPromoteEnquiryId;
    data['user_id'] = this.userId;
    data['promote_type_id'] = this.promoteTypeId;
    data['promote_type_value'] = this.promoteTypeValue;
    data['all_promote_price_id'] = this.allPromotePriceId;
    data['promote_start_date'] = this.promoteStartDate;
    data['promote_end_date'] = this.promoteEndDate;
    data['promote_total_days'] = this.promoteTotalDays;
    data['promote_cost_per_day'] = this.promoteCostPerDay;
    data['promote_total_cost'] = this.promoteTotalCost;
    data['promote_enquiry_status'] = this.promoteEnquiryStatus;
    data['promote_enquiry_cdt'] = this.promoteEnquiryCdt;
    data['image'] = this.image;
    data['listing_name'] = this.listingName;
    return data;
  }
}
