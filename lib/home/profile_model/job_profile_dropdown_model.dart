// class JobProfileDropdownModel {
//   String? message;
//   int? status;
//   JobProDropData? data;
//
//   JobProfileDropdownModel({this.message, this.status, this.data});
//
//   JobProfileDropdownModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ? new JobProDropData.fromJson(json['data']) : null;
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
// class JobProDropData {
//   List<JobProfession>? jobProfession;
//   List<String>? noticePeriod;
//   List<SkillList>? skillList;
//
//   JobProDropData({this.jobProfession, this.noticePeriod, this.skillList});
//
//   JobProDropData.fromJson(Map<String, dynamic> json) {
//     if (json['job_profession'] != null) {
//       jobProfession = <JobProfession>[];
//       json['job_profession'].forEach((v) {
//         jobProfession!.add(new JobProfession.fromJson(v));
//       });
//     }
//     noticePeriod = json['notice_period'].cast<String>();
//     if (json['skill_list'] != null) {
//       skillList = <SkillList>[];
//       json['skill_list'].forEach((v) {
//         skillList!.add(new SkillList.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.jobProfession != null) {
//       data['job_profession'] =
//           this.jobProfession!.map((v) => v.toJson()).toList();
//     }
//     data['notice_period'] = this.noticePeriod;
//     if (this.skillList != null) {
//       data['skill_list'] = this.skillList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class JobProfession {
//   String? categoryId;
//   String? subCategoryCode;
//   String? subCategoryName;
//
//   JobProfession({this.categoryId, this.subCategoryCode, this.subCategoryName});
//
//   JobProfession.fromJson(Map<String, dynamic> json) {
//     categoryId = json['category_id'];
//     subCategoryCode = json['sub_category_code'];
//     subCategoryName = json['sub_category_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['category_id'] = this.categoryId;
//     data['sub_category_code'] = this.subCategoryCode;
//     data['sub_category_name'] = this.subCategoryName;
//     return data;
//   }
// }
//
// class SkillList {
//   String? categoryId;
//   String? categoryCode;
//   String? categoryName;
//   String? categoryImage;
//   String? categoryFilter;
//   String? categoryFilterPosId;
//   String? categoryStatus;
//   String? categorySlug;
//   String? categoryCdt;
//
//   SkillList(
//       {this.categoryId,
//         this.categoryCode,
//         this.categoryName,
//         this.categoryImage,
//         this.categoryFilter,
//         this.categoryFilterPosId,
//         this.categoryStatus,
//         this.categorySlug,
//         this.categoryCdt});
//
//   SkillList.fromJson(Map<String, dynamic> json) {
//     categoryId = json['category_id'];
//     categoryCode = json['category_code'];
//     categoryName = json['category_name'];
//     categoryImage = json['category_image'];
//     categoryFilter = json['category_filter'];
//     categoryFilterPosId = json['category_filter_pos_id'];
//     categoryStatus = json['category_status'];
//     categorySlug = json['category_slug'];
//     categoryCdt = json['category_cdt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['category_id'] = this.categoryId;
//     data['category_code'] = this.categoryCode;
//     data['category_name'] = this.categoryName;
//     data['category_image'] = this.categoryImage;
//     data['category_filter'] = this.categoryFilter;
//     data['category_filter_pos_id'] = this.categoryFilterPosId;
//     data['category_status'] = this.categoryStatus;
//     data['category_slug'] = this.categorySlug;
//     data['category_cdt'] = this.categoryCdt;
//     return data;
//   }
// }
///----------3 nov-------
class JobProfileDropdownModel {
  String? message;
  int? status;
  JobProDropData? data;

  JobProfileDropdownModel({this.message, this.status, this.data});

  JobProfileDropdownModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new JobProDropData.fromJson(json['data']) : null;
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

class JobProDropData {
  List<JobProfession>? jobProfession;
  List<String>? noticePeriod;
  List<SkillList>? skillList;

  JobProDropData({this.jobProfession, this.noticePeriod, this.skillList});

  JobProDropData.fromJson(Map<String, dynamic> json) {
    if (json['job_profession'] != null) {
      jobProfession = <JobProfession>[];
      json['job_profession'].forEach((v) {
        jobProfession!.add(new JobProfession.fromJson(v));
      });
    }
    noticePeriod = json['notice_period'].cast<String>();
    if (json['skill_list'] != null) {
      skillList = <SkillList>[];
      json['skill_list'].forEach((v) {
        skillList!.add(new SkillList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobProfession != null) {
      data['job_profession'] =
          this.jobProfession!.map((v) => v.toJson()).toList();
    }
    data['notice_period'] = this.noticePeriod;
    if (this.skillList != null) {
      data['skill_list'] = this.skillList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobProfession {
  String? categoryId;
  String? subCategoryId;
  String? subCategoryCode;
  String? subCategoryName;

  JobProfession(
      {this.categoryId,
        this.subCategoryId,
        this.subCategoryCode,
        this.subCategoryName});

  JobProfession.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    subCategoryCode = json['sub_category_code'];
    subCategoryName = json['sub_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['sub_category_code'] = this.subCategoryCode;
    data['sub_category_name'] = this.subCategoryName;
    return data;
  }
}

class SkillList {
  String? categoryId;
  String? categoryCode;
  String? categoryName;
  String? categoryImage;
  String? categoryFilter;
  String? categoryFilterPosId;
  String? categoryStatus;
  String? categorySlug;
  String? categoryCdt;

  SkillList(
      {this.categoryId,
        this.categoryCode,
        this.categoryName,
        this.categoryImage,
        this.categoryFilter,
        this.categoryFilterPosId,
        this.categoryStatus,
        this.categorySlug,
        this.categoryCdt});

  SkillList.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryCode = json['category_code'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    categoryFilter = json['category_filter'];
    categoryFilterPosId = json['category_filter_pos_id'];
    categoryStatus = json['category_status'];
    categorySlug = json['category_slug'];
    categoryCdt = json['category_cdt'];
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
    return data;
  }
}
