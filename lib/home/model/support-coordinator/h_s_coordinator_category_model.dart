class ScoordinatorCategoryModel {
  String? message;
  int? status;
  ScoordData? data;

  ScoordinatorCategoryModel({this.message, this.status, this.data});

  ScoordinatorCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new ScoordData.fromJson(json['data']) : null;
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

class ScoordData {
  List<AllSupportCordinatersCatData>? allSupportCordinatersCatData;

  ScoordData({this.allSupportCordinatersCatData});

  ScoordData.fromJson(Map<String, dynamic> json) {
    if (json['all_support_cordinaters_cat_data'] != null) {
      allSupportCordinatersCatData = <AllSupportCordinatersCatData>[];
      json['all_support_cordinaters_cat_data'].forEach((v) {
        allSupportCordinatersCatData!
            .add(new AllSupportCordinatersCatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allSupportCordinatersCatData != null) {
      data['all_support_cordinaters_cat_data'] =
          this.allSupportCordinatersCatData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllSupportCordinatersCatData {
  String? categoryId;
  String? categoryName;
  List<Subcategories>? subcategories;

  AllSupportCordinatersCatData(
      {this.categoryId, this.categoryName, this.subcategories});

  AllSupportCordinatersCatData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  String? subCategoryId;
  String? subCategoryName;
  String? subCategoryImage;
  String? subCategoryListCount;

  Subcategories(
      {this.subCategoryId,
        this.subCategoryName,
        this.subCategoryImage,
        this.subCategoryListCount});

  Subcategories.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    subCategoryName = json['sub_category_name'];
    subCategoryImage = json['sub_category_image'];
    subCategoryListCount = json['sub_category_list_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_id'] = this.subCategoryId;
    data['sub_category_name'] = this.subCategoryName;
    data['sub_category_image'] = this.subCategoryImage;
    data['sub_category_list_count'] = this.subCategoryListCount;
    return data;
  }
}
