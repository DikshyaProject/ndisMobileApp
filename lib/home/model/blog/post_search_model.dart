class PostSearchModel {
  String? message;
  PostSearchData? data;
  int? status;

  PostSearchModel({this.message, this.data, this.status});

  PostSearchModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new PostSearchData.fromJson(json['data']) : null;
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

class PostSearchData {
  List<Searchlist>? searchlist;

  PostSearchData({this.searchlist});

  PostSearchData.fromJson(Map<String, dynamic> json) {
    if (json['searchlist'] != null) {
      searchlist = <Searchlist>[];
      json['searchlist'].forEach((v) {
        searchlist!.add(new Searchlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchlist != null) {
      data['searchlist'] = this.searchlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Searchlist {
  String? blogImage;
  String? blogName;

  Searchlist({this.blogName, this.blogImage});

  Searchlist.fromJson(Map<String, dynamic> json) {
    blogImage = json['blog_image'];
    blogName = json['blog_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_image'] = this.blogImage;
    data['blog_name'] = this.blogName;
    return data;
  }
}
