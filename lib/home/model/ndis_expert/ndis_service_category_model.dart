class NdisServiceCategoryModel {
  String? message;
  int? status;
  NdisServiceCatData? data;

  NdisServiceCategoryModel({this.message, this.status, this.data});

  NdisServiceCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new NdisServiceCatData.fromJson(json['data']) : null;
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

class NdisServiceCatData {
  List<NdisServiceExpertCatData>? ndisServiceExpertCatData;

  NdisServiceCatData({this.ndisServiceExpertCatData});

  NdisServiceCatData.fromJson(Map<String, dynamic> json) {
    if (json['ndis_service_expert_cat_data'] != null) {
      ndisServiceExpertCatData = <NdisServiceExpertCatData>[];
      json['ndis_service_expert_cat_data'].forEach((v) {
        ndisServiceExpertCatData!.add(new NdisServiceExpertCatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ndisServiceExpertCatData != null) {
      data['ndis_service_expert_cat_data'] =
          this.ndisServiceExpertCatData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NdisServiceExpertCatData {
  String? categoryId;
  String? categoryName;
  String? categoryImage;
  String? categoryExpertCount;

  NdisServiceExpertCatData(
      {this.categoryId,
        this.categoryName,
        this.categoryImage,
        this.categoryExpertCount});

  NdisServiceExpertCatData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    categoryExpertCount = json['category_expert_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    data['category_expert_count'] = this.categoryExpertCount;
    return data;
  }
}
