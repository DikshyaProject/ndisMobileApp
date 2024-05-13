//
// class BlogListModel {
//   String? message;
//   int? status;
//   BlogListData? data;
//
//   BlogListModel({this.message, this.status, this.data});
//
//   BlogListModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ? new BlogListData.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class BlogListData {
//   List<Topbloglist>? topbloglist;
//   List<Blogpost>? blogpost;
//
//   BlogListData({this.topbloglist, this.blogpost});
//
//   BlogListData.fromJson(Map<String, dynamic> json) {
//     if (json['topbloglist'] != null) {
//       topbloglist = <Topbloglist>[];
//       json['topbloglist'].forEach((v) {
//         topbloglist!.add(new Topbloglist.fromJson(v));
//       });
//     }
//     if (json['blogpost'] != null) {
//       blogpost = <Blogpost>[];
//       json['blogpost'].forEach((v) {
//         blogpost!.add(new Blogpost.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.topbloglist != null) {
//       data['topbloglist'] = this.topbloglist!.map((v) => v.toJson()).toList();
//     }
//     if (this.blogpost != null) {
//       data['blogpost'] = this.blogpost!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Topbloglist {
//   String? userId;
//   String? blogName;
//   String? blogDescription;
//   String? categoryId;
//   String? blogImage;
//   String? blogSlug;
//   String? blogCdt;
//   String? firstName;
//   String? lastName;
//   String? profileImage;
//   String? coverImage;
//   String? createdAt;
//   String? cOUNT;
//   String? postedBy;
//
//   Topbloglist(
//       {this.userId,
//         this.blogName,
//         this.blogDescription,
//         this.categoryId,
//         this.blogImage,
//         this.blogSlug,
//         this.blogCdt,
//         this.firstName,
//         this.lastName,
//         this.profileImage,
//         this.coverImage,
//         this.createdAt,
//         this.cOUNT,
//         this.postedBy});
//
//   Topbloglist.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     blogName = json['blog_name'];
//     blogDescription = json['blog_description'];
//     categoryId = json['category_id'];
//     blogImage = json['blog_image'];
//     blogSlug = json['blog_slug'];
//     blogCdt = json['blog_cdt'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     profileImage = json['profile_image'];
//     coverImage = json['cover_image'];
//     createdAt = json['created_at'];
//     cOUNT = json['COUNT(*)'];
//     postedBy = json['posted_by'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['blog_name'] = this.blogName;
//     data['blog_description'] = this.blogDescription;
//     data['category_id'] = this.categoryId;
//     data['blog_image'] = this.blogImage;
//     data['blog_slug'] = this.blogSlug;
//     data['blog_cdt'] = this.blogCdt;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['profile_image'] = this.profileImage;
//     data['cover_image'] = this.coverImage;
//     data['created_at'] = this.createdAt;
//     data['COUNT(*)'] = this.cOUNT;
//     data['posted_by'] = this.postedBy;
//     return data;
//   }
// }
//
// class Blogpost {
//   String? blogId;
//   String? userId;
//   String? blogName;
//   String? createdAt;
//   String? blogCdt;
//   String? cId;
//   String? blogImage;
//   String? categoryName;
//   String? eyeCount;
//   String? postedBy;
//   String? profileImage;
//
//   Blogpost(
//       {this.blogId,
//         this.userId,
//         this.blogName,
//         this.createdAt,
//         this.blogCdt,
//         this.cId,
//         this.blogImage,
//         this.categoryName,
//         this.eyeCount,
//         this.postedBy,
//         this.profileImage});
//
//   Blogpost.fromJson(Map<String, dynamic> json) {
//     blogId = json['blog_id'];
//     userId = json['user_id'];
//     blogName = json['blog_name'];
//     createdAt = json['created_at'];
//     blogCdt = json['blog_cdt'];
//     cId = json['c_id'];
//     blogImage = json['blog_image'];
//     categoryName = json['category_name'];
//     eyeCount = json['eye_count'];
//     postedBy = json['posted_by'];
//     profileImage = json['profile_image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['blog_id'] = this.blogId;
//     data['user_id'] = this.userId;
//     data['blog_name'] = this.blogName;
//     data['created_at'] = this.createdAt;
//     data['blog_cdt'] = this.blogCdt;
//     data['c_id'] = this.cId;
//     data['blog_image'] = this.blogImage;
//     data['category_name'] = this.categoryName;
//     data['eye_count'] = this.eyeCount;
//     data['posted_by'] = this.postedBy;
//     data['profile_image'] = this.profileImage;
//     return data;
//   }
// }
class BlogListModel {
  String? message;
  int? status;
  BlogListData? data;

  BlogListModel({this.message, this.status, this.data});

  BlogListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new BlogListData.fromJson(json['data']) : null;
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

class BlogListData {
  List<Topbloglist>? topbloglist;
  List<Blogpost>? blogpost;

  BlogListData({this.topbloglist, this.blogpost});

  BlogListData.fromJson(Map<String, dynamic> json) {
    if (json['topbloglist'] != null) {
      topbloglist = <Topbloglist>[];
      json['topbloglist'].forEach((v) {
        topbloglist!.add(new Topbloglist.fromJson(v));
      });
    }
    if (json['blogpost'] != null) {
      blogpost = <Blogpost>[];
      json['blogpost'].forEach((v) {
        blogpost!.add(new Blogpost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topbloglist != null) {
      data['topbloglist'] = this.topbloglist!.map((v) => v.toJson()).toList();
    }
    if (this.blogpost != null) {
      data['blogpost'] = this.blogpost!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Topbloglist {
  String? blogId;
  String? userId;
  String? blogName;
  String? blogDescription;
  String? categoryId;
  String? blogImage;
  String? blogSlug;
  String? blogCdt;
  String? firstName;
  String? lastName;
  String? profileImage;
  String? coverImage;
  String? createdAt;
  String? cOUNT;
  String? postedBy;

  Topbloglist(
      {this.blogId,
        this.userId,
        this.blogName,
        this.blogDescription,
        this.categoryId,
        this.blogImage,
        this.blogSlug,
        this.blogCdt,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.coverImage,
        this.createdAt,
        this.cOUNT,
        this.postedBy});

  Topbloglist.fromJson(Map<String, dynamic> json) {
    blogId = json['blog_id'];
    userId = json['user_id'];
    blogName = json['blog_name'];
    blogDescription = json['blog_description'];
    categoryId = json['category_id'];
    blogImage = json['blog_image'];
    blogSlug = json['blog_slug'];
    blogCdt = json['blog_cdt'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
    coverImage = json['cover_image'];
    createdAt = json['created_at'];
    cOUNT = json['COUNT(*)'];
    postedBy = json['posted_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_id'] = this.blogId;
    data['user_id'] = this.userId;
    data['blog_name'] = this.blogName;
    data['blog_description'] = this.blogDescription;
    data['category_id'] = this.categoryId;
    data['blog_image'] = this.blogImage;
    data['blog_slug'] = this.blogSlug;
    data['blog_cdt'] = this.blogCdt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['cover_image'] = this.coverImage;
    data['created_at'] = this.createdAt;
    data['COUNT(*)'] = this.cOUNT;
    data['posted_by'] = this.postedBy;
    return data;
  }
}

class Blogpost {
  String? blogId;
  String? userId;
  String? blogName;
  String? createdAt;
  String? blogCdt;
  String? cId;
  String? blogImage;
  String? categoryName;
  int? eyeCount;
  String? postedBy;
  String? profileImage;

  Blogpost(
      {this.blogId,
        this.userId,
        this.blogName,
        this.createdAt,
        this.blogCdt,
        this.cId,
        this.blogImage,
        this.categoryName,
        this.eyeCount,
        this.postedBy,
        this.profileImage});

  Blogpost.fromJson(Map<String, dynamic> json) {
    blogId = json['blog_id'];
    userId = json['user_id'];
    blogName = json['blog_name'];
    createdAt = json['created_at'];
    blogCdt = json['blog_cdt'];
    cId = json['c_id'];
    blogImage = json['blog_image'];
    categoryName = json['category_name'];
    eyeCount = json['eye_count'];
    postedBy = json['posted_by'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_id'] = this.blogId;
    data['user_id'] = this.userId;
    data['blog_name'] = this.blogName;
    data['created_at'] = this.createdAt;
    data['blog_cdt'] = this.blogCdt;
    data['c_id'] = this.cId;
    data['blog_image'] = this.blogImage;
    data['category_name'] = this.categoryName;
    data['eye_count'] = this.eyeCount;
    data['posted_by'] = this.postedBy;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
