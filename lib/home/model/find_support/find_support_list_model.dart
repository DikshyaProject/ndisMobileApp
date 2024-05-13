// class FindSupportModel {
//   String? message;
//   int? status;
//   FindSupportListData? data;
//
//   FindSupportModel({this.message, this.status, this.data});
//
//   FindSupportModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ? new FindSupportListData.fromJson(json['data']) : null;
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
// class FindSupportListData {
//   List<FindSupport>? findSupport;
//
//   FindSupportListData({this.findSupport});
//
//   FindSupportListData.fromJson(Map<String, dynamic> json) {
//     if (json['find_support'] != null) {
//       findSupport = <FindSupport>[];
//       json['find_support'].forEach((v) {
//         findSupport!.add(new FindSupport.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.findSupport != null) {
//       data['find_support'] = this.findSupport!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class FindSupport {
//   String? supportName;
//
//   FindSupport({this.supportName});
//
//   FindSupport.fromJson(Map<String, dynamic> json) {
//     supportName = json['support_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['support_name'] = this.supportName;
//     return data;
//   }
// }
class FindSupportModel {
  String? message;
  int? status;
  FindSupportListData? data;

  FindSupportModel({this.message, this.status, this.data});

  FindSupportModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new FindSupportListData.fromJson(json['data']) : null;
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

class FindSupportListData {
  List<FindSupport>? findSupport;

  FindSupportListData({this.findSupport});

  FindSupportListData.fromJson(Map<String, dynamic> json) {
    if (json['find_support'] != null) {
      findSupport = <FindSupport>[];
      json['find_support'].forEach((v) {
        findSupport!.add(new FindSupport.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.findSupport != null) {
      data['find_support'] = this.findSupport!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FindSupport {
  String? supportName;
  String? supportImage;

  FindSupport({this.supportName, this.supportImage});

  FindSupport.fromJson(Map<String, dynamic> json) {
    supportName = json['support_name'];
    supportImage = json['support_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['support_name'] = this.supportName;
    data['support_image'] = this.supportImage;
    return data;
  }
}
