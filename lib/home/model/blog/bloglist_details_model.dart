class BlogListDetailsModel {
  String? message;
  int? status;
  BlogListDetailsData? data;

  BlogListDetailsModel({this.message, this.status, this.data});

  BlogListDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new BlogListDetailsData.fromJson(json['data']) : null;
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

class BlogListDetailsData {
  Post? post;
  List<RelatedPosts>? relatedPosts;

  BlogListDetailsData({this.post, this.relatedPosts});

  BlogListDetailsData.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
    if (json['related_posts'] != null) {
      relatedPosts = <RelatedPosts>[];
      json['related_posts'].forEach((v) {
        relatedPosts!.add(new RelatedPosts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    if (this.relatedPosts != null) {
      data['related_posts'] =
          this.relatedPosts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  String? blogId;
  String? userId;
  String? categoryId;
  String? blogName;
  String? blogDescription;
  String? blogImage;
  String? blogSlug;
  String? blogCdt;
  int? eyeCount;
  String? hostedBy;
  String? userCdt;
  String? profileImage;

  Post(
      {this.blogId,
        this.userId,
        this.categoryId,
        this.blogName,
        this.blogDescription,
        this.blogImage,
        this.blogSlug,
        this.blogCdt,
        this.eyeCount,
        this.hostedBy,
        this.userCdt,
        this.profileImage});

  Post.fromJson(Map<String, dynamic> json) {
    blogId = json['blog_id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    blogName = json['blog_name'];
    blogDescription = json['blog_description'];
    blogImage = json['blog_image'];
    blogSlug = json['blog_slug'];
    blogCdt = json['blog_cdt'];
    eyeCount = json['eye_count'];
    hostedBy = json['hosted_by'];
    userCdt = json['user_cdt'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_id'] = this.blogId;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['blog_name'] = this.blogName;
    data['blog_description'] = this.blogDescription;
    data['blog_image'] = this.blogImage;
    data['blog_slug'] = this.blogSlug;
    data['blog_cdt'] = this.blogCdt;
    data['eye_count'] = this.eyeCount;
    data['hosted_by'] = this.hostedBy;
    data['user_cdt'] = this.userCdt;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

class RelatedPosts {
  String? blogImage;
  String? blogName;

  RelatedPosts({this.blogImage, this.blogName});

  RelatedPosts.fromJson(Map<String, dynamic> json) {
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
