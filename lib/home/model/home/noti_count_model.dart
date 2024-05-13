class NotiCountModel {
  String? message;
  int? data;
  int? status;

  NotiCountModel({this.message, this.data, this.status});

  NotiCountModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.data;
    data['status'] = this.status;
    return data;
  }
}
