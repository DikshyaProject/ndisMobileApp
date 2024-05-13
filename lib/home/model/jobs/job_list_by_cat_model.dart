class JobListByCatModel {
  String? message;
  int? status;
  JobByCatData? data;

  JobListByCatModel({this.message, this.status, this.data});

  JobListByCatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new JobByCatData.fromJson(json['data']) : null;
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

class JobByCatData {
  List<Jobdetails>? jobdetails;

  JobByCatData({this.jobdetails});

  JobByCatData.fromJson(Map<String, dynamic> json) {
    if (json['jobdetails'] != null) {
      jobdetails = <Jobdetails>[];
      json['jobdetails'].forEach((v) {
        jobdetails!.add(new Jobdetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobdetails != null) {
      data['jobdetails'] = this.jobdetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobdetails {
  String? jobId;
  String? jobCode;
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
  String? educationalQualification;
  String? jobDescription;
  String? jobSmallDescription;
  String? jobLocation;
  String? jobCompanyName;
  String? companyLogo;
  String? contactPerson;
  String? contactEmailId;
  String? contactNumber;
  String? contactWebsite;
  String? interviewLocation;
  String? skillSet;
  String? jobStatus;
  String? seoTitle;
  String? seoDescription;
  String? seoKeywords;
  String? jobSlug;
  String? jobUdt;
  String? jobCdt;
  int? applicant;

  Jobdetails(
      {this.jobId,
        this.jobCode,
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
        this.jobSmallDescription,
        this.jobLocation,
        this.jobCompanyName,
        this.companyLogo,
        this.contactPerson,
        this.contactEmailId,
        this.contactNumber,
        this.contactWebsite,
        this.interviewLocation,
        this.skillSet,
        this.jobStatus,
        this.seoTitle,
        this.seoDescription,
        this.seoKeywords,
        this.jobSlug,
        this.jobUdt,
        this.jobCdt,
        this.applicant});

  Jobdetails.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    jobCode = json['job_code'];
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
    educationalQualification = json['educational_qualification'];
    jobDescription = json['job_description'];
    jobSmallDescription = json['job_small_description'];
    jobLocation = json['job_location'];
    jobCompanyName = json['job_company_name'];
    companyLogo = json['company_logo'];
    contactPerson = json['contact_person'];
    contactEmailId = json['contact_email_id'];
    contactNumber = json['contact_number'];
    contactWebsite = json['contact_website'];
    interviewLocation = json['interview_location'];
    skillSet = json['skill_set'];
    jobStatus = json['job_status'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeywords = json['seo_keywords'];
    jobSlug = json['job_slug'];
    jobUdt = json['job_udt'];
    jobCdt = json['job_cdt'];
    applicant = json['applicant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    data['job_code'] = this.jobCode;
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
    data['job_small_description'] = this.jobSmallDescription;
    data['job_location'] = this.jobLocation;
    data['job_company_name'] = this.jobCompanyName;
    data['company_logo'] = this.companyLogo;
    data['contact_person'] = this.contactPerson;
    data['contact_email_id'] = this.contactEmailId;
    data['contact_number'] = this.contactNumber;
    data['contact_website'] = this.contactWebsite;
    data['interview_location'] = this.interviewLocation;
    data['skill_set'] = this.skillSet;
    data['job_status'] = this.jobStatus;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['job_slug'] = this.jobSlug;
    data['job_udt'] = this.jobUdt;
    data['job_cdt'] = this.jobCdt;
    data['applicant'] = this.applicant;
    return data;
  }
}
