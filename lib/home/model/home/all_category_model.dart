class AllCategoryModel {
  String? message;
  int? status;
  CategoryModelData? data;

  AllCategoryModel({this.message, this.status, this.data});

  AllCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? new CategoryModelData.fromJson(json['data'])
        : null;
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

class CategoryModelData {
  List<AllCategoryData>? allCategoryData;

  CategoryModelData({this.allCategoryData});

  CategoryModelData.fromJson(Map<String, dynamic> json) {
    if (json['all_category_data'] != null) {
      allCategoryData = <AllCategoryData>[];
      json['all_category_data'].forEach((v) {
        allCategoryData!.add(new AllCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allCategoryData != null) {
      data['all_category_data'] =
          this.allCategoryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllCategoryData {
  String? categoryId;
  String? categoryName;
  String? categoryImage;
  dynamic? categoryListCount;
  List<Subcategories>? subcategories;
  bool? isSelect = false;

  AllCategoryData(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryImage,
      required this.categoryListCount,
      required this.subcategories,
      required this.isSelect});

  AllCategoryData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    categoryListCount = json['category_list_count'];
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
    data['category_image'] = this.categoryImage;
    data['category_list_count'] = this.categoryListCount;
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
  String? subCategoryListCount;

  Subcategories(
      {this.subCategoryId, this.subCategoryName, this.subCategoryListCount});

  Subcategories.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    subCategoryName = json['sub_category_name'];
    subCategoryListCount = json['sub_category_list_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_id'] = this.subCategoryId;
    data['sub_category_name'] = this.subCategoryName;
    data['sub_category_list_count'] = this.subCategoryListCount;
    return data;
  }
}
