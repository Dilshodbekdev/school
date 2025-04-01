/// name : "Algebra"
/// count : 1
/// avg_mark : 4.0

class StatisticStudentAppropriationModel {
  StatisticStudentAppropriationModel({
    this.name,
    this.count,
    this.avgMark,
  });

  StatisticStudentAppropriationModel.fromJson(dynamic json) {
    name = json['name'];
    count = json['count'];
    avgMark = json['avg_mark'];
  }

  String? name;
  int? count;
  double? avgMark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['count'] = count;
    map['avg_mark'] = avgMark;
    return map;
  }
}
