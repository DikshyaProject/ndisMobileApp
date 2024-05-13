class PaymentsModel {
  String? message;
  PaymentData? data;
  int? status;

  PaymentsModel({this.message, this.data, this.status});

  PaymentsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new PaymentData.fromJson(json['data']) : null;
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

class PaymentData {
  List<PaymentStatusList>? paymentStatusList;

  PaymentData({this.paymentStatusList});

  PaymentData.fromJson(Map<String, dynamic> json) {
    if (json['payment_status_list'] != null) {
      paymentStatusList = <PaymentStatusList>[];
      json['payment_status_list'].forEach((v) {
        paymentStatusList!.add(new PaymentStatusList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentStatusList != null) {
      data['payment_status_list'] =
          this.paymentStatusList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentStatusList {
  String? name;
  String? userPlan;
  String? startDate;
  String? expiryDate;
  int? remainingDays;
  String? duration;
  String? checkoutAmount;
  String? paymentStatus;

  PaymentStatusList(
      {this.name,
        this.userPlan,
        this.startDate,
        this.expiryDate,
        this.remainingDays,
        this.duration,
        this.checkoutAmount,
        this.paymentStatus});

  PaymentStatusList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userPlan = json['user_plan'];
    startDate = json['start_date'];
    expiryDate = json['expiry_date'];
    remainingDays = json['remaining_days'];
    duration = json['duration'];
    checkoutAmount = json['checkout_amount'];
    paymentStatus = json['payment_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_plan'] = this.userPlan;
    data['start_date'] = this.startDate;
    data['expiry_date'] = this.expiryDate;
    data['remaining_days'] = this.remainingDays;
    data['duration'] = this.duration;
    data['checkout_amount'] = this.checkoutAmount;
    data['payment_status'] = this.paymentStatus;
    return data;
  }
}
