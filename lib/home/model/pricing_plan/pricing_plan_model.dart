// class PricingPlanDataModel {
//   PricingPlanDataModel({
//     required this.message,
//     required this.status,
//     required this.data,
//   });
//   late final String message;
//   late final int status;
//   late final PriceData data;
//
//   PricingPlanDataModel.fromJson(Map<String, dynamic> json){
//     message = json['message'];
//     status = json['status'];
//     data = PriceData.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['message'] = message;
//     _data['status'] = status;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }
//
// class PriceData {
//   PriceData({
//     required this.plan,
//   });
//   late final List<Plan> plan;
//
//   PriceData.fromJson(Map<String, dynamic> json){
//     plan = List.from(json['plan']).map((e)=>Plan.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['plan'] = plan.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Plan {
//   Plan({
//     required this.planName,
//     required this.planTypeMonPrice,
//     required this.discountYearly,
//     required this.features,
//   });
//   late final String planName;
//   late final String planTypeMonPrice;
//   late final String discountYearly;
//   late final List<Features> features;
//
//   Plan.fromJson(Map<String, dynamic> json){
//     planName = json['plan_name'];
//     planTypeMonPrice = json['plan_type_mon_price'];
//     discountYearly = json['discount_yearly'];
//     features = List.from(json['features']).map((e)=>Features.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['plan_name'] = planName;
//     _data['plan_type_mon_price'] = planTypeMonPrice;
//     _data['discount_yearly'] = discountYearly;
//     _data['features'] = features.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Features {
//   Features({
//     required this.featureName,
//     required this.featuresData,
//   });
//   late final String featureName;
//   late final List<FeaturesData> featuresData;
//
//   Features.fromJson(Map<String, dynamic> json){
//     featureName = json['feature_name'];
//     featuresData = List.from(json['features_data']).map((e)=>FeaturesData.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['feature_name'] = featureName;
//     _data['features_data'] = featuresData.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class FeaturesData {
//   FeaturesData({
//     required this.name,
//     required this.value,
//   });
//   late final String name;
//   late final String value;
//
//   FeaturesData.fromJson(Map<String, dynamic> json){
//     name = json['name'];
//     value = json['value'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['name'] = name;
//     _data['value'] = value;
//     return _data;
//   }
// }
class PricingPlanDataModel {
  String? message;
  int? status;
  PriceData? data;

  PricingPlanDataModel({this.message, this.status, this.data});

  PricingPlanDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new PriceData.fromJson(json['data']) : null;
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

class PriceData {
  List<Plan>? plan;

  PriceData({this.plan});

  PriceData.fromJson(Map<String, dynamic> json) {
    if (json['plan'] != null) {
      plan = <Plan>[];
      json['plan'].forEach((v) {
        plan!.add(new Plan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plan != null) {
      data['plan'] = this.plan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plan {
  String? planName;
  String? planTypeMonPrice;
  String? discountYearly;
  List<Features>? features;

  Plan(
      {this.planName,
        this.planTypeMonPrice,
        this.discountYearly,
        this.features});

  Plan.fromJson(Map<String, dynamic> json) {
    planName = json['plan_name'];
    planTypeMonPrice = json['plan_type_mon_price'];
    discountYearly = json['discount_yearly'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_name'] = this.planName;
    data['plan_type_mon_price'] = this.planTypeMonPrice;
    data['discount_yearly'] = this.discountYearly;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String? featureName;
  List<FeaturesData>? featuresData;

  Features({this.featureName, this.featuresData});

  Features.fromJson(Map<String, dynamic> json) {
    featureName = json['feature_name'];
    if (json['features_data'] != null) {
      featuresData = <FeaturesData>[];
      json['features_data'].forEach((v) {
        featuresData!.add(new FeaturesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feature_name'] = this.featureName;
    if (this.featuresData != null) {
      data['features_data'] =
          this.featuresData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturesData {
  String? name;
  String? value;

  FeaturesData({this.name, this.value});

  FeaturesData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
