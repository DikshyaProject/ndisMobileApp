class AllAppliedJobModel {
  String? message;
  AppliedJobData? data;
  int? status;

  AllAppliedJobModel({this.message, this.data, this.status});

  AllAppliedJobModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new AppliedJobData.fromJson(json['data']) : null;
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

class AppliedJobData {
  List<AllAppliedJobList>? allAppliedJobList;

  AppliedJobData({this.allAppliedJobList});

  AppliedJobData.fromJson(Map<String, dynamic> json) {
    if (json['all_applied_job_list'] != null) {
      allAppliedJobList = <AllAppliedJobList>[];
      json['all_applied_job_list'].forEach((v) {
        allAppliedJobList!.add(new AllAppliedJobList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allAppliedJobList != null) {
      data['all_applied_job_list'] =
          this.allAppliedJobList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllAppliedJobList {
  String? jobAppliedId;
  String? jobId;
  String? jobUserId;
  String? jobProfileId;
  String? jobAppliedStatus;
  String? jobAppliedCdt;
  String? jobTitle;

  AllAppliedJobList(
      {this.jobAppliedId,
        this.jobId,
        this.jobUserId,
        this.jobProfileId,
        this.jobAppliedStatus,
        this.jobAppliedCdt,
        this.jobTitle});

  AllAppliedJobList.fromJson(Map<String, dynamic> json) {
    jobAppliedId = json['job_applied_id'];
    jobId = json['job_id'];
    jobUserId = json['job_user_id'];
    jobProfileId = json['job_profile_id'];
    jobAppliedStatus = json['job_applied_status'];
    jobAppliedCdt = json['job_applied_cdt'];
    jobTitle = json['job_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_applied_id'] = this.jobAppliedId;
    data['job_id'] = this.jobId;
    data['job_user_id'] = this.jobUserId;
    data['job_profile_id'] = this.jobProfileId;
    data['job_applied_status'] = this.jobAppliedStatus;
    data['job_applied_cdt'] = this.jobAppliedCdt;
    data['job_title'] = this.jobTitle;
    return data;
  }
}
