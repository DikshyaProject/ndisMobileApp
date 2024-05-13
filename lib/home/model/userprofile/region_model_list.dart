class RegionModelList {
  RegionModelList({
    required this.message,
    required this.status,
    required this.data,
  });
  late final String message;
  late final int status;
  late final RegionModelData data;

  RegionModelList.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    data = RegionModelData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class RegionModelData {
  RegionModelData({
    required this.regions,
  });
  late final List<Regionlist> regions;

  RegionModelData.fromJson(Map<String, dynamic> json){
    regions = List.from(json['regions']).map((e)=>Regionlist.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['regions'] = regions.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Regionlist {
  Regionlist({
    required this.id,
    required this.regionName,
    required this.regionCdt,
    required this.regionUdt,
  });
  late final String id;
  late final String regionName;
  late final String regionCdt;
  late final String regionUdt;

  Regionlist.fromJson(Map<String, dynamic> json){
    id = json['id'];
    regionName = json['region_name'];
    regionCdt = json['region_cdt'];
    regionUdt = json['region_udt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['region_name'] = regionName;
    _data['region_cdt'] = regionCdt;
    _data['region_udt'] = regionUdt;
    return _data;
  }
}