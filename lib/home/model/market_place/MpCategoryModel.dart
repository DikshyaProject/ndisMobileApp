class MpCategoryModel {
  String? message;
  int? status;
  mpCatData? data;

  MpCategoryModel({this.message, this.status, this.data});

  MpCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new mpCatData.fromJson(json['data']) : null;
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

class mpCatData {
  List<MarketPlaceCatData>? marketPlaceCatData;

  mpCatData({this.marketPlaceCatData});

  mpCatData.fromJson(Map<String, dynamic> json) {
    if (json['market_place_cat_data'] != null) {
      marketPlaceCatData = <MarketPlaceCatData>[];
      json['market_place_cat_data'].forEach((v) {
        marketPlaceCatData!.add(new MarketPlaceCatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marketPlaceCatData != null) {
      data['market_place_cat_data'] =
          this.marketPlaceCatData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MarketPlaceCatData {
  String? categoryName;
  String? categoryImage;

  MarketPlaceCatData({this.categoryName, this.categoryImage});

  MarketPlaceCatData.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}
