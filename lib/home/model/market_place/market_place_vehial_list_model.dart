// class MarketPlaceAllVehicalModel {
//   String? message;
//   int? status;
//   MarketPlaceAllVehivalData? data;
//
//   MarketPlaceAllVehicalModel({this.message, this.status, this.data});
//
//   MarketPlaceAllVehicalModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ? new MarketPlaceAllVehivalData.fromJson(json['data']) : null;
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
// class MarketPlaceAllVehivalData {
//   List<VehicleList>? vehicleList;
//   List<UserList>? userList;
//
//   MarketPlaceAllVehivalData({this.vehicleList, this.userList});
//
//   MarketPlaceAllVehivalData.fromJson(Map<String, dynamic> json) {
//     if (json['vehicle_list'] != null) {
//       vehicleList = <VehicleList>[];
//       json['vehicle_list'].forEach((v) {
//         vehicleList!.add(new VehicleList.fromJson(v));
//       });
//     }
//     if (json['user_list'] != null) {
//       userList = <UserList>[];
//       json['user_list'].forEach((v) {
//         userList!.add(new UserList.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.vehicleList != null) {
//       data['vehicle_list'] = this.vehicleList!.map((v) => v.toJson()).toList();
//     }
//     if (this.userList != null) {
//       data['user_list'] = this.userList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class VehicleList {
//   String? productId;
//   String? productName;
//   String? productPrice;
//   String? productPriceOffer;
//   String? productSlug;
//   String? productDescription;
//   String? productCode;
//   String? productStatus;
//   String? paymentStatus;
//   String? productImage;
//   String? location;
//   String? odometer;
//   String? transmission;
//   String? wheelchairPosition;
//   String? rampType;
//   String? hatchback;
//
//   VehicleList(
//       {this.productId,
//         this.productName,
//         this.productPrice,
//         this.productPriceOffer,
//         this.productSlug,
//         this.productDescription,
//         this.productCode,
//         this.productStatus,
//         this.paymentStatus,
//         this.location,
//         this.odometer,
//         this.transmission,
//         this.wheelchairPosition,
//         this.rampType,
//         this.hatchback,
//         this.productImage});
//
//   VehicleList.fromJson(Map<String, dynamic> json) {
//     productId = json['product_id'];
//     productName = json['product_name'];
//     productPrice = json['product_price'];
//     productPriceOffer = json['product_price_offer'];
//     productSlug = json['product_slug'];
//     productDescription = json['product_description'];
//     productCode = json['product_code'];
//     productStatus = json['product_status'];
//     paymentStatus = json['payment_status'];
//     productImage = json['product_image'];
//     location = json['location'];
//     odometer = json['odometer'];
//     transmission = json['transmission'];
//     wheelchairPosition = json['wheelchair_position'];
//     rampType = json['ramp_type'];
//     hatchback = json['Hatchback'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['product_id'] = this.productId;
//     data['product_name'] = this.productName;
//     data['product_price'] = this.productPrice;
//     data['product_price_offer'] = this.productPriceOffer;
//     data['product_slug'] = this.productSlug;
//     data['product_description'] = this.productDescription;
//     data['product_code'] = this.productCode;
//     data['product_status'] = this.productStatus;
//     data['payment_status'] = this.paymentStatus;
//     data['product_image'] = this.productImage;
//     data['location'] = this.location;
//     data['odometer'] = this.odometer;
//     data['transmission'] = this.transmission;
//     data['wheelchair_position'] = this.wheelchairPosition;
//     data['ramp_type'] = this.rampType;
//     data['Hatchback'] = this.hatchback;
//     return data;
//   }
// }
//
// class UserList {
//   String? settingProfileShow;
//   String? userSlug;
//   String? profileImage;
//   String? emailId;
//   String? mobileNumber;
//
//   UserList({this.settingProfileShow, this.userSlug, this.emailId,
//     this.mobileNumber, this.profileImage});
//
//   UserList.fromJson(Map<String, dynamic> json) {
//     settingProfileShow = json['setting_profile_show'];
//     userSlug = json['user_slug'];
//     profileImage = json['profile_image'];
//     emailId = json['email_id'];
//     mobileNumber = json['mobile_number'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['setting_profile_show'] = this.settingProfileShow;
//     data['user_slug'] = this.userSlug;
//     data['profile_image'] = this.profileImage;
//     data['email_id'] = this.emailId;
//     data['mobile_number'] = this.mobileNumber;
//     return data;
//   }
// }
///------------------20 feb------------------
class MarketPlaceAllVehicalModel {
  String? message;
  int? status;
  MarketPlaceAllVehivalData? data;

  MarketPlaceAllVehicalModel({this.message, this.status, this.data});

  MarketPlaceAllVehicalModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new MarketPlaceAllVehivalData.fromJson(json['data']) : null;
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

class MarketPlaceAllVehivalData {
  List<VehicleList>? vehicleList;
  List<UserList>? userList;

  MarketPlaceAllVehivalData({this.vehicleList, this.userList});

  MarketPlaceAllVehivalData.fromJson(Map<String, dynamic> json) {
    if (json['vehicle_list'] != null) {
      vehicleList = <VehicleList>[];
      json['vehicle_list'].forEach((v) {
        vehicleList!.add(new VehicleList.fromJson(v));
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
    if (this.vehicleList != null) {
      data['vehicle_list'] = this.vehicleList!.map((v) => v.toJson()).toList();
    }
    if (this.userList != null) {
      data['user_list'] = this.userList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehicleList {
  String? productId;
  String? productName;
  String? productPrice;
  String? productPriceOffer;
  String? productSlug;
  String? productDescription;
  String? productCode;
  String? productStatus;
  String? location;
  String? odometer;
  String? transmission;
  String? wheelchairPosition;
  String? rampType;
  String? hatchback;
  String? paymentStatus;
  String? productImage;

  VehicleList(
      {this.productId,
        this.productName,
        this.productPrice,
        this.productPriceOffer,
        this.productSlug,
        this.productDescription,
        this.productCode,
        this.productStatus,
        this.location,
        this.odometer,
        this.transmission,
        this.wheelchairPosition,
        this.rampType,
        this.hatchback,
        this.paymentStatus,
        this.productImage});

  VehicleList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productPriceOffer = json['product_price_offer'];
    productSlug = json['product_slug'];
    productDescription = json['product_description'];
    productCode = json['product_code'];
    productStatus = json['product_status'];
    location = json['location'];
    odometer = json['odometer'];
    transmission = json['transmission'];
    wheelchairPosition = json['wheelchair_position'];
    rampType = json['ramp_type'];
    hatchback = json['Hatchback'];
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
    data['location'] = this.location;
    data['odometer'] = this.odometer;
    data['transmission'] = this.transmission;
    data['wheelchair_position'] = this.wheelchairPosition;
    data['ramp_type'] = this.rampType;
    data['Hatchback'] = this.hatchback;
    data['payment_status'] = this.paymentStatus;
    data['product_image'] = this.productImage;
    return data;
  }
}

class UserList {
  String? settingProfileShow;
  String? userSlug;
  String? profileImage;
  String? emailId;
  String? mobileNumber;

  UserList(
      {this.settingProfileShow,
        this.userSlug,
        this.profileImage,
        this.emailId,
        this.mobileNumber});

  UserList.fromJson(Map<String, dynamic> json) {
    settingProfileShow = json['setting_profile_show'];
    userSlug = json['user_slug'];
    profileImage = json['profile_image'];
    emailId = json['email_id'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['setting_profile_show'] = this.settingProfileShow;
    data['user_slug'] = this.userSlug;
    data['profile_image'] = this.profileImage;
    data['email_id'] = this.emailId;
    data['mobile_number'] = this.mobileNumber;
    return data;
  }
}
