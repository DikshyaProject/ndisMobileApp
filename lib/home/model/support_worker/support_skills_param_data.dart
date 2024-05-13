class SupportSkillsParam{
  List<String> id;
  String extraSkillValue;
  SupportSkillsParam({required this.id,required this.extraSkillValue});

  Map toJson() => {
    'ids': id,
    'other_skills': extraSkillValue,
  };
}