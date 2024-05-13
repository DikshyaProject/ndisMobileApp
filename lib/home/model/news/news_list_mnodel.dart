class NewsListModel {
  String? message;
  int? status;
  NewsListData? data;

  NewsListModel({this.message, this.status, this.data});

  NewsListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new NewsListData.fromJson(json['data']) : null;
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

class NewsListData {
  List<Trendingnews>? trendingnews;
  List<Newslidelist>? newslidelist;
  List<LatestAndPopular>? latestAndPopular;
  List<Latest>? latest;
  List<Category>? category;

  NewsListData(
      {this.trendingnews,
        this.newslidelist,
        this.latestAndPopular,
        this.latest,
        this.category});

  NewsListData.fromJson(Map<String, dynamic> json) {
    if (json['trendingnews'] != null) {
      trendingnews = <Trendingnews>[];
      json['trendingnews'].forEach((v) {
        trendingnews!.add(new Trendingnews.fromJson(v));
      });
    }
    if (json['newslidelist'] != null) {
      newslidelist = <Newslidelist>[];
      json['newslidelist'].forEach((v) {
        newslidelist!.add(new Newslidelist.fromJson(v));
      });
    }
    if (json['latest_and_popular'] != null) {
      latestAndPopular = <LatestAndPopular>[];
      json['latest_and_popular'].forEach((v) {
        latestAndPopular!.add(new LatestAndPopular.fromJson(v));
      });
    }
    if (json['latest'] != null) {
      latest = <Latest>[];
      json['latest'].forEach((v) {
        latest!.add(new Latest.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trendingnews != null) {
      data['trendingnews'] = this.trendingnews!.map((v) => v.toJson()).toList();
    }
    if (this.newslidelist != null) {
      data['newslidelist'] = this.newslidelist!.map((v) => v.toJson()).toList();
    }
    if (this.latestAndPopular != null) {
      data['latest_and_popular'] =
          this.latestAndPopular!.map((v) => v.toJson()).toList();
    }
    if (this.latest != null) {
      data['latest'] = this.latest!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trendingnews {
  String? trendingNewsId;
  String? newsId;
  String? trendingNewsCdt;
  String? categoryName;
  String? newsTitle;
  String? newsImage;
  String? date;

  Trendingnews(
      {this.trendingNewsId,
        this.newsId,
        this.trendingNewsCdt,
        this.categoryName,
        this.newsTitle,
        this.newsImage,
        this.date});

  Trendingnews.fromJson(Map<String, dynamic> json) {
    trendingNewsId = json['trending_news_id'];
    newsId = json['news_id'];
    trendingNewsCdt = json['trending_news_cdt'];
    categoryName = json['category_name'];
    newsTitle = json['news_title'];
    newsImage = json['news_image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trending_news_id'] = this.trendingNewsId;
    data['news_id'] = this.newsId;
    data['trending_news_cdt'] = this.trendingNewsCdt;
    data['category_name'] = this.categoryName;
    data['news_title'] = this.newsTitle;
    data['news_image'] = this.newsImage;
    data['date'] = this.date;
    return data;
  }
}

class Newslidelist {
  String? newsSliderId;
  String? newsId;
  String? newsSliderPosId;
  String? newsSliderCdt;
  String? categoryName;
  String? newsTitle;
  String? newsImage;
  String? date;

  Newslidelist(
      {this.newsSliderId,
        this.newsId,
        this.newsSliderPosId,
        this.newsSliderCdt,
        this.categoryName,
        this.newsTitle,
        this.newsImage,
        this.date});

  Newslidelist.fromJson(Map<String, dynamic> json) {
    newsSliderId = json['news_slider_id'];
    newsId = json['news_id'];
    newsSliderPosId = json['news_slider_pos_id'];
    newsSliderCdt = json['news_slider_cdt'];
    categoryName = json['category_name'];
    newsTitle = json['news_title'];
    newsImage = json['news_image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_slider_id'] = this.newsSliderId;
    data['news_id'] = this.newsId;
    data['news_slider_pos_id'] = this.newsSliderPosId;
    data['news_slider_cdt'] = this.newsSliderCdt;
    data['category_name'] = this.categoryName;
    data['news_title'] = this.newsTitle;
    data['news_image'] = this.newsImage;
    data['date'] = this.date;
    return data;
  }
}

class LatestAndPopular {
  String? newsId;
  String? categoryId;
  String? newsTitle;
  String? newsDescription;
  String? newsImage;
  String? newsCdt;
  String? totalCount;
  String? categoryName;
  String? date;

  LatestAndPopular(
      {this.newsId,
        this.categoryId,
        this.newsTitle,
        this.newsDescription,
        this.newsImage,
        this.newsCdt,
        this.totalCount,
        this.categoryName,
        this.date});

  LatestAndPopular.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    categoryId = json['category_id'];
    newsTitle = json['news_title'];
    newsDescription = json['news_description'];
    newsImage = json['news_image'];
    newsCdt = json['news_cdt'];
    totalCount = json['total_count'];
    categoryName = json['category_name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    data['category_id'] = this.categoryId;
    data['news_title'] = this.newsTitle;
    data['news_description'] = this.newsDescription;
    data['news_image'] = this.newsImage;
    data['news_cdt'] = this.newsCdt;
    data['total_count'] = this.totalCount;
    data['category_name'] = this.categoryName;
    data['date'] = this.date;
    return data;
  }
}

class Latest {
  String? newsId;
  String? categoryId;
  String? newsTitle;
  String? newsDescription;
  String? newsImage;
  String? newsCdt;
  int? eyeCount;
  String? categoryName;
  String? date;

  Latest(
      {this.newsId,
        this.categoryId,
        this.newsTitle,
        this.newsDescription,
        this.newsImage,
        this.newsCdt,
        this.eyeCount,
        this.categoryName,
        this.date});

  Latest.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    categoryId = json['category_id'];
    newsTitle = json['news_title'];
    newsDescription = json['news_description'];
    newsImage = json['news_image'];
    newsCdt = json['news_cdt'];
    eyeCount = json['eye_count'];
    categoryName = json['category_name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    data['category_id'] = this.categoryId;
    data['news_title'] = this.newsTitle;
    data['news_description'] = this.newsDescription;
    data['news_image'] = this.newsImage;
    data['news_cdt'] = this.newsCdt;
    data['eye_count'] = this.eyeCount;
    data['category_name'] = this.categoryName;
    data['date'] = this.date;
    return data;
  }
}

class Category {
  String? categoryId;
  String? categoryName;
  int? eyeCount;

  Category({this.categoryId, this.categoryName, this.eyeCount});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    eyeCount = json['eye_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['eye_count'] = this.eyeCount;
    return data;
  }
}
