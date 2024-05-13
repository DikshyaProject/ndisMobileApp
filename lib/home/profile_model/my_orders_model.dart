class MyOrdersModel {
  String? message;
  MyOrderData? data;
  int? status;

  MyOrdersModel({this.message, this.data, this.status});

  MyOrdersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new MyOrderData.fromJson(json['data']) : null;
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

class MyOrderData {
  List<OrderList>? orderList;

  MyOrderData({this.orderList});

  MyOrderData.fromJson(Map<String, dynamic> json) {
    if (json['order list'] != null) {
      orderList = <OrderList>[];
      json['order list'].forEach((v) {
        orderList!.add(new OrderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderList != null) {
      data['order list'] = this.orderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderList {
  String? transactionId;
  String? orderId;
  String? name;
  String? amount;
  String? status;
  String? date;
  String? paymentStatus;
  String? view;

  OrderList(
      {this.transactionId,
        this.orderId,
        this.name,
        this.amount,
        this.status,
        this.date,
        this.paymentStatus,
        this.view});

  OrderList.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    orderId = json['order_id'];
    name = json['name'];
    amount = json['amount'];
    status = json['status'];
    date = json['date'];
    paymentStatus = json['payment_status'];
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
    data['payment_status'] = this.paymentStatus;
    data['view'] = this.view;
    return data;
  }
}
