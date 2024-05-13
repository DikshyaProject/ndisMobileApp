class AccommodationHousingListModel {
  String? message;
  int? status;
  AccommodationListData? data;

  AccommodationHousingListModel({this.message, this.status, this.data});

  AccommodationHousingListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new AccommodationListData.fromJson(json['data']) : null;
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

class AccommodationListData {
  List<MarketPlaceCatData>? marketPlaceCatData;

  AccommodationListData({this.marketPlaceCatData});

  AccommodationListData.fromJson(Map<String, dynamic> json) {
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
  String? categoryId;
  String? categoryName;
  String? categoryImage;

  MarketPlaceCatData({this.categoryId,this.categoryName, this.categoryImage});

  MarketPlaceCatData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}
