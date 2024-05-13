class SupportWorkLocationData {
  String? location;
  String? locationCity;
  String? locationState;
  String? locationCountry;
  String? locationZipCode;
  String? locationLatitude;
  String? locationLongitude;

  SupportWorkLocationData(
      {this.location,
        this.locationCity,
        this.locationState,
        this.locationCountry,
        this.locationZipCode,
        this.locationLatitude,
        this.locationLongitude});

  SupportWorkLocationData.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    locationCity = json['location_city'];
    locationState = json['location_state'];
    locationCountry = json['location_country'];
    locationZipCode = json['location_zip_code'];
    locationLatitude = json['location_latitude'];
    locationLongitude = json['location_longitude'];
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
    return data;
  }
}