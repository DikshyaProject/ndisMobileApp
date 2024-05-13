class JobDetailsModel {
  String? message;
  int? status;
  jobDetailsData? data;

  JobDetailsModel({this.message, this.status, this.data});

  JobDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new jobDetailsData.fromJson(json['data']) : null;
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

class jobDetailsData {
  GetallDetails? getallDetails;
  List<RelatedJobs>? relatedJobs;

  jobDetailsData({this.getallDetails, this.relatedJobs});

  jobDetailsData.fromJson(Map<String, dynamic> json) {
    getallDetails = json['getallDetails'] != null
        ? new GetallDetails.fromJson(json['getallDetails'])
        : null;
    if (json['related_jobs'] != null) {
      relatedJobs = <RelatedJobs>[];
      json['related_jobs'].forEach((v) {
        relatedJobs!.add(new RelatedJobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getallDetails != null) {
      data['getallDetails'] = this.getallDetails!.toJson();
    }
    if (this.relatedJobs != null) {
      data['related_jobs'] = this.relatedJobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetallDetails {
  String? jobId;
  String? jobCode;
  String? closingDate;
  String? accessibilityFeatures;
  String? jobHours;
  String? hideJobAd;
  String? contractType;
  String? jobConditions;
  String? minimumSalary;
  String? jobPay;
  String? userId;
  String? categoryId;
  String? subCategoryId;
  String? jobTitle;
  String? jobSalary;
  String? noOfOpenings;
  String? jobType;
  String? jobInterviewDate;
  String? yearsOfExperience;
  String? jobInterviewTime;
  String? jobRole;
  List<String>? educationalQualification;
  String? jobDescription;
  List<String>? jobLocation;
  String? jobCompanyName;
  String? companyLogo;
  String? contactPerson;
  String? contactEmailId;
  String? contactNumber;
  String? contactWebsite;
  String? interviewLocation;
  String? skillSet;
  List<String>? workingRights;
  String? jobSlug;
  String? jobUdt;
  String? jobCdt;
  String? salary;
  String? date;
  String? time;
  String? gender;
  List<String>? skilsSet;
  List<String>? accFeature;

  GetallDetails(
      {this.jobId,
        this.jobCode,
        this.closingDate,
        this.accessibilityFeatures,
        this.jobHours,
        this.hideJobAd,
        this.contractType,
        this.jobConditions,
        this.minimumSalary,
        this.jobPay,
        this.userId,
        this.categoryId,
        this.subCategoryId,
        this.jobTitle,
        this.jobSalary,
        this.noOfOpenings,
        this.jobType,
        this.jobInterviewDate,
        this.yearsOfExperience,
        this.jobInterviewTime,
        this.jobRole,
        this.educationalQualification,
        this.jobDescription,
        this.jobLocation,
        this.jobCompanyName,
        this.companyLogo,
        this.contactPerson,
        this.contactEmailId,
        this.contactNumber,
        this.contactWebsite,
        this.interviewLocation,
        this.skillSet,
        this.jobSlug,
        this.jobUdt,
        this.jobCdt,
        this.salary,
        this.date,
        this.time,
        this.gender,
        this.skilsSet,
        this.accFeature});

  GetallDetails.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    jobCode = json['job_code'];
    closingDate = json['closing_date'];
    accessibilityFeatures = json['accessibility_features'];
    jobHours = json['job_hours'];
    hideJobAd = json['hide_job_ad'];
    contractType = json['contract_type'];
    jobConditions = json['job_conditions'];
    minimumSalary = json['minimum_salary'];
    jobPay = json['job_pay'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    jobTitle = json['job_title'];
    jobSalary = json['job_salary'];
    noOfOpenings = json['no_of_openings'];
    jobType = json['job_type'];
    jobInterviewDate = json['job_interview_date'];
    yearsOfExperience = json['years_of_experience'];
    jobInterviewTime = json['job_interview_time'];
    jobRole = json['job_role'];
    educationalQualification = json['educational_qualification'].cast<String>();
    jobDescription = json['job_description'];
    jobLocation = json['job_location'].cast<String>()??[];
    jobCompanyName = json['job_company_name'];
    companyLogo = json['company_logo'];
    contactPerson = json['contact_person'];
    contactEmailId = json['contact_email_id'];
    contactNumber = json['contact_number'];
    contactWebsite = json['contact_website'];
    interviewLocation = json['interview_location'];
    skillSet = json['skill_set'];
    workingRights = json['working_rights'].cast<String>();
    jobSlug = json['job_slug'];
    jobUdt = json['job_udt'];
    jobCdt = json['job_cdt'];
    salary = json['salary'];
    date = json['date'];
    time = json['time'];
    gender = json['gender'];
    skilsSet = json['skils_set'].cast<String>()??[];
    accFeature = json['acc_feature'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    data['job_code'] = this.jobCode;
    data['closing_date'] = this.closingDate;
    data['accessibility_features'] = this.accessibilityFeatures;
    data['job_hours'] = this.jobHours;
    data['hide_job_ad'] = this.hideJobAd;
    data['contract_type'] = this.contractType;
    data['job_conditions'] = this.jobConditions;
    data['minimum_salary'] = this.minimumSalary;
    data['job_pay'] = this.jobPay;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['job_title'] = this.jobTitle;
    data['job_salary'] = this.jobSalary;
    data['no_of_openings'] = this.noOfOpenings;
    data['job_type'] = this.jobType;
    data['job_interview_date'] = this.jobInterviewDate;
    data['years_of_experience'] = this.yearsOfExperience;
    data['job_interview_time'] = this.jobInterviewTime;
    data['job_role'] = this.jobRole;
    data['educational_qualification'] = this.educationalQualification;
    data['job_description'] = this.jobDescription;
    data['job_location'] = this.jobLocation??[];
    data['job_company_name'] = this.jobCompanyName;
    data['company_logo'] = this.companyLogo;
    data['contact_person'] = this.contactPerson;
    data['contact_email_id'] = this.contactEmailId;
    data['contact_number'] = this.contactNumber;
    data['contact_website'] = this.contactWebsite;
    data['interview_location'] = this.interviewLocation;
    data['skill_set'] = this.skillSet;
    data['working_rights'] = this.workingRights;
    data['job_slug'] = this.jobSlug;
    data['job_udt'] = this.jobUdt;
    data['job_cdt'] = this.jobCdt;
    data['salary'] = this.salary;
    data['date'] = this.date;
    data['time'] = this.time;
    data['gender'] = this.gender;
    data['skils_set'] = this.skilsSet??[];
    data['acc_feature'] = this.accFeature;
    return data;
  }
}

class RelatedJobs {
  String? companyLogo;
  String? jobId;
  String? categoryId;
  String? jobCdt;
  String? minimumSalary;
  String? jobTitle;
  int? countJobApplied;

  RelatedJobs(
      {this.companyLogo,
        this.jobId,
        this.categoryId,
        this.jobCdt,
        this.minimumSalary,
        this.jobTitle,
        this.countJobApplied});

  RelatedJobs.fromJson(Map<String, dynamic> json) {
    companyLogo = json['company_logo'];
    jobId = json['job_id'];
    categoryId = json['category_id'];
    jobCdt = json['job_cdt'];
    minimumSalary = json['minimum_salary'];
    jobTitle = json['job_title'];
    countJobApplied = json['count_job_applied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_logo'] = this.companyLogo;
    data['job_id'] = this.jobId;
    data['category_id'] = this.categoryId;
    data['job_cdt'] = this.jobCdt;
    data['minimum_salary'] = this.minimumSalary;
    data['job_title'] = this.jobTitle;
    data['count_job_applied'] = this.countJobApplied;
    return data;
  }
}