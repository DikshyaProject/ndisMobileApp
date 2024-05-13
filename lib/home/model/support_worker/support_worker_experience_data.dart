class SupportWorkerExperienceData{
  String? position;
  String? companyName;
  String? workFrom;
  String? workTo;
  String? expYearMonth;
  SupportWorkerExperienceData({ this.position, this.companyName, this.workFrom, this.workTo, this.expYearMonth});

  SupportWorkerExperienceData.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    companyName = json['company_name'];
    workFrom = json['work_from'];
    workTo = json['work_to'];
    expYearMonth = json['exp_year_month'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['company_name'] = this.companyName;
    data['work_from'] = this.workFrom;
    data['work_to'] = this.workTo;
    data['exp_year_month'] = this.expYearMonth;
    return data;
  }
}