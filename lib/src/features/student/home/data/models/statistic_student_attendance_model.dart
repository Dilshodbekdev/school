/// name : "Algebra"
/// count : 0
/// percent : 100.0

class StatisticStudentAttendanceModel {
  StatisticStudentAttendanceModel({
    this.name,
    this.count,
    this.percent,
  });

  StatisticStudentAttendanceModel.fromJson(dynamic json) {
    name = json['name'];
    count = json['count'];
    percent = json['percent'];
  }

  String? name;
  int? count;
  num? percent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['count'] = count;
    map['percent'] = percent;
    return map;
  }
}
