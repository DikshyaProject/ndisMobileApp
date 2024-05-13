class CartListModel {
  String? message;
  CartData? data;
  int? status;

  CartListModel({this.message, this.data, this.status});

  CartListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new CartData.fromJson(json['data']) : null;
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

class CartData {
  List<CartList>? cartList;
  CartListBottom? cartListBottom;

  CartData({this.cartList, this.cartListBottom});

  CartData.fromJson(Map<String, dynamic> json) {
    if (json['cart_list'] != null) {
      cartList = <CartList>[];
      json['cart_list'].forEach((v) {
        cartList!.add(new CartList.fromJson(v));
      });
    }
    cartListBottom = json['cart_list_bottom'] != null
        ? new CartListBottom.fromJson(json['cart_list_bottom'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartList != null) {
      data['cart_list'] = this.cartList!.map((v) => v.toJson()).toList();
    }
    if (this.cartListBottom != null) {
      data['cart_list_bottom'] = this.cartListBottom!.toJson();
    }
    return data;
  }
}

class CartList {
  int? no;
  String? galleryImage;
  String? productName;
  String? creatAt;
  String? price;
  String? offer;
  String? quantity;
  String? totalPrice;
  String? status;

  CartList(
      {this.no,
        this.galleryImage,
        this.productName,
        this.creatAt,
        this.price,
        this.offer,
        this.quantity,
        this.totalPrice,
        this.status});

  CartList.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    galleryImage = json['gallery_image'];
    productName = json['product_name'];
    creatAt = json['creat_at'];
    price = json['price'];
    offer = json['offer'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['gallery_image'] = this.galleryImage;
    data['product_name'] = this.productName;
    data['creat_at'] = this.creatAt;
    data['price'] = this.price;
    data['offer'] = this.offer;
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    return data;
  }
}

class CartListBottom {
  int? total;
  int? discountAmount;
  int? subTotal;

  CartListBottom({this.total, this.discountAmount, this.subTotal});

  CartListBottom.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    discountAmount = json['discount_amount'];
    subTotal = json['sub_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['discount_amount'] = this.discountAmount;
    data['sub_total'] = this.subTotal;
    return data;
  }
}
