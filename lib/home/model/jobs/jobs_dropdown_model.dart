class JobsDropdownModel {
  String? message;
  String? status;
  jobsDropData? data;

  JobsDropdownModel({this.message, this.status, this.data});

  JobsDropdownModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new jobsDropData.fromJson(json['data']) : null;
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

class jobsDropData {
  List<catList>? list;

  jobsDropData({this.list});

  jobsDropData.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <catList>[];
      json['list'].forEach((v) {
        list!.add(new catList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class catList {
  String? categoryId;
  String? categoryName;

  catList({this.categoryId, this.categoryName});

  catList.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    return data;
  }
}
