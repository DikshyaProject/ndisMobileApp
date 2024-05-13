
// class AvailableTimeSlotDataParam{
//   List<SupportAvailableTimeParam> allAvailTimeParam;
//   AvailableTimeSlotDataParam(this.allAvailTimeParam);
//   Map toJson() {
//
//   }
// }

class SupportAvailableTimeParam {
  String day;
  List<AvailableTimeData> availableTimeData;

  SupportAvailableTimeParam(this.day, this.availableTimeData);

  Map toJson() {
    List<Map>? tags = availableTimeData != null
        ? availableTimeData.map((i) => i.toJson()).toList()
        : null;

    return {
      'day': day,
      'data': tags,
    };
  }
}


class AvailableTimeData {
   String? from;
   String? to;

  AvailableTimeData(this.from, this.to);

  AvailableTimeData.fromJson(Map<String, dynamic> json){
    from = json['from'];
    to = json['to'];
  }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['from'] = this.from;
     data['to'] = this.to;
     return data;
      }
}
