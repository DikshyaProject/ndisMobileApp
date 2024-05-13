class AllJobCategoryModel {
  String? message;
  int? status;
  AllJobData? data;

  AllJobCategoryModel({this.message, this.status, this.data});

  AllJobCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new AllJobData.fromJson(json['data']) : null;
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

class AllJobData {
  List<Jobcategories>? jobcategories;
  List<Premiumjobs>? premiumjobs;
  List<Trendingjobs>? trendingjobs;
  dynamic? jobPosted;
  String? companies;
  String? employees;

  AllJobData({this.jobcategories, this.premiumjobs, this.trendingjobs, this.jobPosted,
    this.companies,
    this.employees});

  AllJobData.fromJson(Map<String, dynamic> json) {
    if (json['jobcategories'] != null) {
      jobcategories = <Jobcategories>[];
      json['jobcategories'].forEach((v) {
        jobcategories!.add(new Jobcategories.fromJson(v));
      });
    }
    if (json['premiumjobs'] != null) {
      premiumjobs = <Premiumjobs>[];
      json['premiumjobs'].forEach((v) {
        premiumjobs!.add(new Premiumjobs.fromJson(v));
      });
    }
    if (json['trendingjobs'] != null) {
      trendingjobs = <Trendingjobs>[];
      json['trendingjobs'].forEach((v) {
        trendingjobs!.add(new Trendingjobs.fromJson(v));
      });
    }
    jobPosted = json['job_posted'];
    companies = json['companies'];
    employees = json['employees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobcategories != null) {
      data['jobcategories'] =
          this.jobcategories!.map((v) => v.toJson()).toList();
    }
    if (this.premiumjobs != null) {
      data['premiumjobs'] = this.premiumjobs!.map((v) => v.toJson()).toList();
    }
    if (this.trendingjobs != null) {
      data['trendingjobs'] = this.trendingjobs!.map((v) => v.toJson()).toList();
    }
    data['job_posted'] = this.jobPosted;
    data['companies'] = this.companies;
    data['employees'] = this.employees;
    return data;
  }
}

class Jobcategories {
  String? categoryId;
  String? categoryCode;
  String? categoryName;
  String? categoryImage;
  String? categoryFilter;
  String? categoryFilterPosId;
  String? categoryStatus;
  String? categorySlug;
  String? categoryCdt;
  String? views;
  int? jobCount;

  Jobcategories(
      {this.categoryId,
        this.categoryCode,
        this.categoryName,
        this.categoryImage,
        this.categoryFilter,
        this.categoryFilterPosId,
        this.categoryStatus,
        this.categorySlug,
        this.categoryCdt,
        this.views,
        this.jobCount});

  Jobcategories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryCode = json['category_code'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    categoryFilter = json['category_filter'];
    categoryFilterPosId = json['category_filter_pos_id'];
    categoryStatus = json['category_status'];
    categorySlug = json['category_slug'];
    categoryCdt = json['category_cdt'];
    views = json['views'];
    jobCount = json['job_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_code'] = this.categoryCode;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    data['category_filter'] = this.categoryFilter;
    data['category_filter_pos_id'] = this.categoryFilterPosId;
    data['category_status'] = this.categoryStatus;
    data['category_slug'] = this.categorySlug;
    data['category_cdt'] = this.categoryCdt;
    data['views'] = this.views;
    data['job_count'] = this.jobCount;
    return data;
  }
}

class Premiumjobs {
  String? jobPopularId;
  String? jobName;
  String? jobPopularCdt;
  String? jobCdt;
  String? jobType;
  int? getCountJobAppliedJob;
  String? jobOpening;
  String? companyLogo;
  String? jobRole;

  Premiumjobs(
      {this.jobPopularId,
        this.jobName,
        this.jobPopularCdt,
        this.jobCdt,
        this.jobType,
        this.getCountJobAppliedJob,
        this.jobOpening,
        this.companyLogo,
        this.jobRole});

  Premiumjobs.fromJson(Map<String, dynamic> json) {
    jobPopularId = json['job_popular_id'];
    jobName = json['job_name'];
    jobPopularCdt = json['job_popular_cdt'];
    jobCdt = json['job_cdt'];
    jobType = json['job_type'];
    getCountJobAppliedJob = json['getCountJobAppliedJob'];
    jobOpening = json['job_opening'];
    companyLogo = json['company_logo'];
    jobRole = json['job_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_popular_id'] = this.jobPopularId;
    data['job_name'] = this.jobName;
    data['job_popular_cdt'] = this.jobPopularCdt;
    data['job_cdt'] = this.jobCdt;
    data['job_type'] = this.jobType;
    data['getCountJobAppliedJob'] = this.getCountJobAppliedJob;
    data['job_opening'] = this.jobOpening;
    data['company_logo'] = this.companyLogo;
    data['job_role'] = this.jobRole;
    return data;
  }
}

class Trendingjobs {
  String? jobId;
  String? jobCode;
  String? userId;
  String? subCategoryId;
  String? jobTitle;
  String? minimumSalary;
  String? noOfOpenings;
  String? jobType;
  String? jobInterviewDate;
  String? yearsOfExperience;
  String? jobInterviewTime;
  String? jobRole;
  String? jobLocation;
  String? jobCompanyName;
  String? companyLogo;
  String? contactPerson;
  String? contactEmailId;
  String? interviewLocation;
  String? skillSet;
  String? jobStatus;
  String? seoTitle;
  String? seoDescription;
  String? seoKeywords;
  String? jobSlug;
  String? jobUdt;
  String? jobCdt;
  String? cityName;
  int? noOfApplicants;

  Trendingjobs(
      {this.jobId,
        this.jobCode,
        this.userId,
        this.subCategoryId,
        this.jobTitle,
        this.minimumSalary,
        this.noOfOpenings,
        this.jobType,
        this.jobInterviewDate,
        this.yearsOfExperience,
        this.jobInterviewTime,
        this.jobRole,
        this.jobLocation,
        this.jobCompanyName,
        this.companyLogo,
        this.contactPerson,
        this.contactEmailId,
        this.interviewLocation,
        this.skillSet,
        this.jobStatus,
        this.seoTitle,
        this.seoDescription,
        this.seoKeywords,
        this.jobSlug,
        this.jobUdt,
        this.jobCdt,
        this.cityName,
        this.noOfApplicants});

  Trendingjobs.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    jobCode = json['job_code'];
    userId = json['user_id'];
    subCategoryId = json['sub_category_id'];
    jobTitle = json['job_title'];
    minimumSalary = json['minimum_salary'];
    noOfOpenings = json['no_of_openings'];
    jobType = json['job_type'];
    jobInterviewDate = json['job_interview_date'];
    yearsOfExperience = json['years_of_experience'];
    jobInterviewTime = json['job_interview_time'];
    jobRole = json['job_role'];
    jobLocation = json['job_location'];
    jobCompanyName = json['job_company_name'];
    companyLogo = json['company_logo'];
    contactPerson = json['contact_person'];
    contactEmailId = json['contact_email_id'];
    interviewLocation = json['interview_location'];
    skillSet = json['skill_set'];
    jobStatus = json['job_status'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeywords = json['seo_keywords'];
    jobSlug = json['job_slug'];
    jobUdt = json['job_udt'];
    jobCdt = json['job_cdt'];
    cityName = json['city_name'];
    noOfApplicants = json['no_of_applicants'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    data['job_code'] = this.jobCode;
    data['user_id'] = this.userId;
    data['sub_category_id'] = this.subCategoryId;
    data['job_title'] = this.jobTitle;
    data['minimum_salary'] = this.minimumSalary;
    data['no_of_openings'] = this.noOfOpenings;
    data['job_type'] = this.jobType;
    data['job_interview_date'] = this.jobInterviewDate;
    data['years_of_experience'] = this.yearsOfExperience;
    data['job_interview_time'] = this.jobInterviewTime;
    data['job_role'] = this.jobRole;
    data['job_location'] = this.jobLocation;
    data['job_company_name'] = this.jobCompanyName;
    data['company_logo'] = this.companyLogo;
    data['contact_person'] = this.contactPerson;
    data['contact_email_id'] = this.contactEmailId;
    data['interview_location'] = this.interviewLocation;
    data['skill_set'] = this.skillSet;
    data['job_status'] = this.jobStatus;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['job_slug'] = this.jobSlug;
    data['job_udt'] = this.jobUdt;
    data['job_cdt'] = this.jobCdt;
    data['city_name'] = this.cityName;
    data['no_of_applicants'] = this.noOfApplicants;
    return data;
  }
}
