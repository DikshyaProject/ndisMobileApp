class TransactionHistoryModel {
  String? message;
  TransactionHistoryData? data;
  int? status;

  TransactionHistoryModel({this.message, this.data, this.status});

  TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new TransactionHistoryData.fromJson(json['data']) : null;
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

class TransactionHistoryData {
  List<TransactionData>? transactionData;

  TransactionHistoryData({this.transactionData});

  TransactionHistoryData.fromJson(Map<String, dynamic> json) {
    if (json['transaction_data '] != null) {
      transactionData = <TransactionData>[];
      json['transaction_data '].forEach((v) {
        transactionData!.add(new TransactionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactionData != null) {
      data['transaction_data '] =
          this.transactionData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransactionData {
  String? payId;
  String? userId;
  String? userContactName;
  String? userContactMobile;
  String? userContactEmail;
  String? planTypeId;
  String? token;
  String? transactionId;
  String? amount;
  String? currency;
  String? cardNo;
  String? cvv;
  String? expMonth;
  String? expYear;
  String? response;
  String? status;
  String? paymentStatus;
  String? createAt;
  String? updatedAt;

  TransactionData(
      {this.payId,
        this.userId,
        this.userContactName,
        this.userContactMobile,
        this.userContactEmail,
        this.planTypeId,
        this.token,
        this.transactionId,
        this.amount,
        this.currency,
        this.cardNo,
        this.cvv,
        this.expMonth,
        this.expYear,
        this.response,
        this.status,
        this.paymentStatus,
        this.createAt,
        this.updatedAt});

  TransactionData.fromJson(Map<String, dynamic> json) {
    payId = json['pay_id'];
    userId = json['user_id'];
    userContactName = json['user_contact_name'];
    userContactMobile = json['user_contact_mobile'];
    userContactEmail = json['user_contact_email'];
    planTypeId = json['plan_type_id'];
    token = json['token'];
    transactionId = json['transaction_id'];
    amount = json['amount'];
    currency = json['currency'];
    cardNo = json['card_no'];
    cvv = json['cvv'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    response = json['response'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    createAt = json['create_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pay_id'] = this.payId;
    data['user_id'] = this.userId;
    data['user_contact_name'] = this.userContactName;
    data['user_contact_mobile'] = this.userContactMobile;
    data['user_contact_email'] = this.userContactEmail;
    data['plan_type_id'] = this.planTypeId;
    data['token'] = this.token;
    data['transaction_id'] = this.transactionId;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['card_no'] = this.cardNo;
    data['cvv'] = this.cvv;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    data['response'] = this.response;
    data['status'] = this.status;
    data['payment_status'] = this.paymentStatus;
    data['create_at'] = this.createAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
