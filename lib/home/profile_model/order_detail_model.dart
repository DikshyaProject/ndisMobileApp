class OrderDetailModel {
  String? message;
  OrderDetailData? data;
  int? status;

  OrderDetailModel({this.message, this.data, this.status});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new OrderDetailData.fromJson(json['data']) : null;
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

class OrderDetailData {
  OrderDetail? orderDetail;

  OrderDetailData({this.orderDetail});

  OrderDetailData.fromJson(Map<String, dynamic> json) {
    orderDetail = json['order detail'] != null
        ? new OrderDetail.fromJson(json['order detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderDetail != null) {
      data['order detail'] = this.orderDetail!.toJson();
    }
    return data;
  }
}

class OrderDetail {
  String? orderId;
  String? userId;
  String? userContactName;
  String? userAddress;
  String? userCity;
  String? userState;
  String? userCountry;
  String? userZipCode;
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
  String? orderStatus;
  String? orderStatusName;
  String? createAt;
  String? updatedAt;
  List<ProductList>? productList;

  OrderDetail(
      {this.orderId,
        this.userId,
        this.userContactName,
        this.userAddress,
        this.userCity,
        this.userState,
        this.userCountry,
        this.userZipCode,
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
        this.orderStatus,
        this.orderStatusName,
        this.createAt,
        this.updatedAt,
        this.productList});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    userId = json['user_id'];
    userContactName = json['user_contact_name'];
    userAddress = json['user_address'];
    userCity = json['user_city'];
    userState = json['user_state'];
    userCountry = json['user_country'];
    userZipCode = json['user_zip_code'];
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
    orderStatus = json['order_status'];
    orderStatusName = json['order_status_name'];
    createAt = json['create_at'];
    updatedAt = json['updated_at'];
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['user_id'] = this.userId;
    data['user_contact_name'] = this.userContactName;
    data['user_address'] = this.userAddress;
    data['user_city'] = this.userCity;
    data['user_state'] = this.userState;
    data['user_country'] = this.userCountry;
    data['user_zip_code'] = this.userZipCode;
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
    data['order_status'] = this.orderStatus;
    data['order_status_name'] = this.orderStatusName;
    data['create_at'] = this.createAt;
    data['updated_at'] = this.updatedAt;
    if (this.productList != null) {
      data['product_list'] = this.productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList {
  String? id;
  String? userId;
  String? orderId;
  String? productId;
  String? creatorId;
  String? galleryImage;
  String? productName;
  String? quantity;
  String? price;
  String? offer;
  String? unitPrice;
  String? totalPrice;
  String? orderstatus;
  String? status;
  String? creatAt;
  String? updateAt;

  ProductList(
      {this.id,
        this.userId,
        this.orderId,
        this.productId,
        this.creatorId,
        this.galleryImage,
        this.productName,
        this.quantity,
        this.price,
        this.offer,
        this.unitPrice,
        this.totalPrice,
        this.orderstatus,
        this.status,
        this.creatAt,
        this.updateAt});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    creatorId = json['creator_id'];
    galleryImage = json['gallery_image'];
    productName = json['product_name'];
    quantity = json['quantity'];
    price = json['price'];
    offer = json['offer'];
    unitPrice = json['unit_price'];
    totalPrice = json['total_price'];
    orderstatus = json['orderstatus'];
    status = json['status'];
    creatAt = json['creat_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['creator_id'] = this.creatorId;
    data['gallery_image'] = this.galleryImage;
    data['product_name'] = this.productName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['offer'] = this.offer;
    data['unit_price'] = this.unitPrice;
    data['total_price'] = this.totalPrice;
    data['orderstatus'] = this.orderstatus;
    data['status'] = this.status;
    data['creat_at'] = this.creatAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}
