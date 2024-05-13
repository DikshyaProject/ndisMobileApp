class NDISPropertSaleModel {
  String? message;
  int? status;
  NDISPropertySaleData? data;

  NDISPropertSaleModel({this.message, this.status, this.data});

  NDISPropertSaleModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? new NDISPropertySaleData.fromJson(json['data'])
        : null;
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

class NDISPropertySaleData {
  List<AllPropertyListings>? allPropertyListings;

  NDISPropertySaleData({this.allPropertyListings});

  NDISPropertySaleData.fromJson(Map<String, dynamic> json) {
    if (json['all_property_listings'] != null) {
      allPropertyListings = <AllPropertyListings>[];
      json['all_property_listings'].forEach((v) {
        allPropertyListings!.add(new AllPropertyListings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allPropertyListings != null) {
      data['all_property_listings'] =
          this.allPropertyListings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllPropertyListings {
  String? listingId;
  String? listingName;
  String? listingAddress;
  String? eneEffRating;
  String? listingStatus;
  String? listingApprove;
  String? emailId;
  String? mobileNumber;
  String? profileImage;
  List<ServiceLocations>? serviceLocations;
  String? propertyType;
  String? proPrice;
  String? rent_co_per_week;
  List<PropertyTypeDetail>? propertyTypeDetail;
  List<TypeOfPropertyDetail>? typeOfPropertyDetail;
  List<BedroomCarerDetail>? bedroomCarerDetail;
  List<PropSizeM2>? propSizeM2;
  List<NumOfBedr>? numOfBedr;
  List<NumOfBathr>? numOfBathr;
  String? rentalYield;
  String? potTotalIncPerYr;
  String? listingSlug;

  AllPropertyListings(
      {this.listingId,
      this.listingName,
      this.listingAddress,
      this.eneEffRating,
      this.listingStatus,
      this.listingApprove,
      this.emailId,
      this.mobileNumber,
      this.profileImage,
      this.serviceLocations,
      this.propertyType,
      this.propertyTypeDetail,
      this.typeOfPropertyDetail,
      this.bedroomCarerDetail,
      this.propSizeM2,
      this.numOfBedr,
      this.numOfBathr,
      this.proPrice,
      this.rentalYield,
      this.potTotalIncPerYr,
      this.listingSlug,
      this.rent_co_per_week});

  AllPropertyListings.fromJson(Map<String, dynamic> json) {
    listingId = json['listing_id'];
    listingName = json['listing_name'];
    listingAddress = json['listing_address'];
    eneEffRating = json['ene_eff_rating'];
    listingStatus = json['listing_status'];
    listingApprove = json['listing_approve'];
    emailId = json['email_id'];
    mobileNumber = json['mobile_number'];
    profileImage = json['profile_image'];
    if (json['service_locations'] != null) {
      serviceLocations = <ServiceLocations>[];
      json['service_locations'].forEach((v) {
        serviceLocations!.add(new ServiceLocations.fromJson(v));
      });
    }
    propertyType = json['property_type'];
    if (json['property_type_detail'] != null) {
      propertyTypeDetail = <PropertyTypeDetail>[];
      json['property_type_detail'].forEach((v) {
        propertyTypeDetail!.add(new PropertyTypeDetail.fromJson(v));
      });
    }
    if (json['type_of_property_detail'] != null) {
      typeOfPropertyDetail = <TypeOfPropertyDetail>[];
      json['type_of_property_detail'].forEach((v) {
        typeOfPropertyDetail!.add(new TypeOfPropertyDetail.fromJson(v));
      });
    }
    if (json['bedroom_carer_detail'] != null) {
      bedroomCarerDetail = <BedroomCarerDetail>[];
      json['bedroom_carer_detail'].forEach((v) {
        bedroomCarerDetail!.add(new BedroomCarerDetail.fromJson(v));
      });
    }
    if (json['prop_size_m2'] != null) {
      propSizeM2 = <PropSizeM2>[];
      json['prop_size_m2'].forEach((v) {
        propSizeM2!.add(new PropSizeM2.fromJson(v));
      });
    }
    if (json['num_of_bedr'] != null) {
      numOfBedr = <NumOfBedr>[];
      json['num_of_bedr'].forEach((v) {
        numOfBedr!.add(new NumOfBedr.fromJson(v));
      });
    }
    if (json['num_of_bathr'] != null) {
      numOfBathr = <NumOfBathr>[];
      json['num_of_bathr'].forEach((v) {
        numOfBathr!.add(new NumOfBathr.fromJson(v));
      });
    }
    proPrice = json['pro_price'];
    rentalYield = json['rental_yield'];
    potTotalIncPerYr = json['pot_total_inc_per_yr'];
    listingSlug = json['listing_slug'];
    rent_co_per_week = json['rent_co_per_week'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listing_id'] = this.listingId;
    data['listing_name'] = this.listingName;
    data['listing_address'] = this.listingAddress;
    data['ene_eff_rating'] = this.eneEffRating;
    data['listing_status'] = this.listingStatus;
    data['listing_approve'] = this.listingApprove;
    data['email_id'] = this.emailId;
    data['mobile_number'] = this.mobileNumber;
    data['profile_image'] = this.profileImage;
    if (this.serviceLocations != null) {
      data['service_locations'] =
          this.serviceLocations!.map((v) => v.toJson()).toList();
    }
    data['property_type'] = this.propertyType;
    if (this.propertyTypeDetail != null) {
      data['property_type_detail'] =
          this.propertyTypeDetail!.map((v) => v.toJson()).toList();
    }
    if (this.typeOfPropertyDetail != null) {
      data['type_of_property_detail'] =
          this.typeOfPropertyDetail!.map((v) => v.toJson()).toList();
    }
    if (this.bedroomCarerDetail != null) {
      data['bedroom_carer_detail'] =
          this.bedroomCarerDetail!.map((v) => v.toJson()).toList();
    }
    if (this.propSizeM2 != null) {
      data['prop_size_m2'] = this.propSizeM2!.map((v) => v.toJson()).toList();
    }
    if (this.numOfBedr != null) {
      data['num_of_bedr'] = this.numOfBedr!.map((v) => v.toJson()).toList();
    }
    if (this.numOfBathr != null) {
      data['num_of_bathr'] = this.numOfBathr!.map((v) => v.toJson()).toList();
    }
    data['pro_price'] = this.proPrice;
    data['rental_yield'] = this.rentalYield;
    data['pot_total_inc_per_yr'] = this.potTotalIncPerYr;
    data['listing_slug'] = this.listingSlug;
    data['rent_co_per_week'] = this.rent_co_per_week;
    return data;
  }
}

class PropertyTypeDetail {
  String? pType;
  String? pTypeName;

  PropertyTypeDetail({this.pType, this.pTypeName});

  PropertyTypeDetail.fromJson(Map<String, dynamic> json) {
    pType = json['p_type'];
    pTypeName = json['p_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['p_type'] = this.pType;
    data['p_type_name'] = this.pTypeName;
    return data;
  }
}

class TypeOfPropertyDetail {
  String? typeOfPropertyType;
  String? typeOfPropertyName;

  TypeOfPropertyDetail({this.typeOfPropertyType, this.typeOfPropertyName});

  TypeOfPropertyDetail.fromJson(Map<String, dynamic> json) {
    typeOfPropertyType = json['type_of_property_type'];
    typeOfPropertyName = json['type_of_property_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_of_property_type'] = this.typeOfPropertyType;
    data['type_of_property_name'] = this.typeOfPropertyName;
    return data;
  }
}

class BedroomCarerDetail {
  String? bCarerType;
  String? bCarerName;
  String? bedroomCarerImage;

  BedroomCarerDetail(
      {this.bCarerType, this.bCarerName, this.bedroomCarerImage});

  BedroomCarerDetail.fromJson(Map<String, dynamic> json) {
    bCarerType = json['b_carer_type'];
    bCarerName = json['b_carer_name'];
    bedroomCarerImage = json['bedroom_carer_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['b_carer_type'] = this.bCarerType;
    data['b_carer_name'] = this.bCarerName;
    data['bedroom_carer_image'] = this.bedroomCarerImage;
    return data;
  }
}

class PropSizeM2 {
  String? propSizeType;
  String? propSizeName;
  String? propSizeImage;

  PropSizeM2({this.propSizeType, this.propSizeName, this.propSizeImage});

  PropSizeM2.fromJson(Map<String, dynamic> json) {
    propSizeType = json['prop_size_type'];
    propSizeName = json['prop_size_name'];
    propSizeImage = json['prop_size_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prop_size_type'] = this.propSizeType;
    data['prop_size_name'] = this.propSizeName;
    data['prop_size_image'] = this.propSizeImage;
    return data;
  }
}

class NumOfBedr {
  String? numOfBedrType;
  String? numOfBedrName;
  String? bedrImage;

  NumOfBedr({this.numOfBedrType, this.numOfBedrName, this.bedrImage});

  NumOfBedr.fromJson(Map<String, dynamic> json) {
    numOfBedrType = json['num_of_bedr_type'];
    numOfBedrName = json['num_of_bedr_name'];
    bedrImage = json['bedr_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num_of_bedr_type'] = this.numOfBedrType;
    data['num_of_bedr_name'] = this.numOfBedrName;
    data['bedr_image'] = this.bedrImage;
    return data;
  }
}

class NumOfBathr {
  String? numOfBathrType;
  String? numOfBathrName;
  String? bathrImage;

  NumOfBathr({this.numOfBathrType, this.numOfBathrName, this.bathrImage});

  NumOfBathr.fromJson(Map<String, dynamic> json) {
    numOfBathrType = json['num_of_bathr_type'];
    numOfBathrName = json['num_of_bathr_name'];
    bathrImage = json['bathr_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num_of_bathr_type'] = this.numOfBathrType;
    data['num_of_bathr_name'] = this.numOfBathrName;
    data['bathr_image'] = this.bathrImage;
    return data;
  }
}

class ServiceLocations {
  String? location;
  String? locationCity;
  String? locationState;
  String? locationCountry;
  String? locationZipCode;
  String? locationLatitude;
  String? locationLongitude;
  String? region;

  ServiceLocations(
      {this.location,
      this.locationCity,
      this.locationState,
      this.locationCountry,
      this.locationZipCode,
      this.locationLatitude,
      this.locationLongitude,
      this.region});

  ServiceLocations.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    locationCity = json['location_city'];
    locationState = json['location_state'];
    locationCountry = json['location_country'];
    locationZipCode = json['location_zip_code'];
    locationLatitude = json['location_latitude'];
    locationLongitude = json['location_longitude'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['location_city'] = this.locationCity;
    data['location_state'] = this.locationState;
    data['location_country'] = this.locationCountry;
    data['location_zip_code'] = this.locationZipCode;
    data['location_latitude'] = this.locationLatitude;
    data['location_longitude'] = this.locationLongitude;
    data['region'] = this.region;
    return data;
  }
}
