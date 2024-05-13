

class HomeSearchModel {
  String? message;
  int? status;
  HomeSearchData? data;

  HomeSearchModel({this.message, this.status, this.data});

  HomeSearchModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new HomeSearchData.fromJson(json['data']) : null;
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

class HomeSearchData {
  List<SelectServiceList>? selectServiceList;

  HomeSearchData({this.selectServiceList});

  HomeSearchData.fromJson(Map<String, dynamic> json) {
    if (json['select_service_list'] != null) {
      selectServiceList = <SelectServiceList>[];
      json['select_service_list'].forEach((v) {
        selectServiceList!.add(new SelectServiceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.selectServiceList != null) {
      data['select_service_list'] =
          this.selectServiceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SelectServiceList {
  String? value;
  String? option;
  List<Subcategories>? subcategories;

  SelectServiceList({this.value, this.option, this.subcategories});

  SelectServiceList.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    option = json['option'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['option'] = this.option;
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  String? subCategoryId;
  String? subCategorySlug;
  String? subCategoryName;

  Subcategories(
      {this.subCategoryId, this.subCategorySlug, this.subCategoryName});

  Subcategories.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    subCategorySlug = json['sub_category_slug'];
    subCategoryName = json['sub_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_id'] = this.subCategoryId;
    data['sub_category_slug'] = this.subCategorySlug;
    data['sub_category_name'] = this.subCategoryName;
    return data;
  }
}
