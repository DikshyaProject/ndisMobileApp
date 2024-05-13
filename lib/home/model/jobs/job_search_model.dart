class JobSearchDataModel {
  String? message;
  JobSearchData? data;
  int? status;

  JobSearchDataModel({this.message, this.data, this.status});

  JobSearchDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new JobSearchData.fromJson(json['data']) : null;
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

class JobSearchData {
  List<SearchResult>? searchResult;

  JobSearchData({this.searchResult});

  JobSearchData.fromJson(Map<String, dynamic> json) {
    if (json['search_result'] != null) {
      searchResult = <SearchResult>[];
      json['search_result'].forEach((v) {
        searchResult!.add(new SearchResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchResult != null) {
      data['search_result'] =
          this.searchResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchResult {
  String? jobId;
  String? companyLogo;
  String? jobCdt;
  int? applicant;
  String? jobSlug;
  String? opening;

  SearchResult(
      {
        this.jobId,
        this.companyLogo,
        this.jobCdt,
        this.applicant,
        this.jobSlug,
        this.opening});

  SearchResult.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    companyLogo = json['company_logo'];
    jobCdt = json['job_cdt'];
    applicant = json['applicant'];
    jobSlug = json['job_slug'];
    opening = json['opening'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    data['company_logo'] = this.companyLogo;
    data['job_cdt'] = this.jobCdt;
    data['applicant'] = this.applicant;
    data['job_slug'] = this.jobSlug;
    data['opening'] = this.opening;
    return data;
  }
}
