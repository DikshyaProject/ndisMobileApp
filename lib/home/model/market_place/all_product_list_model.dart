class MarketPlaceAllProductListModel {
  String? message;
  int? status;
  MarketPlaceAllProductListData? data;

  MarketPlaceAllProductListModel({this.message, this.status, this.data});

  MarketPlaceAllProductListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new MarketPlaceAllProductListData.fromJson(json['data']) : null;
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

class MarketPlaceAllProductListData {
  List<ProductList>? productList;
  List<UserList>? userList;

  MarketPlaceAllProductListData({this.productList, this.userList});

  MarketPlaceAllProductListData.fromJson(Map<String, dynamic> json) {
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
    if (json['user_list'] != null) {
      userList = <UserList>[];
      json['user_list'].forEach((v) {
        userList!.add(new UserList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productList != null) {
      data['product_list'] = this.productList!.map((v) => v.toJson()).toList();
    }
    if (this.userList != null) {
      data['user_list'] = this.userList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList {
  String? productId;
  String? productName;
  String? productPrice;
  String? productPriceOffer;
  String? productSlug;
  String? productDescription;
  String? productCode;
  String? productStatus;
  String? paymentStatus;
  String? productImage;

  ProductList(
      {this.productId,
        this.productName,
        this.productPrice,
        this.productPriceOffer,
        this.productSlug,
        this.productDescription,
        this.productCode,
        this.productStatus,
        this.paymentStatus,
        this.productImage});

  ProductList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productPriceOffer = json['product_price_offer'];
    productSlug = json['product_slug'];
    productDescription = json['product_description'];
    productCode = json['product_code'];
    productStatus = json['product_status'];
    paymentStatus = json['payment_status'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['product_price_offer'] = this.productPriceOffer;
    data['product_slug'] = this.productSlug;
    data['product_description'] = this.productDescription;
    data['product_code'] = this.productCode;
    data['product_status'] = this.productStatus;
    data['payment_status'] = this.paymentStatus;
    data['product_image'] = this.productImage;
    return data;
  }
}

class UserList {
  String? settingProfileShow;
  String? userSlug;
  String? profileImage;

  UserList({this.settingProfileShow, this.userSlug, this.profileImage});

  UserList.fromJson(Map<String, dynamic> json) {
    settingProfileShow = json['setting_profile_show'];
    userSlug = json['user_slug'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['setting_profile_show'] = this.settingProfileShow;
    data['user_slug'] = this.userSlug;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
