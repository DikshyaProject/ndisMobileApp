class LookingForJobModel {
  String? message;
  LookingJobData? data;
  int? status;

  LookingForJobModel({this.message, this.data, this.status});

  LookingForJobModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new LookingJobData.fromJson(json['data']) : null;
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

class LookingJobData {
  List<AllJobDetailList>? allJobDetailList;

  LookingJobData({this.allJobDetailList});

  LookingJobData.fromJson(Map<String, dynamic> json) {
    if (json['All Job Detail List'] != null) {
      allJobDetailList = <AllJobDetailList>[];
      json['All Job Detail List'].forEach((v) {
        allJobDetailList!.add(new AllJobDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allJobDetailList != null) {
      data['All Job Detail List'] =
          this.allJobDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllJobDetailList {
  String? jobProfile;
  String? designation;
  String? jobType;
  String? location;
  String? region;

  AllJobDetailList(
      {this.jobProfile,
        this.designation,
        this.jobType,
        this.location,
        this.region});

  AllJobDetailList.fromJson(Map<String, dynamic> json) {
    jobProfile = json['job_profile'];
    designation = json['designation'];
    jobType = json['job_type'];
    location = json['location'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_profile'] = this.jobProfile;
    data['designation'] = this.designation;
    data['job_type'] = this.jobType;
    data['location'] = this.location;
    data['region'] = this.region;
    return data;
  }
}
