class SupportQualificationParam{
  List<String> id;
  String otherQualification;
  SupportQualificationParam({required this.id,required this.otherQualification});

  Map toJson() => {
    'ids': id,
    'other_qualifications': otherQualification,
  };
}

