class InvoicesModel {
  String? message;
  InvoicesData? data;
  int? status;

  InvoicesModel({this.message, this.data, this.status});

  InvoicesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new InvoicesData.fromJson(json['data']) : null;
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

class InvoicesData {
  List<InvoiceList>? invoiceList;

  InvoicesData({this.invoiceList});

  InvoicesData.fromJson(Map<String, dynamic> json) {
    if (json['invoice_list'] != null) {
      invoiceList = <InvoiceList>[];
      json['invoice_list'].forEach((v) {
        invoiceList!.add(new InvoiceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.invoiceList != null) {
      data['invoice_list'] = this.invoiceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceList {
  int? no;
  String? productName;
  String? paymentDate;
  String? amount;
  String? download;

  InvoiceList(
      {this.no,
        this.productName,
        this.paymentDate,
        this.amount,
        this.download});

  InvoiceList.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    productName = json['product_name'];
    paymentDate = json['payment_date'];
    amount = json['amount'];
    download = json['download'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['product_name'] = this.productName;
    data['payment_date'] = this.paymentDate;
    data['amount'] = this.amount;
    data['download'] = this.download;
    return data;
  }
}
