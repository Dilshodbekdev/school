/// id : 1
/// number : 1
/// start_time : "09:00"
/// end_time : "09:40"

class TimeStudentModel {
  TimeStudentModel({
    this.id,
    this.number,
    this.startTime,
    this.endTime,
  });

  TimeStudentModel.fromJson(dynamic json) {
    id = json['id'];
    number = json['number'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  int? id;
  int? number;
  String? startTime;
  String? endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['number'] = number;
    map['start_time'] = startTime;
    map['end_time'] = endTime;
    return map;
  }
}
