class NewDetailModel {
  NewDetailModel({
    required this.message,
    required this.status,
    required this.data,
  });
  late final String message;
  late final int status;
  late final NewsDetailsData data;

  NewDetailModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    data = NewsDetailsData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class NewsDetailsData {
  NewsDetailsData({
    required this.newsidDetails,
    required this.relatedPost,
    required this.latestNews,
  });
  late final List<NewsidDetails> newsidDetails;
  late final List<RelatedPost> relatedPost;
  late final List<LatestNews> latestNews;

  NewsDetailsData.fromJson(Map<String, dynamic> json){
    newsidDetails = List.from(json['newsidDetails']).map((e)=>NewsidDetails.fromJson(e)).toList();
    relatedPost = List.from(json['relatedPost']).map((e)=>RelatedPost.fromJson(e)).toList();
    latestNews = List.from(json['latest_news']).map((e)=>LatestNews.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['newsidDetails'] = newsidDetails.map((e)=>e.toJson()).toList();
    _data['relatedPost'] = relatedPost.map((e)=>e.toJson()).toList();
    _data['latest_news'] = latestNews.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class NewsidDetails {
NewsidDetails({
required this.newsId,
required this.categoryId,
required this.newsTitle,
required this.newsImage,
required this.newsCdt,
required this.newsDescription,
required this.date,
});
late final String newsId;
late final String categoryId;
late final String newsTitle;
late final String newsImage;
late final String newsCdt;
late final String newsDescription;
late final String date;

NewsidDetails.fromJson(Map<String, dynamic> json){
newsId = json['news_id'];
categoryId = json['category_id'];
newsTitle = json['news_title'];
newsImage = json['news_image'];
newsCdt = json['news_cdt'];
newsDescription = json['news_description'];
date = json['date'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['news_id'] = newsId;
_data['category_id'] = categoryId;
_data['news_title'] = newsTitle;
_data['news_image'] = newsImage;
_data['news_cdt'] = newsCdt;
_data['news_description'] = newsDescription;
_data['date'] = date;
return _data;
}
}

class RelatedPost {
  RelatedPost({
    required this.newsId,
    required this.categoryId,
    required this.newsTitle,
    required this.newsImage,
    required this.newsCdt,
    required this.eyeCount,
    required this.date,
  });
  late final String newsId;
  late final String categoryId;
  late final String newsTitle;
  late final String newsImage;
  late final String newsCdt;
  late final int eyeCount;
  late final String date;

  RelatedPost.fromJson(Map<String, dynamic> json){
    newsId = json['news_id'];
    categoryId = json['category_id'];
    newsTitle = json['news_title'];
    newsImage = json['news_image'];
    newsCdt = json['news_cdt'];
    eyeCount = json['eye_count'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['news_id'] = newsId;
    _data['category_id'] = categoryId;
    _data['news_title'] = newsTitle;
    _data['news_image'] = newsImage;
    _data['news_cdt'] = newsCdt;
    _data['eye_count'] = eyeCount;
    _data['date'] = date;
    return _data;
  }
}

class LatestNews {
  LatestNews({
    required this.newsId,
    required this.categoryId,
    required this.newsTitle,
    required this.newsImage,
    required this.newsCdt,
    required this.eyeCount,
    required this.date,
  });
  late final String newsId;
  late final String categoryId;
  late final String newsTitle;
  late final String newsImage;
  late final String newsCdt;
  late final int eyeCount;
  late final String date;

  LatestNews.fromJson(Map<String, dynamic> json){
    newsId = json['news_id'];
    categoryId = json['category_id'];
    newsTitle = json['news_title'];
    newsImage = json['news_image'];
    newsCdt = json['news_cdt'];
    eyeCount = json['eye_count'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['news_id'] = newsId;
    _data['category_id'] = categoryId;
    _data['news_title'] = newsTitle;
    _data['news_image'] = newsImage;
    _data['news_cdt'] = newsCdt;
    _data['eye_count'] = eyeCount;
    _data['date'] = date;
    return _data;
  }
}