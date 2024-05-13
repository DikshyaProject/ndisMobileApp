class OrderHistroyModel {
  String? message;
  OrderHistoryData? data;
  int? status;

  OrderHistroyModel({this.message, this.data, this.status});

  OrderHistroyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new OrderHistoryData.fromJson(json['data']) : null;
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

class OrderHistoryData {
  List<OrderHistoryList>? orderHistoryList;

  OrderHistoryData({this.orderHistoryList});

  OrderHistoryData.fromJson(Map<String, dynamic> json) {
    if (json['order history list'] != null) {
      orderHistoryList = <OrderHistoryList>[];
      json['order history list'].forEach((v) {
        orderHistoryList!.add(new OrderHistoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderHistoryList != null) {
      data['order history list'] =
          this.orderHistoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderHistoryList {
  String? transactionId;
  String? orderId;
  String? name;
  String? amount;
  String? status;
  String? date;
  String? view;

  OrderHistoryList(
      {this.transactionId,
        this.orderId,
        this.name,
        this.amount,
        this.status,
        this.date,
        this.view});

  OrderHistoryList.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    orderId = json['order_id'];
    name = json['name'];
    amount = json['amount'];
    status = json['status'];
    date = json['date'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_id'] = this.transactionId;
    data['order_id'] = this.orderId;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['date'] = this.date;
    data['view'] = this.view;
    return data;
  }
}
