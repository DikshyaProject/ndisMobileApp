class LanguageModel {
  LanguageModel({
    required this.message,
    required this.status,
    required this.data,
  });
  late final String message;
  late final int status;
  late final LanguageData data;

  LanguageModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    data = LanguageData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class LanguageData {
  LanguageData({
    required this.languages,
  });
  late final List<Languages> languages;

  LanguageData.fromJson(Map<String, dynamic> json){
    languages = List.from(json['languages']).map((e)=>Languages.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['languages'] = languages.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Languages {
  Languages({
    required this.id,
    required this.languageCode,
    required this.languageName,
    required  this.languageCdt,
    required this.languageUdt,
  });
  late final String id;
  late final String languageCode;
  late final String languageName;
  late final String languageCdt;
  late final String languageUdt;

  Languages.fromJson(Map<String, dynamic> json){
    id = json['id'];
    languageCode = json['language_code'];
    languageName = json['language_name'];
    languageCdt =  json['language_cdt']??"";
    languageUdt =  json['language_udt']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['language_code'] = languageCode;
    _data['language_name'] = languageName;
    _data['language_cdt'] = languageCdt;
    _data['language_udt'] = languageUdt;
    return _data;
  }
}